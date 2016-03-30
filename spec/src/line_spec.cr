require "./../spec_helper"

describe SRT::Line do
  context "when rendering" do
    starts_at = Helper.smart_time(4, 32, 2, 32)
    finishs_at = Helper.smart_time(5, 7, 3, 27)

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
      output = "7\n" +
               "04:32:02,032 --> 05:07:03,027\n" +
               "Hello\n" +
               "\n"

      line.to_s.should eq(output)
    end
  end
end
