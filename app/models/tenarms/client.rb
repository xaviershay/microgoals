require 'json'
require 'open-uri'

module Tenarms
  class Client
    def initialize(id)
      @id = id
    end

    def max_lift(activity)
      content = open("https://www.tenarms.net/api/dashboards/#{@id}").read

      json = JSON.parse(content)
      max = json['lifts'].detect {|x| x['activity'] == activity }
      max['resistance'] if max
    end
  end
end
