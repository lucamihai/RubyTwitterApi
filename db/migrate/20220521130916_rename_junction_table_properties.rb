class RenameJunctionTableProperties < ActiveRecord::Migration[7.0]
  def change
    change_table :resources_tweets do |t|
      t.rename :tweets_id, :tweet_id
      t.rename :resources_id, :resource_id
    end
    
  end
end
