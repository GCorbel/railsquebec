(function(){window.Editor=CKEDITOR,Editor.active=function(){var e,t,i,n,a;for(t=$(".editable-long-text"),t.attr("contenteditable",!0),t.effect("highlight",{duration:5e3}),a=[],i=0,n=t.length;n>i;i++)e=t[i],a.push(CKEDITOR.inline(e,{extraPlugins:"sourcedialog"}));return a},Editor.deactive=function(){return $(".editable-long-text").attr("contenteditable",!1),$.each(CKEDITOR.instances,function(e,t){return t.destroy()})},Editor.commitAll=function(){return $.each(CKEDITOR.instances,function(e,t){var i,n;return i=t.container.$.dataset,n=FrontendEditor.getCurrentModel(i.object),n.id=i.id,n.set(i.attribute,t.getData())})}}).call(this);