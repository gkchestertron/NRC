window.NRC = {
	Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		NRC.pages = new NRC.Collections.Pages();
		NRC.pages.fetch({
      success: function () {
        NRC.router = new NRC.Routers.Router({$rootEl: $("#content")});
        Backbone.history.start();
      }
    });
  }	
};

$(function () {
	window.NRC.initialize();
});


