module SRT
  class Line
    class Invalid < Exception; end

    TIME_FORMAT = "%H:%M:%S,%L"
    SEPARATOR = "-->"
    property sequence : Int32,
             starts_at : Time,
             finishs_at : Time,
             text : String

    def initialize(@sequence = 0, @starts_at = Time.now, @finishs_at = Time.now, @text = ""); end

    def to_s(io)
      io << <<-STRING
      #{sequence}
      #{starts_at.to_s(TIME_FORMAT)} #{SEPARATOR} #{finishs_at.to_s(TIME_FORMAT)}
      #{text}
      \n
      STRING
    end

    def self.parse(input : String)
      lines = input.lines

      if lines.size < 4
        raise Invalid.new("Invalid Size")
      end

      if lines[0].match(/[0-9]/).nil?
        raise Invalid.new("Invalid Sequence")
      end
      sequence = lines[0].to_i

      starts_at, separator, finishs_at = lines[1].split(" ")

      if starts_at.match(/(([0-9]{2}[:,]){3})[0-9]{3}/).nil?
        raise Invalid.new("Invalid Starts at")
      end
      starts_at = Time.parse(starts_at, TIME_FORMAT)

      if finishs_at.match(/(([0-9]{2}[:,]){3})[0-9]{3}/).nil?
        raise Invalid.new("Invalid Finishs at")
      end
      finishs_at = Time.parse(finishs_at, TIME_FORMAT)

      text = lines[2..-2].join("\n").rstrip

      new(sequence: sequence, starts_at: starts_at, finishs_at: finishs_at, text: text)
    end
  end
end
