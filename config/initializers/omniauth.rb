OmniAuth.config.logger = Rails.logger

HasAuthProvider = false

@LdapConfigPath = "#{Rails.root}/config/ldap.yml"

if File.exists?(@LdapConfigPath)

  LDAPConfig = YAML.load(File.open(@LdapConfigPath))

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

    HasAuthProvider = true
  end

end