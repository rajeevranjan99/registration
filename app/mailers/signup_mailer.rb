class SignupMailer < ApplicationMailer
    #default from: 'raj16170158@gmail.com'
    # default to: -> {['rajeev.rnjan125@gmail.com','pradumgupta6999@gmail.com'] },
    #     from: "raj16170158@gmail.com"
    # default from: email_address_with_name('raj16170158@gmail.com', 'Example Company Notifications')
          #from: "raj16170158@gmail.com"
    def welcome_email(signup)
      @signup = signup
      @url  = 'http://example.com/login'
      attachments['image.jpg'] = File.read('app/assets/images/image.jpg')
      mail(to:email_address_with_name("rajeev.rnjan125@gmail.com", "RRRRR"),subject: 'Welcome to My Awesome Site')
    end
end
