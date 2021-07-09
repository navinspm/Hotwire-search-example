class Users::SearchesController < ApplicationController
  def index
    respond_to do |format|
      format.turbo_stream do
        @users = if params[:search_term].present?
          # Since we're using this in two controllers now it might be
          # wise to abstract it out into a Model method
          User.where("name LIKE :name", name: "%#{params[:search_term]}%")
        else
          User.all
        end

        render turbo_stream: turbo_stream.replace(
          :userListing,
          partial: "users/listing"
        )
      end
    end
  end
end
