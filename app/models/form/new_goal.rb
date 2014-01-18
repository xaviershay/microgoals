require 'active_model'

module Form
  class NewGoal < ::Form::Goal
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
  end
end
