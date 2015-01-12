module UsersHelper
    def user_status(user)
        if current_account.owner == user
            content_tag(:span, '', class: 'glphyicon glphyicon-ok color-success')
        else
            'Invitation Pending'
        end
    end
end
