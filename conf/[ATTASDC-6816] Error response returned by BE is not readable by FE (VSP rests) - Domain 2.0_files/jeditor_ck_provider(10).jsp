(function()
{
    CKEDITOR.plugins.add('extrashortcuts',
        {
            init : function(editor)
            {
                editor.addCommand('extraMonoStyle', {
                    exec: function() {
                        var monoStyle = new CKEDITOR.style({element: 'tt'});
                        if (monoStyle.checkActive(editor.elementPath(), editor))
                            editor.removeStyle(monoStyle);
                        else
                            editor.applyStyle(monoStyle);

                        editor.fire('extraMonoStyle', this.state);
                    }
                });
                editor.addCommand('extraCodeStyle', {
                    exec: function() {
                        var codeStyle = new CKEDITOR.style({element: 'pre'});
                        if (codeStyle.checkActive(editor.elementPath(), editor))
                            editor.removeStyle(codeStyle);
                        else
                            editor.applyStyle(codeStyle);

                        editor.fire('extraCodeStyle', this.state);
                    }
                });
                editor.addCommand('extraCheckbox', {
                    modes: {
                        wysiwyg: !CKEDITOR.env.ie
                    },
                    exec: function() {
                        var checkbox = new CKEDITOR.dom.element('input');
                        checkbox.setAttribute('type', 'checkbox');
                        checkbox.setAttribute('class', 'jeditorControl');
                        checkbox.setAttribute('id', new Date().getTime());
                        checkbox.setAttribute('value', new Date().getTime());
                        editor.insertElement(checkbox);
                        
                        editor.fire('extraCheckbox', this.state);
                    }
                });
                editor.setKeystroke([
                    [CKEDITOR.CTRL + CKEDITOR.SHIFT + 67, 'extraCodeStyle'], // CTRL+SHIFT+C
                    [CKEDITOR.CTRL + CKEDITOR.SHIFT + 77, 'extraMonoStyle'], // CTRL+SHIFT+M
                    [CKEDITOR.CTRL + CKEDITOR.ALT + 67, 'extraCheckbox'] // CTRL+ALT+C
                ]);
            }
        });
})();