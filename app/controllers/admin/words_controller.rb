class Admin::WordsController < Admin::BaseController
  before_action :load_word, only: :destroy

  def index
    @words = Word.all
  end

  def show; end

  def destroy
    if @word.destroy
      flash[:success] = t ".success"
      redirect_back fallback_location: admin_root_path
    else
      flash[:error] = t ".error"
      redirect_to admin_root_path
    end
  end

  private
  def load_word
    @word = Word.find_by id: params[:id]
    return if @word.present?

    flash[:error] = t "words.not_found"
    redirect_to admin_root_path
  end
end
