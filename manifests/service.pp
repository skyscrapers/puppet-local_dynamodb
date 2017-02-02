class local_dynamodb::service inherits local_dynamodb {

  service { 'local_dynamodb':
    enable    => true,
    hasstatus => true,
    require   => File['/etc/init.d/local_dynamodb'],
  }

  exec { 'start_localdynamodb':
    command => '/usr/sbin/service local_dynamodb start',
    require => Service['local_dynamodb'],

  }

}
