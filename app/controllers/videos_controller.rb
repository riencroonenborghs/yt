class VideosController < ApplicationController
  def download
    @info = ::YtStreams.info params[:video][:url]
  end
end