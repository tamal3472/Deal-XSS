class Post < ApplicationRecord
  before_save :sanitize_body


  validates :title, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and spaces" }

  private

  def sanitize_body
    self.body = HtmlSanitizer.custom_sanitize(body)
  end
end
