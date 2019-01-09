require 'docking_station'

describe DockingStation do
  # it 'responds to release_bike' do
    # expect(subject).to respond_to :release_bike
  # end
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "responds to the method dock" do
    # bike = Bikes.new
    # docking_station = DockingStation.new
    expect(subject).to respond_to :dock
  end

  it "adds a new bike to the docking_station" do
    bike1 = Bikes.new
    expect(subject.dock(bike1)).to eq bike1

    # docking_station = DockingStation.new
    # bike1 = docking_station.release_bike
    # docking_station.dock(bike1)
    # expect(docking_station.bike).to eq (bike1)


  end



end
