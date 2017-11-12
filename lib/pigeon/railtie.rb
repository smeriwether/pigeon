class Pigeon::Railtie < Rails::Railtie
  rake_tasks do
    load "tasks/pigeon.rake"
  end
end
