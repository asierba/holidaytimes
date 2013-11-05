OmniAuth.config.logger = Rails.logger

HasAuthProvider = false

LDAPConfig = YAML.load(File.open("#{Rails.root}/config/ldap.yml"))

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
