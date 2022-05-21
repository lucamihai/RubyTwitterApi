module Mutations
  class TweetCreate < Mutations::BaseMutation
    argument :attributes, Types::TweetCreateAttributes

    field :tweet, Types::TweetType
    field :errors, [String], null: false

    def resolve(attributes:)
      {
        tweet: OpenStruct.new(id: 42),
        errors: ["some error"]
      }
    end
  end
end
