require_relative 'bikes'

class DockingStation

  attr_reader :bike

  def initialize
    @bike = nil
  end

  def release_bike
    raise 'EmptyDockError' unless @bike
    @bike
  end

  def dock(bike)
    raise 'DockFullError' if @bike
    @bike = bike
  end

end
