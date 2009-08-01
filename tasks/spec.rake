begin
  require 'bacon'

  desc "Run Specs with Bacon"
  task :spec do
    sh "bacon spec/**/*.rb --quiet"
  end
rescue
  puts 'Bacon not available'
end