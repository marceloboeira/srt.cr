module Helper
  def self.smart_time(hours, minutes, seconds, milliseconds)
    Time.new(Time::Span.new(0, hours, minutes, seconds, milliseconds).ticks)
  end
end
