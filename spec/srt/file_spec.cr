require "./../spec_helper"

describe SRT::File do
  let(two_lines) { Fixture.load("two-lines.srt") }
  let(lines) {
    [ SRT::Line.new(1, Helper.smart_time(0, 2, 50, 904), Helper.smart_time(0, 2, 52, 929), "Help me!"),
      SRT::Line.new(2, Helper.smart_time(0, 2, 53, 6), Helper.smart_time(0, 2, 55, 406), "Somebody, help me out.") ]
  }

  context "when parsing" do
    context "with valid params" do
      let(file) { SRT::File.parse(two_lines) }

      it "parses all lines" do
        expect(file.lines.size).to eq(2)

        expect(file.lines.first.sequence).to eq(1)
        expect(file.lines.first.text).to eq("Help me!")

        expect(file.lines.last.sequence).to eq(2)
        expect(file.lines.last.text).to eq("Somebody, help me out.")
      end

      it "reproduces the same input when rendering" do
        expect(file.to_s).to eq(two_lines)
      end
    end
  end

  context "when rendering" do
    let(file) { SRT::File.new(lines: lines) }

    it "render the lines in sequence" do
      expect(file.to_s).to eq(two_lines)
    end
  end
end
