module StaticPagesHelper
    def weight
        if @daily_weight
            return "#{@daily_weight.daily_weight}kg"
        else
            return '体重が記録されていません'
        end
    end

    def record
        if @daily_record
            return "#{@daily_record.total_calorie}kcal"
        else
            return 'カロリーが記録されていません'
        end
    end
end
