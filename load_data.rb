require 'dbconfig'

words = File.open('/usr/share/dict/words').readlines

Tag.destroy_all

words[0..3000].shuffle.each do |w|
  Tag.create({:name => w.downcase})
end
