
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "makeup_maker/version"

Gem::Specification.new do |spec|
  spec.name          = "makeup_maker"
  spec.version       = MakeupMaker::VERSION
  spec.authors       = ["'Ayana Bando'"]
  spec.email         = ["'ayanaflax@yahoo.com'"]
  spec.add_development_dependency "rspec"
  spec.summary       = ["Search makeup manufacturers stock and corp info"]
  spec.homepage      = ""
  spec.license       = "MIT"
end
