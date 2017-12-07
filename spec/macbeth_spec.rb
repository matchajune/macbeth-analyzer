require "rails_helper"
require "nokogiri"
require_relative "../lib/assets/macbeth.rb"

describe MacBeth do
  before(:all) do
    path_to_test_xml = "#{Dir.pwd}/spec/macbeth-test.xml"
    MacBeth.new(path_to_test_xml).save
  end

  context "Act" do
    before(:all) do
      @acts = Act.all
      @act  = Act.all.first
    end

    it "length is 1" do
      expect(@acts.length).to eq(1)
    end

    it "has 1 scene" do
      scenes = @act.scenes
      expect(scenes.length).to eq(1)
    end

    it "has 3 characters" do
      characters = @act.characters
      expect(characters.length).to eq(3)
    end

    it "has 11 lines" do
      lines = @act.lines
      expect(lines.length).to eq(11)
    end
  end

  context "Scene" do
    before(:all) do
      @scenes = Scene.all
      @scene  = Scene.all.first
    end

    it "length is 1" do
      expect(@scenes.length).to eq(1)
    end

    it "has 1 act" do
      act = @scene.act
      expect(act).to be_truthy
    end

    it "has 3 characters" do
      characters = @scene.characters
      expect(characters.length).to eq(3)
    end

    it "has 11 lines" do
      lines = @scene.lines
      expect(lines.length).to eq(11)
    end
  end

  context "Characters" do
    before(:all) do
      @characters = Character.all
    end

    it "length is 3" do
      expect(@characters.length).to eq(3)
    end

    it "each has 1 act" do
      @characters.each do |character|
        expect(character.acts.length).to eq(1)
      end
    end

    it "each has 1 scene" do
      @characters.each do |character|
        expect(character.scenes.length).to eq(1)
      end
    end

    it "each has has its respective number of lines" do
      @characters.each do |character|
        case character.name
        when "first witch"
          expect(character.lines.length).to eq(4)
        when "second witch"
          expect(character.lines.length).to eq(4)
        when "third witch"
          expect(character.lines.length).to eq(3)
        end
      end
    end
  end

  context "Lines" do
    before(:all) do
      @lines = Line.all
    end

    it "length is 11" do
      expect(@lines.length).to eq(11)
    end

    it "each has 1 character" do
      @lines.each do |line|
        expect(line.character).to be_truthy
      end
    end

    it "each has 1 scene" do
      @lines.each do |line|
        expect(line.scene).to be_truthy
      end
    end

    it "each has 1 act" do
      @lines.each do |line|
        expect(line.act).to be_truthy
      end
    end
  end

end