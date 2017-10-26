require 'rails_helper'

RSpec.describe RentsController, type: :controller do
  let(:rent) { create :rent_book1_user1 }
  let(:user) { rent.user }

  context 'when user is logged in' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      before do
        get :index
      end
      it { is_expected.to render_template :index }
      it { is_expected.to render_template :application }
      it { is_expected.to respond_with :success }
      it 'assigns an array of rents' do
        assigns(:rents).should eq([rent])
      end
    end

    describe 'POST #create' do
      let(:book) { create :other_book }

      context 'with valid attributes' do
        it 'creates a new rent' do
          expect do
            post :create, params: { rent: { book_id: book.id,
                                            return_date: '2017-10-25',
                                            return?: false } }
          end.to change(Rent, :count).by(1)
        end
      end
      context 'with valid attributes and returned book' do
        it 'creates a new rent' do
          expect do
            post :create, params: { rent: { book_id: book.id,
                                            return_date: '2017-10-25',
                                            return?: true } }
          end.to change(Rent, :count).by(1)
        end
      end
      context 'with invalid attributes' do
        let(:other_user) { create(:other_user) }
        let(:other_book) { create(:other_book) }
        let(:deleted_book) { create(:deleted_book) }

        it 'does not save the new rent without book' do
          expect do
            post :create, params: { rent: { book_id: nil,
                                            return_date: '2017-10-25',
                                            return?: false } }
          end.not_to change(Rent, :count)
        end
        it 'does not save the new rent with rented book' do
          expect do
            post :create, params: { rent: { book_id: rent.book.id,
                                            return_date: '2017-10-25',
                                            return?: false } }
          end.not_to change(Rent, :count)
        end
        it 'does not save the new rent with deleted book' do
          expect do
            post :create, params: { rent: deleted_book.attributes }
          end.not_to change(Rent, :count)
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        @rent = rent
      end
      it 'deleted the rent' do
        expect do
          rent.delete
        end.to change(Rent, :count).by(-1)
      end
    end
  end
end
