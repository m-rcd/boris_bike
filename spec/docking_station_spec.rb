require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'releases a bike' do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it 'has a docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike_store).to include(bike)
  end

  it 'raises an error if no bikes available' do
    expect {subject.release_bike}.to raise_error('Sorry, no bikes')
  end

  it 'raises an error if a bike is already docked' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect {subject.dock(Bike.new)}.to raise_error('Sorry, we are full!')
  end

  it 'allows capacity to be set' do
    capacity = 5
    station = DockingStation.new(capacity)
    expect(station.capacity).to eq(capacity)
  end

end
