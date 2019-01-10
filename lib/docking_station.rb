require_relative 'bikes'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    empty? ? (raise 'EmptyDockError') : @bikes.pop
  end

  def dock(bike)
    bike.ask_user
    full? ? (raise 'DockFullError') : @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
