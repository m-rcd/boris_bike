require 'bike'

describe Bike do

  context 'creates an instance that has a broken argument' do
    it { is_expected.to have_attributes(broken: false) }
  end
end
