require_relative '../lib/aoc'

module Day06
	extend AOC::Day

	@num = 6
	@ans_test1 = 4277556
	@ans_test2 = 3263827

	def self.solve_part1(input)
		nums = []
		r = 0
		input.strip.lines do |line|
			if line.count('*') == 0
				nums << line.strip.scan(/\d+/).map(&:to_i)
			else
				line.strip.scan(/[*+]/).each_with_index do |sign, i|
					r += nums.map { |a| a[i] }.inject(sign)
				end
			end
		end
		r
	end

	def self.solve_part2(input)
		lines = input.lines
		last = lines.pop.strip
		length = lines.map(&:length).max
		last = last + ' '*(length-last.length)
		si = 0
		r = 0
		last.scan(/[*+]\s+/).each do |sign|
			r += (si...si+sign.length-1).map do |i|
				lines.map { |l| l[i].to_s }.sum("").to_i
			end.inject(sign.strip)
			si += sign.length
		end
		return r
	end
end

Day06.run true
