module VideosHelper
  def video_title(video_info)
    @video_title ||= video_info['title'].first.gsub('+',' ')
  end

  def video_type(map)
    type = map['type']
    if type =~ /video\/webm/
      'WebM'
    elsif type =~ /video\/mp4/
      'MP4'
    elsif type =~ /video\/x-flv/
      'FLV'
    elsif type =~ /video\/3gpp/
      '3GPP'
    end
  end
end