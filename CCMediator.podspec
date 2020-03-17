Pod::Spec.new do |s|
  s.name             = 'CCMediator'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CCMediator.'
  s.description      = <<-DESC
  Mediator Explore
  DESC
  
  s.homepage         = 'https://github.com/chaningcheng/CCMediator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chaningcheng' => 'simon_ccheng@vipabc.com' }
  s.source           = { :git => 'https://github.com/chaningcheng/CCMediator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  
  s.public_header_files = 'CCMediator/Classes/**/*.h'
  s.source_files = 'CCMediator/Classes/**/*'
  s.resource_bundles = {
      'CCMediator' => ['CCMediator/Assets/*.png']
  }

end
