var Vote = {
  init: function() {
    $('a.vote').on('ajax:success', this.updateVoteCount);
  },

  updateVoteCount: function(event, data) {
    var $vote_count = data.vote_count
    $(".total-votes").text("" + $vote_count + " " + pluralize($vote_count, "vote"));  
  },
}

pluralize = function(value, word) {
  return value == 1 ? word : word + "s";
}

$(document).ready(function(){
  Vote.init();
});