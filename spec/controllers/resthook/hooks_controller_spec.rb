require 'spec_helper'

module Resthook
  describe HooksController do
    routes { Resthook::Engine.routes }

    # This should return the minimal set of attributes required to create a valid
    # Hook. As you add validations to Hook, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      {
        subscribed_resource: 'FakeResource',
        event: 'update',
        url: 'http://example',
        version: 1
      }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # HooksController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET index' do
      let(:hook) {Hook.new valid_attributes}
      before(:each) do
        hook.save!
      end
      it 'assigns all hooks as @hooks' do
        get :index, {}, valid_session
        expect(assigns(:hooks)).to eq([hook])
      end
    end

    describe 'GET show' do
      it 'assigns the requested hook as @hook' do
        hook = Hook.create! valid_attributes
        get :show, {:id => hook.to_param}, valid_session
        expect(assigns(:hook)).to eq(hook)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested hook as @hook' do
        hook = Hook.create! valid_attributes
        get :edit, {:id => hook.to_param}, valid_session
        expect(assigns(:hook)).to eq(hook)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Hook' do
          expect {
            post :create, {:hook => valid_attributes}, valid_session
          }.to change(Hook, :count).by(1)
        end

        it 'assigns a newly created hook as @hook' do
          post :create, {:hook => valid_attributes}, valid_session
          expect(assigns(:hook)).to be_a(Hook)
          expect(assigns(:hook)).to be_persisted
        end

        it 'redirects to the created hook' do
          post :create, {:hook => valid_attributes}, valid_session
          expect(response).to redirect_to(Hook.last)
        end
      end

      describe 'with invalid params' do
        it 'returns an unprocessable entity error' do
          # Trigger the behavior that occurs when invalid params are submitted
          Hook.any_instance.stub(:save).and_return(false)
          post :create, {:hook => { 'subscribed_resource' => 'invalid value' }}, valid_session
          expect(response.status).to eq 422
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'updates the requested hook' do
          hook = Hook.create! valid_attributes
          # Assuming there are no other hooks in the database, this
          # specifies that the Hook created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Hook.any_instance.should_receive(:update).with({ 'subscribed_resource' => 'MyString' })
          put :update, {id: hook.to_param, hook: { 'subscribed_resource' => 'MyString' }}, valid_session
        end

        it 'assigns the requested hook as @hook' do
          hook = Hook.create! valid_attributes
          put :update, {:id => hook.to_param, :hook => valid_attributes}, valid_session
          expect(assigns(:hook)).to eq(hook)
        end

        it 'redirects to the hook' do
          hook = Hook.create! valid_attributes
          put :update, {:id => hook.to_param, :hook => valid_attributes}, valid_session
          expect(response).to redirect_to(hook)
        end
      end

      describe 'with invalid params' do
        it 'returns an unprocessable entity error' do
          hook = Hook.create! valid_attributes
          
          # Trigger the behavior that occurs when invalid params are submitted
          Hook.any_instance.stub(:save).and_return(false)
          put :update, {:id => hook.to_param, :hook => { 'subscribed_resource' => 'invalid value' }}, valid_session
          expect(response.status).to eq 422
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested hook' do
        hook = Hook.create! valid_attributes
        expect {
          delete :destroy, {:id => hook.to_param}, valid_session
        }.to change(Hook, :count).by(-1)
      end

      it 'redirects to the hooks list' do
        hook = Hook.create! valid_attributes
        delete :destroy, {:id => hook.to_param}, valid_session
        expect(response).to redirect_to(hooks_url)
      end
    end

  end
end
