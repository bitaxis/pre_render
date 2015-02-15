##
# Augments a Rails application's controller.

class ApplicationController < ActionController::Base

  ##
  # Overrides the default render() method to call a subclass' pre_render() method if it is present.  Because
  # the pre_render() method is called before the actual render() method, it is a good place for the controller
  # to compose the "view model" based on the view being rendered before the actual render() method is called.
  # @param args Arguments passed to the original render() method.

  def render(*args)
    if self.class.method_defined? :pre_render
      view = args[0].is_a?(Hash) ? (args[0][:action] || action_name) : (args[0] || action_name)
      self.pre_render(view.to_sym, *args)
    end
    super # invoke the actual render() method
  end

end
