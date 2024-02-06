module UsersHelper
    def sex
        if current_user.sex == 1
            @sex = "男性"
        else
            @sex = "女性"
        end
    end

    def purpose
        if current_user.purpose == -1
            @purpose = "減量"
        elsif current_user.purpose == 0
            @purpose = "現状維持"
        else
            @purpose = "増量"
        end
    end

end
