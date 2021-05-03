# frozen_string_literal: true

require 'test_helper'

class GigGithubClientTest < Minitest::Test
  def setup
    @client = Gig::Github::Client
    @query = 'topic:ruby topic:rails'
    expected_response = load_json_fixture('github_search_response.json')
    stub_request(:get, 'https://api.github.com/search/repositories?per_page=1&q=topic:ruby%20topic:rails')
      .to_return(status: 200, body: expected_response.to_json)
  end

  def test_search
    response = @client.search_repositories(q: @query, per_page: 1)

    assert { response['items'].size == 1 }
  end
end
