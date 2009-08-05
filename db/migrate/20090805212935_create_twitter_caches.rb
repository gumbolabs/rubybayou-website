class CreateTwitterCaches < ActiveRecord::Migration
  def self.up
    create_table :twitter_caches do |t|
      t.string  :text
      t.time    :time
    end
  end

  def self.down
    drop_table :twitter_caches
  end
end
