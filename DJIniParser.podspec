Pod::Spec.new do |s|
  s.name             = 'DJIniParser'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DJIniParser.'
  s.homepage         = 'https://github.com/ericdjzhang/DJIniParser'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ericdjzhang' => '751298862@qq.com' }
  s.source           = { :git => 'https://github.com/ericdjzhang/DJIniParser.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'DJIniParser/Classes/**/*'
end
