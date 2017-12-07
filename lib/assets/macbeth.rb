class MacBeth
  def initialize(file_path)
    xml_doc       = File.open(file_path)
    nokogiri_doc  = Nokogiri::XML(xml_doc)
    @play         = nokogiri_doc.css("ACT")
  end

  def save
    save_all_acts(@play)
  end

  private def save_all_acts(play)
    play.each_with_index do |act, act_index|
      puts "Going through ACT#{act_index + 1}"
      scenes = act.css("SCENE")
      act    = Act.find_or_create_by(number: act_index + 1)

      save_all_scenes(scenes, act.id)
    end
  end

  private def save_all_scenes(scenes, act_id)
    scenes.each_with_index do |scene, scene_index|
      puts "Going through SCENE#{scene_index + 1}"
      speeches = scene.css("SPEECH")
      scene    = Scene.find_or_create_by(
        act_id: act_id,
        number: scene_index + 1
      )

      save_all_speeches(speeches, scene.id)
    end
  end

  private def save_all_speeches(speeches, scene_id)
    speeches.each do |speech|
      characters = sanitize_characters(speech)
      lines      = speech.css("LINE")

      characters.each {|character| save_each_line(lines, character.id, scene_id)}
    end
  end

  private def sanitize_characters(speech)
    speech.css("SPEAKER").map do |character|
      char_name = character.text.downcase
      if char_name == "all"
        next
      elsif char_name == "both murderers"
        Character.where(name: ["first murderer", "second murderer"])
      else
        Character.find_or_create_by(name: char_name)
      end
    end.flatten.compact
  end

  private def save_each_line(lines, character_id, scene_id)
    lines.each do |line|
      Line.find_or_create_by(
        character_id: character_id,
        scene_id: scene_id,
        text: line.text.downcase
      )
    end
  end
end