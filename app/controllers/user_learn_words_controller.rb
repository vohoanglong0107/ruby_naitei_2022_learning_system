class UserLearnWordsController < ApplicationController
  def create
    @user_learn_word = UserLearnWord.new word_id: params[:word_id]
    @user_learn_word.user = current_user
    is_success = @user_learn_word.save
    response = {
      data: @user_learn_word.as_json(only: [:id, :word_id])
    }
    respond_to do |format|
      format.js do
        if is_success
          render json: response
        else
          render json: response, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @user_learn_word = UserLearnWord.find_by id: params[:id]
    if @user_learn_word.destroy
      message_type = :success
      message = t ".success"
    else
      message_type = :error
      message = t ".error"
    end

    respond_to do |format|
      format.html do
        flash[message_type] = message
        redirect_to word.lesson
      end

      format.js{render json: {status: message_type, message: message}}
    end
  end
end
