require 'test_helper'

class PreRenderTest < ActiveSupport::TestCase

  test "pre-render module exists" do
    assert_kind_of Module, PreRender
  end

  test "version constant is defined" do
    assert PreRender::VERSION
    assert PreRender::VERSION != ""
  end

end
