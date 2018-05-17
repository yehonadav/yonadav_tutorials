;
/* module-key = 'jira.webresources:user-message-flags', location = '/includes/jira/admin/admin-flags.js' */
require(["jira/util/logger","wrm/data","jquery","jira/flag"],function(logger,wrmData,$,Flags){$(function(){var data=wrmData.claim("jira.webresources:user-message-flags.adminLockout")||{};if(data.noprojects){var templates=JIRA.Templates.Flags.Admin;var title=templates.adminIssueAccessFlagTitle({});var body=templates.adminIssueAccessFlagBody({manageAccessUrl:data.manageAccessUrl});var flag=Flags.showWarningMsg(title,body,{dismissalKey:data.flagId});$(flag).find("a").on("click",function(){flag.dismiss()})}logger.trace("admin.flags.done")})});;
;
/* module-key = 'jira.webresources:user-message-flags', location = '/includes/jira/admin/admin-flags.soy' */
// This file was automatically generated from admin-flags.soy.
// Please don't edit this file by hand.

/**
 * @fileoverview Templates in namespace JIRA.Templates.Flags.Admin.
 */

if (typeof JIRA == 'undefined') { var JIRA = {}; }
if (typeof JIRA.Templates == 'undefined') { JIRA.Templates = {}; }
if (typeof JIRA.Templates.Flags == 'undefined') { JIRA.Templates.Flags = {}; }
if (typeof JIRA.Templates.Flags.Admin == 'undefined') { JIRA.Templates.Flags.Admin = {}; }


JIRA.Templates.Flags.Admin.adminIssueAccessFlagTitle = function(opt_data, opt_ignored) {
  return '' + soy.$$escapeHtml("Your current restrictions");
};
if (goog.DEBUG) {
  JIRA.Templates.Flags.Admin.adminIssueAccessFlagTitle.soyTemplateName = 'JIRA.Templates.Flags.Admin.adminIssueAccessFlagTitle';
}


JIRA.Templates.Flags.Admin.adminIssueAccessFlagBody = function(opt_data, opt_ignored) {
  var output = '';
  var start__soy5 = '<a href="' + soy.$$escapeHtml("") + '/' + soy.$$escapeHtml(opt_data.manageAccessUrl) + '">';
  var end__soy11 = '</a>';
  output += '<p id="admin-noprojects">' + soy.$$escapeHtml("You\x27ve logged in as an administrator, but you don\x27t have access to any JIRA applications. You can perform administration tasks, but you won\x27t be able to view or edit issues.") + '</p><p><a href="' + soy.$$escapeHtml("") + '/' + soy.$$escapeHtml(opt_data.manageAccessUrl) + '">' + soy.$$escapeHtml("Manage your application access.") + '</a></p>';
  return output;
};
if (goog.DEBUG) {
  JIRA.Templates.Flags.Admin.adminIssueAccessFlagBody.soyTemplateName = 'JIRA.Templates.Flags.Admin.adminIssueAccessFlagBody';
}
;