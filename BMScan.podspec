Pod::Spec.new do |s|
s.name         = 'BMScan'
s.version      = '0.0.1'
s.summary      = '一款对原始二维码扫描的封装,自定义扫描UI,使用协议自定义配置，动画'
s.homepage     = 'https://github.com/asiosldh/BMScan'
s.license      = 'MIT'
s.authors      = {'asiosldh' => 'asiosldh@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/asiosldh/BMScan.git', :tag => s.version}
s.source_files = 'BMScanDemo/BMScan/**/*.{h,m}'
s.resource     = 'BMScanDemo/BMScan/image'
s.requires_arc = true
end
