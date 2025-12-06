require_relative '../lib/aoc'
require_relative '../lib/grid'

module Day04
	extend AOC::Day

	@num = 4
	@ans_test1 = 13
	@ans_test2 = 43

	def self.solve_part1(input)
		r = 0
		grid = Grid.string_to_grid input
		grid.each_with_index do |row, y|
			row.each_with_index do |cell, x|
				if cell == '@'
					n = Grid.get_neighbours(grid, x, y).select{ |c| c == '@' }.count
					r += 1 if n < 4
				end
			end
		end
		return r
	end

	def self.solve_part2(input)
		new_grid = Grid.string_to_grid input
		r = 0
		r2 = 1 # Is reset before use
		while r2 > 0 do
			r2 = 0
			grid = new_grid.dup
			grid.each_with_index do |row, y|
				row.each_with_index do |cell, x|
					if cell == '@'
						n = Grid.get_neighbours(grid, x, y).select{ |c| c == '@' }.count
						if n < 4
							r2 += 1
							new_grid[y][x] = '.'
						end
					end
				end
			end
			r += r2
		end
		return r
	end
end

Day04.run true
