class Fortune < ActiveRecord::Base
def self.search(search, page)
  paginate :per_page => 10, :page => page,
           :conditions => ['wykonawca like ?', "%#{search}%"], :order => 'wykonawca',
	   :conditions => ['tytul like ?', "%#{search}%"], :order => 'tytul'
end
  validates :wykonawca, length: { in: 2..30 }, allow_blank: true
  validates :tytul, length: { in: 2..40 }, allow_blank: true
  validates :album, length: { maximum: 35 }
  validates :tekst, length: { maximum: 5000 }
end
