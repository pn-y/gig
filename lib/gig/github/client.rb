# frozen_string_literal: true

require 'http'

module Gig
  module Github
    class Client
      BASE_PATH = 'https://api.github.com/'
      REPOSITORY_SEARCH = 'search/repositories'

      class << self
        def search_repositories(params)
          url = BASE_PATH + REPOSITORY_SEARCH
          get(url, params)
        end

        def get(path, params)
          response = HTTP.get(path, params: params)
          check_response!(response)
          JSON.parse(response.body)
        rescue HTTP::ConnectionError => e
          raise ConnectionError, e
        end

        def check_response!(response)
          ratelimit_remaining = response.headers['x-ratelimit-remaining']
          if !ratelimit_remaining.nil? && ratelimit_remaining.to_i.zero?
            raise RateLimitReached, response.headers['x-ratelimit-reset'].to_i - Time.now.utc.to_i
          end

          raise UnexpectedResponseError if response.status > 299
        end
      end
    end
  end
end
