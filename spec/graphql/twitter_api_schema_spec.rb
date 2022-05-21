require "rails_helper"

RSpec.describe TwitterApiSchema do
  it "does the test query" do
    query_string = <<-GRAPHQL
      query {
        testField
    }
    GRAPHQL

    result = TwitterApiSchema.execute(query_string)

    expect(result["data"]["testField"]).to eq "Hello World!"
  end  
end
