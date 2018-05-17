(function()
{
    CKEDITOR.plugins.add('extrabottom',
        {
            init : function(editor)
            {
                editor.on('instanceReady',function() {
                    var textarea = editor.element.$;
                    var bottomBarIconHolder = '<span class="je_extra_tools" style=""></span>';
                    var redlineInactiveHtml = '<a class="je_redline" tabindex="-1" hidefocus="true" role="button"><span class="cke_button_icon je-btn inactive">&nbsp;</span></a>';
                    var redlineActiveHtml = '<a class="je_redline" tabindex="-1" hidefocus="true" role="button"><span class="cke_button_icon je-btn active">&nbsp;</span></a>';
                    var redlineHtml = localStorage.getItem('JEDITOR_RED_LINE') !== 'enabled' ? redlineInactiveHtml : redlineActiveHtml;
                    var toolbarswapHtml = '<a class="je_toolbar_swap" tabindex="-1" hidefocus="true" role="button"><span class="cke_button_icon je-btn je_toolbarswap">&nbsp;</span></a>';
                    var editmodewikiHtml = '<a class="je_editmode_wiki" tabindex="-1" hidefocus="true" role="button"><span class="cke_button_icon je-btn je_editmodewiki">&nbsp;</span></a>';
                    
                    if (AJS.$(editor.container.$).find('span.cke_bottom').length)
                        AJS.$(editor.container.$).find('span.cke_bottom').append(bottomBarIconHolder);
                    else
                        AJS.$(editor.container.$).find('div.cke_inner').append(bottomBarIconHolder.replace('style=""', 'style="height: 16px; margin: 0 0 3px 0;"').replace('span', 'div'));
                    
                    if (JEDITOR_CONFIGURATION_JIRA['JEDITOR_RED_LINE'].value !== '2') {
                        AJS.$(editor.container.$).find('.je_extra_tools').append(redlineHtml);
                        AJS.$(editor.container.$).find('.je_redline').click(function() {
                            //editor.execCommand('showblocks');
                            localStorage.getItem('JEDITOR_RED_LINE') !== 'enabled' ? CKEDITOR.helpers.localStorage.setItem('JEDITOR_RED_LINE','enabled') : CKEDITOR.helpers.localStorage.setItem('JEDITOR_RED_LINE','disabled');
                            AJS.$(this).find('span.cke_button_icon').toggleClass('active').toggleClass('inactive');
                            editor.focus();
                        });
                    }
                    
                    if (localStorage.getItem('je_switchtoolbar') === 'on' && editor.element.$.name !== 'portfolio-description') {
                        if (typeof ServiceDesk === 'undefined' || !ServiceDesk.Api) {
                            AJS.$(editor.container.$).find('.je_extra_tools').append(toolbarswapHtml);
                            AJS.$(editor.container.$).find('.je_toolbar_swap').click(function() {
                                if (localStorage.getItem('je_tb__'+AJS.$(editor.element.$).attr('name')) === null)
                                    CKEDITOR.helpers.localStorage.setItem('je_tb__'+AJS.$(editor.element.$).attr('name'),'mini');
                                else
                                    localStorage.removeItem('je_tb__'+AJS.$(editor.element.$).attr('name'));
                                if (CKEDITOR.readyInstances && typeof CKEDITOR.readyInstances.splice === 'function')
                                    CKEDITOR.readyInstances.splice(CKEDITOR.readyInstances.indexOf(editor.name), 1);
                                if (editor.element.$.id.indexOf('_jeid-') > 0) // prevent clearing comment textarea
                                    editor.element.$.id = editor.element.$.id.split('_jeid-')[0];
                                editor.destroy(false);
                            });
                        }
                    }
                    
                    if (localStorage.getItem('je_wikimode') === 'on' && editor.element.$.name !== 'portfolio-description') {
                        if (typeof ServiceDesk === 'undefined' || !ServiceDesk.Api) {
                            AJS.$(editor.container.$).find('.je_extra_tools').append(editmodewikiHtml);
                            AJS.$(editor.container.$).find('.je_editmode_wiki').click(function() {
                                if (CKEDITOR.WikiModeHelpers.wikifyString(textarea.value) === 'JE_HTML2WIKI_ERR')
                                    if (!window.confirm('Disable JEditor and switch to wiki mode?'))
                                        return;
                                        
                                CKEDITOR.helpers.localStorage.setItem('je_editmode__'+AJS.$(textarea).attr('name'), 'wiki');
                                
                                if (CKEDITOR.readyInstances && typeof CKEDITOR.readyInstances.splice === 'function')
                                    CKEDITOR.readyInstances.splice(CKEDITOR.readyInstances.indexOf(editor.name), 1);
                                editor.destroy(true);
                                
                                AJS.$(textarea).attr('je-wiki', 'forced');
                                    
                                CKEDITOR.WikiModeHelpers.prepareWikiMode(textarea);
                            });
                        }
                    }
                });
            }
        });
})();