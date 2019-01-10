require 'docking_station'

describe DockingStation do

  before(:each) do
    @bike = Bike.new
    @default_capacity = DockingStation::DEFAULT_CAPACITY
  end

  describe '#bikes' do
    it { is_expected.to respond_to :bikes }
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'should not include the bike in the bikes array when released' do
      subject.dock(@bike)
      subject.release_bike
      expect(subject.bikes).not_to include(@bike)
    end

    it 'should raise error if the dock is empty' do
      expect { subject.release_bike }.to raise_error('EmptyDockError')
    end
  end

  describe '#working?' do
    it "releases working bikes" do
      expect(@bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "adds a new bike to the docking station" do
      subject.dock(@bike)
      expect(subject.bikes).to include(@bike)
    end

    it "should raise an error if the docking station is full" do
      @default_capacity.times {subject.dock(@bike)}
      expect {subject.dock(@bike)}.to raise_error 'DockFullError'
    end
  end

end
