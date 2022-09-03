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

  def column_full?(column)
    !grid[0][column].nil?
  end

  def game_over?#(chip)
    column_full?(0) and column_full?(1) and column_full?(2)
    # or one win checker
  end

  def take_chip(column, player_num = 0)
    return puts 'Column full' if column_full?(column)
    player_num == 1 ? chip = Chip.new('Y') : chip = Chip.new('R')
    current_row = 0
    until grid[current_row + 1].nil? or grid[current_row + 1][column].class == Chip
      current_row += 1
    end
    self.grid[current_row][column] = chip
    chip.row = current_row
    p chip.row
    chip.column = column
    chip
  end

  def check_win_row(chip)
    row = grid[chip.row]
    counter = 1
    
    index = chip.column
    until row[index + 1].nil? or row[index + 1].color != chip.color or counter == 3
      index += 1
      counter += 1
    end
    # return true if counter == 3

    index = chip.column
    until row[index - 1].nil? or row[index - 1].color != chip.color or counter == 3
      index -= 1
      counter += 1
    end
    # return true if counter == 3
    puts "row-counter: #{counter}"
  end

  def check_win_column(chip)
    current_row = chip.row
    column = chip.column
    counter = 1

    until grid[current_row + 1].nil? or grid[current_row + 1][column].color != chip.color or counter == 3
      current_row += 1
      counter += 1
    end

    # return true if counter == 3
    puts "col-counter: #{counter}"
  end
end

class Chip
  attr_reader :color
  attr_accessor :row, :column
  def initialize(color = nil)
    @color = color
    @row = nil
    @column = nil
  end
end

game = Game.new
game.print_grid
puts "\n\n"
game.take_chip(2)
game.take_chip(2)
chip = game.take_chip(2)
game.print_grid
game.check_win_row(chip)
game.check_win_column(chip)

# Player 1 is Y
# Player 2 is R