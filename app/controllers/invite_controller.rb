require 'transactional_mailer'

class InviteController < ApplicationController

  def create
  	tm = TransactionalMailer.new
  	tm.send_mail(params[:email], 1)
  	redirect_to "/"
  end

end