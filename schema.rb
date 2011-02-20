require 'dbconfig'
ActiveRecord::Schema.define do 
  create_table :tags do |t|
    t.column :name, :string
  end
  add_index :tags, :name
end
