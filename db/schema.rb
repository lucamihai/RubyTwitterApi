# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_21_130916) do
  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "imageUrl"
  end

  create_table "resources_tweets", id: false, force: :cascade do |t|
    t.integer "tweet_id"
    t.integer "resource_id"
    t.index ["resource_id"], name: "index_resources_tweets_on_resource_id"
    t.index ["tweet_id"], name: "index_resources_tweets_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "content"
  end

  create_table "tweets_resources", id: false, force: :cascade do |t|
    t.integer "tweets_id"
    t.integer "resources_id"
    t.index ["resources_id"], name: "index_tweets_resources_on_resources_id"
    t.index ["tweets_id"], name: "index_tweets_resources_on_tweets_id"
  end

end
