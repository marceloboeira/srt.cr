require "./../spec_helper"

describe SRT::File do
  context "when rendering" do

    lines = [ SRT::Line.new(1, Helper.smart_time(0, 2, 50, 904), Helper.smart_time(0, 2, 52, 929), "Help me!"),
              SRT::Line.new(2, Helper.smart_time(0, 2, 53, 6), Helper.smart_time(0, 2, 55, 406), "Somebody, help me out.") ]
    file = SRT::File.new(lines: lines)

    it "render the lines in sequence" do
      output = "1\n" +
               "00:02:50,904 --> 00:02:52,929\n" +
               "Help me!\n" +
               "\n" +
               "2\n" +
               "00:02:53,006 --> 00:02:55,406\n" +
               "Somebody, help me out.\n" +
               "\n"

      file.to_s.should eq(output)
    end
  end
end
