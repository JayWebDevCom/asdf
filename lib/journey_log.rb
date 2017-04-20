class JourneyLog

  attr_accessor :history

  def initialize
    @history = []
  end

  def add(journey)
    @history << journey
  end


  def number_of_journies
    history.size
  end

end
