(function()
{
    CKEDITOR.plugins.add( 'mention',
        {
            requires : [ 'dialog' ],

            init : function( editor )
            {
                CKEDITOR.dialog.add( 'mentionDialog', CKEDITOR.getUrl( this.path + 'dialogs/mentions.js' ) );

                editor.addCommand( 'mentionDialog', new CKEDITOR.dialogCommand( 'mentionDialog' ) );

                editor.ui.addButton( 'Mention',
                    {
                        label : 'Mention, Ctrl+M',
                        command : 'mentionDialog'
                    });
            }
        });
})();

/*
(function () {

    var someSome = "";
    var someCollect = false;

    var digitsOnly = /[1234567890]/g;
    var floatOnly = /[0-9\.]/g;
    var alphaOnly = /[A-Za-z]/g;

    function alphaTest(key) {
        var regexLetter = /[a-zA-Z0-9()]/;
        return regexLetter.test(key);
    }

    var onKey = function (e) {
        if (this.mode !== 'wysiwyg') {
            return;
        }

        if (!alphaTest(String.fromCharCode(e.data.keyCode)))
        {
            someCollect = false;
            someSome = "";
        }

        if (someCollect)
        {
            someSome += String.fromCharCode(e.data.keyCode);
            console.log(someSome);

            userMentionRequest( "PSD", JIRA.Issue.getIssueKey(), someSome)
        }
        if (e.data.keyCode == 2228274 )
        {
            someCollect = true;

        }
        //localStorage.setItem(window.location.href + this.element.getNameAtt() + '__ckeditor_comment', this.getData());

    };

    //http://localhost:2990/jira/rest/api/2/user/viewissue/search?issueKey=PSD-1&projectKey=PSD&maxResults=10&username=a&_=1344941882233
    function userMentionRequest(projectKey, issueKey, username) {
        AJS.$.ajax({
            url: AJS.Meta.get('context-path') + '/rest/api/2/user/viewissue/search',
            data:
            {
                'projectKey' : projectKey,
                'issueKey' : issueKey,
                'maxResults' : 10,
                'username' : username
            }   ,
            dataType: 'json',
            success: function (response) {
                console.log(response)
            },
            error: function() {

            }

        });
    }


    CKEDITOR.plugins.add('mention',
        {
            requires: [ 'htmldataprocessor' ],
            init: function (editor) {
                var pluginName = 'restore';
                editor.on('key', onKey, editor);

            }
        });
})();
    */