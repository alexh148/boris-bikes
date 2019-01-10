require 'docking_station'

describe DockingStation do

  before(:each) do
    @bike = Bike.new
  end

  describe '#initialize' do
    it 'should initialize with a default capacity of 20' do
      expect(subject.capacity).to eq 20
    end
    it 'should initialize with a custom capacity of 25' do
      docking_station = DockingStation.new(25)
      expect(docking_station.capacity).to eq 25
    end
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
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
  end

    it 'should not release a bike if it is not working' do
      @bike.report_broken
      subject.dock(@bike)
      expect(subject.release_bike).to raise_error('No bikes available')
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
      subject.capacity.times {subject.dock(@bike)}
      expect {subject.dock(@bike)}.to raise_error 'DockFullError'
    end


  end

end
