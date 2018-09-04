require_relative 'bike'

class DockingStation

  attr_reader :store

  def initialize
    @store = []
  end

  def release_bike
    return Bike.new unless @store.empty?
    raise "No more bikes. Sorry come back another time. Bye!"
  end

  def dock(bike)
    return @store << bike unless store.count > 10
    raise "Too many bikes, mate!"
  end

end
