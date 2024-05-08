Pod::Spec.new do |s|
  s.name             = 'ModelResources'
  s.version          = '0.0.1-dev'
  s.author           = { 'Oskar Kwaśniewski' => 'oskarkwasniewski@icloud.com' }
  s.license          = 'MIT'
  s.homepage         = 'https://github.com/okwasniewski/react-native-model3d'
  s.source           = { :git => 'https://github.com/okwasniewski/react-native-model3d' }
  s.summary          = 'Resources for AwesomeApp'
  s.resources = '*.{usdz}'
end
