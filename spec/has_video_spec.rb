require 'spec_helper'

describe YmVideos::HasVideo do
  
  describe "video_embed_id" do
  
    let(:resource) {FactoryGirl.build(:resource)}
  
    it "returns correct id when Vimeo" do
      resource.video_url = "https://vimeo.com/39057126"
      resource.video_embed_id.should == "39057126"
    end
  
    it "returns correct id when YouTube" do
      resource.video_url = "http://www.youtube.com/watch?v=JVxe5NIABsI"
      resource.video_embed_id.should == "JVxe5NIABsI"
    end
  
    it "returns nil when blank" do
      resource.video_url = nil
      resource.video_embed_id.should == nil
    end
  
  end
  
end