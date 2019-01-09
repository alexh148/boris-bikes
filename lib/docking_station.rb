require_relative 'bikes'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'EmptyDockError' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'DockFullError' if @bikes.count >= 20
    @bikes << bike
  end

end
