class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless email_valid?(record.email)
      record.errors.add(:base, "The email is invalid")
    end
  end

  REGEX_PATTERN = /^\S+@\S+\.\S+$/
  def email_valid?(email)
    email =~REGEX_PATTERN
  end
end
