class Event < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 60}
	validates	:description, length: {minimum: 100 }, allow_blank: true

	validate :start_at_is_present

	validate :end_date_consistency
	#ojo se pone validate sin s cuando queremos hacer la validación custom
	
	scope :start_today, lambda {
			where(["start_at = ?", Date.today])
		}

	scope :name_like, lambda { |name|
			where(["name like ?", "%#{name}%"])
		}

  #scope sería lo mismo que hacer un metodo de clase
  #def self.for_today
  #	where()
  #end

	private

	def end_date_consistency
		if start_at && end_at && (end_at<start_at)
		errors.add(:end_at, "End date need to be after start date")
		end
	end

	def start_at_is_present
		if start_at.blank?
			errors.add(:start_at, "debes introducir la fecha de inicio")
		end
	end
end

