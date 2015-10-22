# Chess
A two-player chess game written in Ruby and played in the console.

##About
I wrote comprehensive [RSpec unit tests][spec] and created modules ([here][example_helpers] and [here][example_group_helpers]) to DRY up specs code.

[SlidingPiece][sliding-piece] and [SteppingPiece][stepping-piece] classes are utilized to avoid repetition and DRY up pieces code. Keyboard support is implemented via io/console extension of Ruby's built-in IO class.


[sliding-piece]: ./lib/sliding_piece.rb
[stepping-piece]: ./lib/stepping_piece.rb
[keypress]: ./lib/keypress.rb
[spec]: ./spec
[example_helpers]: ./spec/example_helpers.rb
[example_group_helpers]: ./spec/example_group_helpers.rb

##How to Play
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
- [x] Write RSpec unit tests
- [ ] Implement en-passant, promotion and castling
- [ ] Implement Computer Player AI
