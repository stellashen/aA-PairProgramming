class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  def self.random_code
    result_str = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: result_str)
      result_str = SecureRandom.urlsafe_base64
    end
    result_str
  end

  def self.get_short_url(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(:short_url =>  short_url, :long_url => long_url, :user_id => user.id )
  end

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: :Visit,
    foreign_key: :short_url_id,
    primary_key: :id

  has_many :visitors,
    through: :visits,
    source: :visitor

  def num_clicks
    self.visitors.length
  end

  def num_uniques
    self.visitors.uniq.length
  end

  def num_recent_uniques
    num = 0
    # get uniq visits from one hour ago to now
    self.visitors.uniq.select do |visitor|
      num += 1 if Time.now.getutc - visitor.created_at < 60 * 60
    end

    num
  end

end
