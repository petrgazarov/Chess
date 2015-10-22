# Chess
A two-player chess game written in Ruby and played in the console.

##About
[SlidingPiece][sliding-piece] and [SteppingPiece][stepping-piece] classes are utilized to avoid repetition and DRY up code. [Keyboard support][keypress] is implemented via io/console extension of Ruby's built-in IO class.

I wrote [RSpec unit tests][spec] for all pieces. I created modules to DRY up specs code.

[sliding-piece]: ./lib/sliding_piece.rb
[stepping-piece]: ./lib/stepping_piece.rb
[keypress]: ./lib/keypress.rb
[spec]: ./spec

##How to Play
NB: If you don't have Ruby, you can download it using simple instructions [here][ruby]. Make sure you are running Ruby version > 2.1.0

[ruby]: https://www.ruby-lang.org/en/downloads/

The game is played via keyboard input. To pick a piece, use arrow keys for navigation on the board and 'enter' for selection. Repeat for destination cell.

* Download the repo
* Navigate to the Chess folder and run:

```
$ bundle install
```

You are now ready to play the game!
```
$ ruby play.rb
```

##To-Dos
- [x] Write RSpec Tests for pieces
- [ ] Write RSpec Tests for everything else
- [ ] Implement en-passant, promotion and castling
- [ ] Implement Computer Player AI
