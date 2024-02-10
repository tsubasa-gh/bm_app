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

    def activity_level
        if current_user.activity_level ==1.2
            @activity_level = "普段運動はせず、デスクワーク"
        elsif current_user.activity_level ==1.375
            @activity_level = "週１〜2回軽い運動をする"
        elsif current_user.activity_level ==1.55
            @activity_level = "週3〜4回軽い運動をする"
        elsif current_user.activity_level ==1.725
            @activity_level = "週5回激しい運動をする"
        else
            @activity_level = "毎日激しい運動をする・肉体労働者"
        end
    end

end
