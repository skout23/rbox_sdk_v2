# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rbox_sdk_v2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Stout"]
  gem.email         = ["j.scott.stout@gmail.com"]
  gem.description   = %q{Box.net v1/v2 ruby api sdk}
  gem.summary       = %q{Ruby box.net api which uses v1 for auth and v2 for all file / folder operations}
  gem.homepage      = "https://github.com/skout23/rbox_sdk_v2"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rbox_sdk_v2"
  gem.require_paths = ["lib"]
  gem.version       = RboxSdkV2::VERSION
end
