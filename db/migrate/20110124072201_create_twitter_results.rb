class CreateTwitterResults < ActiveRecord::Migration
  def self.up
    create_table :twitter_results do |t|
      t.string :screen_name
      t.string :tweet_id

      t.string :tweet
      t.string :source
      t.string :geo
      t.integer :tweet_length
      t.boolean :has_link
      t.boolean :positive
      t.boolean :negative
      t.float :spam
      t.datetime :tweet_created
      t.boolean :has_question

      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_results
  end
end
