class DockingStation
  attr_reader :bikes_in_station
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes_in_station = []
    @capacity = capacity
    @capacity.times{@bikes_in_station << Bike.new}
  end

  def release_bike
    fail "No bikes at this station" if empty?
    @bikes_in_station.each_with_index do |bike, index|
      if bike.working?
        bike.release
        @bikes_in_station.delete_at(index)
        return bike
      end
    end
    fail "No working bikes at this station"
  end

  def dock(bike, status="working")
    fail "The station is full" if full?
    @bikes_in_station.push(bike)
    bike.working_status = status
    bike.dock
  end

  private

  def empty?
    @bikes_in_station.empty?
  end

  def full?
    @bikes_in_station.length == @capacity
  end

end

class Bike
  attr_reader :dock_status
  attr_writer :working_status

  def initialize
    @dock_status = "docked"
    @working_status = "working"
  end

  def dock
    @dock_status = "docked"
  end

  def release
    @dock_status = "undocked"
  end

  def working?
    return true if @working_status == "working"
    false
  end

end
