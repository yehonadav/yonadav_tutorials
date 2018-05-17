CKEDITOR.plugins.add('syntaxhighlight',
{
	requires: 'dialog',
	lang: 'ar,en,de,fr,ko,es,sv,fi,nl,no,bg,cs,da,hi,hu,is,fa,el,et,he,hr,it,ja,lt,lv,pl,pt,sr,vi,zh,th,ro,sk,sl,tr,uk,ru',
	init: function(editor)
	{
		var pluginName = 'syntaxhighlight';
		var command = editor.addCommand(pluginName, new CKEDITOR.dialogCommand(pluginName) );
		command.canUndo = false;
		editor.ui.addButton && editor.ui.addButton('Code',
		{
	            label : editor.lang.syntaxhighlight.title,
				command : pluginName
		});
		CKEDITOR.dialog.add(pluginName, this.path + 'dialogs/syntaxhighlight.js' );
	}
});

