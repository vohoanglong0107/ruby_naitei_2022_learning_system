class ExamsController < BaseController
  before_action :load_exam, only: %i(show edit update)

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new exam_params
    sample_questions
    if @exam.save
      flash[:success] = t ".success"
      redirect_to edit_exam_path(@exam)
    else
      flash[:error] = t ".fail"
      redirect_to @exam.lesson
    end
  end

  def index
    @exams = current_user.exams
  end

  def show
    return redirect_to edit_exam_path(@exam) unless @exam.is_finished?
  end

  def edit
    return redirect_to @exam if @exam.is_finished?
  end

  def update
    if @exam.update exam_params.merge is_finished: true
      flash[:success] = t ".success"
      redirect_to exam_path(@exam)
    else
      flash[:error] = t ".fail"
      redirect_to edit_exam_path(@exam)
    end
  end

  private

  def exam_params
    params.require(:exam).permit Exam::PERMIT_ATTRIBUTES
  end

  def load_exam
    @exam = Exam.find_by id: params[:id]
    return if @exam

    flash[:error] = t "exams.not_found"
    redirect_to exams_path
  end

  def sample_questions
    word_ids = helpers.sample_word_ids_from @exam.lesson
    word_ids.each do |chosen_word_id|
      sampled_word_ids = helpers.sample_3_wrong_word_ids word_ids,
                                                         chosen_word_id
      exam_question = @exam.exam_questions.build true_answer_id: chosen_word_id
      sampled_word_ids.each do |sampled_word_id|
        exam_question.wrong_answers.build word_id: sampled_word_id
      end
    end
  end
end
