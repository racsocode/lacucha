<?php
namespace Admin\Adapter;
 
use stdClass;
use Zend\Authentication\Adapter\DbTable;
use Zend\Crypt\Password\Bcrypt;
use Zend\Authentication\Result as AuthenticationResult;
use Zend\Authentication\Exception;
use Zend\Db\Adapter\Adapter as DbAdapter;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Select as DbSelect;
 
class DbTableBcrypt extends DbTable{

    protected $zendDb = null;
    protected $dbSelect = null;
    protected $tableName = null;
    protected $identityColumn = null;
    protected $credentialColumn = null;
    protected $identity = null;
    protected $credential = null;
    protected $authenticateResultInfo = null;
    protected $resultRow = null;
     
    /**
     * $ambiguityIdentity - Flag to indicate same Identity can be used with
     * different credentials. Default is FALSE and need to be set to true to
     * allow ambiguity usage.
     *
     * @var boolean
     */
    protected $ambiguityIdentity = false;
     
    /**
     * __construct() - Sets configuration options
     *
     * @param  EntityManager $entityManager
     * @param  string    $tableName           Optional
     * @param  string    $identityColumn      Optional
     * @param  string    $credentialColumn    Optional
     * @return \Zend\Authentication\Adapter\DbTable
     */
    public function __construct(DbAdapter $zendDb, $tableName = null, $identityColumn = null, $credentialColumn = null){
        $this->zendDb = $zendDb;
         
        if (null !== $tableName) {
            $this->setTableName($tableName);
        }
     
        if (null !== $identityColumn) {
            $this->setIdentityColumn($identityColumn);
        }
     
        if (null !== $credentialColumn) {
            $this->setCredentialColumn($credentialColumn);
        }
    }
     
    public function setTableName($tableName){
        $this->tableName = $tableName;
        return $this;
    }
     
    public function setIdentityColumn($identityColumn){
        $this->identityColumn = $identityColumn;
        return $this;
    }
     
    public function setCredentialColumn($credentialColumn){
        $this->credentialColumn = $credentialColumn;
        return $this;
    }
     
    public function setIdentity($value){
        $this->identity = $value;
        return $this;
    }
     
    public function setCredential($credential){
        $this->credential = $credential;
        return $this;
    }
     
    public function setAmbiguityIdentity($flag){
        if (is_integer($flag)) {
            $this->ambiguityIdentity = (1 === $flag ? true : false);
        } elseif (is_bool($flag)) {
            $this->ambiguityIdentity = $flag;
        }
        return $this;
    }
     
    public function getAmbiguityIdentity(){
        return $this->ambiguityIdentity;
    }
     
    public function getDbSelect(){
        if ($this->dbSelect == null) {
            $this->dbSelect = new DbSelect();
        }
        return $this->dbSelect;
    }
     

    public function getResultRowObject($returnColumns = null, $omitColumns = null){
        if (!$this->resultRow) {
            return false;
        }
     
        $returnObject = new \stdClass();
     
        if (null !== $returnColumns) {
     
            $availableColumns = array_keys($this->resultRow);
            foreach ((array)$returnColumns as $returnColumn) {
                if (in_array($returnColumn, $availableColumns)) {
                    $returnObject->{$returnColumn} = $this->resultRow[$returnColumn];
                }
            }
            return $returnObject;
     
        } elseif (null !== $omitColumns) {
     
            $omitColumns = (array)$omitColumns;
            foreach ($this->resultRow as $resultColumn => $resultValue) {
                if (!in_array($resultColumn, $omitColumns)) {
                    $returnObject->{$resultColumn} = $resultValue;
                }
            }
            return $returnObject;
     
        } else {
     
            foreach ($this->resultRow as $resultColumn => $resultValue) {
                $returnObject->{$resultColumn} = $resultValue;
            }
            return $returnObject;
     
        }
    }
     
