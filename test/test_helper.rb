# frozen_string_literal: true

require 'minitest/autorun'
require 'pathname'
require 'json'
require 'minitest/power_assert'
require 'mocha/minitest'
require 'webmock/minitest'
require 'pry'

require 'gig'

def load_json_fixture(fixture_path)
  root_path = Pathname.new(Dir.pwd)
  full_fixture_path = root_path.join('test', 'fixtures', fixture_path)
  file_content = File.read(full_fixture_path)
  JSON.parse(file_content)
end
