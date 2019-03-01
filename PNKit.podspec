Pod::Spec.new do |s|
  s.name             = 'PNKit'
  s.version          = '0.6.0'
  s.summary          = 'PNKit 0.6.0 Version'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/P1nov/PNKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'P1nov' => '1473781785@qq.com' }
  s.source           = { :git => 'https://github.com/P1nov/PNKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'PNKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PNKit' => ['PNKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
