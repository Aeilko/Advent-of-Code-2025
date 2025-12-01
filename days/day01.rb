require_relative '../lib/aoc'

module Day01
	extend AOC::Day

	@num = 1
	@ans_test1 = 3
	@ans_test2 = 6

	def self.solve_part1(input)
		r = 0
		dial = 50
		input.lines.each do |line|
			x = line[1..].to_i
			x = x*-1 if line[0] == 'L'
			dial = (dial + x) % 100
			r += 1 if dial == 0
		end
		r
	end

	def self.solve_part2(input)
		r = 0
		dial = 50
		input.lines.each do |line|
			start = dial
			x = line[1..].to_i
			r += x / 100
			x = x % 100
			x = x * -1 if line[0] == 'L'
			dial = dial + x
			r += 1 if (dial < 0 && start != 0) || dial > 100
			dial = dial % 100
			r += 1 if dial == 0
		end
		r
	end
end

Day01.run
