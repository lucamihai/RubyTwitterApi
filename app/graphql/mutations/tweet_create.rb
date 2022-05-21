require 'nokogiri'
require 'open-uri'

module Mutations
  class TweetCreate < Mutations::BaseMutation
    argument :attributes, Types::TweetCreateAttributes

    field :tweet, Types::TweetType
    field :errors, [String], null: false

    def resolve(attributes:)
      content = attributes.arguments.keyword_arguments[:content]
      do_stuff_with_contents(content)

      {
        tweet: OpenStruct.new(id: 42),
        errors: ["some error"]
      }
    end

    private

    # TODO: Extract this into separate module/class
    def do_stuff_with_contents(content)

      urls = extract_urls(content)
      pp urls

      for url in urls
        doc = Nokogiri::HTML(URI.open(url))
        url = doc.xpath('//meta[@property="og:url"]').first['content']
        title = doc.xpath('//meta[@property="og:title"]').first['content']
        image = doc.xpath('//meta[@property="og:image"]').first['content']
        description = doc.xpath('//meta[@property="og:description"]').first['content']
  
        p "URL: #{url}"
        p "Title: #{title}"
        p "Image: #{image}"
        p "Description: #{description}"
        print "\n"
      end
      
    end

    def extract_urls(content)
      URI.extract(content, ['http', 'https'])
    end
  end
end
