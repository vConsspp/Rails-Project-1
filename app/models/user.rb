class User < ActiveRecord::Base

    before_save  {self.email = email.downcase}

    validates :firstname , presence: true, length: {minimum: 5 , maximum: 20}

    validates :lastname , presence: true, length: {minimum: 5 , maximum: 20}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email , presence: true , format: {with: VALID_EMAIL_REGEX} , uniqueness: {case_sensetive: false}

    validates :password , presence: true , length: {minimum: 8 , maximum:20}

    validates :phone , numericality: { only_integer: true }

    validates :password, confirmation: { case_sensitive: true }

    has_many :articles

    has_secure_password

end
