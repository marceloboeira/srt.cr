module SRT
  class Line
    property sequence : Int32,
             text : String

    def initialize(@sequence = 0, @text = ""); end

    def to_s
      "#{sequence}\n" +
      "#{text}"
    end
  end
end
