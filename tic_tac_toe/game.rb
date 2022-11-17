class Game
    def initialize(player_1, player_2, board)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @current_player = @player_2
        @winner = nil
        @error_message = ''
    end

    def start
        while !have_winner && !is_board_fulfilled
            next_turn
        end

        system("clear")
        @board.print_board

        if (is_board_fulfilled && @winner.nil?)
            fulfilled_message
        else
            winn_message
        end
    end

    private def set_next_player
        @current_player = @current_player == @player_2 ? @player_1 : @player_2
    end

    private def have_winner
        if (@board.has_winning_combination(@current_player))
            @winner = @current_player
            return true
        else false
        end
    end

    private def is_board_fulfilled
        @board.cells.all? { |cell| !cell.player.nil? }
    end

    private def next_turn
        if (@error_message.empty?)
            set_next_player
        end

        system("clear")
        puts @error_message
        puts "#{@current_player.name}, your turn."
        @board.print_board
        print "Enter cell numbers between 1 and 3, like '1 3': "
        turn_value = gets.chomp
        r_s, c_s = turn_value.split(' ')
        c = c_s.to_i
        r = r_s.to_i

        if (c > 3 || c < 1 || r > 3 || r < 1)
            @error_message = "Enter row and cell numbers between 1 and 3"
            return
        end

        cell = @board.get_cell(r, c);

        if (@board.cell_has_value(cell))
            @error_message = "It's incorrect value. Please, try again."
            return
        else
            @board.set_cell(r, c, @current_player)
            @error_message = ''
            return
        end
    end

    private def fulfilled_message
        puts
        puts "====================================="
        puts "Game over!" 
        puts "All cells are fulfilled"
        puts "====================================="
    end

    private def winn_message
        puts
        puts "====================================="
        puts "Game over!" 
        puts "#{@current_player.name} is a winner!"
        puts "====================================="
    end
end