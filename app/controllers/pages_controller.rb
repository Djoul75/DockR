class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @invoices = policy_scope(Invoice).order(created_at: :desc)
  end
end
