class UserMailer < ApplicationMailer
    def confirmation_email
        @user = params[:user]
        #@url  = 'https://guides.rubyonrails.org/'
        mail(to: @user.email, subject: 'Welcome to Task Academy!')
      end
    end
end
