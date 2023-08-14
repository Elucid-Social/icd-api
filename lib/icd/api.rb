# frozen_string_literal: true

require 'zeitwerk'
require 'dry-configurable'
require 'faraday'
require 'icd/api/version'

loader = Zeitwerk::Loader.new
%w[lib].each do |require_path|
  loader.push_dir(require_path)
end

loader.setup

module Icd
  module Api
    class Error < StandardError; end
  end
end
