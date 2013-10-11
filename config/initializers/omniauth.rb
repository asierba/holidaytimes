OmniAuth.config.logger = Rails.logger

LDAPConfig = YAML.load(File.open("#{Rails.root}/config/ldap.yml"))

Bookmeoff::Application.config.middleware.use OmniAuth::Strategies::LDAP,
                                             :host => LDAPConfig['ldap']['host'],
                                             :port => LDAPConfig['ldap']['port'],
                                             :method => LDAPConfig['ldap']['method'],
                                             :base => LDAPConfig['ldap']['base'],
                                             :uid => LDAPConfig['ldap']['uid'],
                                             :bind_dn => LDAPConfig['ldap']['bind_dn'],
                                             :password => LDAPConfig['ldap']['password']