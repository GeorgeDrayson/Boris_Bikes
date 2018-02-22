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

  it 'allows user to dock a broken bike' do
    ds = DockingStation.new
    bike = ds.release_bike
    ds.dock(bike, 'broken')
    expect(ds.bikes_in_station[-1].working?).to eq false
  end

  it "doesn't release a broken bike when there are only broken bikes" do
    expect {
      ds = DockingStation.new(1)
      bike = ds.release_bike
      ds.dock(bike, 'broken')
      ds.release_bike
    }.to raise_error("No working bikes at this station")
  end

  it "doesn't release a broken bike when there are some broken bikes" do
    ds = DockingStation.new(2)
    bike = ds.release_bike
    ds.dock(bike, 'broken')
    expect(ds.release_bike.working?).to eq true
  end

end
# a) gets a Bike
# b) expects the bike to be working
