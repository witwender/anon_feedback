class Feedback < ApplicationRecord

  before_create :sanitize
  validates_presence_of :recipient_handle, :text
  validates_length_of :recipient_handle, :in => 1..15
  validates_length_of :text, :in => 1..250

  after_create :send_tweet

  def sanitize
    # => insert logic regarding transformations
    self.recipient_handle = self.recipient_handle.gsub('@', '')
  end

  def send_tweet
    puts "Sending tweet"
    TwitterService.tweet!(self)
  end
end
