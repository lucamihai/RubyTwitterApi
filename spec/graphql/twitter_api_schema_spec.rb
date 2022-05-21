require "rails_helper"

RSpec.describe TwitterApiSchema do
  it "does the test query" do
    query_string = <<-GRAPHQL
      mutation($input: TweetCreateInput!) {
        tweetCreate(input: $input) {
          tweet {
            id
          }
        }
      }
    GRAPHQL

    variables = {
      "input": {
        "attributes": {
          "content": "Best thing I found in a while: https://12ft.io/"
        }
      }
    }
    result = TwitterApiSchema.execute(query_string, variables: variables)
    expect(result["data"]["tweetCreate"]).not_to be nil
  end  
end
