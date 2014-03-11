require 'spec_helper'

describe Event do

	describe 'name' do
		it 'should not be blank' do
			event = Event.new name: nil
			expect(event).to have(1).error_on(:name)
		end

		it 'should not have error when present' do
			event = Event.new name: 'hi'
			expect(event).not_to have(1).error_on(:name)
		end

		it 'should not be longer than 60 charecters' do
			event = Event.new name: 'a'*61
			expect(event).to have(1).error_on(:name)
		end

	end


	describe 'description' do

		#it 'its valid when blank' do
		#	event = Event.new description: ''
		#	expect(event).not_to have(0).error_on(:description)
		#end

		it 'is not valid when it has less than 100 characters' do
			event = Event.new description: 'a'*99
			expect(event).to have(1).error_on(:description)
		end

		it 'is  valid when it has more than 100 characters' do
			event = Event.new description: 'a'*100
			expect(event).to have(0).error_on(:description)
		end
		
		describe 'start_at' do
			it 'is invalid when blank' do
				event = Event.new start_at: nil
				expect(event).to have(1).error_on(:start_at)
			end

		end


		it 'end date cant be < start date' do
			event = Event.new end_at: 1.hour.ago, start_at: Time.now
			expect(event).to have(0).error_on(:description)
		end


		it 'is valid when it has 100 characters or more' do
			event = Event.new description: "a"*100
			expect(event).to have(0).error_on(:description)
		end

	end

	describe 'for today' do
		#queremo meter un evento pero no definirlo para que pase todas las validaciones
		#para eso aprovechamos los 'factoy'
		it 'returs an event that starts today' do #solo comprobamos un solo evento
			event = FactoryGirl.create(:event, start_at: Date.today)
			expect(Event.start_today).to eq([event])
			#expect(Event.for_today).to include(event)

			#aunque el factoy defina una cosa aqui puedes sobreescribirlo con los datos que necesites para tu test
		end
		it 'does not return an event that starts tomorrow' do
			event = FactoryGirl.create(:event, start_at: Date.today + 1.days)
			expect(Event.start_today).to eq([])
		end

		it 'does not return an event that has started' do
		event = FactoryGirl.create(:event, start_at: Date.today - 1.days)
			expect(Event.start_today).to eq([])
		end
	end
end

  

