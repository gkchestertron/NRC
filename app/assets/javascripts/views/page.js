NRC.Views.Page = Backbone.View.extend({
	events: {
		'input .editable': 'saveContent'
	},
	render: function () {
		var view = this;
		var content = this.template({page: this.model});
		var contents = this.model.get('layout').get('contents')
		this.$el.html(content);
		contents.each(function (element) {
			var $tag = $(view.$el.find(element.get('parent_selector')))
			$tag.text(element.get('text'));
			$tag.data('id', element.id)
		});
		if (NRC.currentUser && NRC.currentUser.get('admin')) {
			_.each($(view.$el.find('.editable')), function (editable) {
				$(editable).attr('contenteditable', 'true');
			});
		}
		return this.$el;
	},
	saveContent: function (event) {
		var view = this;
		var $contentTag = $(event.target);
		var text = $contentTag.text();
		var id = $contentTag.data('id');
		if (id) {
			var content = new NRC.Models.Content({id: id});
			content.fetch({
				success: function () {
					content.set('text', text);
					content.save();
				}
			});
		} else {
			console.log(view.model.get('layout'));
			var content = new NRC.Models.Content({
				layout_id: view.model.get('layout').id, 
				parent_selector: "#" + $contentTag.attr('id'),
				text: text
			});
			content.save();
		}
	},
	template: JST['pages/show']
});