;
/* module-key = 'com.atlassian.jira.jira-tzdetect-plugin:tzdetect-lib', location = 'banner/tzdetect-banner.js' */
(function(){require(["jquery","jira/flag"],function(G,C){function E(H){return(+H||0)*60*1000}function B(H){return Math.floor((+H||0)/1000/60)}function D(H){return function I(J){if(J.which===1&&!J.shiftKey&&!J.ctrlKey&&!J.metaKey){H.apply(this,arguments)}}}var F=AJS.contextPath()+"/rest/tzdetect/1";var A={$tzFlag:null,$link:null,$dropdown:null,prefs:{},detected:{}};A.init=function(){if(A.$tzFlag){return }A.detectTimezoneOffsets();if(A.detected.janOffset!=null&&A.detected.julyOffset!=null){var H=A.detected.janOffset!=A.prefs.janOffset||A.detected.julyOffset!=A.prefs.julyOffset;if(H){A.create()}}};A.detectTimezoneOffsets=function(){A.prefs=A.getPreferences();if(!A.prefs.tzid){return }A.detected.janOffset=A.getTzOffset(0);A.detected.julyOffset=A.getTzOffset(6)};A.create=function(){var L=A.profileLink();var M=AJS.format("Your computer\'\'s time zone does not appear to match your JIRA time zone preference of {0}.",A.prefs.tzname);var I="Update your JIRA preference";var K=JIRA.plugins.tzdetect.soy.banner({message:M,updateLinkText:I,updateLink:L+"#zone-set"});var J=[E(A.detected.janOffset),E(A.detected.julyOffset)].join(",");var H=C.showInfoMsg(null,K,{dismissalKey:"com.atlassian.jira.tzdetect."+J});if(H){A.$tzFlag=G(H);A.getPotentialZones();A.$tzFlag.on("aui-flag-close",function(){A.track("clicked.nothanks");A.$tzFlag=undefined});A.$link=A.$tzFlag.find(".tz-yes");A.$link.click(D(function(N){N.preventDefault();A.getPotentialZones().then(A.handleZoneData)}));A.track("shown")}};A.track=function(J,H){var I={name:"tzdetect.banner."+J};if(H){I.data=H}AJS.trigger("analyticsEvent",I)};A.profileLink=function(){return AJS.contextPath()+"/secure/ViewProfile.jspa"};A.redirect=function(H){window.location=H};A.getPreferences=function(){var L="tzdetect.pref.";var K=["tzid","tzname","janOffset","julyOffset"];var H={};var J=K.length;var I,M;while(J--){I=K[J];M=WRM.data.claim(L+I);if(I.indexOf("Offset")>-1){M=B(M)}H[I]=M}return H};A.handleZoneData=function(K){var I=A.filterZoneData(K.zones);var H=I.length;I.regions={};var J=K.regions.length,L;while(J--){L=K.regions[J];I.regions[L.key]=L.displayName}I.sort(function(O,N){var Q=O.regionKey;var P=N.regionKey;if(Q==P){return O.city<N.city?-1:1}return Q<P?-1:1});A.track("clicked.update",{matchingZoneCount:H});if(!H){A.redirect(A.$link.attr("href"));return }if(H===1){A.setUserTimeZone(I[0].timeZoneId,"banner");return }if(!A.$dropdown){var M="timezone-selection-list";A.$link.addClass("aui-dropdown2-trigger").attr("aria-owns",M).attr("aria-haspopup","true");A.$dropdown=AJS.$(JIRA.plugins.tzdetect.soy.dropdown({id:M,sections:A.getListSections(I),baseHref:A.profileLink()})).css("z-index",5000).on("click","a",D(function(P){var O=AJS.$(this);var Q=O.attr("data-tzid");if(Q){P.preventDefault();A.setUserTimeZone(Q,"menu")}else{if(O.attr("data-tzother")){var N={offsets:[A.detected.janOffset,A.detected.julyOffset].join(",")};A.track("menu.other",N)}}})).appendTo("body")}A.$dropdown.trigger("aui-button-invoke")};A.filterZoneData=function(H){var I=["Antarctica","Etc"];return _.filter(H,function(J){return !_.contains(I,J.regionKey)})};A.getListSections=function(H){var N=[];var L,K,M;for(var I=0,J=H.length;I<J;I++){L=H[I].regionKey;if(L!==K){M={region:H.regions[L]||L,zones:[]};N.push(M);K=L}M.zones.push(H[I])}N.push({other:"Other\u2026"});return N};A.getTzOffset=function(J){var I=new Date().getFullYear();var H=new Date(I,J,1,12,0,0);return -H.getTimezoneOffset()};A.getPotentialZones=function(){var H=G.Deferred();if(A.zoneList){H.resolve(A.zoneList)}else{var I={janOffset:E(A.detected.janOffset),julyOffset:E(A.detected.julyOffset)};JIRA.SmartAjax.makeRequest({url:F+"/zones",type:"GET",data:I,contentType:"application/json",complete:function(L,J,K){if(J!="abort"&&K.successful){A.zoneList=K.data;H.resolve(A.zoneList)}else{H.reject(K)}}})}return H.promise()};A.setUserTimeZone=function(I,H){A.track("setzone",{zoneId:I,source:H});JIRA.SmartAjax.makeRequest({url:F+"/update",type:"POST",data:I,contentType:"application/json",complete:function(N,J,K){if(J!="abort"&&K.successful){if(A.$tzFlag){A.$tzFlag.find(".aui-icon.icon-close").click()}if(JIRA.Messages){var M=K.data;var L=AJS.format("Your default time zone has been set to {0}.",M.gmtOffset+" "+M.city);JIRA.Messages.showSuccessMsg(L,{closeable:true})}}}})};G(function(){if(!window.__tzTesting&&WRM.data.claim("tzdetect.pref.auto.detect")==true){A.init()}});(JIRA.plugins||(JIRA.plugins={})).tzBanner=A})})();;
;
/* module-key = 'com.atlassian.jira.jira-tzdetect-plugin:tzdetect-lib', location = 'banner/tzdetect-banner.soy' */
// This file was automatically generated from tzdetect-banner.soy.
// Please don't edit this file by hand.

