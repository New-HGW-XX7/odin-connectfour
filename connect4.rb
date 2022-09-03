class Game
  attr_accessor :grid
  def initialize
    @grid = Array.new(3) { Array.new(3, nil) }
  end

  def print_grid
    grid.each do |subarr|
      counter = 0
      subarr.each do |value|
        counter += 1
        if value.nil?
          if counter == 3
            print "nil\n"
          else
            print "nil "
          end
        else
          if counter == 3
            print "#{value.color}\n"
          else
            print "#{value.color} "
          end
        end
      end
    end
  end

  def player_column_choice(player_num)
    puts "Player #{player_num}, choose a column"
    gets.chomp
  end
   
end

# game = Game.new
# game.print_grid