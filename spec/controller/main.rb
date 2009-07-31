require 'ramaze'
require 'ramaze/spec/bacon'

require __DIR__('../../app')
Ramaze.options.roots = __DIR__('../../')

describe MainController do
  behaves_like :rack_test

  it 'home page should respond successfully' do
    get('/').status.should == 200
  end
  
  it 'home page should include latest blog post' do
    get ('/')
    last_response.should.match /<div.*id=\"latest_blog\".*>.*<\/div>/m
  end
  
  it 'home page should include Twitter feed' do
    get ('/')
    last_response.should.match /<div.*id=\"twitter\".*>.*<\/div>/m
  end
end
