require 'dbconfig'
require 'benchmark'

#ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Schema.define do
  begin
    remove_index :tags, :name
  rescue
  end
end


Benchmark.bm(10) do |b|
  b.report("ORM") do
    ActiveRecord::Base.cache do 
      (1..100).each do 
        @tags = Tag.find(:all)
      end
    end
  end
  b.report("ORM sorted") do
    ActiveRecord::Base.cache do 
      (1..100).each do
        @tags = Tag.find(:all, :order => "name")
      end
    end
  end
end

Benchmark.bm(10) do |b|
  b.report("ORM") do
    ActiveRecord::Base.uncached do 
      (1..100).each do 
        @tags = Tag.find(:all)
      end
    end
  end
  b.report("ORM sorted") do
    ActiveRecord::Base.uncached do 
      (1..100).each do
        @tags = Tag.find(:all, :order => "name")
      end
    end
  end
end