/**
 * @fileoverview Templates in namespace JIRA.plugins.tzdetect.soy.
 */

if (typeof JIRA == 'undefined') { var JIRA = {}; }
if (typeof JIRA.plugins == 'undefined') { JIRA.plugins = {}; }
if (typeof JIRA.plugins.tzdetect == 'undefined') { JIRA.plugins.tzdetect = {}; }
if (typeof JIRA.plugins.tzdetect.soy == 'undefined') { JIRA.plugins.tzdetect.soy = {}; }


JIRA.plugins.tzdetect.soy.banner = function(opt_data, opt_ignored) {
  return soy.$$escapeHtml(opt_data.message) + '<p><a class="tz-yes" href="' + soy.$$escapeHtml(opt_data.updateLink) + '">' + soy.$$escapeHtml(opt_data.updateLinkText) + '</a></p>';
};
if (goog.DEBUG) {
  JIRA.plugins.tzdetect.soy.banner.soyTemplateName = 'JIRA.plugins.tzdetect.soy.banner';
}


JIRA.plugins.tzdetect.soy.dropdown = function(opt_data, opt_ignored) {
  var output = '<div class="aui-dropdown2 aui-style-default"' + ((opt_data.id) ? ' id="' + soy.$$escapeHtml(opt_data.id) + '"' : '') + '>';
  var sectionList17 = opt_data.sections;
  var sectionListLen17 = sectionList17.length;
  for (var sectionIndex17 = 0; sectionIndex17 < sectionListLen17; sectionIndex17++) {
    var sectionData17 = sectionList17[sectionIndex17];
    output += '<div class="aui-dropdown2-section">';
    if (sectionData17.region) {
      output += '<strong>' + soy.$$escapeHtml(sectionData17.region) + '</strong><ul class="aui-list-truncate">';
      var zoneList24 = sectionData17.zones;
      var zoneListLen24 = zoneList24.length;
      for (var zoneIndex24 = 0; zoneIndex24 < zoneListLen24; zoneIndex24++) {
        var zoneData24 = zoneList24[zoneIndex24];
        output += '<li><a href="' + soy.$$escapeHtml(opt_data.baseHref) + '#zone-' + soy.$$escapeHtml(zoneData24.timeZoneId) + '" data-tzid="' + soy.$$escapeHtml(zoneData24.timeZoneId) + '">' + soy.$$escapeHtml(zoneData24.gmtOffset) + ' ' + soy.$$escapeHtml(zoneData24.city) + '</a></li>';
      }
      output += '</ul>';
    } else if (sectionData17.other) {
      output += '<ul class="aui-list-truncate"><li><a href="' + soy.$$escapeHtml(opt_data.baseHref) + '#zone-other" data-tzother="true">' + soy.$$escapeHtml(sectionData17.other) + '</a></li></ul>';
    }
    output += '</div>';
  }
  output += '</div>';
  return output;
};
if (goog.DEBUG) {
  JIRA.plugins.tzdetect.soy.dropdown.soyTemplateName = 'JIRA.plugins.tzdetect.soy.dropdown';
}
;