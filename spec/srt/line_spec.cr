require "./../spec_helper"

describe SRT::Line do
  let(one_line) { Fixture.load("one-line.srt") }

  context "when parsing" do
    let(line) { SRT::Line.parse(one_line) }

    context "with a valid input" do
      it "parses the sequence" do
        expect(line.sequence).to eq(1)
      end

      it "parses the starts at" do
        expect(line.starts_at).to eq(Helper.smart_time(0, 2, 50, 904))
      end

      it "parses the finishs at" do
        expect(line.finishs_at).to eq(Helper.smart_time(0, 2, 52, 929))
      end

      it "parses the text" do
        expect(line.text).to eq("Help me!")
      end
    end

    context "with an invalid input" do
      it "validates the size" do
        input = "\n\n\n"

        expect{ SRT::Line.parse(input) }.to raise_error(SRT::Line::Invalid, "Invalid Size")
      end

      it "validates the sequence" do
        input = "A\n\n\n\n"

        expect{ SRT::Line.parse(input) }.to raise_error(SRT::Line::Invalid, "Invalid Sequence")
      end

      it "validates starts_at" do
        input = "1\n00:11:22,A --> 00:11:23,300\n\n\n"

        expect{ SRT::Line.parse(input) }.to raise_error(SRT::Line::Invalid, "Invalid Starts at")
      end

      it "validates starts_at" do
        input = "1\n00:11:22,200 --> 00:11:33,A\n\n\n"

        expect{ SRT::Line.parse(input) }.to raise_error(SRT::Line::Invalid, "Invalid Finishs at")
      end
    end
  end

  context "when rendering" do
    let(starts_at) { Helper.smart_time(0, 2, 50, 904) }
    let(finishs_at) { Helper.smart_time(0, 2, 52, 929) }
    let(line) { SRT::Line.new(sequence: 1, starts_at: starts_at, finishs_at: finishs_at, text: "Help me!") }

    it "renders the sequence" do
      expect(line.to_s).to match(/1/)
    end

    it "renders the text" do
      expect(line.to_s).to match(/Help me!/)
    end

    it "renders the starts_at" do
      expect(line.to_s).to match(/00:02:50,904/)
    end

    it "renders the finishs_at" do
      expect(line.to_s).to match(/00:02:52,929/)
    end

    it "renders the separator" do
      expect(line.to_s).to match(/-->/)
    end

    it "renders in the correct positions" do
      expect(line.to_s).to eq(one_line)
    end
  end
end
