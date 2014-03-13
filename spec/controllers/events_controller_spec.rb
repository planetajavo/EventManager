require 'spec_helper'

describe EventsController do

	describe '#index' do

		it 'displays events for today' do
			expect(Event).to receive(:start_today)
			get :index

		end
	end

	describe '#new' do

		before do
				@user = FactoryGirl.create(:user)
				sign_in @user
			end

		it 'create a new empty event' do
			
			get :new
			expect(assigns(:event)).to be_a_new(Event)
		end
	end

	describe '#create' do

			before do
				@user = FactoryGirl.create(:user)
				sign_in @user
			end

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

			it 'renders the form when invalid' do
				post :create, event: {description: 'evento44'}
				expect(response).to render_template(:new)
			end
	end

end
