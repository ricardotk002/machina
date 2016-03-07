require 'erubis'
require 'machina/file_model'

module Machina
  class Controller
    include Machina::Model
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end

    private

    def controller_name
      klass = self.class
      klass = klass.name.gsub(/Controller$/, "")
      Machina.to_underscore(klass)
    end

  end

end
