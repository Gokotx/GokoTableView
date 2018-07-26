Pod::Spec.new do |s|  
  s.name             = "GokoTableView"  
  s.version          = "0.1.0"  
  s.summary          = "A block supported UITableView"  
  s.description      = <<-DESC
                          It is a block supported UITableView, which implement by Objective-C. 
                          DESC

  s.homepage         = "https://github.com/Gokotx/GokoTableView"  
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"  
  s.license          = 'MIT'  
  s.author           = { "Goko" => "gokotx@outlook.com" }  
  s.source           = { :git => "https://github.com/Gokotx/GokoTableView.git", :tag => s.version.to_s }  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, '8.0'  
  # s.ios.deployment_target = '5.0'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  
  s.source_files = 'GokoTableView/UITableView+Goko/*'  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  s.frameworks = 'Foundation', 'UIKit'  
  
end