/**
 * @type import('hardhat/config').HardhatUserConfig
 */
/*module.exports = {
  solidity: "0.8.0",
  networks: {
    hardhat: {
      rinkeby : {
        url: process.env.RINKEBY_URL || "",
        accounts: process.env.PRIVATE_KEY != undefined ? [process.env.PRIVATE_KEY] : [],
      }
    }
  }
};*/
require('@nomiclabs/hardhat-ethers');
module.exports = {
  defaultNetwork: "rinkeby",
  networks: {
    hardhat: {
    },
    rinkeby: {
      url: process.env.RINKEBY_URL || "",
      accounts: process.env.PRIVATE_KEY != undefined ? [process.env.PRIVATE_KEY] : [],
    }
  },
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 40000
  }
}
