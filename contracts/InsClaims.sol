// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract InsuranceClaims {
    struct Claim {
        string description;
        uint256 amount;
        bool approved;
        address claimant;
    }

    mapping(bytes32 => Claim) public claims;

    event ClaimSubmitted(bytes32 indexed claimId, string description, uint256 amount, address indexed claimant);
    event ClaimApproved(bytes32 indexed claimId);
    event ClaimRejected(bytes32 indexed claimId);

    function submitClaim(bytes32 claimId, string memory description, uint256 amount) public {
        claims[claimId] = Claim(description, amount, false, msg.sender);
        emit ClaimSubmitted(claimId, description, amount, msg.sender);
    }

    function approveClaim(bytes32 claimId) public {
        claims[claimId].approved = true;
        emit ClaimApproved(claimId);
    }

    function rejectClaim(bytes32 claimId) public {
        delete claims[claimId];
        emit ClaimRejected(claimId);
    }

    function getClaim(bytes32 claimId) public view returns (string memory, uint256, bool, address) {
        Claim memory claim = claims[claimId];
        return (claim.description, claim.amount, claim.approved, claim.claimant);
    }
}
