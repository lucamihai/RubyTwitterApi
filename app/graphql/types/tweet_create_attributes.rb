module Types
  class TweetCreateAttributes < Types::BaseInputObject
    description "Attributes for creating a tweet"
    argument :content, String, "The content of the tweet"
  end
end
