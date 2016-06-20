require 'rails_helper'

RSpec.describe FunctionsController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns a function object" do
      get :new
      expect(assigns(:function)).to be_a_new(Function)
    end
  end
  describe "#create" do

    it "saves a record to the database" do
      count_before=Function.count
      post :create, function: {name: "x**2"}
      count_after=Function.count
      expect(count_after).to eq(count_before +1)
    end
    it "redirects to index page" do
      post :create, function: {name: "x**2"}
      expect(response).to redirect_to(function_path(Function.last))
    end
    it "sets a flash message" do
      post :create, function: {name: "x**2"}
      expect(flash[:notice]).to be
    end
  end
  describe "#show" do

    before do
      #@c=FactoryGirl.create(:campaign)
      @f=Function.create(name: "x**2")
      get :show, id: @f.id
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "sets a instance variable" do
      expect(assigns(:model_function)).to eq(@f)
    end
  end
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
    it "assigns an instance variable to all functions in the database" do
      c=Function.create(name: "(x)**2")
      c1=Function.create(name: "(x)**3 +1")
      get :index
      expect(assigns(:functions)).to eq([c,c1])
    end
  end
end
