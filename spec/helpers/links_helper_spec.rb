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
end
