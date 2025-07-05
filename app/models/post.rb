class Post < ApplicationRecord
  before_save :sanitize_body


  private

  def sanitize_body
    self.body = HtmlSanitizer.custom_sanitize(body)
  end
end
