module SRT
  class File
    property lines : Array(Line)

    def initialize(@lines = [] of Line); end

    def to_s(io)
      lines.each do |line|
        io << line
      end
    end

    def self.parse(input : String)
      input_lines = input.lines
      lines = [] of Line
      buffer = ""

      input.lines.each do |line|
        buffer += line

        if line.strip.empty?
          lines << Line.parse(buffer)

          buffer = ""
        end
      end

      new(lines: lines)
    end
  end
end
