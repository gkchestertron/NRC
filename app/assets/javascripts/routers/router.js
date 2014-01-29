NRC.Routers.Router = Backbone.Router.extend({
	initialize: function (options) {
		this.$rootEl = options.$rootEl;
	},
	routes: { 
		'': 'pages',
		'pages/:id': 'pages'
	},
	// home: function () {
	// 	var view = new NRC.Views.Home();
	// 	this._swapView(view);
	// },
	pages: function (id) {
		if (!id) {
			id = 1;
		}
		var page = NRC.pages.get(id);
		var view = new NRC.Views.Page({ model: page });
		this._swapView(view);
	},
	_swapView: function (view) {
		this._currentView && this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render());
		if (NRC.currentUser && NRC.currentUser.get('admin')) {
			_.each($(view.$el.find('.editable')), function (editable) {
				$(editable).attr('contenteditable', 'true');
			});
		}
	}
});