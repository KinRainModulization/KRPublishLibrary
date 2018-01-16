Pod::Spec.new do |s|
s.name         = "KRPublishLibrary"
s.version      = "0.0.11"
s.summary      = "KRPublishLibrary"
s.description  = <<-DESC
                    KRPublishLibrary.podspec
                    DESC

s.homepage     = "https://github.com/KinRainModulization/KRPublishLibrary.git"
s.prefix_header_file = "KRPublishLibrary/KRPublishLibrary/PrefixHeader.pch"
# s.screenshots  = "www.example.com/screenshots_1.gif"
s.license      = "MIT"                #开源协议
s.author             = { "linyi31" => "linyi@jd.com" }

s.source       = { :git => "https://github.com/KinRainModulization/KRPublishLibrary.git" }
#s.source       = { :git => "https://github.com/KinRainModulization/KRPublishLibrary.git", :tag => s.version.to_s }

s.platform     = :ios, "9.0"
s.requires_arc = true

s.source_files  = "KRPublishLibrary/KRPublishLibrary/Publish/**/*.{h,m}"

#s.dependency "CTMediator"

end
