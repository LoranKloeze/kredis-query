# frozen_string_literal: true

require_relative "lib/kredis/query/version"

Gem::Specification.new do |spec|
  spec.name = "kredis-query"
  spec.version = Kredis::Query::VERSION
  spec.authors = ["Loran Kloeze"]
  spec.email = ["loran@codedivision.nl"]

  spec.summary = "Kredis plugin for querying keys"
  spec.description = spec.summary
  spec.homepage = "https://github.com/LoranKloeze/kredis-query"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 6.0.0"
  spec.add_dependency "kredis", "~> 1.0.0"
  spec.add_development_dependency "rails", ">= 6.0.0"
  
  spec.metadata["rubygems_mfa_required"] = "true"
end
