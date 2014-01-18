require 'active_model'

module Form
  class EditGoal
    include ActiveModel::Validations
    extend ActiveModel::Naming

    ATTRIBUTES = [
      :target
    ]
    attr_accessor *ATTRIBUTES
    attr_reader :existing

    validates_presence_of :target

    def to_key; [existing.id] end
    def persisted?; true end
    def to_param; to_key[0] end

    def initialize(existing, data = {})
      @existing = existing

      ATTRIBUTES.each do |attr|
        self.send("#{attr}=", data.fetch(attr, existing.attributes[attr.to_s]))
      end
    end

    def save
      return false unless valid?

      existing.update_attributes!(target: target)

      true
    end

    def self.name
      "Goal"
    end
  end
end
