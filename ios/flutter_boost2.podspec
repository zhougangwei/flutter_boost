#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_boost2'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin make flutter better to use!'
  s.description      = <<-DESC
A new Flutter plugin make flutter better to use!
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE.md' }
  s.author           = { 'Alibaba Xianyu' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*.{h,m,mm}'
  
  s.public_header_files = 
    'Classes/Boost/FlutterBoostPlugin2.h',
    'Classes/Boost/FLB2Platform.h',
    'Classes/Boost/FLBFlutterContainer.h',
    'Classes/Boost/FLB2FlutterAppDelegate.h',
    'Classes/Boost/FLBTypes.h',
    'Classes/Boost/FlutterBoost2.h',
    'Classes/Boost/BoostChannel.h',
    'Classes/1.5/FLB2FlutterViewContainer.h'
    
  s.dependency 'Flutter'
  s.libraries = 'c++'
  
  s.ios.deployment_target = '8.0'
end

