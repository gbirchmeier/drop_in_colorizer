# rubocop:disable Metrics/LineLength

require './drop_in_colorizer'

# alias the class name for easier coding
Dic = DropInColorizer::Dic

puts
puts 'DropInColorizer demo:'
puts

puts '  STYLES:'
puts '    * ' + Dic.new('.bold').bold.to_s
puts '    * ' + Dic.new('.dim').dim.to_s
puts '    * ' + Dic.new('.underline').underline.to_s
puts '    * ' + Dic.new('.blink').blink.to_s
puts '    * ' + Dic.new('.invert').invert.to_s
puts '    * ' + Dic.new('.conceal').conceal.to_s + '(.conceal)'
puts

puts '  COLORS:'
fgcolors = []
fgcolors << Dic.new('.black   ').black
fgcolors << Dic.new('.red   ').red
fgcolors << Dic.new('.green   ').green
fgcolors << Dic.new('.yellow   ').yellow
fgcolors << Dic.new('.blue   ').blue
fgcolors << Dic.new('.magenta   ').magenta
fgcolors << Dic.new('.cyan   ').cyan
fgcolors << Dic.new('.white   ').white
puts '    dim:      ' + fgcolors.collect { |c| c.dup.dim }.join(' ')
puts '    dim&bold: ' + fgcolors.collect { |c| c.dup.dim.bold }.join(' ')
puts '    regular:  ' + fgcolors.join(' ')
puts '    bold:     ' + fgcolors.collect { |c| c.bold.bold }.join(' ')

bgcolors = []
bgcolors << Dic.new('.bg_black').bg_black
bgcolors << Dic.new('.bg_red').bg_red
bgcolors << Dic.new('.bg_green').bg_green
bgcolors << Dic.new('.bg_yellow').bg_yellow
bgcolors << Dic.new('.bg_blue').bg_blue
bgcolors << Dic.new('.bg_magenta').bg_magenta
bgcolors << Dic.new('.bg_cyan').bg_cyan
bgcolors << Dic.new('.bg_white').bg_white
puts '    bg:       ' + bgcolors.join(' ')
puts

puts '  ENABLE/DISABLE:'
Dic.disable
puts "    disabled: #{Dic.new('This should not be red underlined').red.underline}"
Dic.enable
puts "    disabled: #{Dic.new('This should be green').green}"
puts

puts '  COMBINATIONS:'
puts "    * #{Dic.new('.dim').dim} / regular / #{Dic.new('.bold').bold} / #{Dic.new('.bold.dim').bold.dim}"
puts "    * #{Dic.new('.bold.underline.invert.magenta').underline.bold.invert.magenta}"
puts "    * #{Dic.new('.bg_blue.yellow.invert').bg_blue.yellow.invert} (should be blue fg on yellow bg)"
puts "    * #{Dic.new('.red.bg_blue.conceal').red.bg_blue.conceal} (.red.bg_blue.conceal)"
puts "    * #{Dic.new('.red.cyan').red.cyan} (last color clobbers)"
puts "    * #{Dic.new('.bg_red.bg_cyan').bg_red.bg_cyan} (last color clobbers)"
puts

puts '  MODIFYING AN EXISTING OBJECT'
puts "    * foo = Dic.new('alpha').bold.underline => #{foo = Dic.new('alpha').bold.underline}"
puts "    * foo.replace_text('beta').green        => #{foo.replace_text('beta').green}"
puts "    * foo.plain                             => #{foo.plain}"
puts "    * foo.cyan.bg_blue                      => #{foo.magenta.bg_cyan}"
puts "    * foo.reset_bg                          => #{foo.reset_bg}"
puts "    * foo.reset_fg                          => #{foo.reset_fg}"
puts

# puts "Experiment:"
# puts "\e[92mbright green\e[0m"
# puts "\e[102mbright bg green\e[0m"

# rubocop:enable Metrics/LineLength
