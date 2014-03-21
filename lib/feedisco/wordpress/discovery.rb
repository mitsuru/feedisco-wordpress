require 'feedisco/utilities'
require 'feedisco/checks'
require 'uri'
require 'open-uri'
require 'pp'

module Feedisco
  module Wordpress
    extend Utilities
    extend Checks

    module Discovery
      FEED_TYPES = [ "rss2", "atom", "rss", "rdf" ]

      def find(url, args = {})
        raise ArgumentError.new("url can't be nil!") if url.nil?

        harmonized_url = harmonize_url(url)

        raise ArgumentError.new("url's protocol must be 'http(s)' or 'feed' (#{url})") if harmonized_url.nil?

        feeds = []

        harmonized_url += "/" unless harmonized_url.end_with? '/'

        FEED_TYPES.each do |type|
          test_url = harmonized_url + "?feed=" + type 

          begin
            open(test_url) do |file|
              if feed_content_type?(file)
                feeds.push file.base_uri.to_s unless file.base_uri.to_s == harmonized_url
              end
            end
          rescue
          end
        end

        feeds.uniq
      end
    end
  end
end
