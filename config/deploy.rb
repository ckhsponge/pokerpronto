require 'mt-capistrano'
 
set :site,         "44693"
set :application,  "pokerpronto"
set :webpath,      "pokerpronto.com"
set :domain,       "64.13.192.133"
set :user,         "serveradmin%pokerpronto.com"
set :password,     "H6mtkRxv"
 
#ssh_options[:username] = 'serveradmin%primarydomain.com'
 
set :scm, :git
set :scm_command, "/home/#{site}/users/.home/usr/bin/git"
set :repository, "git://github.com/ckhsponge/#{application}.git"
set :deploy_to,  "/home/#{site}/containers/rails/#{application}"
set :current_deploy_dir, "#{deploy_to}/current"
set :tmp_dir, "#{deploy_to}/tmp"
 
set :checkout, "export"
 
role :web, "#{domain}"
role :app, "#{domain}"
role :db,  "#{domain}", :primary => true
 
task :after_update_code, :roles => :app do
  run "cp #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  #put(File.read('config/database.yml'), "#{release_path}/config/database.yml", :mode => 0444)
  #tar_source
end
 
namespace :deploy do
  task :restart, :roles => :app do
    #run "mtr restart #{application} -u #{user} -p #{password}"
    #run "mtr generate_htaccess #{application} -u #{user} -p #{password}"
    run "mtr restart #{application} -u #{user} -p #{password}"
    run "mtr generate_htaccess #{application} -u #{user} -p #{password}"
    #migrate
  end
end

namespace :static do
  task :start, :roles => :app do
    #run "cd /home/44693/domains/pokerpronto.com"
    run "rm /home/44693/domains/pokerpronto.com/html;true"
    #run "mkdir /home/44693/domains/pokerpronto.com/html"
    run "cp -r /home/44693/containers/rails/pokerpronto/current/public /home/44693/domains/pokerpronto.com"
    run "mv /home/44693/domains/pokerpronto.com/public /home/44693/domains/pokerpronto.com/html"
    run "mv /home/44693/domains/pokerpronto.com/html/static.html /home/44693/domains/pokerpronto.com/html/index.html"
    run "rm /home/44693/domains/pokerpronto.com/html/.htaccess;true"
    run "rm /home/44693/domains/pokerpronto.com/html/dispatch.*;true"
    mt_stop
  end
  
  task :stop,  :roles => :app do
    run "rm -rf /home/44693/domains/pokerpronto.com/html; true"
    mt_create_link
    mt_start
  end
end

task :init_log_dir do
  run "mkdir -p /home/#{site}/containers/rails/#{application}/shared"
  run "mkdir -p /home/#{site}/containers/rails/#{application}/shared/log"
end

task :mt_status do
  run "/usr/local/bin/mtr -u serveradmin%pokerpronto.com -p H6mtkRxv status"
end

task :mt_info do
  run "/usr/local/bin/mtr -u serveradmin%pokerpronto.com -p H6mtkRxv info #{application}"
end
