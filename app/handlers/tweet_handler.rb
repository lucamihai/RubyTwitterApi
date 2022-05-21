require 'tweet_resource_extractor'

class TweetHandler
  def add_tweet(tweet_contents)

    already_existing_tweet = Tweet.find_by(content: tweet_contents)

    # TODO: Should I update the tweet's resources instead?
    if (already_existing_tweet != nil)
      return
    end

    resources = TweetResourceExtractor.extract_tweet_resources(tweet_contents)
    added_tweet = Tweet.create(content: tweet_contents)

    for resource in resources

      already_existing_resource = Resource.find_by(url: resource.url)

      if (already_existing_resource != nil)
        already_existing_resource.tweets.push(added_tweet)
        next
      end

      new_resource = Resource.new
      new_resource.title = resource.title
      new_resource.description = resource.description
      new_resource.url = resource.url
      new_resource.imageUrl = resource.imageUrl
      new_resource.tweets.push(added_tweet)

      new_resource.save
    end

    added_tweet
  end
end
