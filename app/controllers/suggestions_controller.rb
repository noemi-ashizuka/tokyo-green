class SuggestionsController < ApplicationController
  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    authorize @suggestion
    if @suggestion.save
      redirect_to 'users/show'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content)
  end
end
