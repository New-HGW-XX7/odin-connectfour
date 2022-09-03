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
            print "#{value}\n"
          else
            print "#{value} "
          end
        end
      end
    end
  end

  def player_column_choice(player_num)
    puts "Player #{player_num}, choose a column"
    gets.chomp
  end

  def take_chip(column, object = 'Y')
    return puts 'Column full' if column_full?(column)
    current_row = 0
    until grid[current_row + 1].nil? or grid[current_row + 1][column] == 'Y'
      current_row += 1
    end
    self.grid[current_row][column] = object
  end

  def column_full?(column)
    !grid[0][column].nil?
  end

end

game = Game.new
game.print_grid
puts "\n\n"
game.take_chip(1)
game.take_chip(1)
game.take_chip(1)
game.print_grid
game.take_chip(1)