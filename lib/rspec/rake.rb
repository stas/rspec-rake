require 'rspec/rake/version'
require 'rspec/rake/example_group'

RSpec.configure do |config|
  config.include RSpec::Rake::ExampleGroup,
    :type => :task,
    :example_group => lambda { |example_group, metadata|
      metadata[:type].nil? && %r{spec/tasks}.match(example_group[:file_path])
    }
end
