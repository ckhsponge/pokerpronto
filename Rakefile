# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :db do
  namespace :test do
    task :prepare => :clone_structure do |t|
      puts "Preparing spongecell test db"
      system "mysql -D spongecell_test < db/time_zones.sql"
      system "mysql -D spongecell_test < db/gateways.sql"
    end
  end

  task :promote do |t|
    system "mysql -u root -D spongecell_development < db/promote.sql"
  end
end

task :runprod do |t|
  system 'ruby test/functional/info_controller_test.rb -n /test_gen_/'
  system 'rake asset:packager:delete_all'
  system 'rake asset:packager:build_all'
  system 'ruby script/server -e production'
end

PKG_DESTINATION="/Users/ckhmini/Sites/pokerpronto"

BASE_DIRS   = %w(
	  app config/environments components db doc log lib lib/tasks public script script/performance script/process test vendor vendor/plugins
  tmp/sessions tmp/cache tmp/sockets tmp/pids
)
	
APP_DIRS    = %w( models controllers helpers views )
PUBLIC_DIRS = %w( images javascripts stylesheets )
TEST_DIRS   = %w( fixtures unit functional mocks mocks/development mocks/test )

LOG_FILES = %w( server.log development.log test.log production.log )

def make_dest_dirs(dirs, path = '.')
  mkdir_p dirs.map { |dir| File.join(PKG_DESTINATION, path.to_s, dir) }
end
	
desc "Make the directory structure for the new Rails application"
task :make_dir_structure => [ :make_base_dirs, :make_app_dirs, :make_public_dirs, :make_test_dirs, :make_view_dirs ]

task(:make_base_dirs)   { make_dest_dirs BASE_DIRS              }
task(:make_app_dirs)    { make_dest_dirs APP_DIRS,    'app'     }
task(:make_public_dirs) { make_dest_dirs PUBLIC_DIRS, 'public'  }
task(:make_test_dirs)   { make_dest_dirs TEST_DIRS,   'test'    }

task :copy_all_but_configs => [:make_dir_structure, :copy_application, :copy_public, :copy_vendor]
task :copy_all => [:copy_all_but_configs, :copy_configs]

task :copy_configs do
  #cp "config/asset_packages.yml", "#{PKG_DESTINATION}/config/asset_packages.yml"
  cp "config/routes.rb", "#{PKG_DESTINATION}/config/routes.rb"
  cp "config/database.yml", "#{PKG_DESTINATION}/config/database.yml"
  cp "config/boot.rb", "#{PKG_DESTINATION}/config/boot.rb"
  cp "config/environment.rb", "#{PKG_DESTINATION}/config/environment.rb"
  cp "config/environments/production.rb", "#{PKG_DESTINATION}/config/environments/production.rb"
  cp "config/environments/development.rb", "#{PKG_DESTINATION}/config/environments/development.rb"
  cp "config/environments/test.rb", "#{PKG_DESTINATION}/config/environments/test.rb"
end

task :make_view_dirs do
  FileList["app/views/*"].each do |path|
    mkdir_p "#{PKG_DESTINATION}/#{path}"
  end
  FileList["app/views/promote/*"].each do |path|
    mkdir_p "#{PKG_DESTINATION}/#{path}"
  end
end

task :copy_application do
  FileList["app/**/*.rb"].each do |path|
    cp path,"#{PKG_DESTINATION}/#{path}"
  end
  FileList["app/**/*.rhtml"].each do |path|
    cp path,"#{PKG_DESTINATION}/#{path}"
  end
end

task :copy_public do
  cp_r "public","#{PKG_DESTINATION}"
  FileUtils.rm_r(Dir.glob(File.join(PKG_DESTINATION, 'public', "**", ".svn")))
end

task :copy_vendor do
  cp_r "vendor","#{PKG_DESTINATION}"
  FileUtils.rm_r(Dir.glob(File.join(PKG_DESTINATION, 'vendor', "**", ".svn")))
end

task :initialize_log_files do
  log_dir = File.join(PKG_DESTINATION, 'log')
  chmod 0777, log_dir
  LOG_FILES.each do |log_file|
    log_path = File.join(log_dir, log_file)
    touch log_path
    chmod 0666, log_path
  end
end

task :initialize_local_log_files do
  log_dir = 'log'
  mkdir_p log_dir
  chmod 0777, log_dir
  LOG_FILES.each do |log_file|
    log_path = File.join(log_dir, log_file)
    touch log_path
    chmod 0666, log_path
  end
end

desc "Copy in all the Rails packages to vendor"
task :copy_vendor_libraries do
  mkdir File.join(PKG_DESTINATION, 'vendor', 'rails')
  VENDOR_LIBS.each { |dir| cp_r File.join('..', dir), File.join(PKG_DESTINATION, 'vendor', 'rails', dir) }
  FileUtils.rm_r(Dir.glob(File.join(PKG_DESTINATION, 'vendor', 'rails', "**", ".svn")))
end

desc "Link in all the Rails packages to vendor"
task :link_vendor_libraries do
  mkdir File.join(PKG_DESTINATION, 'vendor', 'rails')
  VENDOR_LIBS.each { |dir| ln_s File.join('..', '..', '..', dir), File.join(PKG_DESTINATION, 'vendor', 'rails', dir) }
end
