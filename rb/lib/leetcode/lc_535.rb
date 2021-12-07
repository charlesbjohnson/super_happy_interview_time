# frozen_string_literal: true

require("digest")
require("uri")

module LeetCode
  # 535. Encode and Decode TinyURL
  module LC535
    Store = Struct.new(:value) {
      def get(k)
        value[k]
      end

      def set(k, v)
        value[k] = v
      end

      def clear
        value.clear
      end
    }

    SIZE = 6
    REGISTRY = Store.new({})

    # Description:
    # TinyURL is a URL shortening service where you enter a URL such as
    # https://leetcode.com/problems/design-tinyurl and it returns a short URL such as
    # http://tinyurl.com/4e9iAk.
    #
    # Design the encode and decode methods for the TinyURL service.
    # There is no restriction on how your encode/decode algorithm should work.
    # You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.
    #
    # Notes:
    # - Your functions will be called as such:
    #   decode(encode(url))
    #
    # @param url {String}
    # @return {String}
    def encode(url)
      path = Digest::SHA256.hexdigest(url.to_s).slice(0, SIZE)
      REGISTRY.set(path, url)
      URI::HTTPS.build(host: "tinyurl.com", path: "/#{path}").to_s
    end

    # @param url {String}
    # @return {String}
    def decode(url)
      REGISTRY.get(URI.parse(url).path.slice(1, SIZE)).to_s
    end
  end
end
