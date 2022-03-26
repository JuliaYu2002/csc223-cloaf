class User < ApplicationRecord
  validates_presence_of   :email
  validates_uniqueness_of :username
                          :email
  validate                :has_username
                          :has_password

  has_many :bikes, optional:true

  # I know we're only allowing one bike per user to start with,
  # but I defined it as a one-to-many relationship to make it easier to change later.

  scope :registered, lambda { where("registration_date != ?", nil)  }

  private

    def has_username
      if :registered && :username == nil
        errors.add(:username, "Must enter a username.")
      end
    end

  private

    def has_password
      if :registered && :password == nil
        errors.add(:password, "Must enter a password.")
      end
    end

end
