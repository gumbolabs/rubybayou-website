begin
  require 'rcov/rcovtask'

  Rcov::RcovTask.new do |t|
    t.test_files = FileList['spec/**/*.rb']
    # t.libs = FileList['controller/**/*.rb',
    #                   'helper/**/*.rb',
    #                   'model/**/*.rb',
    #                   'spec/**/*.rb']
    t.verbose = true
    
    t.rcov_opts << "--comments"
  end
rescue
  puts 'Rcov is not available.'
end