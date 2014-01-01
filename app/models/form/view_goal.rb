module Form
  class ViewGoal
    def self.wrap
      method(:new)
    end

    def initialize(dao)
      @dao = dao
    end

    def activity; dao.activity end
    def target; dao.target end
    def current; "Unknown"; end

    protected

    attr_reader :dao
  end
end
