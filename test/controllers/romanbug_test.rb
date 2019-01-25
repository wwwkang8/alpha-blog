require_relative 'romanbug_test'
require 'test_helper'
class TestRoman < Test::Unit::TestCase

  test "should tet" do
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
  end


end