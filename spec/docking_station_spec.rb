require "docking_station"

describe DockingStation do

  context 'creates an instance of the class with a capacity' do
    it { is_expected.to have_attributes(capacity: 20) }
  end

  context 'Releasing a bike' do
    let(:bike) { double :bike }
    it 'releases a bike' do
      bike1 = double(:bike, broken?: false)
      bike2 = double(:bike, broken?: false)
      subject.dock(bike1)
      subject.dock(bike2)
      subject.release_bike(bike1)
      expect(subject.bike_docked?(bike1)).to be false
    end

    it 'raises an error if no bikes available' do
      bike = double(:bike, report_broken: false)
      expect {subject.release_bike(bike)}.to raise_error('Sorry, no bikes')
    end

    it 'raises an error if bike broken' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike(bike) }.to raise_error('Bike is broken!')
    end
  end

 context 'Docking a bike' do

  it 'docks a bike' do
     bike = double(:bike)
     subject.dock(bike)
     expect(subject.bike_docked?(bike)).to be true
   end

   it 'returns a broken bike' do
     bike = double(:bike, broken?: false)
     subject.dock(bike)
     subject.release_bike(bike)
     subject.dock(bike)
     expect(subject.bike_docked?(bike)).to be true
   end

   it 'raises an error if a bike is already docked' do
     bike = double(:bike)
     DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
     expect {subject.dock(bike)}.to raise_error('Sorry, we are full!')
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
