namespace :pigeon do
  desc "Start Pigeon"
  task :start => [ :setup ] do
    require "pigeon"

    Pigeon::Process.start
  end

  task :setup do
    Rails.application.initialize!
    Rails.application.eager_load!
  end
end
