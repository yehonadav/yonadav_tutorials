(function()
{
    CKEDITOR.plugins.add('prepopulate',
        {
            init : function(editor)
            {
                editor.on('instanceReady', function() {
                    var form = AJS.$(this.element.$).closest('form'),
                        projectField = form.find('#project').get(0) || form.find('[name="pid"]').get(0),
                        issueTypeField = form.find('#issuetype').get(0) || form.find('[name="issuetype"]').get(0),
                        fieldId = AJS.$('#'+this.name).attr('name'),
                        fieldIsEmpty = this.element.$.value.replace(/\u200B/gi,'') === '',
                        templateExists = false,
                        templateCode = '',
                        grepScheme = [],
                        projectId = '',
                        projectKey = '',
                        issueTypeId = '',
                        watermark = '<span style="display:none;" class="jeditor-template-watermark">&nbsp;</span>',
                        textareaWatermarked = this.element.$.value.indexOf('jeditor-template-watermark') > 0,
                        allScreens = !!JIRA.Dialog.current && CKEDITOR.populateAllScreens,
                        ghxIssueType = AJS.$('.ghx-selected-primary').length === 1 ? AJS.$('.ghx-selected-primary').attr('class').replace(/.*?ghx-type-([0-9]{5,6}).*/g, '$1') : '',
                        getParamTemplateName = '';
                    
                    if (this.name === 'fake-jeditor-textarea')
                        return;
                    
                    if (this.name.indexOf('description_jeid') === 0 && location.search.indexOf('jeditor.description.template=') > 0) {
                        getParamTemplateName = location.search.match(/jeditor\.description\.template=[^&]*/i)[0].split('=')[1];
                        for (var i=0; i < JEDITOR_CONFIGURATION_JIRA.JEDITOR_TEMPLATES_ORDER.params.order.length; i++) {
                            if (JEDITOR_CONFIGURATION_JIRA[JEDITOR_CONFIGURATION_JIRA.JEDITOR_TEMPLATES_ORDER.params.order[i]].label === getParamTemplateName) {
                                setTimeout((function($this, templateCode) {
                                    return function()
                                    {
                                        templateCode = generateNewIds(templateCode);
                                        templateCode = replaceVars(templateCode);

                                        $this.setData(templateCode + watermark);
                                        $this.element.setValue(templateCode + watermark);
                                    }
                                })(this, decodeURIComponent(JEDITOR_CONFIGURATION_JIRA[JEDITOR_CONFIGURATION_JIRA.JEDITOR_TEMPLATES_ORDER.params.order[i]].value)), 200);
                            }
                        }
                        return;
                    }
                    
                    if (!CKEDITOR.prepopulatedFields)
                        CKEDITOR.prepopulatedFields = {};
                        
                    if (!AJS.$(this.element.$).closest('[id^="create-issue-dialog"]:visible, #create-epic-issue-dialog:visible, #create-subtask-dialog:visible, form#issue-create, #subtask-create-details').length && !allScreens)
                        return;
                        
                    if (!!JIRA.Issue && !!JIRA.Issue.getIssueKey)
                        projectKey = !!JIRA.Issue.getIssueKey() ? JIRA.Issue.getIssueKey().split('-')[0] : 'Pr0ject key n0t f0und';
                    
                    if (typeof projectField === 'undefined' && !!projectKey && allScreens)
                        projectField = null;
                    
                    if (typeof issueTypeField === 'undefined' && ghxIssueType !== '')
                        issueTypeField = null;
                        
                    if (typeof projectField === 'undefined' || typeof issueTypeField === 'undefined')
                        return;
                    
                    if (projectField === null) {
                        projectId = 'Pr0ject id n0t f0und';
                    }
                    else {
                        projectId = typeof AJS.$(projectField).val() !== 'string' ? AJS.$(projectField).val()[0] : AJS.$(projectField).val();
                        projectKey = 'Pr0ject key n0t needed';
                    }
                    
                    if (issueTypeField === null)
                        issueTypeId = ghxIssueType;
                    else
                        issueTypeId = typeof AJS.$(issueTypeField).val() !== 'string' ? AJS.$(issueTypeField).val()[0] : AJS.$(issueTypeField).val();
                    
                    if (typeof projectId === 'undefined' || typeof issueTypeId === 'undefined')
                        return;
                    
                    if (CKEDITOR.prepopObj[fieldId] && CKEDITOR.prepopObj[fieldId].issueTypeId === issueTypeId && CKEDITOR.prepopObj[fieldId].projectId === projectId)
                        return;
                    else {
                        CKEDITOR.prepopObj[fieldId] = {};
                        CKEDITOR.prepopObj[fieldId].issueTypeId = issueTypeId;
                        CKEDITOR.prepopObj[fieldId].projectId = projectId;
                    }
                        

                    /* grep scheme to find match in projectId, issuetypeId and fieldId */
                    grepScheme = AJS.$.grep(this.config.prepopulation, function(e)
                    {
                        var projectIdMatchFound = false;
                        if (e.projects)
                            AJS.$.each(e.projects,function(){
                                if (this.projectId === projectId || this.projectKey === projectKey || this.projectKey === 'allProjects')
                                    projectIdMatchFound = true;
                            });
                        if (e.categories)
                            AJS.$.each(e.categories, function(index, elem) {
                                AJS.$.each(JEDITOR_PROJECT_CATEGORIES, function() {
                                    if (this.id == elem.id && this.projectsId.indexOf(projectId) >= 0)
                                        projectIdMatchFound = true;
                                })
                            });
                        return projectIdMatchFound && e.fieldId === fieldId && e.issueTypeId === issueTypeId;
                    });

                    templateExists = grepScheme.length && typeof JEDITOR_CONFIGURATION_JIRA[grepScheme[0].template] !== 'undefined';
                    templateCode = templateExists ? decodeURIComponent(JEDITOR_CONFIGURATION_JIRA[grepScheme[0].template].value) : '';

                    if (templateExists && fieldIsEmpty)
                    {
                        setTimeout((function($this, templateCode) {
                            return function()
                            {
                                templateCode = generateNewIds(templateCode);
                                templateCode = replaceVars(templateCode);
                                
                                $this.setData(templateCode + watermark);
                                $this.element.setValue(templateCode + watermark);
                            }
                        })(this, templateCode), 200);
                    }
                    else if (templateExists && textareaWatermarked)
                    {
                        setTimeout((function($this, templateCode) {
                            return function()
                            {
                                templateCode = generateNewIds(templateCode);
                                templateCode = replaceVars(templateCode);
                                
                                $this.setData(templateCode + watermark);
                                $this.element.setValue(templateCode + watermark);
                            }
                        })(this, templateCode), 200);
                    }
                    else if (!templateExists && textareaWatermarked)
                    {
                        setTimeout((function($this) {
                            return function()
                            {
                                $this.setData('');
                                $this.element.setValue('');
                            }
                        })(this), 200);
                    }
                    
                });
                
                function generateNewIds(templateCode) {
                    var htmlObj = AJS.$('<div>'+templateCode+'</div>'),
                        changes = 0;
                    htmlObj.find('.jeditorControl, .jeditorForm, .jeditor_custom_form').each(function() {
                        AJS.$(this).attr('id', CKEDITOR.WikiModeHelpers.generateId(true));
                        changes++;
                    });
                    if (changes > 0)
                        templateCode = htmlObj.html();
                    return templateCode;
                }
                
                function replaceVars(templateCode) {
                    templateCode = templateCode.replace(/\{\$datetime\}/g, new Date().toLocaleDateString()+' '+new Date().toLocaleTimeString())
                                                .replace(/\{\$time-all\}/g, new Date().toTimeString())
                                                .replace(/\{\$date-cal\}/g, new Date().toDateString())
                                                .replace(/\{\$time\}/g, new Date().toLocaleTimeString())
                                                .replace(/\{\$date\}/g, new Date().toLocaleDateString())
                                                .replace(/\{\$user\}/g, AJS.Meta.get('remote-user'))
                                                .replace(/\{\$user-fullname\}/g, AJS.Meta.get('remote-user-fullname'))
                                                .replace(/<\/?html[^<>]*>/gi, '')
                                                .replace(/<\/?body[^<>]*>/gi, '')
                                                .replace(/<\/?head[^<>]*>/gi, '');
                    return templateCode;
                }
            }
        });
})();