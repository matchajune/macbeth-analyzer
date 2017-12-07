class MainController < ApplicationController
  before_action :get_json

  def index
    @acts = Act.all
  end

  private def get_json
    @json = {}
    Character.all.each do |char|
      @json[char.name] = char.lines.length
    end
  end
end
