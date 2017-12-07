module MainHelper
  def sort_by_line_count(json)
    json.sort_by {|k,v| -v}
  end

  def aggregate_totals(acts)
    acts.map do |act|
      {
        number: act.number,
        characters: act.characters.length,
        scenes: act.scenes.length,
        lines: act.lines.length
      }
    end
  end
end
