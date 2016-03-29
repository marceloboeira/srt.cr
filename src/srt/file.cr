module SRT
  class File
    property lines : Array(Line)

    def initialize(@lines = [] of Line); end

    def to_s
      buffer = ""

      lines.each do |line|
        buffer += line.to_s
      end

      buffer
    end
  end
end
