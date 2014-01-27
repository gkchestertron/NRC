json.array! @pages do |page|
	json.title page.title
	json.id page.id
	json.set! :layout do 
		json.set! :id, page.layout.id
		json.set! :name, page.layout.name
		json.set! :html, page.layout.html
		json.set! :page_id, page.layout.page_id
		json.set! :template_id, page.layout.template_id
		json.contents do
			json.array! page.layout.contents do |content|
				json.id content.id
				json.layout_id content.layout_id
				json.parent_selector content.parent_selector
				json.text content.text
			end
		end	
	end
end