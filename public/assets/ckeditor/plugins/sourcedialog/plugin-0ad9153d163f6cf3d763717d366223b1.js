/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */
CKEDITOR.plugins.add("sourcedialog",{lang:"en",icons:"sourcedialog,sourcedialog-rtl",init:function(e){e.addCommand("sourcedialog",new CKEDITOR.dialogCommand("sourcedialog")),CKEDITOR.dialog.add("sourcedialog",this.path+"dialogs/sourcedialog.js"),e.ui.addButton&&e.ui.addButton("Sourcedialog",{label:e.lang.sourcedialog.toolbar,command:"sourcedialog",toolbar:"mode,10"})}});