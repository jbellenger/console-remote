ssh_authorized_key { 
  'jbellenger@tw-mbp-jbellenger':
    type => 'ssh-rsa',
    user => 'pi',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC2KLJtnScBWA5DYM5fSg9Zkhy/sqnxrM1viKtatoMfwK9FJ25xgRI8HNxwOd9Fcw8trObypYrQWfM7F5KAmgg6DuDmo2mfwtjylvhQHKYwH0FOowIqqpLEGOXnU/UeQaw81xbPVOyquWT7DQvS229n0JBag7tcSa0Jv2VFFLkazaY6mPjzJ37auppym9zdFrBgNOUuG2dIK6M6sE7FGdpDbADNNSYAdtfSkBiSKB94cpnQ4r8rdEzwNJWBOeqKFP5pIWzM/VnUw28agSCgx7CbbJ4v7vGWFnRwQ6hmCIIY29Gbe42u5Y5DC3QIdFXpneAZGAbHr5DYd489xwzKY0WH';

  'james@abyss.bellenger.org':
    type => 'ssh-rsa',
    user => 'pi',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCZJ/9cLwE8EbWj749X4GX2oGImQNemlQWyH7Aa6SCIF3AQ9IpZlcB5GpFH4JIBaPTQNtyb7+9xnVplL2Amx+MOsjGdCvPtnJItA5RTD5BVG9Y2wksN3e5rwBWvDmZb8ms/yeQG7siAG8CidubRI7Jv4Uj+UQxikb7djlM2S++453BP3vE8k6T/8eaykDZBJLDOKep9pB8jRGE/NomsOjB1EGwV0C59y6fV46SdUrNZX/lF2OlSCl3EhEn2wGdXSDEuLVkzjrbvZKl1OuwQKSJI1DejpXox5zEL1K1HZizMRWH2gUKHkErHLMBDXbBiBLCZpGYh0V20aKrt8Rr3qSDZ';
}

exec { fetch_node:
  command => 'wget http://node-arm.herokuapp.com/node_latest_armhf.deb -O /root/node_latest_armhf.deb',
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  creates => '/root/node_latest_armhf.deb';
}

package {
  nodejs:
    provider => dpkg,
    require => Exec[fetch_node],
    source => '/root/node_latest_armhf.deb',
    ensure => installed;

  git: 
    ensure => installed;
}
