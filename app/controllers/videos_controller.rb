class VideosController < ApplicationController

  def download
    # @video_info = ::Yt::Base.video_info(params[:video][:url])

    @info = ::Yt::Search.video_info(params[:video][:url])
  end
end