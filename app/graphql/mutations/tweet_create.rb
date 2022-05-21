require 'nokogiri'
require 'open-uri'

module Mutations
  class TweetCreate < Mutations::BaseMutation
    argument :attributes, Types::TweetCreateAttributes

    field :tweet, Types::TweetType
    field :errors, [String], null: false

    def resolve(attributes:)
      content = attributes.arguments.keyword_arguments[:content]
      tweet_handler = TweetHandler.new
      tweet = tweet_handler.add_tweet(content)
      pp tweet.resources

      {
        tweet: tweet,
        errors: ["some error"]
      }
    end
  end
end
