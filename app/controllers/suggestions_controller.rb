class SuggestionsController < ApplicationController
  def index
    if !current_user.admin?
      raise Pundit::NotAuthorizedError
    else
      @suggestions = policy_scope(Suggestion.all)
    end
  end
  
  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    authorize @suggestion
    if @suggestion.save
      flash[:alert] = "Thank you. Your suggestion has been received!"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content)
  end
end
