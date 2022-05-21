module TweetResourceExtractor
  def self.extract_tweet_resources(tweet_contents)
    urls = extract_urls(tweet_contents)
    resources = []
    
    for url in urls
      doc = Nokogiri::HTML(URI.open(url))
      url = doc.xpath('//meta[@property="og:url"]').first['content']
      title = doc.xpath('//meta[@property="og:title"]').first['content']
      image = doc.xpath('//meta[@property="og:image"]').first['content']
      description = doc.xpath('//meta[@property="og:description"]').first['content']

      resources.push(OpenStruct.new(title: title, description: description, url: url, imageUrl: image))
    end

    resources
  end

  private 

  def self.extract_urls(content)
    URI.extract(content, ['http', 'https'])
  end
end
