require 'pry'

class Board
	attr_accessor :board
	def initialize
		@board = [
			%w(. . .),
			%w(. . .),
			%w(. . .)
		]
	end

  # The array at co-ordinate x, y is set to the value
  # of marker, unless it has already been set.
  #
	def mark(x, y, marker)
		if @board[x][y] != "."
			puts "#{x}, #{y} is already taken by #{@board[x][y]}! Choose another position!"
		else
			@board[x][y] = marker 
		end
	end

	# The board returns each of the possible winning combinations.
	#
	def each_winning_move
		all_winning_moves = []
		vertical_array = []
		all_winning_moves << @board[0]
		all_winning_moves << @board[1] 
		all_winning_moves << @board[2]
		vertical_array =  @board.transpose
		all_winning_moves << vertical_array[0]
		all_winning_moves << vertical_array[1]
		all_winning_moves << vertical_array[2]
		all_winning_moves << [@board[0][0], @board[1][1], @board[2][2]]
		all_winning_moves << [@board[0][2], @board[1][1], @board[2][0]]
		all_winning_moves
	end



	# Returns the board as a String, so that it appears
	# in a 3 x 3 grid
	def to_s
		s = ""
		board.each do |row|
		 	s += row.join (" ") 
		 	s += "\n"
		end
		s
	end
end

class Game
	def initialize
		@board = Board.new
		@players = [Nought, Cross]
		@turn = @players.sample
	end

	# The main game loop.
	#
	def play
		9.times do 
			while true #repeats until a valid move is made
				puts @board
				puts "#{@turn}, Pick a coordiante between 0,0 and 2,2."
				input = gets.chomp.strip
				coordinate = input.split(',')
				marker = @board.mark(coordinate[0].to_i, coordinate[1].to_i, @turn.marker)
				if marker != nil #breaks out of loop if @board.mark returns a value and continues game
					break
				end
			end 

			if winner != true 
				self.next_turn
			else
				puts @board
				puts "#{@turn} wins!"
			end
		end
	end

  # Returns the next player's turn. 
  #
	def next_turn
		if @turn == Nought
			@turn = Cross
		elsif @turn == Cross
			@turn = Nought
		end
	end

	# Returns the winning Class if they have won.
	#

	def winner 
		stop = false 
		@board.each_winning_move.each do |row|
		 	if @turn.filled?(row)
		 		stop = true
		 		break
		 	end
		end
		stop
	end
end

class Player
	def self.filled?(row)
		row == [self.marker] * 3
	end
end

class Nought < Player
	def self.marker
		'o'
	end
end

class Cross < Player
	def self.marker
		'x'
	end
end

Game.new.play