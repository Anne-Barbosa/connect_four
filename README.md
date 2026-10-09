# Connect Four (Ruby)

A classic **Connect Four** game built in Ruby using **Test-Driven Development (TDD)** principles. It features a fully interactive command-line interface (CLI) with professional emoji support and customizable players.

## Features

* **Two-Player Mode:** Play locally with a friend in the terminal.
* **Custom Names and Emojis:** Choose your own player names and custom emoji markers (like 🔴, 🟡, 🐱, 🚀).
* **Complete Game Logic:** Detects vertical, horizontal, and diagonal wins, plus board-full ties.
* **Gravity Mechanics:** Pieces automatically fall to the lowest available space in the chosen column.
* **Tested with RSpec:** Built step-by-step using TDD to ensure solid, bug-free code.

## Project Structure

```text
├── lib/
│   ├── board.rb      # Manages the 6x7 grid, gravity, and display
│   ├── player.rb     # Stores player name and marker
│   └── game.rb       # Coordinates turns, moves, and win/draw checks
├── spec/
│   ├── board_spec.rb # Tests for the board logic
│   ├── player_spec.rb# Tests for the player class
│   └── game_spec.rb  # Tests for game rules and win conditions
└── main.rb           # Main executable file to run the game
```
## Requirements

- Ruby (version 3.x recommended)
- RSpec (gem for testing)

## How to Run the Tests

To run the RSpec test suite and check if everything is passing, open your terminal in the project folder and run:

```
rspec
```
## How to Play

1. Open your terminal in the project directory.
2. Run the main executable file:
```
ruby play.rb
```
3. Enter the names and choose the emoji markers for Player 1 and Player 2.
4. Take turns entering a column number (0 to 6) to drop your piece.
5. First player to connect 4 pieces in a row wins! 

## Author
Anne Barbosa
Built with passion while learning Ruby and TDD principles.

