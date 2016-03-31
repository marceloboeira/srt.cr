require "./../spec_helper"

describe SRT::Line do
  one_line = Fixture.load("one-line.srt")

  context "when rendering" do
    starts_at = Helper.smart_time(0, 2, 50, 904)
    finishs_at = Helper.smart_time(0, 2, 52, 929)

    line = SRT::Line.new(sequence: 1,
                         starts_at: starts_at,
                         finishs_at: finishs_at,
                         text: "Help me!")

    it "renders the sequence" do
      line.to_s.should match(/1/)
    end

    it "renders the text" do
      line.to_s.should match(/Help me!/)
    end

    it "renders the starts_at" do
      line.to_s.should match(/00:02:50,904/)
    end

    it "renders the finishs_at" do
      line.to_s.should match(/00:02:52,929/)
    end

    it "renders the separator" do
      line.to_s.should match(/-->/)
    end

    it "renders in the correct positions" do
      line.to_s.should eq(one_line)
    end
  end
end
