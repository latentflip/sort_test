require 'rubygems'
require 'activerecord'
ActiveRecord::Base.establish_connection({
  :adapter  => :postgresql,
  :database => "benchmark",
  :encoding => "utf8",
  :reconnect => false,
  :pool => 5,
  :username => "latentflip"
})

class Tag < ActiveRecord::Base
end
