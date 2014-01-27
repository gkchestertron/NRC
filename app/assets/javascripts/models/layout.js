NRC.Models.Layout = Backbone.Model.extend({
	urlRoot: '/layouts',
	parse: function (data) {
		var contents = data.contents;
		data.contents = new NRC.Collections.Contents(contents);
		return data;
	}
});