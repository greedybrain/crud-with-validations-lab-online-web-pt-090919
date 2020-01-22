class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "There can't be a release of the same song twice in a year."
  }
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_presence
  validates :artist_name, presence: true

  def release_year_presence
    if self.released
      unless self.release_year
        errors.add(:release_year, "There must be a release year present.")
      else
        now = Time.new
        if now.year < self.release_year
          errors.add(:release_year, "Release year is in the future.")
        end
      end
    end
  end
end