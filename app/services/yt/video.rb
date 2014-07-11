module Yt
  class Video < Struct.new(:url, :quality, :is_3d, :type)
    def video_type
      if self.type =~ /video\/webm/
        'WebM'
      elsif self.type =~ /video\/mp4/
        'MP4'
      elsif self.type =~ /video\/x-flv/
        'FLV'
      elsif self.type =~ /video\/3gpp/
        '3GPP'
      end
    end
  end
end