# frozen_string_literal: true

require 'gig/downloader'
require 'gig/utils'
require 'gig/github/client'

module Gig
  UnexpectedResponseError = Class.new(StandardError)
  ConnectionError = Class.new(StandardError)
  class RateLimitReached < StandardError
    def initialize(seconds_till_reset)
      super "Rate limit reached. Please wait #{seconds_till_reset} seconds"
    end
  end

  class << self
    # rubocop:disable Metrics/MethodLength
    def call(query, store_path = Dir.pwd)
      if query.empty?
        puts 'No arguments passed. Try "topic:rails topic:ruby"'
        return
      end

      response = Gig::Github::Client.search_repositories(q: query)
      items = response['items']

      if items.empty?
        puts 'Nothing found for your request'
        return
      end

      download_path = Utils.download_path(store_path, query)
      download_avatars(items, download_path)

      puts "Success! Check #{download_path} for images"
    rescue ConnectionError
      puts 'Connection error, check your internet connection'
    rescue UnexpectedResponseError
      puts 'Unexpected response, try again later'
    rescue RateLimitReached => e
      puts e.message
    end
    # rubocop:enable Metrics/MethodLength

    private

    def download_avatars(items, download_path)
      avatars_urls = items.map { |item| item.dig('owner', 'avatar_url') }
      Gig::Downloader.call(avatars_urls, download_path)
    end
  end
end
