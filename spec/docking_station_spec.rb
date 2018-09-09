require "docking_station"
require 'Bike'

describe DockingStation do

  context 'creates an instance of the class with a capacity' do
    it { is_expected.to have_attributes(capacity: 20) }
  end

  context 'Releasing a bike' do
    it 'releases a bike' do
      bike1 = Bike.new
      bike2 = Bike.new
      allow(subject).to receive(:broken?) { false }
      subject.dock(bike1)
      subject.dock(bike2)
      subject.release_bike(bike1)
      expect(subject.bike_docked?(bike1)).to be false
    end

    it 'raises an error if no bikes available' do
      expect {subject.release_bike(Bike.new)}.to raise_error('Sorry, no bikes')
    end

    it 'raises an error if bike broken' do
      bike = Bike.new
      allow(bike).to receive(:broken?) { false }
      subject.dock(bike)
      allow(bike).to receive(:broken?) { true }
      expect { subject.release_bike(bike) }.to raise_error('Bike is broken!')
    end
  end

 context 'Docking a bike' do
   it 'docks a bike' do
     bike = Bike.new
     allow(bike).to receive(:broken?) { false }
     subject.dock(bike)
     expect(subject.bike_docked?(bike)).to be true
   end

   it 'raises an error if a bike is already docked' do
     allow(subject).to receive(:broken?) { false }
     DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
     expect {subject.dock(Bike.new)}.to raise_error('Sorry, we are full!')
   end

   it 'reports a bike as broken' do
     bike = Bike.new
     subject.dock(bike)
     allow(bike).to receive(:broken) { false }
     subject.release_bike(bike)
     subject.dock(bike)
     allow(subject).to receive(:broken) { true }
     expect(bike.broken?).to eq false
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
