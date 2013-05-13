// Tutorial View
var TutorialView = Backbone.View.extend({
  render: function(){
    var html = '<h1>' + this.model.get(:title) + '</h1>',
                '<p>' + this.model.get(:content) + '</p>';
    $(this.el).html(html)
  }
});

var tutorialView = new TutorialView({ model: tutorial })
tutorialView.render();

//Set the el's html - shortcut
tutorialView.$el.html()

//Setting default element(.el)
var TutorialView = Backbone.View.extend({
  tagName: 'h1',
  id: 'tutorial-view',
  className: 'tutorial',
  render: function(){
    var html = '<h1>' + this.model.get(:title) + '</h1>',
                '<p>' + this.model.get(:content) + '</p>';
    this.$el.html(html)
  }
});


//Creating custom events
var TutorialView = Backbone.View.extend({
  events: {
    "click h1": "alertStatus"
    "<event> <selector>": "<function>"
  },

  alertStatus: function(e){
    alert('Hey you clicked me!');
  }
})

//More events
 events: { "click span": "alertTitle" },
  alertTitle: function(){
    alert(this.model.get('title'));
  },

//List of Jquery events you can listen for
//  change,     click,      dblclick,   focus,      focusin
//  focusout,   hover,      keydown,    keypress,   load,
//  mousedown,  mouseenter, mouseleave, mousemove,  mouseout
//  mouseover,  mouseup,    ready,      resize,      scroll,
//  select,     unload

//Templates from Underscore.js
var AppointmentView = Backbone.View.extend({
  template: _.template('<span><%= title %></span>'),

  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
  }
});




// Home page
var HomeView = Backbone.View.extend({});
