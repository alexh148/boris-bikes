require_relative 'bikes'

class DockingStation

  attr_reader :bikes

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
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end

end
