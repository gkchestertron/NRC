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
			if (NRC.currentUser && NRC.currentUser.get('admin')) {
				$tag.attr('contenteditable', 'true');
			}
			$tag.data('id', element.id)
		});
		return this.$el;
	},
	saveContent: function (event) {
		var $contentTag = $(event.target);
		var text = $contentTag.text();
		var id = $contentTag.data('id');
		console.log(id);
		var content = new NRC.Models.Content({id: id});
		content.fetch({
			success: function () {
				content.set('text', text);
				content.save({
					success: function () {
						console.log('saved!')
					}
				});
			}
		});
	},
	template: JST['pages/show']
});