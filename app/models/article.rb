class Article < ActiveRecord::Base
    belongs_to :user

    # validates :title , validate_with
end
