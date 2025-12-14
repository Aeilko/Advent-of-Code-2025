require_relative '../lib/aoc'
require_relative '../lib/grid'

module Day07
	extend AOC::Day

	@num = 7
	@ans_test1 = 21
	@ans_test2 = 40

	def self.solve_part1(input)
		grid = Grid.string_to_grid input
		sx, sy = 0, 0
		grid.each_with_index do |row, y|
			row.each_with_index do |cell, x|
				if cell == 'S'
					sx, sy = x, y
				end
			end
		end

		@used = Set.new
		beam(sx, sy, grid)
	end

	def self.solve_part2(input)
		grid = Grid.string_to_grid input
		sx, sy = 0, 0
		grid.each_with_index do |row, y|
			row.each_with_index do |cell, x|
				if cell == 'S'
					sx, sy = x, y
				end
			end
		end

		@cache = {}
		beam_cache(sx, sy, grid)
	end

	def self.beam(x, y, grid)
		r = 0
		grid[y..-1].map{ |a| a[x] }.each_with_index do |val, i|
			if val == '^'
				break if @used.include?([x, y+i])

				r += 1
				@used.add([x, y+i])
				r += beam(x-1, y+i, grid) unless x-1 < 0
				r += beam(x+1, y+i, grid) unless x+1 > grid[0].length-1
				break
			end
		end
		r
	end

	def self.beam_cache(x, y, grid)
		return @cache[[x, y]] if @cache.include?([x, y])

		r = 0
		grid[y..-1].map{ |a| a[x] }.each_with_index do |val, i|
			if val == '^'
				r += beam_cache(x-1, y+i, grid) unless x-1 < 0
				r += beam_cache(x+1, y+i, grid) unless x+1 > grid[0].length-1
				break
			end
		end
		r = 1 if r == 0
		@cache[[x, y]] = r
	end
end

Day07.run true
