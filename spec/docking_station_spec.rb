require 'docking_station'

describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'should return the bike that is already docked when we release bike' do
      bike = Bikes.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'should raise error if the dock is empty' do
      expect { subject.release_bike }.to raise_error('EmptyDockError')
    end
  end

  describe '#working?' do
    it "releases working bikes" do
      bike = Bikes.new
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "adds a new bike to the docking_station" do
      bike1 = Bikes.new
      expect(subject.dock(bike1)).to eq bike1
    end

  end

end
