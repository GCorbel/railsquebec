describe LinksHelper do
  let(:model) { stub(to_s: "A model") }

  describe :link_for_delete do
    context "when the user can delete the model" do
      it "give a link to destroy" do
        stub!(:can?).with(:delete, model).and_return(true)
        stub!(:polymorphic_path).and_return('link')

        expect(link_for_delete(model)).to eq "<a href=\"link\" class=\"btn btn-danger\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\">Delete</a>"
      end
    end

    context "when the user cannot delete the model" do
      it "return nil" do
        stub!(:can?).with(:delete, model).and_return(false)
        expect(link_for_delete(model)).to be_nil
      end
    end
  end

  describe :link_for_edit do
    context "when the user can edit the model" do
      it "give a link to destroy" do
        stub!(:can?).with(:update, model).and_return(true)
        stub!(:edit_polymorphic_path).and_return('link')

        expect(link_for_edit(model)).to eq "<a href=\"link\" class=\"btn\">Edit</a>"
      end
    end

    context "when the user cannot edit the model" do
      it "return nil" do
        stub!(:can?).with(:update, model).and_return(false)
        expect(link_for_edit(model)).to be_nil
      end
    end
  end

  describe :form_actions_for do
    context "when the user can manage the model" do
      it "show form actions" do
        stub!(:can?).with(:manage, model).and_return(true)
        stub!(:link_for_edit).and_return("link_for_edit")
        stub!(:link_for_delete).and_return("link_for_delete")
        expect(form_actions_for(model)).to eq "<div class=\"form-actions\">link_for_editlink_for_delete</div>"
      end
    end

    context "when the user cannot manage the model"  do
      it "return nil" do
        stub!(:can?).with(:manage, model).and_return(false)
        expect(form_actions_for(model)).to be_nil
      end
    end
  end
end
