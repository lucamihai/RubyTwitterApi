class CreateAnotherJunctionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :resources_tweets, id: false do |t|
      t.belongs_to :tweets
      t.belongs_to :resources
    end
  end
end
