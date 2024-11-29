# HealthDataManagement-DApp

## Project Description

**HealthDataManagement-DApp** is a blockchain-based smart contract designed to securely, efficiently, and decentralizedly manage medical data. The main idea is to provide a system where patients have full control over their medical data, allowing access to healthcare providers and maintaining a secure and immutable record. This project addresses security and privacy issues in centralized health systems, such as the cyberattack suffered by the Irish health system (HSE) in 2021.

## Motivation

The security and privacy of medical data are crucial. Traditional, centralized health systems are vulnerable to attacks and data breaches, as evidenced by the **HSE (Health Service Executive)** cyberattack in Ireland in 2021. With blockchain technology, it is possible to enhance security by ensuring that medical data is only accessible to authorized parties and that every change to the data is transparent and immutable.

## Project Features

- **Patient Registration**: The system administrator can register patients on the blockchain.
- **Provider Authorization**: Healthcare providers must be authorized by the administrator to access medical data.
- **Patient Control**: Patients have control over who can view their data, granting and revoking access to providers.
- **Security and Transparency**: Utilizes blockchain immutability to ensure the security of medical information.

## Technologies Used

- **Solidity**: For developing the smart contract.
- **Remix IDE**: For writing and deploying the contract.
- **Ganache**: For creating a local blockchain for testing.
- **MetaMask**: For interacting with the blockchain.

## Requirements

- **Node.js and npm**: To install and run Ganache.
- **MetaMask**: Browser extension for blockchain interaction.
- **Remix IDE**: Preferably the online version to deploy the contract.

## Setup and Project Execution

### Step 1: Start Ganache

1. Start **Ganache** to create a local blockchain network.
2. Ensure the network is running at `http://127.0.0.1:7545` and the **Chain ID** is `1337` (or `5777`).

### Step 2: Connect MetaMask to Ganache

1. Open **MetaMask** and import one of the Ganache accounts using the private key.
2. Add a custom network in MetaMask with the following details:
   - **Network Name**: Ganache Local
   - **New RPC URL**: `http://127.0.0.1:7545`
   - **Chain ID**: `1337` or `5777`
   - **Currency Symbol**: ETH

### Step 3: Deploy the Contract in Remix

1. Open **Remix IDE** and create a new file named `HealthDataManagement.sol`.
2. Copy and paste the contract code into the file.
3. Compile the contract, ensuring you use version `0.8.0` or similar.
4. Go to the **Deploy & Run Transactions** tab and select **"Injected Provider - MetaMask"** as the environment.
5. Click **Deploy** and confirm the transaction in MetaMask.

### Step 4: Interact with the Contract

- **Register Patients**: Use the `registerPatient` function with the patient's details.
- **Authorize Providers**: As the administrator, use `authorizeProvider` to allow a provider to access the data.
- **View Patient Data**: Switch to the authorized provider account and use `viewPatientData` to access the patient's data.
- **Revoke Access**: Use `revokeProvider` to revoke a provider's authorization.

## Usage Examples

- **Register a Patient**: The administrator enters the patient's details (only the admin can do this).
- **Grant Access**: A patient can grant access to a specific provider using the `grantAccessToProvider` function.
- **Test Denied Access**: Switch to an unauthorized account and attempt to use `viewPatientData` to see that access is denied.

## Screenshots

![Patient Registration in Remix](path/to/screenshot.png)
![MetaMask Interaction](path/to/another-screenshot.png)


## References

- Medinaceli, K. (2024). Blockchain in Healthcare.
- Health Service Executive, Ireland. (2021). Cybersecurity Incident Report.

## Complete Project on Github
(https://github.com/2022475/HealthDataManagement-DApp.git)

