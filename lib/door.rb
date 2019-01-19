class Door
  attr_accessor :seen, :winner, :picked

  def initialize(winner=false)
    @seen = false
    @winner = winner
    @picked = false
  end

  def picked!
    self.picked = true
  end

  def seen!
    self.seen = true
  end

  def unpicked!
    self.picked = false
  end

  def winner!
    self.winner = true
  end

  def winner?
    self.winner
  end
end