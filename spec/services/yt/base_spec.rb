require 'spec_helper'

describe Yt::Base do
  let(:url) { 'https://www.youtube.com/watch?v=nareTnpxvTQ' }

  context "#video_id" do
    it "should find the ID for https" do
      Yt::Base.video_id(url).should == 'nareTnpxvTQ'
    end

    it "should find the ID for http" do
      Yt::Base.video_id(url.gsub('https','http')).should == 'nareTnpxvTQ'
    end
  end
end