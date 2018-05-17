CKEDITOR.plugins.add( 'tabs', {
    requires: 'widget',

    icons: 'tabs',

    init: function( editor ) {
        editor.widgets.add('HandyTabs', {

            button: 'Content box with tabs',

            template:
                '<div class="jeditor-tabs">'
                    + '<div class="tabs-nav">'
                      + '<div name="tab0" class="tab-title active" draggable="true">New Tab</div>'
                      + '<div name="tab1" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab2" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab3" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab4" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab5" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab6" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab7" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab8" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab9" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab10" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab11" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab12" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab13" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab14" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab15" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab16" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab17" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab18" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab19" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab20" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab21" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab22" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab23" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab24" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab25" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab26" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab27" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab28" class="tab-title hidden" draggable="true">Tab</div>'
                      + '<div name="tab29" class="tab-title hidden" draggable="true">Tab</div>'
                    + '</div>'
                    + '<div class="tabs-data">'
                        + '<div name="tab0" class="tab-data-panel active"><p><br></p></div>'
                        + '<div name="tab1" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab2" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab3" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab4" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab5" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab6" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab7" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab8" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab9" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab10" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab11" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab12" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab13" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab14" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab15" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab16" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab17" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab18" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab19" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab20" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab21" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab22" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab23" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab24" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab25" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab26" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab27" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab28" class="tab-data-panel"><p><br></p></div>'
                        + '<div name="tab29" class="tab-data-panel"><p><br></p></div>'
                    + '</div>'
                + '</div>',

            editables: {
                title0: {
                    selector: '.tab-title[name="tab0"]',
                    allowedContent: 'b u i'
                },
                title1: {
                    selector: '.tab-title[name="tab1"]',
                    allowedContent: 'b u i'
                },
                title2: {
                    selector: '.tab-title[name="tab2"]',
                    allowedContent: 'b u i'
                },
                title3: {
                    selector: '.tab-title[name="tab3"]',
                    allowedContent: 'b u i'
                },
                title4: {
                    selector: '.tab-title[name="tab4"]',
                    allowedContent: 'b u i'
                },
                title5: {
                    selector: '.tab-title[name="tab5"]',
                    allowedContent: 'b u i'
                },
                title6: {
                    selector: '.tab-title[name="tab6"]',
                    allowedContent: 'b u i'
                },
                title7: {
                    selector: '.tab-title[name="tab7"]',
                    allowedContent: 'b u i'
                },
                title8: {
                    selector: '.tab-title[name="tab8"]',
                    allowedContent: 'b u i'
                },
                title9: {
                    selector: '.tab-title[name="tab9"]',
                    allowedContent: 'b u i'
                },
                title10: {
                    selector: '.tab-title[name="tab10"]',
                    allowedContent: 'b u i'
                },
                title11: {
                    selector: '.tab-title[name="tab11"]',
                    allowedContent: 'b u i'
                },
                title12: {
                    selector: '.tab-title[name="tab12"]',
                    allowedContent: 'b u i'
                },
                title13: {
                    selector: '.tab-title[name="tab13"]',
                    allowedContent: 'b u i'
                },
                title14: {
                    selector: '.tab-title[name="tab14"]',
                    allowedContent: 'b u i'
                },
                title15: {
                    selector: '.tab-title[name="tab15"]',
                    allowedContent: 'b u i'
                },
                title16: {
                    selector: '.tab-title[name="tab16"]',
                    allowedContent: 'b u i'
                },
                title17: {
                    selector: '.tab-title[name="tab17"]',
                    allowedContent: 'b u i'
                },
                title18: {
                    selector: '.tab-title[name="tab18"]',
                    allowedContent: 'b u i'
                },
                title19: {
                    selector: '.tab-title[name="tab19"]',
                    allowedContent: 'b u i'
                },
                title20: {
                    selector: '.tab-title[name="tab20"]',
                    allowedContent: 'b u i'
                },
                title21: {
                    selector: '.tab-title[name="tab21"]',
                    allowedContent: 'b u i'
                },
                title22: {
                    selector: '.tab-title[name="tab22"]',
                    allowedContent: 'b u i'
                },
                title23: {
                    selector: '.tab-title[name="tab23"]',
                    allowedContent: 'b u i'
                },
                title24: {
                    selector: '.tab-title[name="tab24"]',
                    allowedContent: 'b u i'
                },
                title25: {
                    selector: '.tab-title[name="tab25"]',
                    allowedContent: 'b u i'
                },
                title26: {
                    selector: '.tab-title[name="tab26"]',
                    allowedContent: 'b u i'
                },
                title27: {
                    selector: '.tab-title[name="tab27"]',
                    allowedContent: 'b u i'
                },
                title28: {
                    selector: '.tab-title[name="tab28"]',
                    allowedContent: 'b u i'
                },
                title29: {
                    selector: '.tab-title[name="tab29"]',
                    allowedContent: 'b u i'
                },
                data0: {
                    selector: '.tab-data-panel[name="tab0"]'
                },
                data1: {
                    selector: '.tab-data-panel[name="tab1"]'
                },
                data2: {
                    selector: '.tab-data-panel[name="tab2"]'
                },
                data3: {
                    selector: '.tab-data-panel[name="tab3"]'
                },
                data4: {
                    selector: '.tab-data-panel[name="tab4"]'
                },
                data5: {
                    selector: '.tab-data-panel[name="tab5"]'
                },
                data6: {
                    selector: '.tab-data-panel[name="tab6"]'
                },
                data7: {
                    selector: '.tab-data-panel[name="tab7"]'
                },
                data8: {
                    selector: '.tab-data-panel[name="tab8"]'
                },
                data9: {
                    selector: '.tab-data-panel[name="tab9"]'
                },
                data10: {
                    selector: '.tab-data-panel[name="tab10"]'
                },
                data11: {
                    selector: '.tab-data-panel[name="tab11"]'
                },
                data12: {
                    selector: '.tab-data-panel[name="tab12"]'
                },
                data13: {
                    selector: '.tab-data-panel[name="tab13"]'
                },
                data14: {
                    selector: '.tab-data-panel[name="tab14"]'
                },
                data15: {
                    selector: '.tab-data-panel[name="tab15"]'
                },
                data16: {
                    selector: '.tab-data-panel[name="tab16"]'
                },
                data17: {
                    selector: '.tab-data-panel[name="tab17"]'
                },
                data18: {
                    selector: '.tab-data-panel[name="tab18"]'
                },
                data19: {
                    selector: '.tab-data-panel[name="tab19"]'
                },
                data20: {
                    selector: '.tab-data-panel[name="tab20"]'
                },
                data21: {
                    selector: '.tab-data-panel[name="tab21"]'
                },
                data22: {
                    selector: '.tab-data-panel[name="tab22"]'
                },
                data23: {
                    selector: '.tab-data-panel[name="tab23"]'
                },
                data24: {
                    selector: '.tab-data-panel[name="tab24"]'
                },
                data25: {
                    selector: '.tab-data-panel[name="tab25"]'
                },
                data26: {
                    selector: '.tab-data-panel[name="tab26"]'
                },
                data27: {
                    selector: '.tab-data-panel[name="tab27"]'
                },
                data28: {
                    selector: '.tab-data-panel[name="tab28"]'
                },
                data29: {
                    selector: '.tab-data-panel[name="tab29"]'
                }
            },
            
            allowedContent: '*',

            requiredContent: 'div(jeditor-tabs);div(tabs-nav);div(tabs-data)',

            upcast: function( element ) {
                return element.name == 'div' && element.hasClass('jeditor-tabs');
            },
            
            init: function() {
                var tabs = this.wrapper.find('.tab-title');
                var nav = this.wrapper.findOne('.tabs-nav');
                var data = this.wrapper.findOne('.tabs-data');
                var newtab = new CKEDITOR.dom.element('div');
                var innerHtml = '';
                var ie9 = CKEDITOR.env.ie && CKEDITOR.env.version === 9;
                
                if (!this.wrapper.findOne('.jeditor-tabs').getAttribute('id'))
                    this.wrapper.findOne('.jeditor-tabs').setAttribute('id', CKEDITOR.WikiModeHelpers.generateId(true));
                                
                if (!this.wrapper.findOne('.add-tab-title')) {
                    newtab.addClass('add-tab-title');
                    newtab.appendTo(nav);
                }
                
                this.wrapper.findOne('.add-tab-title').on('mousedown', function(evt) {
                    var newtab = nav.findOne('.hidden');
                    
                    if (!newtab)
                        return;
                    
                    newtab.setText('New Tab');
                    newtab.removeClass('hidden');
                    
                    if (!!nav.findOne('.active'))
                        nav.findOne('.active').removeClass('active');
                    newtab.addClass('active');                    
                    
                    data.findOne('.tab-data-panel.active').setStyle('display', 'none');
                    data.findOne('.tab-data-panel.active').removeClass('active');
                    data.findOne('[name="' + newtab.getAttribute('name') + '"]').setHtml('<p><br></p>');
                    data.findOne('[name="' + newtab.getAttribute('name') + '"]').addClass('active');
                    data.findOne('.tab-data-panel.active').setStyle('display', 'block');
                });
                
                for (var i = 0; i < tabs.count(); i++) {
                    tabs.getItem(i).on('mousedown', function(evt) {
                        var sender = evt.sender,
                            senderName = sender.getAttribute('name');
                            active = sender.getParent().findOne('.tab-title.active');
                        
                        active.removeClass('active');
                        sender.addClass('active');
                        
                        data.findOne('.tab-data-panel.active').setStyle('display', 'none');
                        data.findOne('.tab-data-panel.active').removeClass('active');
                        data.findOne('[name="' + senderName + '"]').addClass('active');
                        data.findOne('.tab-data-panel.active').setStyle('display', 'block');
                        editor.fire('change');
                    });
                    
                    if (!tabs.getItem(i).$.getAttribute('draggable'))
                        tabs.getItem(i).$.setAttribute('draggable', 'true');
                    
                    tabs.getItem(i).$.addEventListener('dragstart', handleDragStart, false);
                    tabs.getItem(i).$.addEventListener('dragenter', handleDragEnter, false);
                    tabs.getItem(i).$.addEventListener('dragover', handleDragOver, false);
                    tabs.getItem(i).$.addEventListener('dragleave', handleDragLeave, false);
                    tabs.getItem(i).$.addEventListener('drop', handleDrop, false);
                    tabs.getItem(i).$.addEventListener('dragend', handleDragEnd, false);
                }
                
                if (ie9)
                    AJS.$(editor.document.$).on("selectstart", "[draggable]", function() { 
                        this.dragDrop();
                        return false;
                    });
                
                function handleDragStart(e) {
                    if (!ie9)
                        this.style.opacity = '0.4';
                    e.dataTransfer.effectAllowed = 'move';
                    e.dataTransfer.setData('text', this.getAttribute('name'));
                }
                
                function handleDragEnd(e) {
                    [].forEach.call(tabs.$, function (tab) {
                        AJS.$(tab).removeClass('over');
                    });
                    
                    this.style.opacity = '1.0';
                    editor.fire('change');
                }
                
                function handleDrop(e) {
                    if (e.stopPropagation)
                        e.stopPropagation();
                    if (e.preventDefault)
                        e.preventDefault();

                    var finalTarget = nav.findOne('[name="' + this.getAttribute('name') + '"]');
                    var source = nav.findOne('[name="' + e.dataTransfer.getData('text') + '"]');
                    
                    source.insertAfter(finalTarget);
                }

                function handleDragOver(e) {
                    if (e.preventDefault)
                        e.preventDefault();

                    e.dataTransfer.dropEffect = 'move';

                    return false;
                }

                function handleDragEnter(e) {
                    if (this.getAttribute('name') !== e.dataTransfer.getData('text'))
                        AJS.$(this).addClass('over');
                }

                function handleDragLeave(e) {
                    if (this.classList)
                        this.classList.remove('over');
                    else
                        AJS.$(this).removeClass('over');
                }
            }
        });
        
        editor.addCommand('removeTab', {
            exec: function (editor) {
                var element = editor.getSelection().getStartElement(),
                    nav = element.getParent(),
                    data = !!nav ? nav.getParent().findOne('.tabs-data') : nav;
                
                if (element.hasClass('tab-title')) {
                    element.addClass('hidden');
                    element.removeClass('active');
                    element.setText('New Tab');
                    element.appendTo(element.getParent());
                    nav.findOne('.add-tab-title').appendTo(element.getParent());
                    
                    nav.findOne('.tab-title').addClass('active');
                    
                    data.findOne('.active').setHtml('<p><br></p>');
                    data.findOne('.active').setStyle('display', 'none');
                    data.findOne('.active').removeClass('active');
                    data.findOne('[name="' + nav.findOne('.active').getAttribute('name') + '"]').addClass('active');
                    data.findOne('.active').setStyle('display', 'block');
                    editor.fire('change');
                }
            }
        });
        
        editor.addCommand('removeImg', {
            exec: function (editor) {
                var element = editor.getSelection().getStartElement(),
                    img = element.getName() === 'img' ? element : element.findOne('img');
                
                if (!!img)
                    img.remove();
            }
        });
        
        editor.addCommand('colorTab', {
            exec: function (editor) {
                var element = editor.getSelection().getStartElement();
                if (element.hasClass('tab-title')) {
                    editor.getColorFromDialog(function(color) {
                        if (typeof color === 'string')
                            this.element.setAttribute('style', 'background-color:' + color);
                            this.editor.fire('change');
                    }, {element: element, editor: editor});
                }
            }
        });
        
        if (editor.contextMenu) {
            editor.addMenuGroup('jeTabsGroup');
            editor.addMenuItem('removeTab', {
                label: 'Remove tab',
                command: 'removeTab',
                group: 'jeTabsGroup'
            });
            editor.addMenuItem('colorTab', {
                label: 'Change color...',
                command: 'colorTab',
                group: 'jeTabsGroup'
            });
            editor.addMenuItem('removeImg', {
                label: 'Remove image',
                command: 'removeImg',
                group: 'jeTabsGroup'
            });

            editor.contextMenu.addListener(function (element) {
                if (element.hasClass('tab-title')) {
                    return {
                        removeTab: CKEDITOR.TRISTATE_OFF,
                        colorTab: CKEDITOR.TRISTATE_OFF
                    };
                }
                var parents = element.getParents(),
                    isInTab = false,
                    isImg = element.getName() === 'img' || element.findOne('img') !== null;
                for (var i in parents) {
                    if (!parents[i] || typeof parents[i].hasClass !== 'function')
                        continue;
                    if (parents[i].hasClass('tab-data-panel'))
                        isInTab = true;
                }
                if (isImg && isInTab) {
                    return {
                        removeImg: CKEDITOR.TRISTATE_OFF
                    };
                }
            });
        }
    }
});