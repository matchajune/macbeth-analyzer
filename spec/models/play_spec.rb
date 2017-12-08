require "rails_helper"

RSpec.describe Play, type: :model do
  context "successfully parsed" do
    before(:all) do
      path_to_xml = [
        "http://www.ibiblio.org/xml/examples/shakespeare/com_err.xml",
        "http://www.ibiblio.org/xml/examples/shakespeare/troilus.xml",
        "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
      ]
      parse       = Play.new(path_to_xml.sample)
      @error      = parse.error
      @play       = parse.play
      @winner     = parse.winner
    end

    it "should not have an error state" do
      expect(@error).to be false
    end

    it "should have characters in the play" do
      expect(@play.length).to be > 0
    end

    it "verify the winner is valid with correct lines" do
      expect(@play.key(@play.values.max)).to eq(@winner[:name])
      expect(@play.values.max).to eq(@winner[:count])
    end
  end

  context "fail to parse" do
    before(:all) do
      path_to_xml = "bad_path"
      parse       = Play.new(path_to_xml)
      @error      = parse.error
      @play       = parse.play
      @winner     = parse.winner
    end

    it "should have an error state" do
      expect(@error).to be true
    end

    it "should have no characters in the play" do
      expect(@play.length).to eq(0)
    end

    it "there is no winner" do
      expect(@play.key(@play.values.max)).to be_nil
      expect(@play.values.max).to be_nil

      expect(@winner).to be_empty
    end
  end

end
