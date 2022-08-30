class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exams, dependent: :destroy
  has_many :word_associations, class_name: UserLearnWord.name,
                               dependent: :destroy
  has_many :learned_words, through: :word_associations, source: :word
  has_many :lesson_accomplishments, dependent: :destroy
  has_many :completed_lessons, through: :lesson_accomplishments, source: :lesson
  before_save :downcase_email
  attr_accessor :remember_token

  validates :name, presence: true,
                   length: {maximum: Settings.user.name_max_length}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email_max_length},
                    format: {
                      with: Regexp.new(Settings.user.VALID_EMAIL_REGEX, true)
                    },
                    uniqueness: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password_min_length},
                        allow_nil: true

  scope :learners, ->{where(admin: false)}

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end

      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false unless remember_digest

    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def learned? word
    learned_words.include? word
  end

  private

  def downcase_email
    email.downcase!
  end
end
