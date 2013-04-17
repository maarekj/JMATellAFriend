Pod::Spec.new do |s|
  s.name = 'JMATellAFriend'
  s.version = '1.0.0'
  s.summary = 'JMATellAFriend is an iOS toolkit for displaying a preconfigued mail composer with a "Tell a Friend" template in ios apps.'
  s.homepage = 'https://github.com/maarekj/JMATellAFriend'
  s.author = 'Joseph Maarek'
  
  s.source = { :git => "git://github.com/maarekj/JMATellAFriend.git", :tag => 'v1.0.0' }
  s.requires_arc = true
  s.platform = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  
  s.source_files = 'src/*.{h,m}'
  s.resources = ["src/Resources/**/*"]
  s.preserve_paths = "Classes", "*.{plist,pch,md,m,xcodeproj}", "example"
  s.frameworks = 'MessageUI'

  s.dependency 'iTellAFriend', '~> 1.3.0'
end
