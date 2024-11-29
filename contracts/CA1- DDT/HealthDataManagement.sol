// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthDataManagement {
    // Structure for storing patient data
    struct Patient {
        uint id;
        string name;
        address patientAddress;
        string medicalHistory;
        bool exists;
    }

    // Structure for authorized providers
    struct Provider {
        address providerAddress;
        bool isAuthorized;
    }

    // Mapping to store patient data by ID
    mapping(uint => Patient) private patients;
    uint private patientCounter;

    // Mapping to store authorized healthcare providers
    mapping(address => Provider) public providers;

    // Owner of the contract (typically a health institution or network admin)
    address public owner;

     // Events
    event PatientRegistered(uint patientId, string name, address patientAddress);
    event ProviderAuthorized(address providerAddress);
    event ProviderRevoked(address providerAddress);
    event AccessGranted(uint patientId, address providerAddress);
    event MedicalHistoryUpdated(uint patientId, string newMedicalHistory);

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Modifier to restrict access to authorized providers
    modifier onlyAuthorizedProvider() {
        require(providers[msg.sender].isAuthorized == true, "Not an authorized provider");
        _;
    }

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to register a new patient
    function registerPatient(string memory _name, address _patientAddress, string memory _medicalHistory) public onlyOwner {
        patientCounter++;
        patients[patientCounter] = Patient(patientCounter, _name, _patientAddress, _medicalHistory, true);
        emit PatientRegistered(patientCounter, _name, _patientAddress);
    }

    // Function to authorize a healthcare provider
    function authorizeProvider(address _providerAddress) public onlyOwner {
        providers[_providerAddress] = Provider(_providerAddress, true);
        emit ProviderAuthorized(_providerAddress);
    }

    // Function to revoke authorization of a healthcare provider
    function revokeProvider(address _providerAddress) public onlyOwner {
        providers[_providerAddress].isAuthorized = false;
        emit ProviderRevoked(_providerAddress);
    }

    // Function for authorized providers to view patient data
    function viewPatientData(uint _patientId) public view onlyAuthorizedProvider returns (string memory name, string memory medicalHistory) {
        require(patients[_patientId].exists, "Patient does not exist");
        Patient memory patient = patients[_patientId];
        return (patient.name, patient.medicalHistory);
    }

    // Function for authorized providers to update medical history
    function updateMedicalHistory(uint _patientId, string memory _newMedicalHistory) public onlyAuthorizedProvider {
        require(patients[_patientId].exists, "Patient does not exist");
        patients[_patientId].medicalHistory = _newMedicalHistory;
        emit MedicalHistoryUpdated(_patientId, _newMedicalHistory);
    }

    // Function for patients to grant access to a provider
    function grantAccessToProvider(uint _patientId, address _providerAddress) public {
        require(patients[_patientId].patientAddress == msg.sender, "Only the patient can grant access");
        require(patients[_patientId].exists, "Patient does not exist");
        providers[_providerAddress].isAuthorized = true;
        emit AccessGranted(_patientId, _providerAddress);
    }

}
