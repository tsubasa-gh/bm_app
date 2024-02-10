module DailyRecordsHelper
    def i_calorie
        if current_user.sex == 1
            m_calorie = (13.4 * current_user.weight + 4.8 * current_user.height - 5.677 * current_user.age + 88.4) * current_user.activity_level
            if current_user.purpose == -1
                @i_calorie = m_calorie - 500
            elsif current_user.purpose == 0
                @i_calorie = m_calorie
            else
                @i_calorie = m_calorie + 300
            end
        else
            m_calorie = (9.2 * current_user.weight + 3.1 * current_user.height - 4.3 * current_user.age + 447.5) * current_user.activity_level
            if current_user.purpose == -1
                @i_calorie = m_calorie - 500
            elsif current_user.purpose == 0
                @i_calorie = m_calorie
            else
                @i_calorie = m_calorie + 300
            end
        end
    end
end
