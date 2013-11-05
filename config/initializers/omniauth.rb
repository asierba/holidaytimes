OmniAuth.config.logger = Rails.logger

$has_auth_provider = false

@ldapConfigPath = "#{Rails.root}/config/ldap.yml"

if File.exists?(@ldapConfigPath)

  LDAPConfig = YAML.load(File.open(@ldapConfigPath))

  if LDAPConfig != nil && LDAPConfig['ldap']['enabled']
    Bookmeoff::Application.config.middleware.use OmniAuth::Builder do
      provider :ldap,
               :host => LDAPConfig['ldap']['host'],
               :port => LDAPConfig['ldap']['port'],
               :method => LDAPConfig['ldap']['method'],
               :base => LDAPConfig['ldap']['base'],
               :uid => LDAPConfig['ldap']['uid'],
               :bind_dn => LDAPConfig['ldap']['bind_dn'],
               :password => LDAPConfig['ldap']['password']
    end

    $has_auth_provider = true
  end

end