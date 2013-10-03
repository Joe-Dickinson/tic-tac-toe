require 'pry'

class Board
	attr_accessor :board
	def initialize
		@board = [
			%w(1 2 3),
			%w(4 5 6),
			%w(7 8 9)
		]
	end

  # TODO - Add code so that the array at co-ordinate x, y is set to the value
  # of marker, unless it has already been set.
  #
	def mark(x, y, marker)
		@board[y][x] = marker
	end

	# TODO - Have the board return each of the possible winning combinations.
	#
	def each_winning_move
		all_winning_moves = []
		vertical_array = []
		all_winning_moves << @board[0]
		puts "board[0]: #{board[0]}"
		all_winning_moves << @board[1] 
		puts "board[1]: #{board[1]}"
		all_winning_moves << @board[2]
		vertical_array =  @board.transpose
		puts "board[2]: #{board[2]}"
		all_winning_moves << vertical_array[0]
		puts "vertical_array [0]: #{vertical_array[0]}"
		all_winning_moves << vertical_array[1]
		puts "vertical_array [1]: #{vertical_array[1]}"
		all_winning_moves << vertical_array[2]
		puts "vertical_array [2]: #{vertical_array[2]}"
		puts all_winning_moves #BUG FIXING	
		all_winning_moves << [@board[0][0], @board[1][1], @board[2][2]]
		all_winning_moves << [@board[0][2], @board[1][1], @board[2][0]]
		puts all_winning_moves.join(", ") # BUG FIXING
		puts "all winning moves: #{all_winning_moves}"
		all_winning_moves
	end

	# TODO - Add code to return the board as a String, so that it appears
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

	# TODO - The main game loop goes in here.
	#
	def play
		#binding.pry
		puts @board

		puts "#{@turn}, Pick a coordiante between 0,0 and 2,2."
		input = gets.chomp.strip
		coordinate = input.split(',')
		@board.mark(coordinate[0].to_i, coordinate[1].to_i, @turn.marker)

		puts @board
		@board.each_winning_move

		# While the game is still going on, do the following:
			# 1. Show the board to the user
			# 2. Prompt for an co-ordinate on the Board that we want to target
			# 3. Mark the board on the given square. If the input is invalid or already
			# taken, go back to 1.
			# 4. If we've got a winner, show the board and show a congratulations method.
			# 5. Otherwise call next_turn and repeat.
			# 6. How to detect a draw?
	end

  # TODO - Return the next player's turn. I.e. not @turn but the other one.
  #
	def next_turn
		@turn = !@turn
	end

	# TODO - Return the winning Class if they have won, otherwise return nil.
	#
	def winner
		# Check each of the winning moves on the board, rows, cols and diagonals
		# to see if a Player has filled a row of three consequtive squares
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