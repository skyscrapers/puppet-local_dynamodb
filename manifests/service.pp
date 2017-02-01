class local_dynamodb::service inherits local_dynamodb {
  service { 'local_dynamodb':
    ensure    => 'running',
    enable    => true,
    hasstatus => true,
    require   => File['/etc/init.d/local_dynamodb'],
  }

}
