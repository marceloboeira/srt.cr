require "./../spec_helper"

describe SRT::Line do
  context "when rendering" do
    starts_at = Time.new(Time::Span.new(0, 4, 32, 2, 32).ticks)
    finishs_at = Time.new(Time::Span.new(0, 5, 7, 3, 27).ticks)

    line = SRT::Line.new(sequence: 7,
                         starts_at: starts_at,
                         finishs_at: finishs_at,
                         text: "Hello")

    it "renders the sequence" do
      line.to_s.should match(/7/)
    end

    it "renders the text" do
      line.to_s.should match(/Hello/)
    end

    it "renders the starts_at" do
      line.to_s.should match(/04:32:02,032/)
    end

    it "renders the finishs_at" do
      line.to_s.should match(/05:07:03,027/)
    end

    it "renders the separator" do
      line.to_s.should match(/-->/)
    end

    it "renders in the correct positions" do
      line.to_s.should eq("7\n04:32:02,032 --> 05:07:03,027\nHello")
    end
  end
end
