require "nokogiri"
require "open-uri"
require "net/http"

module Feedisco
  module Wordpress
    # Your code goes here...
  end
end

require "feedisco/wordpress/version"
require "feedisco/wordpress/discovery"

Feedisco::Wordpress.extend Feedisco::Wordpress::Discovery
