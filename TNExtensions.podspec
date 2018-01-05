Pod::Spec.new do |s|

  s.name         = "TNExtensions"
  s.version      = "0.2"
  s.summary      = "Tiyo Nir Extensions"
  s.description  = "Commonly used extensions"
  s.homepage     = "https://github.com/mownier/tiyonir-extensions"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Mounir Ybanez" => "rinuom91@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/mownier/tiyonir-extensions.git", :tag => s.version }
  s.requires_arc = true

  s.subspec 'ImageCreator' do |ss|
    ss.source_files = 'TiyoNirExtensions/Source/ImageCreator/*.swift'
  end

  s.subspec 'HexColorConverter' do |ss|
    ss.source_files = 'TiyoNirExtensions/Source/HexColorConverter/*.swift'
  end
end
