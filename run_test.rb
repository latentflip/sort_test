require 'dbconfig'
require 'benchmark'

ActiveRecord::Base.logger = Logger.new(STDOUT)

Benchmark.bm(10) do |b|
  b.report("ORM sorted") do
    (1..100).each do 
      @tags = Tag.find(:all)
    end
  end
  b.report("ORM sorted") do
    (1..100).each do
      @tags = Tag.find(:all, :order => "name")
    end
  end
end
