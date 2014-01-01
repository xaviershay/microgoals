require 'active_model'

module Form
  class NewGoal
    include ActiveModel::Validations
    extend ActiveModel::Naming

    ATTRIBUTES = [
      :activity,
      :target
    ]
    attr_accessor *ATTRIBUTES

    validates_presence_of :activity, :target

    def to_key; nil end
    def persisted?; false end

    def initialize(data = {})
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", data[attr])
      end
    end

    def save
      return false unless valid?

      ::Goal.create!(
        activity: activity,
        target: target
      )

      true
    end

    def self.name
      "Goal"
    end
  end
end
