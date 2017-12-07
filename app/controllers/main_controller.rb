class MainController < ApplicationController
  before_action :sanitize_params
  before_action :setup_play_and_winner, if: :sanitize_params

  def index

  end

  private def sanitize_params
    @path = params[:xml_url]
  end

  private def setup_play_and_winner
    parse   = Play.new(@path)
    @play   = parse.play
    @winner = parse.winner
  end
end
