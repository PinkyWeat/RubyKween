# Create the directory for the application
directory '/var/www/salary_calculator' do
  owner 'root'
  mode '777'
  recursive true
  action :create
end

# Download the application from GitHub
remote_file '/tmp/salary_calculator1.zip' do
  source 'https://github.com/PinkyWeat/RubyKween/archive/refs/heads/master.zip'
  action :create
end

# Legacy way of unzipping
# Extract the application to a temporary location
#execute 'unzip_salary_calculator1' do
#  command 'unzip /tmp/salary_calculator1.zip -d /tmp/'
#  not_if { ::Dir.exist?('/tmp/RubyKween-master/irpf/salary_calculator1') }
#end

# This extracts as well + is Chef
archive_file 'Extract salary_calculator1' do
  path '/tmp/salary_calculator1.zip'
  destination '/tmp/'
  not_if { ::Dir.existis?('/tmp/RubyKween-master/irpf/salary_calculator1') }
end

# Use rsync to move the application to its desired location
execute 'sync_salary_calculator1' do
  command 'rsync -av /tmp/RubyKween-master/irpf/salary_calculator1/ /var/www/salary_calculator/'
  only_if { ::Dir.exist?('/tmp/RubyKween-master/irpf/salary_calculator1') }
end

# Clean up temporary files
file '/tmp/salary_calculator1.zip' do
  action :delete
end

# Remove the extracted temporary directory
directory '/tmp/RubyKween-master' do
  recursive true
  action :delete
end

