require 'bikes'

describe Bike do

  before (:each) do
    @bike = Bike.new
  end

  describe '#working?' do
    it {is_expected.to respond_to :working?}
  end

  it "asks user for input, sets working variable of bike to false if user enters no" do
    allow($stdin).to receive(:gets).and_return ('No')
    @bike.ask_user = $stdin.gets
    expect(@bike.working).to eq false
  end



end
