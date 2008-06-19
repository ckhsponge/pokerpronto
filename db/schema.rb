# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 1) do

  create_table "hit_counts", :force => true do |t|
    t.column "created_on", :date, :null => false
    t.column "count", :integer, :default => 0, :null => false
  end

  create_table "holdem_hole_stat_sim", :id => false, :force => true do |t|
    t.column "stat_id", :integer, :limit => 3, :null => false
    t.column "hole_id", :integer, :limit => 3, :default => 0, :null => false
    t.column "wins", :integer, :limit => 10, :default => 0, :null => false
    t.column "losses", :integer, :limit => 10, :default => 0, :null => false
    t.column "total", :integer, :limit => 10, :default => 0, :null => false
  end

  add_index "holdem_hole_stat_sim", ["stat_id"], :name => "stat_id", :unique => true
  add_index "holdem_hole_stat_sim", ["hole_id"], :name => "hole_id", :unique => true

  create_table "hole_stats", :force => true do |t|
    t.column "hole_id", :integer, :limit => 3, :default => 0, :null => false
    t.column "wins", :integer, :limit => 20, :default => 0, :null => false
    t.column "losses", :integer, :limit => 20, :default => 0, :null => false
    t.column "total", :integer, :limit => 20, :default => 0, :null => false
  end

  add_index "hole_stats", ["hole_id"], :name => "hole_id", :unique => true

  create_table "hole_widow_five_stats", :force => true do |t|
    t.column "hole_id", :integer, :limit => 3, :default => 0, :null => false
    t.column "widow_five_id", :integer, :limit => 8, :default => 0, :null => false
    t.column "wins", :integer, :limit => 5, :default => 0, :null => false
    t.column "losses", :integer, :limit => 5, :default => 0, :null => false
  end

  add_index "hole_widow_five_stats", ["widow_five_id", "hole_id"], :name => "widow_id", :unique => true

  create_table "hole_widow_four_stats", :force => true do |t|
    t.column "hole_id", :integer, :limit => 3, :default => 0, :null => false
    t.column "widow_four_id", :integer, :limit => 8, :default => 0, :null => false
    t.column "wins", :integer, :limit => 5, :default => 0, :null => false
    t.column "losses", :integer, :limit => 5, :default => 0, :null => false
    t.column "total", :integer, :limit => 5, :default => 0, :null => false
  end

  add_index "hole_widow_four_stats", ["widow_four_id", "hole_id"], :name => "widow4_id", :unique => true

  create_table "hole_widow_three_stats", :force => true do |t|
    t.column "hole_id", :integer, :limit => 3, :default => 0, :null => false
    t.column "widow_three_id", :integer, :limit => 5, :default => 0, :null => false
    t.column "wins", :integer, :limit => 10, :default => 0, :null => false
    t.column "losses", :integer, :limit => 10, :default => 0, :null => false
    t.column "total", :integer, :limit => 10, :default => 0, :null => false
  end

  add_index "hole_widow_three_stats", ["widow_three_id", "hole_id"], :name => "widow3_id", :unique => true

  create_table "holes", :force => true do |t|
    t.column "card0", :string, :limit => 2, :default => "", :null => false
    t.column "card1", :string, :limit => 2, :default => "", :null => false
  end

  add_index "holes", ["card0", "card1"], :name => "card0", :unique => true

  create_table "test_table", :id => false, :force => true do |t|
    t.column "test_id", :integer, :null => false
    t.column "first_name", :string, :limit => 30, :default => "", :null => false
    t.column "last_name", :string, :limit => 30, :default => "", :null => false
    t.column "score", :integer
    t.column "percentile", :float
  end

  add_index "test_table", ["first_name", "last_name"], :name => "name_unique", :unique => true
  add_index "test_table", ["first_name", "last_name"], :name => "name_index"

  create_table "widow_fives", :force => true do |t|
    t.column "card0", :string, :limit => 2, :default => "", :null => false
    t.column "card1", :string, :limit => 2, :default => "", :null => false
    t.column "card2", :string, :limit => 2, :default => "", :null => false
    t.column "card3", :string, :limit => 2, :default => "", :null => false
    t.column "card4", :string, :limit => 2, :default => "", :null => false
  end

  add_index "widow_fives", ["card0", "card1", "card2", "card3", "card4"], :name => "card0", :unique => true

  create_table "widow_fours", :force => true do |t|
    t.column "card0", :string, :limit => 2, :default => "", :null => false
    t.column "card1", :string, :limit => 2, :default => "", :null => false
    t.column "card2", :string, :limit => 2, :default => "", :null => false
    t.column "card3", :string, :limit => 2, :default => "", :null => false
  end

  add_index "widow_fours", ["card0", "card1", "card2", "card3"], :name => "card0", :unique => true

  create_table "widow_threes", :force => true do |t|
    t.column "card0", :string, :limit => 2, :default => "", :null => false
    t.column "card1", :string, :limit => 2, :default => "", :null => false
    t.column "card2", :string, :limit => 2, :default => "", :null => false
  end

  add_index "widow_threes", ["card0", "card1", "card2"], :name => "card0", :unique => true

end