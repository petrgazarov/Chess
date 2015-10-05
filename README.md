# Chess
A two-player chess game written in Ruby and played in the console.

##About
A series of algorithms were used in development to check the validity of potential moves.
[SlidingPiece][sliding-piece] and [SteppingPiece][stepping-piece] classes are utilized to avoid repetition and DRY up code. [Keyboard support][keypress] is implemented via io/console extension of Ruby's built-in IO class.

[sliding-piece]: ./lib/sliding_piece.rb
[stepping-piece]: ./lib/stepping_piece.rb
[keypress]: ./lib/keypress.rb

##How to Play
NB: If you don't have Ruby, you can download it using simple instructions [here][ruby]. Make sure you are running Ruby version > 2.1.0

[ruby]: https://www.ruby-lang.org/en/downloads/

The game is played via keyboard input. To pick a piece, use arrow keys for navigation on the board and 'enter' for selection. Repeat for destination cell.

* Download the repo
* Install the colorize gem. On a mac, you can run the following command from the root folder of the game:

```
$ gem install colorize
```

You are ready to play the game! :)
```
$ ruby library.rb
```

##To-Dos
- [ ] Write RSpec Test Suite
- [ ] Implement en-passant, promotion and castling
- [ ] Implement Computer Player AI
