require "bundler/gem_tasks"
Rake.application.instance_variable_get('@tasks').delete('release')

desc 'Run test_unit based test'
task :test do
  Dir.glob('test/**/test_*.rb') do |path|
    cmd = "bundle exec ruby #{path}"
    puts cmd
    system cmd
  end
end
