# frozen_string_literal: true

require 'down'

module Gig
  class Downloader
    class << self
      def call(urls, path = Dir.pwd)
        threads = urls.map do |url|
          Thread.new do
            tempfile = Down.download(url)
            FileUtils.mv(tempfile.path, Utils.image_store_path(path, tempfile))
          end
        end
        threads.each(&:join)
      end
    end
  end
end
