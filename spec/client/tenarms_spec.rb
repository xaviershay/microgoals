require 'integration_helper'

require 'tenarms/client'

describe Tenarms::Client do
  it 'can fetch max squat' do
    VCR.use_cassette('dashboard') do
      client = Tenarms::Client.new('T5JK51')
      squat_max = client.max_lift("FrontSquat")

      expect(squat_max['value']).to be > 0
    end
  end
end
