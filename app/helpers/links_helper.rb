module LinksHelper
  def link_for_delete(model)
    if can?(:delete, model)
      link_to "Delete",
        model,
        method: :delete,
        data: { confirm: "Are you sure?" },
        class: 'btn btn-danger'
    end
  end

  def link_for_edit(model)
    if can?(:update,model)
      link_to "Edit", edit_polymorphic_path(model), class: 'btn'
    end
  end

  def form_actions_for(model)
    if can?(:manage, model)
      link_for_edit = link_for_edit(model) || ""
      link_for_delete = link_for_delete(model) || ""
      content_tag(:div, class: "form-actions") do
        link_for_edit + link_for_delete
      end
    end
  end
end