    /**
     * This method is called to attempt an authentication. Previous to this
     * call, this adapter would have already been configured with all
     * necessary information to successfully connect to a database table and
     * attempt to find a record matching the provided identity.
     *
     * @throws Exception\RuntimeException if answering the authentication query is impossible
     * @return AuthenticationResult
     */
    public function authenticate(){
        $this->_authenticateSetup();

        $dbSelect = $this->getDbSelect();
        $dbSelect->from($this->tableName)
                ->columns(array('*'))
                ->where($this->zendDb->getPlatform()->quoteIdentifier($this->identityColumn) . ' = ?');
//echo "llego ".$this->tableName;


        $statement = $this->zendDb->createStatement();
        $dbSelect->prepareStatement($this->zendDb, $statement);
        $resultSet = new ResultSet();
        $resultSet->initialize($statement->execute(array($this->identity)));
        $resultIdentities = $resultSet->toArray();

     
        if (($authResult = $this->_authenticateValidateResultSet($resultIdentities)) instanceof AuthenticationResult) {
            return $authResult;
        }
     
        $authResult = $this->_authenticateValidateResult(array_shift($resultIdentities));
        return $authResult;
    }
     
    /**
     * _authenticateSetup() - This method abstracts the steps involved with
     * making sure that this adapter was indeed setup properly with all
     * required pieces of information.
     *
     * @throws Exception\RuntimeException in the event that setup was not done properly
     * @return boolean
     */
    protected function _authenticateSetup(){
        $exception = null;
     
        if ($this->tableName == '') {
            $exception = 'A table must be supplied for the DbTable authentication adapter.';
        } elseif ($this->identityColumn == '') {
            $exception = 'An identity column must be supplied for the DbTable authentication adapter.';
        } elseif ($this->credentialColumn == '') {
            $exception = 'A credential column must be supplied for the DbTable authentication adapter.';
        } elseif ($this->identity == '') {
            $exception = 'A value for the identity was not provided prior to authentication with DbTable.';
        } elseif ($this->credential === null) {
            $exception = 'A credential value was not provided prior to authentication with DbTable.';
        }
     
        if (null !== $exception) {
            throw new \Exception($exception);
        }
     
        $this->authenticateResultInfo = array(
                'code'     => AuthenticationResult::FAILURE,
                'identity' => $this->identity,
                'messages' => array()
        );
     
        return true;
    }
     

    protected function _authenticateValidateResultSet(array $resultIdentities){
     
        if (count($resultIdentities) < 1) {
            $this->authenticateResultInfo['code']       = AuthenticationResult::FAILURE_IDENTITY_NOT_FOUND;
            $this->authenticateResultInfo['messages'][] = 'A record with the supplied identity could not be found.';
            return $this->_authenticateCreateAuthResult();
        } elseif (count($resultIdentities) > 1 && false === $this->getAmbiguityIdentity()) {
            $this->authenticateResultInfo['code']       = AuthenticationResult::FAILURE_IDENTITY_AMBIGUOUS;
            $this->authenticateResultInfo['messages'][] = 'More than one record matches the supplied identity.';
            return $this->_authenticateCreateAuthResult();
        }
     
        return true;
    }
     
    /**
     * _authenticateValidateResult() - This method attempts to validate that
     * the record in the resultset is indeed a record that matched the
     * identity provided to this adapter.
     *
     * @param array $resultIdentity
     * @return Zend_Auth_Result
     */
    protected function _authenticateValidateResult($resultIdentity){
        $bcrypt = new Bcrypt();
         
        // Compare DB Hash against User generated hash
       // $securePass = $bcrypt->create('123456');

        //echo " securePass  ".$securePass  ;

        if (!$bcrypt->verify($this->credential, $resultIdentity[$this->credentialColumn])) {
            
            echo "The password is NOT correct.\n";
            $this->authenticateResultInfo['code'] = AuthenticationResult::FAILURE_CREDENTIAL_INVALID;
            $this->authenticateResultInfo['messages'][] = 'Supplied credential is invalid.';
            return $this->_authenticateCreateAuthResult();
        }else{


            // echo "The password is correct! \n";
        }
     
        unset($resultIdentity[$this->credentialColumn]);
        $this->resultRow = $resultIdentity;
     
        $this->authenticateResultInfo['code'] = AuthenticationResult::SUCCESS;
        $this->authenticateResultInfo['messages'][] = 'Authentication successful.';
        return $this->_authenticateCreateAuthResult();
    }
     
    /**
     * Creates a Zend\Authentication\Result object from the information that
     * has been collected during the authenticate() attempt.
     *
     * @return AuthenticationResult
     */
    protected function _authenticateCreateAuthResult(){
        return new AuthenticationResult(
            $this->authenticateResultInfo['code'],
            $this->authenticateResultInfo['identity'],
            $this->authenticateResultInfo['messages']
        );
    }
}