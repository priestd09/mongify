require 'mongify/translation/base_config'

module Mongify
  class Translation
    class MongodbConfig < Mongify::Translation::BaseConfig
          
      REQUIRED_FIELDS = %w{host database}  
      
      def initialize(options=nil)
        super options
        @adaptor = 'mongo'
      end
      
      def collection(value)
        @database = value
      end
      
      def connection_string
        if(@username && @password)
          "#{@adaptor}://#{@username}:#{@password}@#{@host}/#{@database}"
        else
          "#{@adaptor}://#{@host}/#{@database}"
        end
      end
      
    end
  end
end