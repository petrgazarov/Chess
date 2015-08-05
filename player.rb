class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player

  def get_move
    prompt("starting")
    starting_pos = get_input

    prompt("ending")
    ending_pos = get_input

    [starting_pos, ending_pos]
  end

  private

  def get_input
    pos = gets.chomp.split(",")

    validate(pos)
  rescue ArgumentError
    puts "The input should be integers."
  rescue InputError => e
    puts e.message
    retry
  end

  def validate(pos)
    pos.map! { |i| Integer(i) }
    raise InputError.new("The input should contain 2 numbers (e.g. \"2,1\").") unless pos.length == 2
    pos
  end

  def prompt(move)
    puts "Please enter your #{move} position."
    print " >"
  end

end

class ComputerPlayer < Player

  def prompt

  end
end

class InputError < StandardError

end
