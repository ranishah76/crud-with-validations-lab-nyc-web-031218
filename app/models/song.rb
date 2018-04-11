class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
  scope: [:release_year, :artist_name],
  message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  with_options if: :released? do |song|
  song.validates :release_year, presence: true
  song.validates :release_year, numericality: {
    less_than_or_equal_to: Date.today.year
  }
end

def released?
  released
end

#   validate :release_year_can_be_in_the_past
#
# def release_year_can_be_in_the_past
#   if release_year > Date.today.year
#     errors.add(:release_year, "can't be in the future")
#   end
# end


end
