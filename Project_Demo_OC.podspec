Pod::Spec.new do |s|

  s.name         = 'Project_Demo_OC'
  s.version      = '1'
  s.summary      = 'Project_Demo_OC.'

  s.description  = <<-DESC
                    this is Project_Demo_OC
                   DESC

  s.homepage     = '__HomePage__'
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  s.author       = 'wanglei'
  s.platform     = :ios, '8.0'
  s.source       = { :git => '__HTTPSRepo__', :tag => s.version.to_s }

s.prefix_header_contents = '#import "Masonry.h"','#import "YYModel.h"','#import "SDWebImageManager.h"','#import "UIImageView+WebCache.h"','#import "UIButton+WebCache.h"','#import "PRBaseHeader.h"','#import "PRBassCategory.h"','#import "MBProgressHUD+WL.h"','#import "PFVLoginStatue.h"','#import "TMRouter.h"'


  s.source_files  = 'Project_Demo_OC/Project_Demo_OC/**/*.{h,m,swift}'

  # s.public_header_files = 'Classes/**/*.h'

  s.resources  = ['Project_Demo_OC/Project_Demo_OC/**/*.{storyboard,xib,png,bundle}', 'Project_Demo_OC/Assets.xcassets']

  # s.preserve_paths = 'FilesToSave', 'MoreFilesToSave'

  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  s.requires_arc = true

  s.dependency 'PRBaseDependTool'

end
