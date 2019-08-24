class DashboardController < ApplicationController
  def index
      #ここから次戦
      @games = Game.where(member_id:current_member.id)
#      ↓日付降順を後でやる
      @recent_game = []
      @games.each do |game|
          d1 = Date.new(game.date_yy,game.date_mm,game.date_dd)
          t1 = Date.today
          if d1 >= t1
              @recent_game << game.date_yy
              @recent_game << game.date_mm
              @recent_game << game.date_dd
              @recent_game << game.content
              @recent_game << game.program
              break
          end
      end
      
      #ここから練習強度、ジャンル
      d = Date.today
      gon.recent_trainings_stress = []
      recent_trainings_genre = []
      gon.recent_trainings_genre_per = []
      gon.recent_trainings_stress_date = []
      recent_trainings_evaluation = []
      gon.recent_trainings_evaluation_per = []
      31.times do |i|
          t = 31-i
          recent_training = d.ago(t.days).month.to_s + "/" + d.ago(t.days).day.to_s
          gon.recent_trainings_stress_date.push(recent_training)
          
          @recent_training0 = Training.find_by(member_id:current_member.id,date_yy:d.ago(t.days).year ,date_mm:d.ago(t.days).month ,date_dd:d.ago(t.days).day)
          
          if @recent_training0 
              if @recent_training0.stress == "強い"
                  gon.recent_trainings_stress.push(5)
              elsif @recent_training0.stress == "やや強い"
                  gon.recent_trainings_stress.push(4)
              elsif @recent_training0.stress == "普通"
                  gon.recent_trainings_stress.push(3)
              elsif @recent_training0.stress == "やや弱い"
                  gon.recent_trainings_stress.push(2)
              elsif @recent_training0.stress == "弱い"
                  gon.recent_trainings_stress.push(1)
              else @recent_training0.stress == "なし"
                  gon.recent_trainings_stress.push(0)
              end  
          else
              gon.recent_trainings_stress.push(0)
          end
              
          if @recent_training0 
              if @recent_training0.genre == "基礎"
                  recent_trainings_genre.push("基礎")
              elsif @recent_training0.genre == "追込"
                  recent_trainings_genre.push("追込")
              elsif @recent_training0.genre == "実戦"
                  recent_trainings_genre.push("実戦")
              elsif @recent_training0.genre == "調整"
                  recent_trainings_genre.push("調整")
              elsif @recent_training0.genre == "アクティブレスト"
                  recent_trainings_genre.push("アクティブレスト")
              else @recent_training0.genre == "レスト"
                  recent_trainings_genre.push("レスト")
              end  
          else
              recent_trainings_genre.push("その他")
          end

          if @recent_training0 
              if @recent_training0.evaluation == "満足"
                  recent_trainings_evaluation.push("満足")
              elsif @recent_training0.evaluation == "やや満足"
                  recent_trainings_evaluation.push("やや満足")
              elsif @recent_training0.evaluation == "普通"
                  recent_trainings_evaluation.push("普通")
              elsif @recent_training0.evaluation == "やや不満"
                  recent_trainings_evaluation.push("やや不満")
              else @recent_training0.evaluation == "不満"
                  recent_trainings_evaluation.push("不満")
              end  
          else
              recent_trainings_evaluation.push("その他")
          end
      end
      
      a = (recent_trainings_genre.count("基礎")*100/recent_trainings_genre.count)
      b = (recent_trainings_genre.count("追込")*100/recent_trainings_genre.count)
      c = (recent_trainings_genre.count("実戦")*100/recent_trainings_genre.count)
      d = (recent_trainings_genre.count("調整")*100/recent_trainings_genre.count)
      e = (recent_trainings_genre.count("アクティブレスト")*100/recent_trainings_genre.count)
      f = (recent_trainings_genre.count("レスト")*100/recent_trainings_genre.count)
      g = (recent_trainings_genre.count("その他")*100/recent_trainings_genre.count)

      aa = (recent_trainings_evaluation.count("満足")*100/recent_trainings_evaluation.count)
      bb = (recent_trainings_evaluation.count("やや満足")*100/recent_trainings_evaluation.count)
      cc = (recent_trainings_evaluation.count("普通")*100/recent_trainings_evaluation.count)
      dd = (recent_trainings_evaluation.count("やや不満")*100/recent_trainings_evaluation.count)
      ee = (recent_trainings_evaluation.count("不満")*100/recent_trainings_evaluation.count)
      ff = (recent_trainings_evaluation.count("その他")*100/recent_trainings_evaluation.count)
      
      gon.recent_trainings_genre_per.push(a)
      gon.recent_trainings_genre_per.push(b)
      gon.recent_trainings_genre_per.push(c)
      gon.recent_trainings_genre_per.push(d)
      gon.recent_trainings_genre_per.push(e)
      gon.recent_trainings_genre_per.push(f)
      gon.recent_trainings_genre_per.push(g)

      gon.recent_trainings_evaluation_per.push(aa)
      gon.recent_trainings_evaluation_per.push(bb)
      gon.recent_trainings_evaluation_per.push(cc)
      gon.recent_trainings_evaluation_per.push(dd)
      gon.recent_trainings_evaluation_per.push(ee)
      gon.recent_trainings_evaluation_per.push(ff)
      
      #ここから練習日数
      gon.recent_trainings_time = []
      gon.recent_games_time = []
      gon.recent_trainings_time_date = []
      gon.recent_games_time_date = []
      recent_games_evaluation = []
      gon.recent_games_evaluation_per = []

      13.times do |i|
          d = Date.today
          t = 12-i
          recent_training = d.ago(t.months).year.to_s + "/" + d.ago(t.months).month.to_s
          recent_game = d.ago(t.months).year.to_s + "/" + d.ago(t.months).month.to_s
          gon.recent_trainings_time_date.push(recent_training)
          gon.recent_games_time_date.push(recent_game)

          @recent_training0 = Training.where(member_id:current_member.id,date_yy:d.ago(t.months).year ,date_mm:d.ago(t.months).month)
          @recent_game0 = Game.where(member_id:current_member.id,date_yy:d.ago(t.months).year ,date_mm:d.ago(t.months).month)
          
          h = @recent_training0.pluck(:evaluation)
          j = @recent_game0.pluck(:evaluation)
          k = h.count{ |num| !num.blank? }
          l = j.count{ |num| !num.blank? }

          gon.recent_trainings_time.push(k)
          gon.recent_games_time.push(l)

          j.each do |m|
              if m == "満足"
                  recent_games_evaluation.push("満足")
              elsif m == "やや満足"
                  recent_games_evaluation.push("やや満足")
              elsif m == "普通"
                  recent_games_evaluation.push("普通")
              elsif m == "やや不満"
                  recent_games_evaluation.push("やや不満")
              elsif m == "不満"
                  recent_games_evaluation.push("不満")
              else  
              recent_games_evaluation.push("その他")
              end
          end
          
      end
      
          aaa = (recent_games_evaluation.count("満足")*100/recent_games_evaluation.count)
          bbb = (recent_games_evaluation.count("やや満足")*100/recent_games_evaluation.count)
          ccc = (recent_games_evaluation.count("普通")*100/recent_games_evaluation.count)
          ddd = (recent_games_evaluation.count("やや不満")*100/recent_games_evaluation.count)
          eee = (recent_games_evaluation.count("不満")*100/recent_games_evaluation.count)
          fff = (recent_games_evaluation.count("その他")*100/recent_games_evaluation.count)

          gon.recent_games_evaluation_per.push(aaa)
          gon.recent_games_evaluation_per.push(bbb)
          gon.recent_games_evaluation_per.push(ccc)
          gon.recent_games_evaluation_per.push(ddd)
          gon.recent_games_evaluation_per.push(eee)
          gon.recent_games_evaluation_per.push(fff)          

  end
end
