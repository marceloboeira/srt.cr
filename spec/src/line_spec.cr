require "./../spec_helper"

describe SRT::Line do
  context "when rendering" do
    line = SRT::Line.new(sequence: 7)

    it "renders the sequence" do
      line.to_s.should match(/7/)
    end
  end
end
