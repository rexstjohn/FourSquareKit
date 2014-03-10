Pod::Spec.new do |s|
  s.name             = "FourSquareKit"
  s.version          = "0.0.1"
  s.summary          = "A basic FourSquare SDK for iOs."
  s.description      = <<-DESC
                       Helpful for anyone wanting to immediately start working with FourSquare v2 API data.
                       DESC
  s.homepage = 'https://github.com/rexstjohn/FourSquareKit'
  s.license  = { :type => 'MIT',
                 :text => 'FourSquareKit is licensed under MIT License
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.' }
  s.author           = { "Rex St John" => "rexstjohn@ux-rx.com" }
  s.source           = { 
                          :git => 'https://github.com/rexstjohn/FourSquareKit.git',
                          :commit => 'a0da57ec853a060d53cd8f8672a606a8adf22fd4'
                       }
  s.social_media_url = 'https://twitter.com/rexstjohn'

  s.dependency 'MKNetworkKit', '~> 0.87'
  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Classes/ios/*.{h,m}'
  s.resources = 'Resources'
  s.ios.exclude_files = 'Classes/osx'
  s.public_header_files = 'Classes/**/*.h'
  s.prefix_header_contents = '#import "FourSquareKit.h"'
  s.frameworks = 'CFNetwork', 'ImageIO', 'CoreLocation', 'UIKit'
end
