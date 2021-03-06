# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController,
               type: :controller do
  context 'GET#index' do
    it 'has show all accounts successfully' do
      account1 = FactoryBot.create(:account)
      account2 = FactoryBot.create(:account)
      get :index
      expect(assigns(:accounts)).to include account1
      expect(assigns(:accounts)).to include account2
      expect(response).to have_http_status(:ok)
    end
  end
  context 'GET#show' do
    it 'has get account successfully' do
      account = FactoryBot.create(:account)
      get :show, params: { id: account.id }
      expect(assigns(:account)).to eq(account)
      expect(response).to have_http_status(:ok)
    end

    it 'has not get invalid account' do
      get :show, params: { id: '12345' }
      expect(response).to have_http_status(:not_found)
    end
  end
  context 'GET#new' do
    it 'has get new account successfully' do
      get :new
      expect(assigns(:account).id).to eq(nil)
      expect(assigns(:account).acc_no).to eq(nil)
      expect(assigns(:account).acc_type).to eq(nil)
      expect(assigns(:account).balance).to eq(nil)
      expect(response).to have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'has get correct account successfully' do
      account = FactoryBot.create(:account)
      get :edit, params: { id: account.id }
      expect(assigns(:account)).to eq(account)
      expect(response).to have_http_status(:ok)
    end

    it 'has not get account with invalid id' do
      get :edit, params: { id: '12345' }
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'POST#create' do
    it 'has create account successfully' do
      account = FactoryBot.build(:account)
      account_params = {
        account: {
          account_no: account.acc_no,
          type: account.acc_type,
          balance: account.balance,
          user_id: account.user_id
        }
      }
      post :create, params: account_params
      expect(assigns(:account).acc_no).to eq account.acc_no
      expect(assigns(:account).acc_type).to eq account.acc_type
      expect(assigns(:account).balance).to eq account.balance
      expect(assigns(:account).user_id).to eq account.user_id
      expect(response).to have_http_status(:created)
    end

    it 'has not create account with invalid inputs' do
      account_params = {
        account: {
          acc_no: nil, acc_type: nil, balance: nil, user_id: nil
        }
      }
      post :create, params: account_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT#update' do
    it 'has update account successfully' do
      @b = FactoryBot.create(:branch, code: 'etugght34')
      @u = FactoryBot.create(:user, branch_id: @b.id)
      account1 = FactoryBot.create(:account)
      account2 = FactoryBot.build(:account)
      put :update,
          params: {
            id: account1.id,
            account: {
              account_no: account2.acc_no,
              type: account2.acc_type,
              balance: account2.balance,
              user_id: account2.user_id
            }
          }
      expect(assigns(:account).id).to eq account1.id
      expect(assigns(:account).acc_no).to eq account2.acc_no
      expect(assigns(:account).acc_type).to eq account2.acc_type
      expect(assigns(:account).balance).to eq account2.balance
      expect(assigns(:account).user_id).to eq account2.user_id
      expect(response).to have_http_status(:ok)
    end

    it 'has not update account with invalid inputs' do
      account1 = FactoryBot.create(:account)
      put :update, params: {
        id: account1.id, account: {
          acc_no: nil, acc_type: nil, balance: nil
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'has not update account with invalid account' do
      account = FactoryBot.create(:account)
      put :update, params: { id: '123456', account: {
        acc_no: account.acc_no,
        acc_type: account.acc_type,
        balance: account.balance
      } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE#destroy' do
    it 'has destroy account successfully' do
      account = FactoryBot.create(:account)
      delete :destroy, params: { id: account.id }
      expect(assigns(:account)).to eq account
      expect(response).to have_http_status(:ok)
    end

    it 'has not destroy invalid account' do
      delete :destroy, params: { id: '12345' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end