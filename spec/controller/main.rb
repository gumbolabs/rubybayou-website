require 'ramaze'
require 'ramaze/spec/bacon'

require __DIR__('../../app')
Ramaze.options.roots = __DIR__('../../')

describe MainController do
  behaves_like :rack_test

  should 'show start page' do
    get('/').status.should == 200
    last_response['Content-Type'].should == 'text/html'
    # last_response.should =~ /<h1>Welcome to Ramaze!<\/h1>/
  end
end
