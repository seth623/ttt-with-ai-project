require 'pry'
class Game 

    attr_accessor :board, :player_1, :player_2 

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ] 

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1 
        @player_2 = player_2 
        @board = board 
    end

    def current_player
        if @board.turn_count % 2 == 0
            @player_1
        else
            @player_2
        end 
    end
    
    def draw?
        board.full? && !(self.won?)
    end 

    def over?
        draw? || won?
    end 

    def play 

        until over?
            turn 
            @board.display 
        end 

        if winner
            puts "Congratulations #{winner}!" 
        elsif draw?
            puts "Cat's Game!"
        end 

    end 

    def turn 

        input = nil

        until @board.valid_move?(input)
            puts "Where would you like to move?"
            input = current_player.move(@board)
        end 

        @board.update(input, current_player)
        
    end 

    def winner 
        @board.cells[won?[0]] if won?
    end 

    def won?

        won_combo = nil 

        WIN_COMBINATIONS.each do |combo|
            if (combo.all?{ |n| @board.cells[n] == "X" }) || (combo.all?{ |n| @board.cells[n] == "O" })
                won_combo = combo  
            end
        end 
        
        return won_combo  

    end 

end 