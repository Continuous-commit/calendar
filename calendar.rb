require "date"
require 'optparse'
day = Date.today

option = {}
opt = OptionParser.new
opt.on('-m [value]') {|v| option[:m] = v}
opt.parse!(ARGV)

if opt.parse!(ARGV)
  mon = option[:m].to_i
else
  mon = day.mon
end

year = day.year
head = Date.new(year, mon, 1).strftime("%m月, %Y")
firstday = Date.new(year, mon, 1).wday
lastday = Date.new(year, mon, -1).day
week = %w(Su Mo Tu We Th Fr Sa)

puts head.center(20)
puts week.join(" ")
print "   " * firstday

wday = firstday
(1..lastday).each do |date|
  print date.to_s.rjust(2) + " "
  if Date.new(year, mon, date).wday == 6
    puts "\n"
  end
end


