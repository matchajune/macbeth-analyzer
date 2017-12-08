class Play
  require 'open-uri'
  attr_reader :play, :winner, :error

  def initialize(path)
    @play   = {}
    @winner = ""
    @count  = 0
    @error  = false

    begin
      file    = open(path)
      xml_doc = Nokogiri::HTML(file)
      parse(xml_doc)
    rescue
      @error  = true
      puts "Couldn't parse...returning defaults."
    end
  end

  private def parse(xml_doc)
    speeches = xml_doc.css("speech")
    speeches.each do |speech|
      parse_all_characters(speech)
    end
  end

  private def parse_all_characters(speech)
    characters      = speech.css("speaker")
    number_of_lines = speech.css("line").length
    characters.map do |character|
      name = character.text.downcase

      find_or_create_character(name, number_of_lines)
      check_winner(name)
    end
  end

  private def find_or_create_character(name, number_of_lines)
    unless ["", "all"].include?(name)
      @play[name] ||= 0
      @play[name] += number_of_lines
    end
  end

  private def check_winner(name)
    total = @play[name] || 0
    if total > @count
      @winner = {
        name: name,
        count: total
      }
      @count = total
    end
  end

end
