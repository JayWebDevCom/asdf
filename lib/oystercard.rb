require_relative 'station'
require_relative 'journey_log'

#understands

class Oystercard
  attr_reader :balance, :journey

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY = 6

  def initialize
    @balance = 0
    @journey = nil
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Limit of £#{BALANCE_LIMIT} reached" if limit_reached?(amount)
    @balance += amount
  end

  def in_journey?
    !!@journey
  end

  def touch_in(station)
    charge_penalty_in if in_journey?
    raise 'Balance too low to travel' if low_balance?
    @journey = Journey.new(station.name, station.zone)
  end

  def touch_out(end_station)
    charge_penalty_out(end_station) unless in_journey?
    deduct
    record_journey(end_station)
  end

  private

  def limit_reached?(amount)
    @balance + amount > BALANCE_LIMIT
  end

  def record_journey(end_station)
    @journey.complete(end_station)
    @journey_log.add(@journey)
    @journey = nil
  end

  def low_balance?
    @balance < MINIMUM_FARE
  end

  def deduct
    @balance -= fare
  end

  def charge_penalty_in
    @journey = nil
    deduct
  end

  def charge_penalty_out(station)
    deduct
    @journey = Journey.new(station.name, station.zone)
  end

  def fare
     in_journey? ? MINIMUM_FARE : PENALTY
  end

end
