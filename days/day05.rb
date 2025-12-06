require_relative '../lib/aoc'

module Day05
	extend AOC::Day

	@num = 5
	@ans_test1 = 3
	@ans_test2 = 14

	def self.solve_part1(input)
		ranges, list = input.split("\n\n")
		ids = []
		ranges.strip.lines do |line|
			start, stop = line.strip.split("-").map(&:to_i)
			ids << (start..stop)
		end

		r = 0
		list.strip.lines do |line|
			r += 1 if ids.any? { |range| range.member?(line.to_i) }
		end
		r
	end

	def self.solve_part2(input)
		ranges = []
		rangess, _ = input.split("\n\n")
		rangess.strip.lines do |line|
			start, stop = line.strip.split("-").map(&:to_i)
			ranges << (start..stop)
		end
		ranges.sort_by!(&:min)

		unique_ranges = []
		ranges.each do |range|
			prev = unique_ranges.last
			if prev.nil? || !prev.member?(range.min)
				unique_ranges << range
				next
			end

			next if prev.member?(range.max)

			r = (prev.min..range.max)
			unique_ranges.delete(prev)
			unique_ranges << r
		end

		unique_ranges.map(&:size).sum
	end
end

Day05.run true
