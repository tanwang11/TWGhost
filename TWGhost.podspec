#
# Be sure to run `pod lib lint TWGhost.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TWGhost'
  s.version          = '0.0.3'
  s.summary          = 'TWGhost.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'TWGhost tool.'

  s.homepage         = 'https://github.com/tanwang11/TWGhost'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tanwang11' => 'aihy@linrunwc.com' }
  s.source           = { :git => 'https://github.com/tanwang11/TWGhost.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Example/TWGhost/Classes/*.{h,m}'
  
  # s.resource_bundles = {
  #   'TWGhost' => ['TWGhost/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
    s.dependency 'YYCache'
    s.dependency 'YYModel'
    s.dependency 'Masonry'
    s.dependency 'TWFoundation'
  
end
