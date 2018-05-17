(function()
{
    CKEDITOR.plugins.add('pastewiki',
        {
            requires : [ 'dialog' ],
            lang : 'en',
            init : function(editor)
            {
                CKEDITOR.dialog.add( 'pasteWikiDialog', CKEDITOR.getUrl( this.path + 'dialogs/pastewiki.js' ) );
                editor.addCommand( 'pasteWikiDialog', new CKEDITOR.dialogCommand( 'pasteWikiDialog' ) );
            }
        });
})();