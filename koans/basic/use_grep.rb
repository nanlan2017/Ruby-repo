require "./simple_grep"

pattern = Regexp.new(ARGV[0])
simple_grep(pattern,ARGV[1])


#==============================================================
=begin
bash$ ruby use_grep.rb print chap1.rb
  print "bigger\n"
  print "smaller\n"
  print "All work and no play makes Jack a dull boy.\n"
=end