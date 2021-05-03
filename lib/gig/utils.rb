# frozen_string_literal: true

require 'down'
require 'mimemagic'

module Gig
  class Utils
    class << self
      def download_path(store_path, query)
        download_path = "#{store_path}/#{friendly_foldername(query)}"

        ensure_download_path_existing(download_path)

        download_path
      end

      def image_store_path(path, tempfile)
        extension = MimeMagic.new(tempfile.content_type).extensions.first
        original_filename = tempfile.original_filename
        file_name = original_filename =~ Regexp.new(extension) ? original_filename : "#{original_filename}.#{extension}"

        "#{path}/#{file_name}"
      end

      def friendly_foldername(query)
        query
          .encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: 'ï¿½')
          .strip
          .tr("\u{202E}%$|:;/\t\r\n\\", '-')
          .tr(' ', '_')
      end

      def ensure_download_path_existing(download_path)
        return if File.exist?(download_path)

        FileUtils.mkdir_p(download_path)
      end
    end
  end
end
