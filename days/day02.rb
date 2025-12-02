require_relative '../lib/aoc'

module Day02
	extend AOC::Day

	@num = 2
	@ans_test1 = 1227775554
	@ans_test2 = 4174379265

	def self.solve_part1(input)
		r = 0
		input.strip.split(",").each do |range|
			start, stop = range.split("-").map(&:to_i)
			(start..stop).each do |n|
				r += n if n.to_s =~ /^(\d+)\1$/
			end
		end
		r
	end

	def self.solve_part2(input)
		r = 0
		input.strip.split(",").each do |range|
			start, stop = range.split("-").map(&:to_i)
			(start..stop).each do |n|
				r += n if n.to_s =~ /^(\d+)\1+$/
			end
		end
		r
	end
end

Day02.run true
