require_relative 'bikes'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'EmptyDockError' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'DockFullError' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
