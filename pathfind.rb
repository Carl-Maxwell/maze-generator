require "./mapunit"

 class Pathfinder
	def initialize width, height, map
		@width, @height = width, height
		@x, @y = 0, 0

		@memory = Pathmap.new width, height
		@map    = map

		@last_direction = 3

		@boops = 0
	end

	def moveTo tile
		@x, @y = tile.xy
		@memory[@x][@y].replicate tile
	end

	def explore
		connections = @map[@x][@y].connections

		case @last_direction
		when 0
			priorities = [:left, :up, :right, :down]
		when 1
			priorities = [:up, :right, :down, :left]
		when 2
			priorities = [:right, :down, :left, :up]
		when 3
			priorities = [:down, :left, :up, :right]
		end
		
		#p connections

		connections = priorities.map { |direction| connections.include?(direction) ? connections[direction] : nil }.select { |e| e }

		@last_direction = {up: 0, right: 1, down: 2, left: 3}[ priorities[0] ]

		#p connections.map { |e| e.respond_to?(:xy) ? e.xy : e }

		moveTo connections[0]

		@boops += 1

		if @boops < 10
			p [@x, @y], priorities
		end
	end

	def findGoodPath

		# create a bunch of agents:
		# each step, create one agent per possible move
		# just keep expanding the possibility tree that way
		# then, once one of the branches hits the end, declare victory

		possibility_tree = []

		while true
			possibility_tree.append 
		end

	end

	def complete?
		@memory.complete?
	end

	def display 
		return @memory.display
	end
end
