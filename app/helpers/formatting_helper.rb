module FormattingHelper
  def format_resistance(r)
    return "" unless r
    raise "Unknown type: #{r.inspect}" unless r['type'] == 'Kilos'

    "#{r['value']}kg"
  end
end
