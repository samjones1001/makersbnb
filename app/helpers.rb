module Helpers


    def current_user
      @current_user ||= User.get(session[:user_id])
    end

      def format_date(date)
      DateTime.parse(date).strftime('%d-%m-%Y')
    end
  

end
