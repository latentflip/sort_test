require 'dbconfig'

words = File.open('/usr/share/dict/words').readlines

words[0..3000].each do |w|
  Tag.create({:name => w.downcase})
end
