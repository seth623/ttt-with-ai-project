module Players
    
    class Players::Human < Player
        
        def move(board = Board.new)
            puts "Please enter 1-9:"
            input = gets.strip 
        end 

    end 

end 