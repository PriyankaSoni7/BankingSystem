# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController,
               type: :controller do
  context 'GET#index' do
    it 'has show all creditcards successfully' do
      creditcard1 = FactoryBot.create(:creditcard)
      creditcard2 = FactoryBot.create(:creditcard)
      get :index
      expect(assigns(:creditcards)).to include creditcard1
      expect(assigns(:creditcards)).to include creditcard2
      expect(response).to have_http_status(:ok)
    end
  end
  context 'GET#show' do
    it 'has get creditcard successfully' do
      creditcard = FactoryBot.create(:creditcard)
      get :show, params: { id: creditcard.id }
      expect(assigns(:creditcard)).to eq(creditcard)
      expect(response).to have_http_status(:ok)
    end

    it 'has not get invalid creditcard' do
      get :show, params: { id: '12345' }
      expect(response).to have_http_status(:not_found)
    end
  end
  context 'GET#new' do
    it 'has get new creditcard successfully' do
      get :new
      expect(assigns(:creditcard).id).to eq(nil)
      expect(assigns(:creditcard).card_no).to eq(nil)
      expect(assigns(:creditcard).expiry_date).to eq(nil)
      expect(assigns(:creditcard).issue_date).to eq(nil)
      expect(assigns(:creditcard).cash_limit).to eq(nil)
      expect(response).to have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'has get correct creditcard successfully' do
      creditcard = FactoryBot.create(:creditcard)
      get :edit, params: { id: creditcard.id }
      expect(assigns(:creditcard)).to eq(creditcard)
      expect(response).to have_http_status(:ok)
    end

    it 'has not get creditcard with invalid id' do
      get :edit, params: { id: '12345' }
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'POST#create' do
    it 'has create creditcard successfully' do
      creditcard = FactoryBot.build(:creditcard)
      creditcard_params = {
        creditcard: {
          card_no: creditcard.card_no,
          expiry_date: creditcard.expiry_date,
          issue_date: creditcard.issue_date,
          cash_limit: creditcard.cash_limit
        }
      }
      post :create, params: creditcard_params
      expect(assigns(:creditcard).card_no).to eq creditcard.card_no
      expect(assigns(:creditcard).expiry_date).to eq creditcard.expiry_date
      expect(assigns(:creditcard).issue_date).to eq creditcard.issue_date
      expect(assigns(:creditcard).cash_limit).to eq creditcard.cash_limit
      expect(response).to have_http_status(:created)
    end

    it 'has not create creditcard with invalid inputs' do
      creditcard_params = {
        creditcard: {
          card_no: nil,
          expiry_date: nil,
          issue_date: nil,
          cash_limit: nil
        }
      }
      post :create, params: creditcard_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT#update' do
    it 'has update creditcard successfully' do
      user1 = FactoryBot.create(:creditcard)
      user2 = FactoryBot.build(:creditcard)
      put :update,
          params: {
            id: creditcard1.id,
            creditcard: {
              card_no: creditcard2.card_no,
              expiry_date: creditcard2.expiry_date,
              issue_date: creditcard2.issue_date,
              cash_limit: creditcard2.cash_limit,
            }
          }
      expect(assigns(:creditcard).id).to eq creditcard1.id
      expect(assigns(:creditcard).card_no).to eq creditcard2.card_no
      expect(assigns(:creditcard).expiry_date).to eq creditcard2.expiry_date
      expect(assigns(:creditcard).issue_date).to eq creditcard2.issue_date
      expect(assigns(:creditcard).cash_limit).to eq creditcard2.cash_limit
      expect(response).to have_http_status(:ok)
    end

    it 'has not update creditcard with invalid inputs' do
      user1 = FactoryBot.create(:creditcard)
      put :update, params: {
        id: user1.id, creditcard: {
          card_no: nil,
          expiry_date: nil,
          issue_date: nil,
          cash_limit: nil
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'has not update creditcard with invalid creditcard' do
      creditcard = FactoryBot.create(:creditcard)
      put :update, params: { id: '123456', creditcard: {
        card_no: creditcard.card_no,
        expiry_date: creditcard.expiry_date,
        issue_date: creditcard.issue_date,
        cash_limit: creditcard.cash_limit
      } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE#destroy' do
    it 'has destroy creditcard successfully' do
      creditcard = FactoryBot.create(:creditcard)
      delete :destroy, params: { id: creditcard.id }
      expect(assigns(:creditcard)).to eq creditcard
      expect(response).to have_http_status(:ok)
    end

    it 'has not destroy invalid creditcard' do
      delete :destroy, params: { id: '12345' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end