require 'rails_helper'

RSpec.describe Play, type: :model do
  before(:all) do
    path_to_test_xml = "#{Dir.pwd}/spec/macbeth-test.xml"
    parse            = Play.new({file_path: path_to_test_xml})
    @play            = parse.play
    @winner          = parse.winner
  end

  context "Play" do
    it "has first witch say 4 lines" do
      expect(@play["first witch"]).to eq(4)
    end

    it "has second witch say 3 lines" do
      expect(@play["second witch"]).to eq(4)
    end

    it "has third witch say 3 lines" do
      expect(@play["third witch"]).to eq(4)
    end

  end

end
