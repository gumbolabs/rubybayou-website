require 'fakeweb'

Given /^Twitter is alive$/ do
  FakeWeb.clean_registry
end

Given /^Twitter is not alive$/ do
  FakeWeb.register_uri(:get, "http://twitter.com/",
                       :body => "Post not found",
                       :status => ["404", "Not Found"])
end