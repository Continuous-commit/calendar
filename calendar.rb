require "date"
require 'optparse'

option = {}
opt = OptionParser.new
opt.on('-m [v]') {|v| option[:m] = v}    # オプションmを作り、0-12までの数字を入れられる仕組み
opt.parse!(ARGV)

day = Date.today
mon = if option[:m]
        option[:m].to_i    # 指定した月で表示
      else
        day.mon    # 指定しなかった場合
      end

year = day.year
head = Date.new(year, mon, 1).strftime("%m月, %Y")
puts head.center(20)

week = %w(日 月 火 水 木 金 土)
puts week.join(" ")

first_wday = Date.new(year, mon, 1).wday
print "   " * first_wday    # 曜日の数値分余白をつくる。３＊曜日

lastday = Date.new(year, mon, -1).day
wday = first_wday
(1..lastday).each do |date|    # 1~最終日まで繰り返し
  print date.to_s.rjust(2) + " "
  wday += 1
  if wday % 7 == 0    # 土曜日まで表示したら改行
    print "\n"
  end
end
if wday % 7 != 0
  print "\n"    # %表示を消すため最後の行改行
end



