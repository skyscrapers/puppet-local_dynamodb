# == Class: local_dynamodb
#
class local_dynamodb {
  class { 'java': } ->
  class { 'local_dynamodb::install': } ->
  Class['local_dynamodb']
}
