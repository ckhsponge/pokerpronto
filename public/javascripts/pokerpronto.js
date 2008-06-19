var PokerPronto = {
    change:function() {
        //$("hihi").innerHTML="hihi";
        $("hand_form").onsubmit();
    },
    clear:function() {
        $("hand_hole_string").value="";
        $("hand_widow_string").value="";
        $("hand_hole_string").focus();
    },
    bodyKey:function(e) {
        if(e && e.keyCode==27) {
            PokerPronto.clear();
        }
    },
    cycleAdvertisement:function() {
        new Ajax.Updater('advertisement', '/advertisement/random', {asynchronous:true, evalScripts:true});
    },
    nextCycle:function() {
        PokerPronto.cycleAdvertisement();
        setTimeout("PokerPronto.nextCycle()",30000);
    },
    initAdvertisements:function() {
        setTimeout("PokerPronto.nextCycle()",30000);
    },
    initKeyStrokes:function() {
        $("hand_hole_string").onchange=PokerPronto.change;
        $("hand_hole_string").onkeyup=PokerPronto.change;
        $("hand_widow_string").onchange=PokerPronto.change;
        $("hand_widow_string").onkeyup=PokerPronto.change;
        $("hand_bet").onchange=PokerPronto.change;
        $("hand_bet").onkeyup=PokerPronto.change;
        $("hand_pot").onchange=PokerPronto.change;
        $("hand_pot").onkeyup=PokerPronto.change;
        $("hand_opponent_count").onchange=PokerPronto.change;
        $("hand_opponent_count").onkeyup=PokerPronto.change;
        document.onkeydown = PokerPronto.bodyKey;
    },
    //not used
    initFocus:function() {
        var holeField = $("hand_hole_string");
        if(holeField && holeField.disabled==false && holeField.style.visibility!='hidden' && holeField.style.display!='none') {
            holeField.focus();
        }
    }
}