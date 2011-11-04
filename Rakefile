require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = 'torch'
  s.summary = 'Extensions to make ruby shell scripting easier.'
  s.version = '0.0.1'
  s.author = 'Ben Olive'
  s.email = 'sionide21@gmail.com'
  s.homepage = 'http://github.com/sionide21/Torch'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.8'
  s.files = Dir['{lib}/**/**']
  s.has_rdoc = true
  s.description = <<-EOF
Provides useful tools and extensions to speed up common scripting tasks.
EOF
end

Rake::GemPackageTask.new(spec).define

desc "Remove derived files"
task :clean do
  rm_r 'doc'
  rm_r 'pkg'
end