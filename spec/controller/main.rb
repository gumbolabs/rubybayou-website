require File.expand_path(File.dirname(__FILE__) + '/../common')

include Ramaze::Helper::PrettyStuff

describe MainController do
  before do
    behaves_like :rack_test
  end
  
  describe "home page" do
    should "respond successfully" do
      get('/').status.should == 200
    end
  
    should "include latest blog post" do
      get ('/')
      last_response.should.match /<div.*id=\"latest_blog\".*>.*<\/div>/m
    end
  
    should "include Twitter feed" do
      get ('/')
      last_response.should.match /<div.*id=\"twitter\".*>.*<\/div>/m
    end
  end
end