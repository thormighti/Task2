require("@nomiclabs/hardhat-waffle");
require("dotenv").config({ path: ".env" });

const ALCHEMY_API_KEY_URL = process.env.ALCHEMY_API_KEY_URL;

const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.4",
  networks: {
    localhost:{
      url:"127.0.0.1:8545"
    },
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/kBQgiKvhhtPp2_6TrHyrdRpeq2USykU3",
      accounts: ["a529f08f5b76492a9198ef59bdf28304d56316999c4ecc96ffdc697e7fb0a82a"],
    },
  },
};
