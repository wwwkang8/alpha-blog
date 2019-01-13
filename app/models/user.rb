class User < ActiveRecord::Base

  has_many :articles, dependent: :destroy
  before_save {self.email.downcase} #이메일이 저장되기 전에 소문자로 변환하는 것. 그리고 DB에 저장
  validates :username, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum:3, maximum:25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end