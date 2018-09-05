require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bike_store, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
     @bike_store = []
     @capacity = capacity
  end

  def release_bike
    fail 'Sorry, no bikes' if empty?
    @bike_store.pop
  end

  def dock(bike)
    fail 'Sorry, we are full!' if full?
    @bike_store << bike
  end

  private

  def full?
    @bike_store.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_store.empty?
  end
end
