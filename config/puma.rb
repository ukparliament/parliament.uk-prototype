worker_count = ENV['WEB_CONCURRENCY']
worker_count ||= Rails.env.development? ? 1 : 2

thread_count = ENV['RAILS_MAX_THREADS']
thread_count ||= Rails.env.development? ? 1 : 5

workers Integer(worker_count)
threads Integer(thread_count), Integer(thread_count)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  # ActiveRecord::Base.establish_connection
end
