# Rails Tic Tac Toe
A recreation of my [ASP.NET Tic Tac Toe](https://github.com/Campbell-E-Soup/ASP.NET-TicTacToe-App) in Rails

Uses session to store game state.

## Setup

To run this project, you need a `config/master.key` to decrypt Rails credentials.

If you're just testing locally, you can create your own credentials file:

```bash
EDITOR="nano" bin/rails credentials:edit
