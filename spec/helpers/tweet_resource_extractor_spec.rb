RSpec.describe TweetResourceExtractor do
  it "returns expected array" do
    #contents = 'blah blah https://google.com/ yet another set of blah blahs https://rubygems.org/'
    contents = "Best thing I found in a while: https://12ft.io/"

    resources = TweetResourceExtractor.extract_tweet_resources(contents)

    expect(resources.count).to eq 1
    expect(resources[0].url).to eq "https://12ft.io/"
  end
end
