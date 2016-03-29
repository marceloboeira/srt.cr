module SRT
  class Line
    TIME_FORMAT = "%H:%M:%S,%L"
    SEPARATOR = " --> "
    property sequence : Int32,
             starts_at : Time,
             finishs_at : Time,
             text : String

    def initialize(@sequence = 0, @starts_at = Time.now, @finishs_at = Time.now, @text = ""); end

    def to_s
      "#{sequence}\n" +
      "#{starts_at.to_s(TIME_FORMAT)}#{SEPARATOR}#{finishs_at.to_s(TIME_FORMAT)}\n" +
      "#{text}\n" +
      "\n"
    end
  end
end
