require './lib/door'

class Game
  attr_reader :doors, :switch
  
  def initialize(doors=3, switch=true)
    raise StandardError if doors < 3
    @doors = create_doors(doors)
    @switch = switch
  end

  def door_count
    doors.size
  end

  def pick_a_door
    picked_door = doors.sample
    picked_door.picked!
  end

  def picked_door
    doors.find { |door| door.picked == true }
  end

  def play!
    pick_a_door
    remeaining_doors = []
    if winning_door == picked_door
      remaining_doors = doors - [winning_door, other_doors.sample]
    else
      remaining_doors = doors - [winning_door, picked_door]
    end
    remaining_doors.each(&:seen!)
    switch_doors if switch
    did_we_win?
  end

  def winning_door
    doors.find { |door| door.winner == true }
  end

  private
  
  def create_doors(num)
    door_array = Array.new(num) { Door.new }
    door_array.sample.winner!
    door_array
  end
  
  def did_we_win?
    picked_door == winning_door
  end
  
  def other_doors
    doors - [winning_door, picked_door]
  end

  def switch_doors
    u_door = unseen_doors.find { |door| door.picked == false }
    p_door = picked_door
    
    u_door.picked!; p_door.unpicked!
  end
  
  def unseen_doors
    doors.find_all { |door| door.seen == false }
  end

end