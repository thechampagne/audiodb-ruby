# frozen_string_literal: true

require_relative "lib/audiodb/version"

Gem::Specification.new do |spec|
  spec.name          = "audiodb"
  spec.version       = AudioDB::VERSION
  spec.authors       = ["XXIV"]

  spec.summary       = "TheAudioDB API client"
  spec.description   = "TheAudioDB API client"
  spec.homepage      = "https://github.com/thechampagne/audiodb-ruby"
  spec.license = 'Apache-2.0'
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/thechampagne/audiodb-ruby"
  spec.metadata["github_repo"] = "git@github.com:thechampagne/audiodb-ruby.git"

  spec.files = Dir["lib/**/*.rb", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]
end
