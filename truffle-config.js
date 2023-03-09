require('dotenv').config();
const MNEMONIC = process.env.mnemonicphrase
const ALCHEMY_API_KEY = process.env.alchemyApiKey

const HDWalletProvider = require('@truffle/hdwallet-provider');
const alchemyEndpoint = `https://polygon-mumbai.g.alchemy.com/v2/${ALCHEMY_API_KEY}`;

module.exports = {
  /**
   * $ truffle test --network <network-name>
   */

  networks: {
    mumbai: {
      provider: () => new HDWalletProvider(MNEMONIC, alchemyEndpoint),
      network_id: 80001,
      gas: 1000000,
      gasPrice: 1000000,
    },
  },

  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "0.8.19",

    }
  },
};
