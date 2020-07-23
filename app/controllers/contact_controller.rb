# frozen_string_literal: true

class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
  end

  private

  def contact_params
    params.require(:contact)
      .permit()
  end
end