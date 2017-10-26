require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { create :book }
  let(:user) { create :user1 }

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
      it 'assigns an array of books' do
        assigns(:books).should eq([book])
      end
    end

    describe 'GET #show' do
      before do
        get :show, params: { id: book }
      end
      it { is_expected.to render_template :show }
      it { is_expected.to render_template :application }
      it { is_expected.to respond_with :success }
      it 'assigns the requested book to @book' do
        assigns(:book).should eq(book)
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it { is_expected.to render_template :new }
      it { is_expected.to render_template :application }
      it { is_expected.to respond_with :success }
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates a new book' do
          expect do
            post :create, params: { book: build(:book).attributes }
          end.to change(Book, :count).by(1)
        end
      end
      context 'with invalid attributes' do
        it 'does not save the new book' do
          expect do
            post :create, params: { book: build(:invalid_book).attributes }
          end.not_to change(Book, :count)
        end
      end
    end

    describe 'GET #edit' do
      before do
        get :edit, params: { id: book }
      end
      it { is_expected.to render_template :edit }
      it { is_expected.to render_template :application }
      it { is_expected.to respond_with :success }
      it 'assigns the requested book to @book' do
        assigns(:book).should eq(book)
      end
    end

    describe 'PUT #update' do
      let(:other_book) { build(:other_book) }

      before do
        put :update, params: { id: book, book: other_book.attributes }
      end
      context 'valid attributes' do
        it 'located the requested @book' do
          assigns(:book).should eq(book)
        end
        it 'changes @book attributes' do
          book.reload
          expect(book.name).to eq(other_book.name)
          expect(book.author).to eq(other_book.author)
          expect(book.category).to eq(other_book.category)
          expect(book.description).to eq(other_book.description)
        end
        it { is_expected.to redirect_to book }
      end
      context 'invalid attributes' do
        let(:book_before_try_update) { book }

        before do
          put :update, params: { id: book, book: build(:invalid_book).attributes }
        end
        it 'does not change @book attributes' do
          book.reload
          expect(book.attributes).to eq(book_before_try_update.attributes)
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        @book = book
      end
      it 'deleted the book' do
        expect do
          book.delete
        end.to change(Book, :count).by(-1)
      end
    end
  end
end
