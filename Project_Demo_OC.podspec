Pod::Spec.new do |s|

  s.name         = 'Project_Demo_OC'
  s.version      = '1'
  s.summary      = 'Project_Demo_OC.'

  s.description  = <<-DESC
                    this is Project_Demo_OC
                   DESC

  s.homepage     = '__HomePage__'
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  s.author       = 'daichen'
  s.platform     = :ios, '8.0'
  s.source       = { :git => '__HTTPSRepo__', :tag => s.version.to_s }

  s.prefix_header_contents = '#import <Foundation/Foundation.h>', '#import <UIKit/UIKit.h>', '#import "ProjectConfig.h"'

  s.public_header_files = 'Project_Demo_OC/Project_Demo_OC/**/ProjectModule.h'

  s.source_files  = 'Project_Demo_OC/Project_Demo_OC/**/*.{h,m,swift}'

  s.resources  = ['Project_Demo_OC/Project_Demo_OC/**/*.{storyboard,xib,png,bundle}', 'Project_Demo_OC/Assets.xcassets']

  # s.preserve_paths = 'FilesToSave', 'MoreFilesToSave'

  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  s.requires_arc = true

  #s.dependency 'PRBaseDependTool'

end
