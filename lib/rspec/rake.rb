require 'rspec/rake/version'
require 'rspec/rake/example_group'

RSpec.configure do |config|
  config.include RSpec::Rake::ExampleGroup,
    type: :task,
    file_path: /\bspec\/tasks\//
end
