class MainController < ApplicationController
  before_action :sanitize_params
  before_action :setup_instance_variables, if: :sanitize_params

  def index

  end

  private def sanitize_params
    @path = params[:xml_url]
  end

  private def setup_instance_variables
    parse   = Play.new(@path)
    @error  = parse.error
    @play   = parse.play
    @winner = parse.winner
  end
end
