class CreateHitCounts < ActiveRecord::Migration
  def self.up
    create_table :hit_counts do |t|
      t.column :created_on, :date, {:null=>false}
      t.column :count, :integer, {:default=>0,:null=>false}
    end
  end

  def self.down
    drop_table :hit_counts
  end
end
