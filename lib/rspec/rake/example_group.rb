require 'rake'

module RSpec::Rake

  module ExampleGroup

    def self.included(base)
      base.instance_eval do

        metadata[:type] = :task
        metadata[:tasks_path] ||= File.join('lib', 'tasks')
        metadata[:rakefile] ||= nil

        subject(:task)  { Rake.application[self.class.top_level_description] }

        before(:each) do
          metadata = self.class.metadata
          task_name = self.class.top_level_description

          rakefile = metadata[:rakefile] || task_name.split(':').first
          task_path = File.join('..', metadata[:tasks_path], rakefile)

          Rake.application = Rake::Application.new
          # We are sending an empty list of loaded files
          # in order to force loading of existing files
          Rake.application.rake_require(task_path, $LOAD_PATH, [])
          Rake::Task.define_task(:environment)
        end
      end

    end

  end
end
