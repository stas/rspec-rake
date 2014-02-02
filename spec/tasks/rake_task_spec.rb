require 'spec_helper'

describe 'default', :rakefile => 'example', :tasks_path => './fixtures' do
  it 'task lists another task as the prerequisite' do
    expect(task.prerequisites).to include('example:subexample:task')
  end

  it 'task calls `puts`' do
    expect(Kernel).to receive(:puts).with('OK')
    task.invoke
  end
end

describe 'example:subexample:task', :tasks_path => 'fixtures' do
  it 'has no prerequisites' do
    expect(task.prerequisites).to be_empty
  end
end
