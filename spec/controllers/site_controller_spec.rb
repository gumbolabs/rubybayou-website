require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SiteController do
  context "index action" do
    before(:each) do
      get :index
    end
    
    it "should respond" do
      controller.should.respond_to? :index
    end
    
    it "should set @title" do 
      assigns[:page_title].should_not be_nil
      assigns[:page_title].should == "New Orleans Ruby User Group"
    end
    
    it "should set @tweets" do
      assigns[:tweets].should_not be_nil
      assigns[:tweets].size.should == 3
    end
    
    it "should set Cache-Control header to 900 seconds" do
      response.headers['Cache-Control'].should == 'public, max-age=900'
    end
  end
end
