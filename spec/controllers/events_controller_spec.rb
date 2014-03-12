require 'spec_helper'

describe EventsController do

	describe '#index' do

		it 'displays events for today' do
			expect(Event).to receive(:for_today)
			get :index

		end
	end

	describe '#new' do

		it 'create a new empty event' do
			get :new
			expect(assigns(:event)).to be_a_new(Event)
		end
	end

	describe '#create' do

			it 'creates new event' do
				#attrs = { name: 'event33', 
				#	description: 'd'*100, 
				#	start_at: Time.now, 
				#	end_at: 1.day.from_now
				#}

				#attributes_for devuelve un hash con los atributes
			 	attrs = FactoryGirl.attributes_for(:event)
				expect {post :create, event: attrs}.to change(Event, :count)
				expect(response).to redirect_to(assigns(:event))
			end

			it 'renders the form when valid' do
				post :create, event: {}
				expect(response).to render_template(:new)
			end
	end

end
