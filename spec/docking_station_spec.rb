require "docking_station"

describe DockingStation do

  context 'creates an instance of the class with a capacity' do
    it { is_expected.to have_attributes(capacity: 20) }
  end

  context 'Releasing a bike' do
    it 'releases a bike' do
      bike1 = Bike.new
      bike2 = Bike.new
      subject.dock(bike1)
      subject.dock(bike2)
      subject.release_bike(bike1)
      expect(subject.bike_docked?(bike1)).to be false
    end

    it 'raises an error if no bikes available' do
      expect {subject.release_bike(Bike.new)}.to raise_error('Sorry, no bikes')
    end
  end

 context 'Docking a bike' do
   it 'docks a bike' do
     bike = Bike.new
     subject.dock(bike)
     expect(subject.bike_docked?(bike)).to be true
   end

   it 'raises an error if a bike is already docked' do
     DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
     expect {subject.dock(Bike.new)}.to raise_error('Sorry, we are full!')
   end
 end


 context 'capacity' do
   it 'sets the default capacity to 20' do
      expect(subject.capacity).to eq 20
    end
    it 'allows capacity to be overridden' do
      capacity = 5
      station = DockingStation.new(capacity)
      expect(station.capacity).to eq(capacity)
    end
 end



end
