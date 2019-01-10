require_relative 'bikes'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    useable_bikes = @bikes.select { |bike| bike.working? }
    useable_bikes.empty? ? (raise 'No bikes available') : @bikes.delete(useable_bikes.first)
  end

  def dock(bike)
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
