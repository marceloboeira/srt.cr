module SRT
  class Line
    property sequence : Int32

    def initialize(@sequence = 0); end

    def to_s
      "#{sequence}"
    end
  end
end
