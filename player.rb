class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player

end

class ComputerPlayer < Player

end
