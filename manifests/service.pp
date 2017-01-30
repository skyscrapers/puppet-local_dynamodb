class local_dynamodb::service inherits local_dynamodb {
  service { 'dynamodb':
    ensure  => 'running',
    binary  => 'java -Djava.library.path=/opt/dynamodb-local/DynamoDBLocal_lib -har /opt/dynamodb-local/DynamoDBLocal.jar -sharedDb',
    require => Class['local_dynamodb::install'],
  }

}
