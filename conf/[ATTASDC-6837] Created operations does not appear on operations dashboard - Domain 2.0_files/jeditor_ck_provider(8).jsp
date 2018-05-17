(function()
{
    CKEDITOR.plugins.add('pastehtml',
        {
            requires : [ 'dialog' ],
            lang : 'en',
            init : function(editor)
            {
                CKEDITOR.dialog.add( 'pastehtmlDialog', CKEDITOR.getUrl( this.path + 'dialogs/pastehtml.js' ) );
                editor.addCommand( 'pastehtmlDialog', new CKEDITOR.dialogCommand( 'pastehtmlDialog' ) );
            }
        });
})();