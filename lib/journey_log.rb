class JourneyLog

  attr_accessor :history

  def initialize
    @history = { 0 => '' }
  end

  def add(journey)
    key = number_of_journies + 1
    @history[key] = journey
  end

  def number_of_journies
    history.keys.max
  end

end
