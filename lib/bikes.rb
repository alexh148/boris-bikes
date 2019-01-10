class Bike
attr_reader :working

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def ask_user
    puts "Is this bike working?"
    input = gets.chomp
    @working = false if input == "No"
  end

end
