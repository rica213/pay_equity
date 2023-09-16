require "rails_helper"

RSpec.describe SalariesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:salary) { FactoryBot.create(:salary, user: user) }
  let(:valid_attributes) { { salary: 60000, benefits: 12000 } }
  let(:invalid_attributes) { { salary: nil, benefits: nil } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new salary" do
        expect {
          post :create, params: { salary: valid_attributes }, format: :json
        }.to change(Salary, :count).by(1)
      end

      it "renders a JSON response  with the new salary" do
        post :create, params: { salary: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include("application/json")
      end
    end
    context "with invalid params" do
      it "renders a JSON response with errors  for the new salary" do
        post :create, params: { salary: { salary: nil, benefits: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid params" do
      it "updates the requested salary" do
        salary = FactoryBot.create(:salary, user: user)
        new_salary = 60000
        put :update, params: { id: salary.id, salary: { salary: new_salary } }
        salary.reload
        expect(salary.salary).to eq((new_salary))
      end

      it "renders a JSON response  with the updated salary" do
        salary = FactoryBot.create(:salary, user: user)
        new_salary = 60000

        put :update, params: { id: salary.id, salary: { salary: new_salary } }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include("application/json")
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the salary" do
        salary = FactoryBot.create(:salary, user: user)
        put :update, params: { id: salary.id, salary: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested salary" do
      salary = FactoryBot.create(:salary, user: user)
      expect do
        delete :destroy, params: { id: salary.id }
      end.to change(Salary, :count).by(-1)
    end
    it "returns a success response" do
      salary = FactoryBot.create(:salary, user: user)
      delete :destroy, params: { id: salary.id }
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "GET #search" do
    context "when there are matching salary records" do
      it "returns a success response with matching salaries" do
        user1 = FactoryBot.create(:user, location: "New York", job_title: "Engineer", industry: "Tech")
        salary1 = FactoryBot.create(:salary, user: user1)
        user2 = FactoryBot.create(:user, location: "San Francisco", job_title: "Designer", industry: "Design")
        salary2 = FactoryBot.create(:salary, user: user2)

        get :search, params: { location: "New York" }

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include("application/json")

        response_body = JSON.parse(response.body)
        expect(response_body).to be_an(Array)
        expect(response_body[0]["salary"]).to eq(salary1.salary)
      end
    end

    context "when there are no matching salary records" do
      it "returns a not found response" do
        get :search, params: { location: "Mars" }

        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to include("application/json")

        response_body = JSON.parse(response.body)
        expect(response_body).to eq({ "errors" => ["No matching salary data found"] })
      end
    end
  end
end
