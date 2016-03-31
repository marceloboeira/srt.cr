require "./../spec_helper"

describe SRT::File do
  context "when rendering" do
    let(two_lines) { Fixture.load("two-lines.srt") }
    let(lines) {
      [ SRT::Line.new(1, Helper.smart_time(0, 2, 50, 904), Helper.smart_time(0, 2, 52, 929), "Help me!"), 
        SRT::Line.new(2, Helper.smart_time(0, 2, 53, 6), Helper.smart_time(0, 2, 55, 406), "Somebody, help me out.") ]
    }
    let(file) { SRT::File.new(lines: lines) }

    it "render the lines in sequence" do
      expect(file.to_s).to eq(two_lines)
    end
  end
end
