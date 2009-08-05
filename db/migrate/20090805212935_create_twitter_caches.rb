class CreateTwitterCaches < ActiveRecord::Migration
  def self.up
    create_table :twitter_caches do |t|
      t.string      :text
      t.datetime    :datetime
    end
  end

  def self.down
    drop_table :twitter_caches
  end
end
