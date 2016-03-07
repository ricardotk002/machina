require 'multi_json'

module Machina
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename

        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      # Setter
      def [](name)
        @hash[name.to_s]
      end

      # Getter
      def []=(name, value)
        @hash[name.to_s] = value
      end

      # Queries
      def self.find(id)
        begin
          FileModel.new("db/quotes/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new(f) }
      end

    end

  end

end
