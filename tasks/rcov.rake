begin
  require 'rcov/rcovtask'

  Rcov::RcovTask.new do |t|
    t.libs = FileList['controller/**/*.rb', 'helper/**/*.rb', 'model/**/*.rb']
    t.rcov_opts = ["--comments","--exclude","spec\/","--exclude","app\.rb","--exclude","start\.rb"]
    t.test_files = FileList['spec/**/*.rb']
    t.verbose = true
  end
rescue
  puts 'Rcov is not available.'
end