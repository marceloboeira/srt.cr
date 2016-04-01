module SRT
  class Line
    class Invalid < Exception; end

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

    def self.parse(input : String)
      lines = input.split("\n")

      if !(lines[0] =~ /[0-9]/)
        raise Invalid.new("Invalid Sequence")
      end
      sequence = lines[0].to_i

      starts_at = Time.parse(lines[1].split(" ")[0], TIME_FORMAT)
      finishs_at = Time.parse(lines[1].split(" ")[2], TIME_FORMAT)
      text = lines[2..-2].join("\n")

      new(sequence: sequence, starts_at: starts_at, finishs_at: finishs_at, text: text)
    end
  end
end
