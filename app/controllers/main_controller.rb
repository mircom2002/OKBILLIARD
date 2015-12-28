require 'json'

class MainController < ApplicationController
  def cover


  end

  def login
    email = params[:email]
    # password=params[:pw]


    # # respond_to do |format|
    render :text => "1"
    #     format.html {redirect_to :main => 'cover'}
    #     format.json { render json: 1}
    # end
  end

  def rank

    @a=Array.new
    Okdb.all.each do |t|
        @a << {:id=>t.id, :win => Scoreboard.where("winid =?", t.id).count, :lose => Scoreboard.where("loseid =? ", t.id).count, :avg => t.average}
    end

  end

  def score
  end

  def setup
  end

  def join
  #     t.string :name
  #     t.string :phoneNum
  #     t.integer :point  #다마수
  #     t.string :image
  #     t.float :average  #총점수
  #     t.integer :allscore   #총다마수
  #     t.integer :count  #총경기횟수


    o=Okdb.new

    o.name = params[:name]
    o.phoneNum = params[:phone]
    o.point = params[:point]
    o.average=0.00
    o.allscore=0
    o.allinning=0
    o.count=0
    o.save

    render :text => "1"
#    redirect_to :action => 'setup'
  end

  def getinfo
    i=params[:id]
    @d=Okdb.where("id = ?", i)

    @w=Scoreboard.where("winid = ?", i).count
    @l=Scoreboard.where("loseid = ?", i).count

    response = {:inf => @d, :wc => @w, :lc => @l}

    respond_to do |format|
        format.html {redirect_to :action => 'score'}
        format.json { render json: response}
    end
  end

  def updateinfo
    u=Scoreboard.new

    w_id=params[:id].to_i
    o=Okdb.find(w_id)

    w_score=params[:score].to_i

    inning=params[:inning].to_i

    l_id=params[:lid].to_i
    l_score=params[:lscore].to_i

    u.winid=w_id
    u.loseid=l_id
    u.gameround=inning
    u.winpoint=w_score
    u.losepoint=l_score
    u.gametime=Time.now

    u.save

    o.allscore=o.allscore+w_score
    o.count=o.count+1
    o.allinning=o.allinning+inning
    o.average=(o.allscore.to_f/o.allinning.to_f).round(2)
    o.save

    l=Okdb.find(l_id)

    l.allscore=l.allscore+l_score
    l.count=l.count+1
    l.allinning=l.allinning+inning
    l.average=(l.allscore.to_f/l.allinning.to_f).round(2)
    l.save


    render :text => "1"
      # t.integer :winid
      # t.integer :loseid
      # t.integer :gameround
      # t.integer :winpoint
      # t.integer :losepoint
      # t.datetime :gametime

      # t.integer :point  #다마수
      # t.string :image
      # t.float :average  #총점수
      # t.integer :allscore   #총다마수
      # t.integer :allinning  #총이닝수
      # t.integer :count  #총경기횟수

  end

  def dashboard
  end

  def odelete
    id=params[:idn]
    Okdb.where("id = ?", id).take.destroy
    redirect_to :action => 'setup'
  end

end
