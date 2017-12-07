class MainController < ApplicationController
  def index
    @json = {}
    @acts = Act.all

    Character.all.each do |char|
      @json[char.name] = char.lines.length
    end
  end
end
