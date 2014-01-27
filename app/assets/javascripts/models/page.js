NRC.Models.Page = Backbone.Model.extend({
	initialize: function () {
	},
	urlRoot: '/pages',
	parse: function (data) {
		var layout = data.layout;
		data.layout = new NRC.Models.Layout(layout, {parse: true});
		return data;
	}
})