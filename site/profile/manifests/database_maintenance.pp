class profile::database_maintenance {

  #Add an exec to modify autovacuum settings to 1% instead of 20%

  if ( $osfamily in [ 'RedHat' ] ) {
    file { "/etc/cron.d/${fqdn}-database-maintenance" :
      ensure  => present,
      content => '0 1 * 2 * root sudo -u pe-postgres /opt/puppetlabs/server/bin/reindexdb --all; sudo -u pe-postgres /opt/puppetlabs/server/bin/vacuumdb --analyze --all;'
    } 
    
  }

}
