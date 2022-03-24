require 'pry'
class Board 

    attr_writer :cells 

    def initialize
        reset!
    end 

    def cells 
        if !@cells
            @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        else 
            @cells
        end 
    end 

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end 

    def full?
        
        full_array = cells.collect do |space|
            taken?(space)
        end 

        if full_array.include?(false)
            return false 
        else 
            return true 
        end 

    end 

    def position(input)
        index = ((input.to_i) - 1)
        self.cells[index]
    end 

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
    end 

    def taken?(space)
        !(self.position(space) == " " || self.position(space) == "" || self.position(space) == nil)
    end 

    def turn_count  
        cells.count{ |cell| cell == "X" || cell == "O" }
    end 

    def update(input, player_object)
        cells[input.to_i - 1] = player_object.token   
    end
    
    def valid_move?(space)  
        !(taken?(space)) && space.to_i.between?(1, 9)
    end 

end 