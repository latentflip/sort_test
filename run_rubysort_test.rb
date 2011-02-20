require 'dbconfig'
require 'benchmark'

#ActiveRecord::Base.logger = Logger.new(STDOUT)

Benchmark.bm(10) do |b|
  b.report("unsorted") do
    @tags = Tag.find(:all)
    (1..100).each do 
      @tags.sort_by { |t| t.name }
    end
  end
  b.report("pre-sorted") do
    @tags = Tag.find(:all, :order => 'name')
    (1..100).each do 
      @tags.sort_by { |t| t.name }
    end
  end
end
