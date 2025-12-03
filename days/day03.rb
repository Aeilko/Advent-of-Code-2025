require_relative '../lib/aoc'

module Day03
	extend AOC::Day

	@num = 3
	@ans_test1 = 357
	@ans_test2 = 3121910778619

	def self.solve_part1(input)
		input.strip.lines.map do |line|
			nums = line.strip.chars.map(&:to_i)
			n1 = nums[0...-1].max
			i = nums.find_index(n1)
			n2 = nums[(i + 1)..].max
			n1 * 10 + n2
		end.sum
	end

	def self.solve_part2(input)
		input.strip.lines.map do |line|
			cur_nums = line.strip.chars.map(&:to_i)
			d = []
			12.times do |j|
				n = cur_nums[0..(-12 + j)].max
				i = cur_nums.find_index(n)
				cur_nums = cur_nums[(i + 1)..]
				d << n
			end
			d.join.to_i
		end.sum
	end
end

Day03.run true