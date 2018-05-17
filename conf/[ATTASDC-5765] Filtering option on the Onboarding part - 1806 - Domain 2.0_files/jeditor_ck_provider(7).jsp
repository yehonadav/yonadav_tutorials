(function()
{
    CKEDITOR.plugins.add('toolbarhide',
        {
            init : function(editor)
            {
                editor.on('instanceReady',function(){
                    var toolbarhidebtn = '<span name="je_extra_tools" class="cke_toolgroup" style="float: right; margin: 0;"><a name="je_toolbar_hide" tabindex="-1" hidefocus="true" role="button"><span class="je_collapser je_collapser_max">&nbsp;</span></a></span>';
                    var toolbarContainer = AJS.$(editor.container.$).find('span.cke_toolbox_main'),
                        elements = AJS.$(toolbarContainer).children(),
                        elementsCount = elements.length,
                        separator = AJS.$(toolbarContainer).find('span.cke_toolbar_break').get(0),
                        firstSeparatorIndex = AJS.$(separator).index(),
                        i = 0;
                    
                    AJS.$(editor.container.$).find('span.cke_toolbox').append(toolbarhidebtn);
                    AJS.$(editor.container.$).find('[name="je_toolbar_hide"]').click(function() {
                        if (localStorage.getItem('JE_' + editor.element.$.name + '_COLLAPSED') === 'true') {
                            elements.show();
                            AJS.$(editor.container.$).find('[name="je_toolbar_hide"] span.je_collapser').toggleClass('je_collapser_max').toggleClass('je_collapser_min');
                            CKEDITOR.helpers.localStorage.setItem('JE_' + editor.element.$.name + '_COLLAPSED', 'false');
                        }
                        else {
                            if (firstSeparatorIndex > 0) {
                                for (i = firstSeparatorIndex; i < elementsCount; i++) {
                                    AJS.$(elements.get(i)).hide();
                                }
                            }
                            AJS.$(editor.container.$).find('[name="je_toolbar_hide"] span.je_collapser').toggleClass('je_collapser_max').toggleClass('je_collapser_min');
                            CKEDITOR.helpers.localStorage.setItem('JE_' + editor.element.$.name + '_COLLAPSED', 'true');
                        }
                    });
                    if (localStorage.getItem('JE_' + editor.element.$.name + '_COLLAPSED') === 'true') {
                        if (firstSeparatorIndex > 0) {
                            for (i = firstSeparatorIndex; i < elementsCount; i++) {
                                AJS.$(elements.get(i)).hide();
                            }
                        }
                        AJS.$(editor.container.$).find('[name="je_toolbar_hide"] span.je_collapser').toggleClass('je_collapser_max').toggleClass('je_collapser_min');
                    }
                    AJS.$(editor.container.$).find('span.cke_toolbox_main').show();
                });
            }
        });
})();
