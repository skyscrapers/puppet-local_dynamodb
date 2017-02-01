# == Class: local_dynamodb
#
class local_dynamodb {
  include ::java
  include local_dynamodb::install
  include local_dynamodb::service
  Class['java'] -> Class['local_dynamodb::install'] -> Class['local_dynamodb::service']
}
