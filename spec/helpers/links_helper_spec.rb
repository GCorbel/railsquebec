describe LinksHelper do
  let(:model) { stubs(to_s: "A model") }

  describe :link_for_delete do
    context "when the user can delete the model" do
      it "give a link to destroy" do
        stubs(:can?).with(:delete, model).returns(true)
        stubs(:polymorphic_path).returns('link')

        expect(link_for_delete(model)).to eq "<a href=\"link\" class=\"btn btn-danger\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\">Delete</a>"
      end
    end

    context "when the user cannot delete the model" do
      it "return nil" do
        stubs(:can?).with(:delete, model).returns(false)
        expect(link_for_delete(model)).to be_nil
      end
    end
  end

  describe :link_for_edit do
    context "when the user can edit the model" do
      it "give a link to destroy" do
        stubs(:can?).with(:update, model).returns(true)
        stubs(:edit_polymorphic_path).returns('link')

        expect(link_for_edit(model)).to eq "<a href=\"link\" class=\"btn\">Edit</a>"
      end
    end

    context "when the user cannot edit the model" do
      it "return nil" do
        stubs(:can?).with(:update, model).returns(false)
        expect(link_for_edit(model)).to be_nil
      end
    end
  end

  describe :form_actions_for do
    context "when the user can manage the model" do
      it "show form actions" do
        stubs(:can?).with(:manage, model).returns(true)
        stubs(:link_for_edit).returns("link_for_edit")
        stubs(:link_for_delete).returns("link_for_delete")
        expect(form_actions_for(model)).to eq "<div class=\"form-actions\">link_for_editlink_for_delete</div>"
      end
    end

    context "when the user cannot manage the model"  do
      it "return nil" do
        stubs(:can?).with(:manage, model).returns(false)
        expect(form_actions_for(model)).to be_nil
      end
    end
  end
end
