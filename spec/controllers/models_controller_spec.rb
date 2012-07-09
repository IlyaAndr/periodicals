require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ModelsController do

  # This should return the minimal set of attributes required to create a valid
  # Model. As you add validations to Model, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ModelsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all models as @models" do
      model = Model.create! valid_attributes
      get :index, {}, valid_session
      assigns(:models).should eq([model])
    end
  end

  describe "GET show" do
    it "assigns the requested model as @model" do
      model = Model.create! valid_attributes
      get :show, {:id => model.to_param}, valid_session
      assigns(:model).should eq(model)
    end
  end

  describe "GET new" do
    it "assigns a new model as @model" do
      get :new, {}, valid_session
      assigns(:model).should be_a_new(Model)
    end
  end

  describe "GET edit" do
    it "assigns the requested model as @model" do
      model = Model.create! valid_attributes
      get :edit, {:id => model.to_param}, valid_session
      assigns(:model).should eq(model)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Model" do
        expect {
          post :create, {:model => valid_attributes}, valid_session
        }.to change(Model, :count).by(1)
      end

      it "assigns a newly created model as @model" do
        post :create, {:model => valid_attributes}, valid_session
        assigns(:model).should be_a(Model)
        assigns(:model).should be_persisted
      end

      it "redirects to the created model" do
        post :create, {:model => valid_attributes}, valid_session
        response.should redirect_to(Model.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved model as @model" do
        # Trigger the behavior that occurs when invalid params are submitted
        Model.any_instance.stub(:save).and_return(false)
        post :create, {:model => {}}, valid_session
        assigns(:model).should be_a_new(Model)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Model.any_instance.stub(:save).and_return(false)
        post :create, {:model => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested model" do
        model = Model.create! valid_attributes
        # Assuming there are no other models in the database, this
        # specifies that the Model created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Model.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => model.to_param, :model => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested model as @model" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => valid_attributes}, valid_session
        assigns(:model).should eq(model)
      end

      it "redirects to the model" do
        model = Model.create! valid_attributes
        put :update, {:id => model.to_param, :model => valid_attributes}, valid_session
        response.should redirect_to(model)
      end
    end

    describe "with invalid params" do
      it "assigns the model as @model" do
        model = Model.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Model.any_instance.stub(:save).and_return(false)
        put :update, {:id => model.to_param, :model => {}}, valid_session
        assigns(:model).should eq(model)
      end

      it "re-renders the 'edit' template" do
        model = Model.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Model.any_instance.stub(:save).and_return(false)
        put :update, {:id => model.to_param, :model => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested model" do
      model = Model.create! valid_attributes
      expect {
        delete :destroy, {:id => model.to_param}, valid_session
      }.to change(Model, :count).by(-1)
    end

    it "redirects to the models list" do
      model = Model.create! valid_attributes
      delete :destroy, {:id => model.to_param}, valid_session
      response.should redirect_to(models_url)
    end
  end

end
