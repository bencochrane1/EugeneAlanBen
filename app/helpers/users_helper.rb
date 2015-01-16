module UsersHelper
    def user_status(user)
        if current_account.owner
            content_tag(:span, '', class: 'glphyicon glphyicon-ok color-success')
            'Admin'
        else 
            content_tag(:span, '', class: 'glphyicon glphyicon-ok color-success')
            'Student'
          end
    end
end
