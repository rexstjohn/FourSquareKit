Pod::Spec.new do |spec|
  spec.name         = 'MKNetworkKit'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/rexstjohn/FourSquareKit'
  spec.authors      = { 'Rex St. John' => 'rexstjohn@ux-rx.com', 'Jason Cross' => 'jason@ux-rx.com' }
  spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
  spec.source_files = 'MKNetworkKit.{h,m}'
  spec.framework    = 'SystemConfiguration'
  
  spec.subspec 'Core' do |cs|
      cs.dependency 'Reachability'
  end

end