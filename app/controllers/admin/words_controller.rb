class Admin::WordsController < Admin::BaseController
  def index
    @words = Word.all
  end
end
