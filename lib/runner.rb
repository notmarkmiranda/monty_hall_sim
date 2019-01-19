require './lib/game'

class Runner
  attr_reader :percentage, :games, :doors

  def initialize(games: 2, percentage: 100, doors: 3)
    @percentage = percentage
    @games = games
    @doors = doors
  end

  def falses
    games - trues
  end
  
  def percentage_converted
    percentage.to_f / 100
  end

  def run!
    outcomes = switches_array.map do |switch|
      Game.new(doors, switch).play!
    end

    wins = outcomes.count { |outcome| outcome == true }
    puts "#{wins.to_f} wins out of #{outcomes.count} chances"
    puts "#{(wins.to_f / outcomes.count) * 100.0}%"
  end

  def switches_array
    (Array.new(trues) { true } + Array.new(falses) { false }).shuffle!
  end

  def trues
    (percentage_converted * games).round
  end

end