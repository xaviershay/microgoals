module Form
  class ViewGoal
    def self.wrap
      client_map = {}
      lambda do |dao|
        x = client_map[dao.tenarms_id] ||= Tenarms::Client.new(dao.tenarms_id)
        new(dao, tenarms_data: x)
      end
    end

    def initialize(dao, tenarms_data: nil)
      @dao = dao
      @tenarms_data = tenarms_data
    end

    def activity; dao.activity end
    def target; dao.target end
    def current; tenarms_data.max_lift(dao.activity); end

    protected

    attr_reader :dao, :tenarms_data
  end
end
