class Bike

  BROKEN = false

  attr_reader :broken

  def initialize(broken = BROKEN)
    @broken = broken
  end

  def broken?
    (0..10).to_a.sample >= 8
  end
end
