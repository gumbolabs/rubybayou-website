class TwitterLastChecked < ActiveRecord::Migration
  def self.up
    add_column :twitter_caches, :updated_on, :datetime
  end

  def self.down
    remove_column :twitter_caches, :updated_on
  end
end
