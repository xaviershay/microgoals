require 'json'
require 'open-uri'

module Tenarms
  class Client
    def initialize(id)
      @id = id
    end

    def max_lift(activity)
      max = json['lifts'].detect {|x| x['activity'] == activity }
      max['resistance'] if max
    end

    protected

    def json
      @json ||= begin
        content = open("https://www.tenarms.net/api/dashboards/#{@id}").read

        JSON.parse(content)
      end
    end
  end
end
