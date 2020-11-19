Pod::Spec.new do |spec|

  spec.name         = "SwiftUtilities"
  spec.version      = "0.0.1"
  spec.summary      = "Library for swift."
  spec.description  = "A smorgasbord of Swift source code."
  spec.homepage     = "https://github.com/IlMatveev/SwiftUtilities"
  spec.license      = "MIT"
  spec.author       = "Ilya Matveev"
  spec.source       = { 
    :git => "https://github.com/IlMatveev/SwiftUtilities", 
    :tag => "0.0.1" 
  }

  spec.source_files = "Source/**/*.{h,m}", "Source/**/*.swift"

end