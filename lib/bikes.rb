class Bike
attr_reader :working

  def initialize
    @working = true
  end


  def working?
    @working = false if ask_user == "No"
    @working
  end

private
  def ask_user
    puts "Is this bike broken?"
    input = gets.chomp
  end

end
