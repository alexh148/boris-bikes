require_relative 'bikes'

class DockingStation

def initialize
  @bike = "Dock is empty"
end

attr_reader :bike

  def release_bike
    Bikes.new
  end

  def dock(bike_to_be_added)
    @bike = bike_to_be_added
  end

end

#DockingStation.dock(newbike)
