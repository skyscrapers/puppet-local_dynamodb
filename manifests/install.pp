class local_dynamodb::install inherits local_dynamodb {
  file { '/opt/dynamodb-local':
    ensure => directory,
  }

  exec { 'install_dynamodb_local':
    command => '/usr/bin/curl -s -j -L https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz | tar xzf - -C /opt/dynamodb-local',
    cwd     => '/tmp',
    unless  => [ '/usr/bin/test -f /opt/dynamodb-local/DynamoDBLocal.jar' ],
    require => File['/opt/dynamodb-local'],
  }

  file { '/etc/init.d/local_dynamodb':
    ensure  => present,
    source  => 'puppet:///modules/local_dynamodb/dynamodb',
    require => Exec['install_dynamodb_local'],
    owner   => root,
    group   => root,
    mode    => '0755',
  }

}
