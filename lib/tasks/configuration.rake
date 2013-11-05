namespace 'configuration' do

  def copy_config_file(sourceDir, destinationDir)
    if File.exists(destinationDir)
      raise 'Config file "%s" already exists' % destinationDir
    else
      FileUtils.cp(sourceDir, destinationDir)
    end
  end

  task :generate_ldap_config do
    copy_config_file('config/templates/ldap.yml', 'config/ldap.yml')
  end
end