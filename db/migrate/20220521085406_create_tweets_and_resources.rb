class CreateTweetsAndResources < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :content
    end

    create_table :resources do |t|
      t.string :name
    end

    create_table :tweets_resources, id: false do |t|
      t.belongs_to :tweets
      t.belongs_to :resources
    end
  end
end
