class GistController < ApplicationController
  def index
    @gists = Gist.all
  end
end
