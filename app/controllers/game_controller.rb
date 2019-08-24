class GameController < ApplicationController
    def year
        @calenders = Calender.where(date_dd: 1).order(date_yy: :asc,date_mm: :asc)
    end

    def month
        @calenders = Calender.where(date_yy: params[:date_yy],date_mm: params[:date_mm])
        
        if params[:date_mm].to_i == 1
            pre_yy = params[:date_yy].to_i-1
            pre_mm = 12
        else
            pre_yy = params[:date_yy]
            pre_mm = params[:date_mm].to_i-1
        end
        
        if params[:date_mm].to_i == 12
            next_yy = params[:date_yy].to_i+1
            next_mm = 1
        else
            next_yy = params[:date_yy]
            next_mm = params[:date_mm].to_i+1
        end

        @k_pre_calenders = Calender.where(date_yy: pre_yy,date_mm: pre_mm).reverse
        if @k_pre_calenders.first.day_of_the_weekend == 6
            @t_pre_calender =@k_pre_calenders.first
        else
        @pre_calenders = []
        @k_pre_calenders.each do |k_pre_calender|
            @pre_calenders.push(k_pre_calender)
            if k_pre_calender.day_of_the_weekend == 0
                break
            end
        end
        end
        
        @k_next_calenders = Calender.where(date_yy: next_yy,date_mm: next_mm)
        if @k_next_calenders.first.day_of_the_weekend == 0
            @t_next_calender =@k_next_calenders.first
        else
        @next_calenders = []
        @k_next_calenders.each do |k_next_calender|
            @next_calenders.push(k_next_calender)
            if k_next_calender.day_of_the_weekend == 6
                break
            end
        end
        end
        
        @games = Game.where(member_id: current_member.id,date_yy:params[:date_yy],date_mm:params[:date_mm])
      
  end

    def create
        @game = Game.new(
            content: params[:content],
            date_yy: params[:date_yy],
            date_mm: params[:date_mm],
            date_dd: params[:date_dd],
            program: params[:program],
            target: params[:target],
            plan_comment: params[:plan_comment],
            result: params[:result],
            evaluation: params[:evaluation],
            after_comment: params[:after_comment]
            )
        @game.member_id = current_member.id
        @game.save
        redirect_to :back
    end
    
    def update 
        @game = Game.find_by(member_id: current_member.id,date_yy: params[:date_yy],date_mm: params[:date_mm],date_dd: params[:date_dd])
        @game.content = params[:content]
        @game.program = params[:program]
        @game.target = params[:target]
        @game.plan_comment = params[:plan_comment]
        @game.result = params[:result]
        @game.evaluation = params[:evaluation]
        @game.after_comment = params[:after_comment]
        @game.save
        redirect_to :back
   end
end
