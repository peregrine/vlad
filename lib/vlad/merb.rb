require 'vlad'

namespace :vlad do
  ##
  # Thin app server

  set :merb_cluster_nodes,  2
  set :merb_port,           4800

  desc "Prepares application servers for deployment. Mongrel
configuration is set via the mongrel_* variables.".cleanup

  remote_task :setup_app, :roles => :app do
    
  end

  def merb(cmd) # :nodoc:
    "merb #{cmd}"
  end

  desc "Restart the app servers"

  remote_task :start_app, :roles => :app do
    run "cd #{current_path}; merb -K all; merb -c #{merb_cluster_nodes} -p #{merb_port} -e #{merb_environment}"
  end

  desc "Stop the app servers"

  remote_task :stop_app, :roles => :app do
    run "cd #{current_path} && merb -K all"
  end
end
