class HumanPlayer < Player

  def get_move
    read_char
  end

  def get_pos
    pos = gets.chomp.split(",")

    validate(pos)
  rescue ArgumentError
    puts "The input should be integers. Please try again:"
    retry
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

class InputError < StandardError
end
