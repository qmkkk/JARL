puts "INSTALLED_KINTEX7_START"
puts [join [get_parts -quiet xc7k*] "\n"]
puts "INSTALLED_KINTEX7_END"
puts "INSTALLED_ARTIX7_START"
puts [join [get_parts -quiet xc7a*] "\n"]
puts "INSTALLED_ARTIX7_END"
exit
