class Board
    def initialize
        @board = []
        (0..8).each { |index| @board[index] = Cell.new() }

        @win_combinations = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]
    end

    def calc(cell)
        if cell.player.nil?
            return " "
        end

        case cell.player.number
        when 1 then "X"
        when 2 then "O"
        else " "
        end
    end

    def cell_has_value(cell)
        !cell.player.nil?
    end

    def get_cell(row, cell)
        @board[to_board_cell(row, cell)]
    end

    def set_cell(row, cell, player)
        @board[to_board_cell(row, cell)] = Cell.new(player)
    end

    def cells
        @board
    end

    def has_winning_combination(player)
        cells = @board.filter { |cell| cell.player == player }
        @win_combinations.any? do |combination| 
            combination.all? do |combination_item| 
                cells.map { |cell| @board.index(cell) }.include?(combination_item)
            end
        end
    end

    def print_board
        puts " --- --- --- "
        puts "| #{calc(@board[0])} | #{calc(@board[1])} | #{calc(@board[2])} |"
        puts " --- --- --- "
        puts "| #{calc(@board[3])} | #{calc(@board[4])} | #{calc(@board[5])} |"
        puts " --- --- --- "
        puts "| #{calc(@board[6])} | #{calc(@board[7])} | #{calc(@board[8])} |"
        puts " --- --- --- "
    end

    private def to_board_cell(row, cell)
        number = (row * 3 - 3) + (cell - 1)
    end
end

class Cell
    def initialize(player = nil)
        @player = player
    end

    def player
        @player
    end
end

class Player
    def initialize(number, name = "anonimus")
        @number = number
        @name = name
    end

    def name
        @name
    end

    def number
        @number
    end
end