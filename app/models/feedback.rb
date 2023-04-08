class Feedback < ApplicationRecord
  # user creates feedback record
  # tweet the 'text' attribute of the feedback record to the 'recipient_handle' attribute

  after_create :send_tweet

  def send_tweet
    puts "Sending tweet"
    # insert Twitter API logic here
  end

end
