json.array! @events do |event|
	#json.name event.name
	#json.description event.description
	#json.start_at event.start_at
	#json.end_at event.end_at
	json.(event, :name, :description)
	json.start_at event.start_at.to_i
	json.end_at event.end_at.to_i
	json.user  do
		json.email event.user.email
	end



end

