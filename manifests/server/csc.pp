# CSC: Client specific configuration
define openvpn::server::csc (
  $content,
  $owner = 'root',
  $group = 0,
  $mode  = '0640'
) {

  include openvpn::params
  $openvpn_dir    = $openvpn::params::openvpn_dir

  realize(File["${openvpn_dir}/ccd"])

  file { "${::openvpn::params::openvpn_dir}/${::openvpn::server::ccd}/${name}":
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => $content,
  }
}
