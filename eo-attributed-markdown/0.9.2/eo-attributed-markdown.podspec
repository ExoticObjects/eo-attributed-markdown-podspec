Pod::Spec.new do |s|
  s.name = "eo-attributed-markdown"
  s.version = "0.9.2"
  s.summary = "AttributedMarkdown is a markdown parser. But the guys who made it can't publish the cocoapod, so we had to make this stupid private repo..."
  s.homepage = "https://github.com/ExoticObjects/AttributedMarkdown"
  s.license = 'MIT'
  s.author = 'Gregory Wieber', 'Jim Radford'
  s.source = { 
    :git => "https://github.com/ExoticObjects/AttributedMarkdown.git", 
    # :tag => "0" 
  }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.source_files = 'markdown_lib.m', 'markdown_lib.h', 'markdown_peg.h', 'markdown_output.m', 'markdown_parser.m', 'platform.h'
  s.public_header_files = '*.h'
  s.preserve_path = "utility_functions.m", "parsing_functions.m"
  s.ios.frameworks = 'CoreText', 'UIKit', 'Foundation'
  s.osx.frameworks = 'CoreText', 'AppKit', 'Foundation'
  s.requires_arc = false
end