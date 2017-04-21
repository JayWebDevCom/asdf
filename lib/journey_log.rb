class JourneyLog

  attr_accessor :history

  def initialize
    @history = { 0 => '' }
  end

  def add(journey)
    @history[ number_of_journies + 1 ] = journey
  end

  def number_of_journies
    history.keys.max
  end

end
