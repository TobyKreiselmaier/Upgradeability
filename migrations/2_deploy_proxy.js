const Dogs = artifacts.require('Dogs');
const DogsUpdated = artifacts.require('DogsUpdated');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){
  //Deploy Contract Instances
  const dogs = await Dogs.new();
  const proxy = await Proxy.new(dogs.address);

  //Create Proxy Dog to Fool Truffle
  //Create a 'Dogs' instance at an already deployed contract address.
  //This only works because of the setup with the shared storage
  var proxyDog = await Dogs.at(proxy.address);

  //Set the nr of dogs through the proxy
  await proxyDog.setNumberOfDogs(10);

  //Testing
  var nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("With Dogs contract: " + nrOfDogs.toNumber());

  //Deploy new version of Dogs
  const dogsUpdated = await DogsUpdated.new();
  proxy.upgrade(dogsUpdated.address);

  //Fool truffle once again. It now thinks proxyDog has all functions.
  proxyDog = await DogsUpdated.at(proxy.address);
  //Initialize proxy state.
  proxyDog.initialize(accounts[0]);

  //Check so that storage remained
  nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("With DogsUpdated: " + nrOfDogs.toNumber());

  //Set the nr of dogs through the proxy with NEW FUNC CONTRACT
  //originally reverted bc owner was the proxy not the deploying user.
  await proxyDog.setNumberOfDogs(30);//only accounts[0] can delegatecall this.

  //Check so that setNumberOfDogs worked with new func contract.
  nrOfDogs = await proxyDog.getNumberOfDogs();
  console.log("After change: " + nrOfDogs.toNumber());
}