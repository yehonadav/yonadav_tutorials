CKEDITOR.plugins.add('userlist', {

    icons: 'userlist',

    init: function(editor) {

        function UserList(editor) {
            var list, body, lastProcessedRequest, cacheWithData = {}, dummyCache = [], eventType = '',
                URL, CSS, TMPL, NAMELENGTH, MINSENDTIME, IGNOREDKEYS, FORBIDDENPARENTS, JIRACONTEXTPATH, ISSUEKEY;

            MINSENDTIME = 500; //in milliseconds
            JIRACONTEXTPATH = AJS.Meta.get('context-path');
            //ISSUEKEY = AJS.Meta.get('issue-key') ? "&issueKey=" + AJS.Meta.get('issue-key') : '';

            URL = JIRACONTEXTPATH + "/rest/api/2/user/viewissue/search?maxResults=10&username=";
            NAMELENGTH = 20;
            CSS = '<style type="text/css">' +
                '.ul-not-found {padding: 5px 10px;}' +
                '.ul-aui-list {position:absolute;border: 1px solid gray;background-color:white;z-index:99999}' +
                '.ul-aui-list ul {list-style: none; margin: 0; padding: 2px 0;}' +
                '.ul-aui-list-item {color: #333;cursor: pointer;}' +
                '.ul-aui-list-item:hover, .ul-aui-list-item.active {background-color: #3b73af; color: white;}' +
                '.ul-aui-list .ul-aui-list-item-link.ul-aui-iconised-link {background-position: 10px 5px; background-repeat: no-repeat; -moz-background-size: 16px; background-size: 16px; padding-left: 31px; padding-right: 10px;}' +
                '.ul-aui-list span.ul-aui-list-item-link.ul-aui-iconised-link {overflow: hidden;text-overflow: ellipsis;display: block;padding-top: 3px;padding-bottom: 3px}</style>';
            TMPL = '<div class="ul-aui-list" style="display:none"></div>';
            FORBIDDENPARENTS = ['PRE', 'FORMATTED', 'CODE'];
            LISTCONTORLKEYS = [38, 40, 13];
            IGNOREDKEYS = [16, 91, 17, 27];

            function getFromCache(key) {
                if (dummyCache.indexOf(key) !== -1) {
                    return {type: 'real', data: []};
                }

                for (var i = 0; i < dummyCache.length; i++) {
                    if (key.indexOf(dummyCache[i]) === 0) {
                        return {type: 'prediction', data: []};
                    }
                };

                return {type: 'real', data: cacheWithData[key]};
            };

            function putToCache(key, data) {
                if (data.length > 0) {
                   cacheWithData[key] = data;
                } else {
                    dummyCache.push(key);
                }
            };

            function moveList() {
                var dummyElement, x = 0, y = 0, obj4Coord, sNode, sOffset, sibling,
                    range = editor.getSelection().getRanges()[0],
                    offset = AJS.$(editor.container.$).find('iframe.cke_wysiwyg_frame').offset();
                
                if (!editor.getSelection().getRanges().length)
                    return;
                
                if (!range.collapsed || range.startOffset !== range.endOffset || range.endContainer.$.innerHTML === '<br>') {
                	return;
                }
                
                if (AJS.$.grep(range.startContainer.getParents(), function(item) {
                    if (!!item.$.className)
                        return (item.$.className.indexOf('jeditor-tabs') >= 0);
                    else
                        return false;
                }).length > 0)
                    return;

                dummyElement = editor.document.createElement('span');

                editor.insertElement(dummyElement);
                sNode = range.startContainer;
                sOffset = range.startOffset;
                obj4Coord = dummyElement.$;

                while (obj4Coord.offsetParent) {
                    x += obj4Coord.offsetLeft;
                    y += obj4Coord.offsetTop;
                    obj4Coord = obj4Coord.offsetParent;
                }
                x += obj4Coord.offsetLeft;
                y += obj4Coord.offsetTop;

                //hack for removing 8203 symbol, which ckeditor insert in webkit
                sibling = dummyElement.$.nextSibling;
                if (sibling && sibling.textContent === String.fromCharCode(8203)) {
                    sibling.remove();
                }
                dummyElement.remove();

                range.setStart(sNode, sOffset);
                range.setEnd(sNode, sOffset);
                range.select();

                y = (offset.top + y + 20 - body.scrollTop());
                x = (offset.left + x - 100);

                list.css({
                    'top': y + 'px',
                    'left': (x < offset.left ? offset.left + 10 : x) + 'px'
                });
            };

            function setUserLink() {
                var item = list.find('.active'),
                    userLinkHtml = '<a class="user-hover" data-context="' + window.location.protocol + '//' + window.location.host + AJS.Meta.get('context-path') + '" data-mention="' + makeId() + '" data-issue="' + JIRA.Issue.getIssueId() + '" href="' + window.location.origin + JIRACONTEXTPATH + '/secure/ViewProfile.jspa?name=' + item.attr('name') + '" rel="' + item.attr('name') +'">' + item.attr('displayName') + '</a>',
                    userLink = CKEDITOR.dom.element.createFromHtml(userLinkHtml, editor.document);


                lastProcessedRequest.range.setStart(lastProcessedRequest.startNode, lastProcessedRequest.startPos);
                lastProcessedRequest.range.deleteContents();
                lastProcessedRequest.range.select();

                editor.insertElement(userLink);

                hideList();
            };
            
            function makeId() {
                return (((1+Math.random())*0x10000)|0).toString(16).substring(1) + (((1+Math.random())*0x10000)|0).toString(16).substring(1);
            }

            function render(data) {

                function renderItem(data) {
                    var name = data.displayName + ' - ' + data.emailAddress + " (" + data.name + ")",
                        li = AJS.$('<li class="ul-aui-list-item"></li>')
                                .attr('name', data.name)
                                .attr('displayName', data.displayName),
                        user = AJS.$('<span class="ul-aui-list-item-link ul-aui-iconised-link">' + name + '</span>')
                                .css('background-image', 'url(' + data.avatarUrls['16x16'] + ')');

                    li.append(user);
                    return li;
                };

                function assembleList() {
                    var ul;

                    list.html('<ul></ul>');
                    ul = list.find('ul');

                    AJS.$.each(data, function(index, elem) {
                        var item = renderItem(elem);
                        if (index === 0) {
                            item.addClass('active');
                        }
                        item.click(function(){
                            list.find('.active').removeClass('active');
                            AJS.$(this).addClass('active');
                            setUserLink();
                        });
                        ul.append(item);
                    });

                }
                if (data.length > 0) {
                    assembleList();
                }
            };

            function dummyList(txt) {
                list.html('<span class="ul-not-found"><i>Found no matching users for: <b>' + txt + '</b></i></span>');
            }

            function showList() {
                if (!list.is(":visible")) {
                    moveList();
                    list.show();
                }
            };

            function hideList() {
                list.hide();
            }

            function getTextAfterAt() {
                var range = editor.getSelection().getRanges()[0],
                    startOffset,
                    res = '', startNode = null, startPos = -1, nodeTxt = null;

                if (!editor.getSelection().getRanges().length)
                    return null;
                
                startOffset = range.startOffset;
                
                if (range.startOffset !== range.endOffset) {
                	return null;
                }
                
                if (AJS.$.grep(range.startContainer.getParents(), function(item) {
                    if (!!item.$.className)
                        return (item.$.className.indexOf('jeditor-tabs') >= 0);
                    else
                        return false;
                }).length > 0)
                    return null;

                function getAllEditableNodes(range) {
                    var startNode = range.startContainer,
                        parent = startNode.getParent(),
                        res = [];

                    if (startNode.type !== CKEDITOR.NODE_TEXT && parent) {
                        return res;
                    }

                    range.collapse(true);
                    range.setStartAt(parent, CKEDITOR.POSITION_AFTER_START);

                    var walker = new CKEDITOR.dom.walker(range),
                        node;

                    while ((node = walker.previous())) {
                        if (node.type === CKEDITOR.NODE_TEXT) {
                            res.push(node);
                        }
                    }

                    return res;
                }

                nodes = getAllEditableNodes(range);

                for (var i = 0; i < nodes.length; i++) {
                    nodeTxt = nodes[i].getText();

                    if (i === 0) {
                        nodeTxt = nodeTxt.substring(0, startOffset);
                    }

                    startPos = nodeTxt.lastIndexOf('@');

                    if (
                        startPos === 0 ||
                        (startPos !== -1 && /\s/.test(nodeTxt[startPos-1]))
                    ) {
                        startNode = nodes[i];
                        res = nodeTxt.slice(startPos) + res;
                        if (res.length > NAMELENGTH) {
                            startPos = -1;
                        }
                        break;
                    }

                    res = nodeTxt + res;
                    if (res.length > NAMELENGTH) {
                        startPos = -1;
                        break;
                    }
                };

                if (
                    startPos === -1 ||
                    startNode === null ||
                    FORBIDDENPARENTS.indexOf(startNode.$.parentNode.tagName) !== -1
                ) {
                    return null;
                } else {
                    return {startPos: startPos, res: res, startNode: startNode, range: range};
                }
            };

            function findPattern() {
                var request = getTextAfterAt(),
                    username = request ? AJS.$.trim(request.res.substring(1).replace(/[\u200B-\u200D\uFEFF]/g, '')) : '',
                    cachedData,
                    projectKey = '',
                    issueKey = JIRA.Issue.getIssueKey() || '';
                
                if (typeof issueKey !== 'string')
                    issueKey = '';
                if (!!editor.element.getAttribute('data-projectkey'))
                    projectKey = editor.element.getAttribute('data-projectkey');
                else
                if (!JIRA.Dialog.current)
                    projectKey = issueKey.slice(0, issueKey.indexOf('-'));
                else
                if (JIRA.Dialog.current.options.id !== 'create-issue-dialog' && JIRA.Dialog.current.options.id !== 'create-subtask-dialog')
                    projectKey = issueKey.slice(0, issueKey.indexOf('-'));
                
                if (projectKey === '')
                    URL = JIRACONTEXTPATH + '/rest/api/2/user/search?maxResults=10&username=';
                else
                    projectKey = '&projectKey=' + projectKey;

                function fillList() {
                    dummyList(username);
                    showList();
                    lastProcessedRequest = request;
                }

                if (username) {

                    cachedData = getFromCache(username);

                    if (cachedData.data === undefined) {
                        fillList();

                        if (username.charCodeAt(0) > 1000)
                            AJS.$.get(URL + encodeURIComponent(username) + projectKey, function(data) {
	                            render(data);
	                            putToCache(username, data);
	                        });
                        else
                            AJS.$.get(URL + username + projectKey, function(data) {
	                            render(data);
	                            putToCache(username, data);
	                        });

                    } else {
                        if (cachedData.type === 'prediction') {
                            hideList();
                        } else {
                            fillList();
                            render(cachedData.data);
                        }
                    }

                } else {
                    hideList();
                }
            };

            function init() {
                body = AJS.$(editor.document.$.body);

                if (!CKEDITOR.isUserListStylesApplied) {
                    AJS.$('head').append(AJS.$(CSS));
                    CKEDITOR.isUserListStylesApplied = true;
                }
                
                list = AJS.$(TMPL);
                AJS.$('body').append(list);

                body.bind('click', function(){
                	eventType = 'click';
                    moveList();
                    findPattern();
                });
                body.bind('keyup', function(event) {
                    if (event.which === 27) {
                        hideList();
                    }

                    if (
                        IGNOREDKEYS.indexOf(event.which) !== -1 ||
                        ((LISTCONTORLKEYS.indexOf(event.which) !== -1) && list.is(':visible'))
                    ) {
                        return;
                    }
                    eventType = 'keyup';
                    findPattern();
                });
                body.bind('focus', function() {
                	eventType = 'focus';
                    moveList();
                    findPattern();
                });
                editor.on('blur', function() {
                	eventType = 'blur';
                    hideList();
                });


                editor.on('key', function (event) {
                    var allItems = list.find('li'),
                        activeIndex = 0,
                        n = allItems.length;

                    if (
                        (LISTCONTORLKEYS.indexOf(event.data.keyCode) !== -1) &&
                        list.is(':visible') &&
                        n > 0
                    ) {
                        allItems.each(function(i){
                            if (AJS.$(this).hasClass('active')) {
                                activeIndex = i;
                            }
                        });

                        if (event.data.keyCode === 38) {
                            //up
                            activeIndex--;
                            if (activeIndex < 0) {
                                activeIndex = n-1;
                            }
                        } else if (event.data.keyCode === 40) {
                            //down
                            activeIndex++;
                            if (activeIndex === n) {
                                activeIndex = 0;
                            }
                        }

                        list.find('.active').removeClass('active');
                        AJS.$(allItems.get(activeIndex)).addClass('active');

                        if (event.data.keyCode === 13) {
                            setUserLink();
                        }

                        event.cancel();
                    }
                });

            };

            init();
        };

        editor.on('dataReady', function() {
            if (editor.mode === 'wysiwyg') {
                UserList(editor);
            }
        });
        
        editor.on('mode', function() {
            if (editor.mode === 'wysiwyg') {
                UserList(editor);
            }
        });

    }
});
