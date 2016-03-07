require "machina/version"
require "machina/routing"
require "machina/util"
require "machina/dependencies"
require "machina/controller"
require "machina/file_model"

module Machina
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { 'Content-Type' => 'text/html' },
        [text]]
    end
  end

end
