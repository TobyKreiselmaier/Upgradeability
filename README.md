# Upgradeability
A great example of how to make smart contracts, which are immutable by nature 
upgradeable through the use of a proxy setup.

The code consists of three contracts:

Proxy   - the user interacts with.
Dogs    - contains all the functionality.
Storage - defines variables and functions for both of the above.

DogsUpdated - simulates a new functional contract that is better/safer.