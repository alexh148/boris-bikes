require 'docking_station'

describe DockingStation do
  describe '#bikes' do
    it { is_expected.to respond_to :bikes }
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'should return the bike that is already docked when we release bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(subject.bikes).not_to include(bike)
    end

    it 'should raise error if the dock is empty' do
      expect { subject.release_bike }.to raise_error('EmptyDockError')
    end
  end

  describe '#working?' do
    it "releases working bikes" do
      bike = Bike.new
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "adds a new bike to the docking_station" do
      bike1 = Bike.new
      expect(subject.dock(bike1)).to include(bike1)
    end

    it "should raise and error if the docking station is full" do
      20.times {subject.dock(Bike.new)}
      expect {subject.dock Bike.new}.to raise_error 'DockFullError'
    end
  end

end
