# frozen_string_literal: true

require 'zeitwerk'
require 'dry-configurable'
require 'faraday'
require 'icd/api/version'

loader = Zeitwerk::Loader.new
root = File.expand_path('..', __dir__)

loader.push_dir(root)

loader.setup

module Icd
  module Api
    class Error < StandardError; end
  end
end
