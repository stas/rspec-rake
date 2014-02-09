require 'spec_helper'

describe RSpec::Rake::ExampleGroup do

  subject(:example_group) do
    RSpec::Core::ExampleGroup.describe do
      include RSpec::Rake::ExampleGroup
    end
  end

  it 'loads metadata' do
    expect(example_group.metadata[:type]).to eq(:task)
    expect(example_group.metadata[:tasks_path]).to eq('../lib/tasks')
    expect(example_group.metadata[:rakefile]).to be_nil
  end

  context '#before(:each) with no rakefile metadata' do
    let(:task_name) { 'some:task' }

    before do
      example_group.class.stub(:top_level_description => task_name)
      example_group.class.stub(:metadata => example_group.metadata)
    end

    it 'creates a new rake application and loads the task rake file' do
      fake_rake_app = Rake::Application.new
      expect(fake_rake_app).to receive(:rake_require).with(
        '../lib/tasks/some', $LOAD_PATH, [])
      expect(Rake::Application).to receive(:new).and_return(fake_rake_app)
      example_group.hooks[:before][:each].first.block.call
    end
  end

  context '#before(:each) with rakefile metadata' do
    let(:metadata) { example_group.metadata.merge(:rakefile => 'another') }

    before do
      example_group.class.stub(:top_level_description)
      example_group.class.stub(:metadata => metadata)
    end

    it 'creates a new rake application and loads the task rake file' do
      fake_rake_app = Rake::Application.new
      expect(fake_rake_app).to receive(:rake_require).with(
        '../lib/tasks/another', $LOAD_PATH, [])
      expect(Rake::Application).to receive(:new).and_return(fake_rake_app)
      example_group.hooks[:before][:each].first.block.call
    end
  end

  context '#subject(:task)' do
    before do
      example_group.hooks[:before][:each].first.stub(:block => proc{})
    end

    it 'calls rake application task' do
      Rake.application = {'' => 'OK'}
      example_group.example { expect(task).to eq('OK') }
      example_group.run(RSpec.configuration.reporter)
    end
  end

end
