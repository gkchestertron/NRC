NRC.Views.Home = Backbone.View.extend({
	render: function () {
		var content = this.template({pages: NRC.pages})
		this.$el.html(content);
		return this.$el
	},
	template: JST['pages/home']
});