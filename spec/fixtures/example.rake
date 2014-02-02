namespace :example do
  namespace :subexample do
    task :task do
      Kernel.puts 'OK'
    end
  end
end

task :default => 'example:subexample:task'
