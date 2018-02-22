require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { expect(subject.release_bike).to be_a Bike }
  it { expect(subject.release_bike.working?).to eq true }
  it { is_expected.to respond_to :dock }

  it "raises an error when no bike available" do
    expect {
      station = DockingStation.new
      21.times{station.release_bike}
    }.to raise_error("No bikes at this station")
  end

  it "raises an error when the dock is full" do
    expect {
      station1 = DockingStation.new
      station2 = DockingStation.new
      bike1 = station1.release_bike
      station2.dock(bike1)
    }.to raise_error("The station is full")
  end

  it "checks if the user can set capacity" do
    expect(
      DockingStation.new(30).bikes_in_station.length
    ).to eq 30
  end

  it "checks if default capacity is the default of capacity" do
    expect(
      DockingStation.new.bikes_in_station.length
    ).to eq 20
  end


end

# a) gets a Bike
# b) expects the bike to be working
