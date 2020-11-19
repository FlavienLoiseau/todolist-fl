class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.first
  end

  def create
    @email = Email.new(object: Faker::Lorem.sentence(word_count: 4), body: Faker::Lorem.paragraph(sentence_count: 4))
    
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  private

  def email_params
    params.permit(:objet, :body)
    
  end
end
