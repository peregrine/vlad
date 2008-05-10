require 'vlad'

namespace :vlad do
  ## God module for merb app server

  set :merb_cluster_nodes,  2
  set :merb_port,           4800

  desc "Prepares application servers for deployment.".cleanup

  remote_task :setup_app, :roles => :app do
    
  end

  desc "Restart the app servers"

  remote_task :start_app, :roles => :app do
    run "god restart #{merb_cluster_name}"
  end

  desc "Stop the app servers"

  remote_task :stop_app, :roles => :app do
    run "god stop #{merb_cluster_name}"
  end
end
