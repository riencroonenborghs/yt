require 'net/http'

# http://coding-everyday.blogspot.co.nz/2012/10/download-youtube-video-files-with.html

module Yt
  class Base
    class << self

      def video_info(url)
        parse(get_video_info(get_video_id(url)))
      end

      def video_info_ext(url)
        parse_video_info_ext(get_video_info(get_video_id(url)))
      end

    private 

      VIDEO_REG_EXP = /.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/

      def get_video_id(url)
        url.match(VIDEO_REG_EXP)[1]
      end

      def get_video_info(video_id)
        path = "http://www.youtube.com/get_video_info?video_id=#{video_id}"
        Net::HTTP.get(URI.parse(path))
      end

      def parse(s)
        h = Hash.new { |hash, key| hash[key] = [] }
        
        s = s.split(/&/)
        s = s.map{|x| x =~ /%/ ? URI.unescape(x) : x  }
        s = s.map{|x| list = x.split(/\=/) 
          if list.size == 2
            h[list.first] << list.last 
          else
            key = list.shift
            fmts = list.join('=').split(',').map{ |x| 
              h2 = {}
              x.split(/&/).map{|y| k,v = y.split(/\=/); h2[k] = v ? URI.unescape(v) : v } 
              h2
            }
            h[key] = fmts
          end
        }

        h
      end

      # url_encoded_fmt_stream_map
      def parse_video_info(video_info)
        video_info.gsub(/url%3D/, '\n\r\n\r<break>').split('<break>').map{|x| URI.unescape(URI.unescape(URI.unescape(x))) }.select{|x| x =~ /codec/}.map { |x|
          x = x.gsub("\\n", '').gsub("\\r", '')
          {x => query_string_parse(x)}
        }
      end    
     
      def query_string_parse(s)
        s.split(/&/).map{|x| x.split(/\=/)}.inject({}) { |hash, (k,v)| hash.merge!(k => v) }
      end

    end # class << self
  end # class Base
end # module Yt