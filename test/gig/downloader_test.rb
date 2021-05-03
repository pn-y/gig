# frozen_string_literal: true

require 'test_helper'
class GigDownloaderTest < Minitest::Test
  def setup
    @client = Gig::Downloader
    @query = 'topic:ruby topic:rails'
    root_path = Pathname.new(Dir.pwd)
    @path_to_temp_file_folder = root_path.join('test', 'support', 'tmp')
  end

  def test_downloading
    url = 'http://google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'

    stub_request(:get, url)
      .to_return(status: 200, body: File.read('test/fixtures/rails.png'), headers: { content_type: 'image/png' })

    @client.call([url], @path_to_temp_file_folder)

    files = Dir.glob('*', base: @path_to_temp_file_folder)

    assert { !files.empty? }
  end
end
