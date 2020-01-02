Pod::Spec.new do |s|
  s.name         = "ViVuTech"
  s.version      = "1.0.3"
  s.summary      = "Small test to test code sharing via cocoapods."
  s.description  = "This is some superl oco framework that was made by kevin vugts."
  s.homepage     = "https://github.com/trunghieunt/ViVuTech"
  s.license      = "MIT"
  s.author       = { "Hieu" => "trunghieunt201@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/trunghieunt/ViVuTech.git", :tag => "1.0.3" }
  s.source_files = "ViVuTech/**/*"
  s.exclude_files = "ViVuTech/**/*.plist"
  s.swift_version = '5.0'
  s.ios.deployment_target  = '11.0'
end
