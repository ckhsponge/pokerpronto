class HandController < ApplicationController
  def stat
    calculate
  end
  
  def stat_result
    calculate 
    @stat ||= nil
    render_text @stat ? @stat.to_s : ""
  end
  
  def pokerpronto
    hit
    calculate(:new=>true)
    @panel_height = 500
    render :action=>:calc
  end
  
  def calc_result
    calculate 
    render :action=>:calc_result, :layout => false
  end
  
  def instructions
  end
  def about
  end
  def holes
  end
  def links
    @links = Link.find(:all)
  end
  def widgets
  end
  def store
  end
  
  private
  def calculate(args={})
    hand_params = params[:hand] || Hash.new
    @hand = Hand.new()
    @hand.hole_string=hand_params[:hole_string]
    @hand.widow_string=hand_params[:widow_string]
    @hand.opponent_count=hand_params[:opponent_count] || 1
    @hand.bet=hand_params[:bet] || 1
    @hand.pot=hand_params[:pot] || 100
    
    @hand.randomize_cards if args[:new]
    
    @stat = @hand.stat if @hand
    #@stat.opponent_count=1
  end
end
