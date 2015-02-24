require 'test_helper'

class PreRenderTest < ActiveSupport::TestCase

  test "pre-render module exists" do
    assert_kind_of Module, PreRender
  end

  test "version constant is defined" do
    assert PreRender::VERSION
    assert PreRender::VERSION != ""
  end

  test "action controller base should have the render methods" do
    assert ActionController::Base.instance_methods.include? :render
    assert ActionController::Base.instance_methods.include? :render_with_override
    assert ActionController::Base.instance_methods.include? :render_without_override
  end

  test "application controller should have the hello method" do
    assert ApplicationController.instance_methods.include? :hello
  end

end
