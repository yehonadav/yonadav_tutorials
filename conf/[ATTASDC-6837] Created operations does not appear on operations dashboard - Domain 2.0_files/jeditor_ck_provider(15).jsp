(function () {
    var restoreCommand = {

        canUndo: false,

        exec: function () {
            if (typeof CKEDITOR.currentInstance.name != 'undefined')
            {
                var label = JIRA.Issue.getIssueKey() ? JIRA.Issue.getIssueKey() : window.location.href,
                    session = localStorage.getItem(CKEDITOR.currentInstance.element.getNameAtt() + '__jeditor_session'),
                    lostValue = localStorage.getItem(CKEDITOR.currentInstance.element.getNameAtt() + '__' + session + '__jeditor');
                if (lostValue) CKEDITOR.currentInstance.setData(lostValue);
                if (session) CKEDITOR.helpers.localStorage.setItem(CKEDITOR.currentInstance.element.getNameAtt() + '__jeditor_last_session', session);
                if (session == null || session == 1) CKEDITOR.helpers.localStorage.setItem(CKEDITOR.currentInstance.element.getNameAtt() + '__jeditor_session', 0);
                if (session == 0) CKEDITOR.helpers.localStorage.setItem(CKEDITOR.currentInstance.element.getNameAtt() + '__jeditor_session', 1);

            }
        }
    };

    var setState = function ()
    {
        if (localStorage.getItem(this.element.getNameAtt() + '__0__jeditor') == null && localStorage.getItem(this.element.getNameAtt() + '__1__jeditor') == null) this.getCommand('restore').setState(CKEDITOR.TRISTATE_DISABLED);
        else this.getCommand('restore').setState(CKEDITOR.TRISTATE_OFF);
    };

    CKEDITOR.plugins.add('restore',
        {
            //requires: [ 'htmldataprocessor' ],
            init: function (editor) {
                var pluginName = 'restore';

                editor.addCommand(pluginName, restoreCommand);

                editor.on( 'contentDom', function()
                {
                    var tempInst = editor;
                    editor.document.on( 'keydown', function( event )
                        {
                            if (localStorage.getItem(tempInst.element.getNameAtt() + '__jeditor_last_session'))
                            {
                                CKEDITOR.helpers.localStorage.setItem(tempInst.element.getNameAtt() + '__jeditor_session', localStorage.getItem(tempInst.element.getNameAtt() + '__jeditor_last_session'));
                                localStorage.removeItem(tempInst.element.getNameAtt() + '__jeditor_last_session');
                            }
                            if (localStorage.getItem(tempInst.element.getNameAtt() + '__jeditor_session') == null) CKEDITOR.helpers.localStorage.setItem(tempInst.element.getNameAtt() + '__jeditor_session', 0);
                            if (tempInst.mode == 'wysiwyg') CKEDITOR.helpers.localStorage.setItem(tempInst.element.getNameAtt() + '__' + localStorage.getItem(tempInst.element.getNameAtt() + '__jeditor_session') + '__jeditor', AJS.$(tempInst.document.getBody().$).html());
                        });
                });

                editor.on('mode', setState, editor);

                editor.ui.addButton('Restore',
                    {
                        label: 'Revert Snapshot',
                        command: pluginName

                    });
            }
        });
})();