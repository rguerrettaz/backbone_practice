// User Model
var User = Backbone.Model.extend({ urlRoot: '/users' });
var user = new User ({ username: "username", password: "pw", email: "email@email.com", id: 1 })

// Vote model
var Vote = Backbone.Model.extend({});
var vote = new Vote ({ vote_type: , tutorial_id: , voter_id: })

// Tutorial Model
var Tutorial = Backbone.Model.extend({ });
var tutorial = new Tutorial ({ title: "My Title here", content: "Content Here", id: 1 });

// Get and Set attributes in model
tutorial.get( 'title' );
tutorial.set({ title: "New Title" });

// Save attributes
tutorial.save();

// Fetching objects
var tutorial = new Tutorial({ id: 1 })
// this will go to server and grab all data for tutorial where id =1
tutorial.fetch()

//Update objects after a fetch
tutorial.set({ title: "New Title 2" })
tutorial.save

//Give a model default values
var User = Backbone.Model.extend({
  defaults: {
    username: "AnonymousUser"
  }
})

//Event listeners
tutorial.on('change', function(){
  tutorial.set({ title: "Some variable"})
})

// OR
tutorial.on('change:title', runFunction);

var runFunction = {
  tutorial.set({ title: "Some variable"})
}
