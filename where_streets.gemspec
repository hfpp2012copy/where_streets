require_relative "lib/where_streets/version"

Gem::Specification.new do |spec|
  spec.name = "where_streets"
  spec.version = WhereStreets::VERSION
  spec.authors = ["hfpp2012copy"]
  spec.email = ["hfpp2012@gmail.com"]

  spec.summary = ""
  spec.homepage = "https://github.com/hfpp2012/where_streets"
  spec.license = "MPL"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/hfpp2012/where_streets/issues",
    "changelog_uri" => "https://github.com/hfpp2012/where_streets/releases",
    "source_code_uri" => "https://github.com/hfpp2012/where_streets",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fast_blank", "~> 1.0.1"
  spec.add_dependency "json", "~> 2.6.1"
end
