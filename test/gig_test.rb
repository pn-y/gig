# frozen_string_literal: true

require 'test_helper'

class GigTest < Minitest::Test
  def setup
    root_path = Pathname.new(Dir.pwd)
    @path_to_temp_file_folder = root_path.join('test', 'support', 'tmp')

    expected_response = load_json_fixture('github_search_response.json')
    stub_request(:get, 'https://api.github.com/search/repositories?q=topic:ruby%20topic:rails')
      .to_return(status: 200, body: expected_response.to_json)

    stub_request(:get, 'https://avatars.githubusercontent.com/u/4223?v=4')
      .to_return(status: 200, body: File.read('test/fixtures/rails.png'), headers: { content_type: 'image/png' })
  end

  def teardown
    FileUtils.rm_rf(Dir.glob(@path_to_temp_file_folder.join('*')))
  end

  def test_it_works
    Gig.call('topic:ruby topic:rails', @path_to_temp_file_folder)

    files = Dir.glob('*', base: @path_to_temp_file_folder)

    assert { files.size > 1 }
  end
end
