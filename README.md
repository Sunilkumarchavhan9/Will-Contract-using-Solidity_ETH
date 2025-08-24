# VENGENS Token Smart Contract

A Solidity-based ERC-20 compatible token contract for the VENGENS (V0) cryptocurrency.

## Contract Details

- **Token Name**: VENGENS
- **Token Symbol**: V0
- **Decimals**: 6
- **Network**: Ethereum (compatible with any EVM chain)

## Features

- **Minting**: Only the contract owner can mint new tokens
- **Transfer**: Standard token transfer functionality
- **Approval**: Allow other addresses to spend tokens on your behalf
- **TransferFrom**: Transfer tokens from approved addresses

## Functions

### `mint(uint amount)`
- Mints new tokens (owner only)
- Increases total supply and owner balance

### `transfer(uint amount, address to)`
- Transfers tokens to another address
- Requires sufficient balance

### `approve(address spender, uint256 value)`
- Approves another address to spend tokens
- Sets allowance for the spender

### `transferFrom(address from, address to, uint value)`
- Transfers tokens from one address to another
- Requires sufficient allowance and balance

## Usage

1. Deploy the contract to your preferred Ethereum network
2. The deploying address becomes the owner
3. Use `mint()` to create initial token supply
4. Use `transfer()` to send tokens to other addresses
5. Use `approve()` and `transferFrom()` for advanced token management

## Security Features

- Owner-only minting prevents unauthorized token creation
- Balance checks prevent overspending
- Allowance system for controlled token delegation

## License

MIT License
