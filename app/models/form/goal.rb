require 'active_model'

module Form
  class Goal
    include ActiveModel::Validations
    extend ActiveModel::Naming

    ATTRIBUTES = [
      :activity,
      :target
    ]
    attr_accessor *ATTRIBUTES

    def self.name
      "Goal"
    end
  end
end
