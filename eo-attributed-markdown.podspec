####################
# Because this..
#
# Because the guy who made AttributedMarkdown, which we like, is either dead or doesn't care 
# and thus won't push his code to the cocoapods repo, we need to make our own private repo and pod:
#
####################
# Do this:
#
# Add local podspec repository:
# pod repo add eo-attributed-markdown-podspec https://github.com/ExoticObjects/eo-attributed-markdown-podspec.git
#
# Create a private pod:
# cd to dir where you want it, then
# git clone https://github.com/ExoticObjects/eo-attributed-markdown-podspec.git
# 
# Push the private pod to the local podspec repository 
# Note: (--allow-warnings is critical; did this: _1.0.0.beta.2_ to run that specific version of cooapods)
# pod _1.0.0.beta.2_ repo push eo-attributed-markdown-podspec eo-attributed-markdown.podspec --allow-warnings
#
####################
# (which does this):
#
# Updating the `eo-attributed-markdown-podspec' repo
#
# From https://github.com/ExoticObjects/eo-attributed-markdown-podspec
#  * [new branch]      master     -> origin/master
#
# Adding the spec to the `eo-attributed-markdown-podspec' repo
#
#  - [Add] eo-attributed-markdown (0.9.2)
#
# Pushing the `eo-attributed-markdown-podspec' repo
#
# To https://github.com/ExoticObjects/eo-attributed-markdown-podspec
#    561fbff..9eba7e5  master -> master
#
####################
# We should now be able to serve AttributedMarkdown from our own github repo. Not ideal, but we can 
# script this if the guy never pushes his repo...
#
# Used this tutorial for guidance: http://code.tutsplus.com/tutorials/managing-private-pods-with-cocoapods--cms-25137
#
# If you have get a linker error from XCode, try this: pod cache clean
#
# Not building for me - look through here: http://stackoverflow.com/questions/9863836/library-not-found-for-lpods



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
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.7'
  s.source_files = 'markdown_lib.m', 'markdown_lib.h', 'markdown_peg.h', 'markdown_output.m', 'markdown_parser.m', 'platform.h'
  s.public_header_files = '*.h'
  s.preserve_path = "utility_functions.m", "parsing_functions.m"
  s.ios.frameworks = 'CoreText', 'UIKit', 'Foundation'
  s.osx.frameworks = 'CoreText', 'AppKit', 'Foundation'
  s.requires_arc = false
end