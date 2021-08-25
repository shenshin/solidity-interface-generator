// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface Bridge {
    function getBtcBlockchainBestChainHeight() external view returns (int);
    function getStateForBtcReleaseClient() external view returns (bytes memory);
    function getStateForDebugging() external view returns (bytes memory);
    function getBtcBlockchainInitialBlockHeight() external view returns (int);
    function getBtcBlockchainBlockHashAtDepth(int256 _depth) external view returns (bytes memory);
    function getBtcTxHashProcessedHeight(string calldata _hash) external view returns (int64);
    function isBtcTxHashAlreadyProcessed(string calldata _hash) external view returns (bool);
    function getFederationAddress() external view returns (string memory);
    function registerBtcTransaction(bytes calldata _tx, int256 _height, bytes calldata _pmt) external view;
    function addSignature(bytes calldata _pubkey, bytes[] calldata _signatures, bytes calldata _txhash) external view;
    function receiveHeaders(bytes[] calldata _blocks) external view;
    function receiveHeader(bytes calldata _block) external view returns (int256);
    function getFederationSize() external view returns (int256);
    function getFederationThreshold() external view returns (int256);
    function getFederatorPublicKey(int256 _index) external view returns (bytes memory);
    function getFederatorPublicKeyOfType(int256 _index, string calldata _type) external view returns (bytes memory);
    function getFederationCreationTime() external view returns (int256);
    function getFederationCreationBlockNumber() external view returns (int256);
    function getRetiringFederationAddress() external view returns (string memory);
    function getRetiringFederationSize() external view returns (int256);
    function getRetiringFederationThreshold() external view returns (int256);
    function getRetiringFederatorPublicKey(int256 _index) external view returns (bytes memory);
    function getRetiringFederatorPublicKeyOfType(int256 _index, string calldata _type) external view returns (bytes memory);
    function getRetiringFederationCreationTime() external view returns (int256);
    function getRetiringFederationCreationBlockNumber() external view returns (int256);
    function createFederation() external returns (int256);
    function addFederatorPublicKey(bytes calldata _key) external returns (int256);
    function addFederatorPublicKeyMultikey(bytes calldata _btcKey, bytes calldata _rskKey, bytes calldata _mstKey) external returns (int256);
    function commitFederation(bytes calldata _hash) external returns (int256);
    function rollbackFederation() external returns (int256);
    function getPendingFederationHash() external view returns (bytes memory);
    function getPendingFederationSize() external view returns (int256);
    function getPendingFederatorPublicKey(int256 _index) external view returns (bytes memory);
    function getPendingFederatorPublicKeyOfType(int256 _index, string calldata _type) external view returns (bytes memory);
    function getLockWhitelistSize() external view returns (int256);
    function getLockWhitelistAddress(int256 _index) external view returns (string memory);
    function getLockWhitelistEntryByAddress(string calldata _address) external view returns (int256);
    function addLockWhitelistAddress(string calldata _address, int256 _maxTransferValue) external returns (int256);
    function addOneOffLockWhitelistAddress(string calldata _address, int256 _maxTransferValue) external returns (int256);
    function addUnlimitedLockWhitelistAddress(string calldata _address) external returns (int256);
    function removeLockWhitelistAddress(string calldata _address) external returns (int256);
    function setLockWhitelistDisableBlockDelay(int256 _disableDelay) external returns (int256);
    function getFeePerKb() external view returns (int256);
    function voteFeePerKbChange(int256 _feePerKb) external returns (int256);
    function updateCollections() external;
    function getMinimumLockTxValue() external view returns (int256);
    function getBtcTransactionConfirmations(bytes32 _txHash, bytes32 _blockHash, uint256 _merkleBranchPath, bytes32[] calldata _merkleBranchHashes) external view returns (int256);
    function getLockingCap() external view returns (int256);
    function increaseLockingCap(int256 _newLockingCap) external view returns (bool);
    function registerBtcCoinbaseTransaction(bytes calldata _btcTxSerialized, bytes32 _blockHash, bytes calldata _pmtSerialized, bytes32 _witnessMerkleRoot, bytes32 _witnessReservedValue) external view;
    function hasBtcBlockCoinbaseTransactionInformation(bytes32 _blockHash) external view returns (bool);
    function registerFastBridgeBtcTransaction(bytes calldata _btcTxSerialized, uint256 _height, bytes calldata _pmtSerialized, bytes32 _derivationArgumentsHash, bytes calldata _userRefundBtcAddress, address _liquidityBridgeContractAddress, bytes calldata _liquidityProviderBtcAddress, bool _shouldTransferToContract) external view returns (int256);
    function getActiveFederationCreationBlockHeight() external view returns (uint256);
    function getBtcBlockchainBestBlockHeader() external view returns (bytes memory);
    function getBtcBlockchainBlockHeaderByHash(bytes32 _btcBlockHash) external view returns (bytes memory);
    function getBtcBlockchainBlockHeaderByHeight(uint256 _btcBlockHeight) external view returns (bytes memory);
    function getBtcBlockchainParentBlockHeaderByHash(bytes32 _btcBlockHash) external view returns (bytes memory);
}
