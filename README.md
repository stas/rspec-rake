# RSpec Rake Support

You can test you Rake files like you test your Rails app.

This gem adds an example group and configures RSpec so we can write tests for our Rake tasks easily.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-rake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-rake

## Usage

Require `rspec/rake` in your `spec_helper.rb`

```ruby
require 'rspec/rake'
```

And start writing tests in your `spec/tasks` directory.

Normally `RSpec::Rake` will detect a **task** test and will try loading it from your `lib/tasks/*.rake` directory.

You can manually specify the rake file location and file name by using metadata:

```ruby
describe 'task:subtask', :rakefile => 'my_task' do
  # Spot the :rakefile metadata value
  # This will tell `RSpec::Test` to load `lib/tasks/my_task.rake`

  it 'does something' do
    task.invoke
  end
end
```

As you can see the subject of the test is the task with the name from example description.
You can also refer to the subject as `task`.

```ruby
describe 'task:subtask', :rakefile => 'my_task', :tasks_path => 'lib/capistrano/tasks' do
  # Same with the :tasks_path metadata value
  # This will tell `RSpec::Test` to load `lib/capistrano/task/my_task.rake`
end
```

### Limitations

Due to how `Rake::Application#rake_require` works, only files with `.rake` extension can be tests.

## Plagiarism alert

My tentative to provide RSpec support for testing Rake tasks in a convenient and idiomatic way is not new.
Previously [Thoughtbot](http://robots.thoughtbot.com/test-rake-tasks-like-a-boss) and [Tyler Hunt](http://devoh.com/blog/2010/11/testing-rake-tasks-with-rspec) wrote about this.

Although I picked a different approach to handle the same problem, it is pretty much the same solution. All I did is tried to put it all together and provide it the way you see it now.

## Contributing

1. Fork it ( http://github.com/stas/rspec-rake/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
