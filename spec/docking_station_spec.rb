require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'releases a bike' do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    expect(station.release_bike).to be_instance_of(Bike)
  end
  it { is_expected.to respond_to(:dock).with(1).argument}
  it 'stores bikes' do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    expect(station.store[0]).to eq(bike)
  end
  it 'throws error when there are no more bike' do
    expect {subject.release_bike}.to raise_error("No more bikes. Sorry come back another time. Bye!")
  end
  it 'thows an error when there are too many bikes in storage' do
    station = DockingStation.new
    (1..11).each do
      bike = Bike.new
      station.dock(bike)
    end
    bike = Bike.new
    expect {station.dock(bike)}.to raise_error("Too many bikes, mate!")
  end
end
