require 'net/http'

# http://coding-everyday.blogspot.co.nz/2012/10/download-youtube-video-files-with.html

module Yt
  class SearchResult < Struct.new(:query, :title, :videos)
  end

  class Search < Base
    class << self

      def video_info(url)
        return ::Yt::SearchResult.new(nil, 'no URL found', []) unless url.present?

        info = super

        title = info['title'].first.gsub('+',' ')
        videos = info['url_encoded_fmt_stream_map'].map do |hash|
          ::Yt::Video.new(hash['url'], hash['quality'], hash.keys.include?('stereo3d'), hash['type'])
        end

        ::Yt::SearchResult.new(url, title, videos)
      end

    end # class << self
  end # class Search
end # module Yt