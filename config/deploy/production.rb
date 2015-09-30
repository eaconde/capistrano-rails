# variables

set :port, 22
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false

server '188.166.252.31',
  roles: [:web, :app, :deploy],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

puts "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer'
}

set :rails_env, :production
set :conditionally_migrate, true
