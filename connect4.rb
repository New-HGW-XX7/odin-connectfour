class Game
  attr_accessor :grid
  def initialize
    @grid = Array.new(6) { Array.new(7, nil) }
  end

  def print_grid
    grid.each do |subarr|
      counter = 0
      subarr.each do |value|
        counter += 1
        if value.nil?
          if counter == 7
            print "[   ]\n"
          else
            print "[   ] "
          end
        else
          if counter == 7
            print "[ #{value.color} ]\n"
          else
            print "[ #{value.color} ] "
          end
        end
      end
    end
  end

  def player_column_choice(player_num)
    valid_input = false
    until valid_input
      puts "Player #{player_num}, choose a column"
      chosen_column = gets.chomp.to_i
      puts "Column full." if column_full?(chosen_column)
      puts "Must be number between 0 and 6." if chosen_column < 0 or chosen_column > 6
      valid_input = true unless column_full?(chosen_column) or chosen_column < 0 or chosen_column > 6
    end
    chosen_column
  end

  def column_full?(column)
    !grid[0][column].nil?
  end
  
  def take_chip(column, player_num)
    player_num == 1 ? chip = Chip.new('Y') : chip = Chip.new('R')
    
    current_row = 0
    until grid[current_row + 1].nil? or grid[current_row + 1][column].class == Chip
      current_row += 1
    end
    self.grid[current_row][column] = chip
    chip.row = current_row
    chip.column = column
    chip
  end
  
  def game_over?(chip)
    (column_full?(0) and column_full?(1) and column_full?(2) and column_full?(3) and column_full?(4) and column_full?(5) and column_full?(6) or check_win_row(chip)) || (check_win_column(chip) or check_win_diagonal_left_to_right(chip) or check_win_diagonal_right_to_left(chip))
  end

  def check_win_row(chip)
    #puts "row is eval"
    row = grid[chip.row]
    counter = 1

    index = chip.column
    until row[index + 1].nil? or row[index + 1].color != chip.color or counter == 4
      puts "index: #{index}"
      puts "counter: #{counter}"
      index += 1
      counter += 1
    end

    index = chip.column
    until row[index - 1].nil? or (index - 1) < 0 or row[index - 1].color != chip.color or counter == 4
      index -= 1
      counter += 1
    end
    
    #puts "row-counter: #{counter}"
    return true if counter == 4
  end

  def check_win_column(chip)
    #puts "col is eval"
    current_row = chip.row
    column = chip.column
    counter = 1

    until grid[current_row + 1].nil? or grid[current_row + 1][column].color != chip.color or counter == 4
      current_row += 1
      counter += 1
    end

    
    #puts "col-counter: #{counter}"
    return true if counter == 4
  end

  def check_win_diagonal_left_to_right(chip)
    #puts "ltr is eval"
    counter = 1

    current_row = chip.row
    current_column = chip.column

    until grid[current_row - 1].nil? or grid[current_row - 1][current_column - 1].nil? or (current_row - 1) < 0 or (current_column - 1) < 0 or grid[current_row - 1][current_column -1].color != chip.color or counter == 4
      current_row -= 1
      current_column -=1
      counter += 1
    end

    current_row = chip.row
    current_column = chip.column
    until grid[current_row + 1].nil? or grid[current_row + 1][current_column + 1].nil? or grid[current_row + 1][current_column + 1].color != chip.color or counter == 4
      current_row += 1
      current_column +=1
      counter += 1
    end

    #puts "dia-left-right-counter: #{counter}"
    return true if counter == 4
  end

  def check_win_diagonal_right_to_left(chip)
    #puts "rtl is eval"
    counter = 1

    current_row = chip.row
    current_column = chip.column
    until grid[current_row - 1].nil? or grid[current_row - 1][current_column + 1].nil? or (current_row - 1) < 0 or grid[current_row - 1][current_column + 1].color != chip.color or counter == 4
      current_row -= 1
      current_column +=1
      counter += 1
    end

    current_row = chip.row
    current_column = chip.column
    until grid[current_row + 1].nil? or grid[current_row + 1][current_column - 1].nil? or (current_column - 1) < 0 or grid[current_row + 1][current_column - 1].color != chip.color or counter == 4
      current_row += 1
      current_column -=1
      counter += 1
    end

    #puts "dia-right-left-counter: #{counter}"
    return true if counter == 4
  end

  def play_game
    over = false
    player_num = 1
    until over
      print_grid
      player_choice = player_column_choice(player_num)
      chip = take_chip(player_choice, player_num)
      if game_over?(chip)
        over = true
      else
        case player_num
        when 1 then player_num = 2
        when 2 then player_num = 1
        end
      end
    end
    print_grid
    if check_win_row(chip) or check_win_column(chip) or check_win_diagonal_left_to_right(chip) or check_win_diagonal_right_to_left(chip)
      puts "Game over. Player #{player_num} wins."
    else
      puts 'Game over. Tie.'
    end
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

# Player 1 is Y
# Player 2 is R

game = Game.new
game.play_game