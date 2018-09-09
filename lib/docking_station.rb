require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
     @bikes = []
     @capacity = capacity
  end

  def release_bike(bike)
    fail 'Sorry, no bikes' if empty?
    @bikes.delete(bike)
  end

  def dock(bike)
    fail 'Sorry, we are full!' if full?
    @bikes << bike
  end

  def bike_docked?(bike)
    @bikes.include?(bike)
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end


end
