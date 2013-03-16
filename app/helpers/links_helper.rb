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
      link_to "edit", model
    end
  end
end
