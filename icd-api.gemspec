# frozen_string_literal: true

require_relative 'lib/icd/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'icd-api'
  spec.version       = Icd::Api::VERSION
  spec.authors       = ['Simon Kunz']
  spec.email         = ['sku@mtomady.de']

  spec.summary       = 'Summary'
  spec.description   = 'Desc'
  spec.homepage      = 'https://www.github.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://www.github.com'
  spec.metadata['changelog_uri'] = 'https://www.github.com'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('dry-configurable', '< 2')
  spec.add_dependency('faraday', '< 3')
  spec.add_dependency('zeitwerk', '< 3')

  # gem.add_development_dependency "bundler"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '>=1.30.0'
end
