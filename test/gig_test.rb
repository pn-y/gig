# frozen_string_literal: true

require 'test_helper'

class GigTest < Minitest::Test
  def test_something
    skip 'blabla'
    assert Gig.call('amazing language:go')
  end
end
