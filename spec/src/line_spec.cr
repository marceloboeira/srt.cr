require "./../spec_helper"

describe SRT::Line do
  context "when rendering" do
    line = SRT::Line.new(sequence: 7, text: "Hello")

    it "renders the sequence" do
      line.to_s.should match(/7/)
    end

    it "renders the text" do
      line.to_s.should match(/Hello/)
    end

    it "renders in the correct positions" do
      line.to_s.should eq("7\nHello")
    end
  end
end
