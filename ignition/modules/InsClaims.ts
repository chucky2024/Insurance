import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const InsuranceClaimsModule = buildModule("InsuranceClaims", (m) => {

    const erc20 = m.contract("InsuranceClaims");

    return { erc20 };
});

export default InsuranceClaimsModule;
//contract address = 0x618529A1e32c289775c62C24e5c514516e3461EA