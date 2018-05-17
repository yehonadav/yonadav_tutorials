/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
.pos-relative {position:relative}
.cke_floatingtools{position:absolute;z-index:999;left:0;top:-500px;border:1px solid #ccc;border-radius:3px;box-shadow: 0 1px 5px rgba(0,0,0,0.3);transition:opacity .1s;-o-transition:opacity .1s;-moz-transition:opacity .1s;-webkit-transition:opacity .1s;}
.cke_floatingtools .cke_combo .cke_combo_button{margin: 0 2px;}
.cke_reset{margin:0;padding:0;border:0;background:transparent;text-decoration:none;width:auto;height:auto;vertical-align:baseline}
.cke_reset_all,.cke_reset_all *{margin:0;padding:0;border:0;background:transparent;text-decoration:none !important;width:auto;height:auto;vertical-align:baseline;border-collapse:collapse;font:normal normal normal 12px Arial,Helvetica,Tahoma,Verdana,Sans-Serif;color:#000;text-align:left;white-space:nowrap;cursor:auto}
.cke_reset_all .cke_rtl *{text-align:right}
.cke_reset_all iframe{vertical-align:inherit}
.cke_reset_all textarea{white-space:pre}
.cke_reset_all textarea,.cke_reset_all input[type="text"],.cke_reset_all input[type="password"]{cursor:text}
.cke_reset_all textarea[disabled],.cke_reset_all input[type="text"][disabled],.cke_reset_all input[type="password"][disabled]{cursor:default}
.cke_reset_all fieldset{padding:10px;border:2px groove #e0dfe3}
.cke_chrome{display:block;border:1px solid #ccc;padding:0}
.cke_inner{display:block;-webkit-touch-callout:none;background:#fff;padding:0}
.cke_float{border:0}
.cke_float .cke_inner{padding-bottom:0}
.cke_top,.cke_contents,.cke_bottom{display:block;overflow:hidden}
.cke_top{border-bottom:1px solid #ccc;padding:2px 2px 1px;background:#f2f2f2;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));background-image:-moz-linear-gradient(top,#fff,#f2f2f2);background-image:-webkit-linear-gradient(top,#fff,#f2f2f2);background-image:-o-linear-gradient(top,#fff,#f2f2f2);background-image:-ms-linear-gradient(top,#fff,#f2f2f2);background-image:linear-gradient(top,#fff,#f2f2f2);filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr='#ffffffff',endColorstr='#fff2f2f2')}
.cke_float .cke_top{border:1px solid #ccc;border-bottom-color:#999}
.cke_bottom{padding:4px 8px 2px 0;position:relative}
.cke_resizer{width:0;height:0;overflow:hidden;width:0;height:0;overflow:hidden;border-width:10px 10px 0 0;border-color:transparent #888 transparent transparent;border-style:dashed solid dashed dashed;font-size:0;vertical-align:bottom;margin-top:4px;margin-bottom:2px;-moz-box-shadow:0 1px 0 rgba(255,255,255,.3);-webkit-box-shadow:0 1px 0 rgba(255,255,255,.3);box-shadow:0 1px 0 rgba(255,255,255,.3)}
.cke_hc .cke_resizer{font-size:15px;width:auto;height:auto;border-width:0}
.cke_resizer_ltr{cursor:se-resize;float:right;margin-right:-4px}
.cke_resizer_rtl{border-width:10px 0 0 10px;border-color:transparent transparent transparent #a5a5a5;border-style:dashed dashed dashed solid;cursor:sw-resize;float:left;margin-left:-4px;right:auto}
.cke_wysiwyg_div{display:block;height:100%;overflow:auto;padding:0 8px;outline-style:none}
.cke_panel{visibility:visible;width:120px;height:100px;overflow:hidden;background-color:#fff;border:1px solid #ccc;border-bottom-color:#999;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;-moz-box-shadow:0 0 3px rgba(0,0,0,.15);-webkit-box-shadow:0 0 3px rgba(0,0,0,.15);box-shadow:0 0 3px rgba(0,0,0,.15)}
.cke_menu_panel{padding:0;margin:0}
.cke_combopanel{width:180px;height:170px}
.cke_panel_frame{width:100%;height:100%;font-size:12px;overflow:auto;overflow-x:hidden}
.cke_panel_container{overflow-y:auto;overflow-x:hidden}
.cke_panel_list{list-style-type:none;margin:3px;padding:0;white-space:nowrap}
.cke_panel_listItem{margin:0;padding-bottom:1px}
.cke_panel_listItem a{padding:3px 4px;display:block;border:1px solid #fff;color:inherit!important;text-decoration:none;overflow:hidden;text-overflow:ellipsis;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px}
* html .cke_panel_listItem a{width:100%;color:#000}
*:first-child+html .cke_panel_listItem a{color:#000}
.cke_panel_listItem.cke_selected a{border:1px solid #dedede;background-color:#f2f2f2;-moz-box-shadow:0 0 2px rgba(0,0,0,.1) inset;-webkit-box-shadow:0 0 2px rgba(0,0,0,.1) inset;box-shadow:0 0 2px rgba(0,0,0,.1) inset}
.cke_panel_listItem a:hover,.cke_panel_listItem a:focus,.cke_panel_listItem a:active{border-color:#dedede;background-color:#f2f2f2;-moz-box-shadow:0 0 2px rgba(0,0,0,.1) inset;-webkit-box-shadow:0 0 2px rgba(0,0,0,.1) inset;box-shadow:0 0 2px rgba(0,0,0,.1) inset}
.cke_hc .cke_panel_listItem a{border-style:none}
.cke_hc .cke_panel_listItem a:hover,.cke_hc .cke_panel_listItem a:focus,.cke_hc .cke_panel_listItem a:active{border:2px solid;padding:1px 2px}
.cke_panel_grouptitle{font-size:11px;font-weight:bold;white-space:nowrap;margin:0;padding:4px 6px;color:#474747;text-shadow:0 1px 0 rgba(255,255,255,.75);border-bottom:1px solid #ccc;-moz-border-radius:2px 2px 0 0;-webkit-border-radius:2px 2px 0 0;border-radius:2px 2px 0 0;background:#f2f2f2;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));background-image:-moz-linear-gradient(top,#fff,#f2f2f2);background-image:-webkit-linear-gradient(top,#fff,#f2f2f2);background-image:-o-linear-gradient(top,#fff,#f2f2f2);background-image:-ms-linear-gradient(top,#fff,#f2f2f2);background-image:linear-gradient(top,#fff,#f2f2f2);filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr='#ffffffff',endColorstr='#fff2f2f2')}
.cke_panel_listItem p,.cke_panel_listItem h1,.cke_panel_listItem h2,.cke_panel_listItem h3,.cke_panel_listItem h4,.cke_panel_listItem h5,.cke_panel_listItem h6,.cke_panel_listItem pre{margin-top:0;margin-bottom:0}
.cke_colorblock{padding:3px;font-size:11px;font-family:'Microsoft Sans Serif',Tahoma,Arial,Verdana,Sans-Serif}
.cke_colorblock,.cke_colorblock a{text-decoration:none;color:#000}
span.cke_colorbox{width:10px;height:10px;border:#808080 1px solid;float:left}
.cke_rtl span.cke_colorbox{float:right}
a.cke_colorbox{border:#fff 1px solid;padding:2px;float:left;width:12px;height:12px}
.cke_rtl a.cke_colorbox{float:right}
a:hover.cke_colorbox,a:focus.cke_colorbox,a:active.cke_colorbox{border:#ccc 1px solid;background-color:#e5e5e5}
a.cke_colorauto,a.cke_colormore{border:#fff 1px solid;padding:2px;display:block;cursor:pointer}
a:hover.cke_colorauto,a:hover.cke_colormore,a:focus.cke_colorauto,a:focus.cke_colormore,a:active.cke_colorauto,a:active.cke_colormore{border:#ccc 1px solid;background-color:#e5e5e5}
.cke_toolbar{float:left}
.cke_rtl .cke_toolbar{float:right}
.cke_toolgroup{float:left;margin:0 2px 2px 0}
.cke_hc .cke_toolgroup{border:0;margin-right:10px;margin-bottom:10px}
.cke_rtl .cke_toolgroup *:first-child{-moz-border-radius:0 2px 2px 0;-webkit-border-radius:0 2px 2px 0;border-radius:0 2px 2px 0}
.cke_rtl .cke_toolgroup *:last-child{-moz-border-radius:2px 0 0 2px;-webkit-border-radius:2px 0 0 2px;border-radius:2px 0 0 2px}
.cke_rtl .cke_toolgroup{float:right;margin-left:6px;margin-right:0}
a.cke_button{display:inline-block;height:18px;padding:4px 6px;outline:0;cursor:default;float:left;border:0}
.cke_rtl .cke_button{float:right}
.cke_hc .cke_button{border:1px solid black;padding:3px 5px;margin:-2px 4px 0 -2px}
.cke_button_on{background:#a3d7ff}
.cke_hc .cke_button_on,.cke_hc a.cke_button_off:hover,.cke_hc a.cke_button_off:focus,.cke_hc a.cke_button_off:active,.cke_hc a.cke_button_disabled:hover,.cke_hc a.cke_button_disabled:focus,.cke_hc a.cke_button_disabled:active{border-width:3px;padding:1px 3px}
.cke_button_disabled .cke_button_icon{opacity:.3}
.cke_hc .cke_button_disabled{opacity:.5}
a.cke_button_off:hover,a.cke_button_off:focus,a.cke_button_off:active,a.cke_button_disabled:hover,a.cke_button_disabled:focus,a.cke_button_disabled:active{background:#d3ecff}
.cke_button_icon{cursor:inherit;background-repeat:no-repeat;margin-top:1px;width:16px;height:16px;float:left;display:inline-block}
.cke_rtl .cke_button_icon{float:right}
.cke_hc .cke_button_icon{display:none}
.cke_button_label{display:none;padding-left:3px;margin-top:1px;line-height:17px;vertical-align:middle;float:left;cursor:default;color:#474747;text-shadow:0 1px 0 rgba(255,255,255,.5)}
.cke_rtl .cke_button_label{padding-right:3px;padding-left:0;float:right}
.cke_hc .cke_button_label{padding:0;display:inline-block;font-size:12px}
.cke_button_arrow{display:inline-block;margin:8px 0 0 1px;width:0;height:0;cursor:default;vertical-align:top;border-left:3px solid transparent;border-right:3px solid transparent;border-top:3px solid #474747}
.cke_rtl .cke_button_arrow{margin-right:5px;margin-left:0}
.cke_hc .cke_button_arrow{font-size:10px;margin:3px -2px 0 3px;width:auto;border:0}
.cke_toolbar_separator{float:left;background-color:#c0c0c0;background-color:rgba(0,0,0,.2);margin:5px 2px 0;height:18px;width:1px;-webkit-box-shadow:1px 0 1px rgba(255,255,255,.5);-moz-box-shadow:1px 0 1px rgba(255,255,255,.5);box-shadow:1px 0 1px rgba(255,255,255,.5)}
.cke_rtl .cke_toolbar_separator{float:right;-webkit-box-shadow:-1px 0 1px rgba(255,255,255,.1);-moz-box-shadow:-1px 0 1px rgba(255,255,255,.1);box-shadow:-1px 0 1px rgba(255,255,255,.1)}
.cke_hc .cke_toolbar_separator{width:0;border-left:1px solid;margin:1px 5px 0 0}
.cke_toolbar_break{display:block;clear:left}
.cke_rtl .cke_toolbar_break{clear:right}
.cke_toolbox_collapser{display:none;width:12px;height:11px;float:right;margin:11px 2px 0;font-size:0;cursor:default;text-align:center;border:1px solid #a6a6a6;border-bottom-color:#979797;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;-moz-box-shadow:0 1px 0 rgba(255,255,255,.5),0 0 2px rgba(255,255,255,.15) inset,0 1px 0 rgba(255,255,255,.15) inset;-webkit-box-shadow:0 1px 0 rgba(255,255,255,.5),0 0 2px rgba(255,255,255,.15) inset,0 1px 0 rgba(255,255,255,.15) inset;box-shadow:0 1px 0 rgba(255,255,255,.5),0 0 2px rgba(255,255,255,.15) inset,0 1px 0 rgba(255,255,255,.15) inset;background:#e4e4e4;background-image:-webkit-gradient(linear,left top,left bottom,from(#fff),to(#e4e4e4));background-image:-moz-linear-gradient(top,#fff,#e4e4e4);background-image:-webkit-linear-gradient(top,#fff,#e4e4e4);background-image:-o-linear-gradient(top,#fff,#e4e4e4);background-image:-ms-linear-gradient(top,#fff,#e4e4e4);background-image:linear-gradient(top,#fff,#e4e4e4);filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr='#ffffffff',endColorstr='#ffe4e4e4')}
.cke_toolbox_collapser:hover{display:none;background:#ccc;background-image:-webkit-gradient(linear,left top,left bottom,from(#f2f2f2),to(#ccc));background-image:-moz-linear-gradient(top,#f2f2f2,#ccc);background-image:-webkit-linear-gradient(top,#f2f2f2,#ccc);background-image:-o-linear-gradient(top,#f2f2f2,#ccc);background-image:-ms-linear-gradient(top,#f2f2f2,#ccc);background-image:linear-gradient(top,#f2f2f2,#ccc);filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr='#fff2f2f2',endColorstr='#ffcccccc')}
.cke_toolbox_collapser.cke_toolbox_collapser_min{margin:2px 2px 4px;display:none;}
.cke_rtl .cke_toolbox_collapser{display:none;float:left}
.cke_toolbox_collapser .cke_arrow{display:inline-block;height:0;width:0;font-size:0;margin-top:1px;border-left:3px solid transparent;border-right:3px solid transparent;border-bottom:3px solid #474747;border-top:3px solid transparent}
.cke_toolbox_collapser.cke_toolbox_collapser_min .cke_arrow{margin-top:4px;border-bottom-color:transparent;border-top-color:#474747}
.cke_hc .cke_toolbox_collapser .cke_arrow{font-size:8px;width:auto;border:0;margin-top:0;margin-right:2px}
.cke_menubutton{display:block}
.cke_menuitem span{cursor:default}
.cke_menubutton:hover,.cke_menubutton:focus,.cke_menubutton:active{background-color:#d3d3d3;display:block}
.cke_hc .cke_menubutton{padding:2px}
.cke_hc .cke_menubutton:hover,.cke_hc .cke_menubutton:focus,.cke_hc .cke_menubutton:active{border:2px solid;padding:0}
.cke_menubutton_inner{display:table-row}
.cke_menubutton_icon,.cke_menubutton_label,.cke_menuarrow{display:table-cell}
.cke_menubutton_icon{background-color:#d7d8d7;opacity:.70;filter:alpha(opacity=70);padding:4px}
.cke_hc .cke_menubutton_icon{height:16px;width:0;padding:4px 0}
.cke_menubutton:hover .cke_menubutton_icon,.cke_menubutton:focus .cke_menubutton_icon,.cke_menubutton:active .cke_menubutton_icon{background-color:#d0d2d0}
.cke_menubutton_disabled:hover .cke_menubutton_icon,.cke_menubutton_disabled:focus .cke_menubutton_icon,.cke_menubutton_disabled:active .cke_menubutton_icon{opacity:.3;filter:alpha(opacity=30)}
.cke_menubutton_label{padding:0 5px;background-color:transparent;width:100%;vertical-align:middle}
.cke_menubutton_disabled .cke_menubutton_label{opacity:.3;filter:alpha(opacity=30)}
.cke_menubutton:hover,.cke_menubutton:focus,.cke_menubutton:active{background-color:#eff0ef}
.cke_panel_frame .cke_menubutton_label{display:none}
.cke_menuseparator{background-color:#d3d3d3;height:1px;filter:alpha(opacity=70);opacity:.70}
.cke_menuarrow{background-image:url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/images/arrow.png&t=2.3.7);background-position:0 10px;background-repeat:no-repeat;padding:0 5px}
.cke_rtl .cke_menuarrow{background-position:5px -13px;background-repeat:no-repeat}
.cke_menuarrow span{display:none}
.cke_hc .cke_menuarrow span{vertical-align:middle;display:inline}
.cke_combo{display:inline-block;float:left;margin: 0 0 2px 0}
.cke_rtl .cke_combo{float:right}
.cke_hc .cke_combo{margin-top:-2px}
.cke_combo_label{display:none;float:left;line-height:26px;vertical-align:top;margin-right:5px}
.cke_rtl .cke_combo_label{float:right;margin-left:5px;margin-right:0}
.cke_combo_button{display:inline-block;float:left;margin:0 6px;text-decoration:none}
.cke_combo_off a.cke_combo_button:hover,.cke_combo_off a.cke_combo_button:focus{background:#d3ecff;outline:0}
.cke_combo_off a.cke_combo_button:active,.cke_combo_on a.cke_combo_button{background:#A3D7FF}
.cke_rtl .cke_combo_button{float:right;margin-left:5px;margin-right:0}
.cke_hc a.cke_combo_button{padding:3px}
.cke_hc .cke_combo_on a.cke_combo_button,.cke_hc .cke_combo_off a.cke_combo_button:hover,.cke_hc .cke_combo_off a.cke_combo_button:focus,.cke_hc .cke_combo_off a.cke_combo_button:active{border-width:3px;padding:1px}
.cke_combo_text{line-height:26px;padding-left:8px;text-overflow:ellipsis;overflow:hidden;float:left;cursor:default;color:#474747;text-shadow:0 1px 0 rgba(255,255,255,.5);width:auto}
.cke_rtl .cke_combo_text{float:right;text-align:right;padding-left:0;padding-right:10px}
.cke_hc .cke_combo_text{line-height:18px;font-size:12px}
.cke_combo_open{cursor:default;display:inline-block;font-size:0;height:19px;line-height:17px;margin:1px 6px 1px 9px;width:5px}
.cke_hc .cke_combo_open{height:12px}
.cke_combo_arrow{margin:11px 0 0;float:left;height:0;width:0;font-size:0;border-left:3px solid transparent;border-right:3px solid transparent;border-top:3px solid #474747}
.cke_hc .cke_combo_arrow{font-size:10px;width:auto;border:0;margin-top:3px}
.cke_combo_disabled .cke_combo_inlinelabel,.cke_combo_disabled .cke_combo_open{opacity:.3}
.cke_path{float:left;margin:-2px 0 2px}
.cke_path_item,.cke_path_empty{display:inline-block;float:left;padding:1px 4px;margin-right:2px;cursor:default;text-decoration:none;outline:0;border:0;color:#4c4c4c;text-shadow:0 1px 0 #fff;font-weight:bold;font-size:11px}
.cke_rtl .cke_path,.cke_rtl .cke_path_item,.cke_rtl .cke_path_empty{float:right}
a.cke_path_item:hover,a.cke_path_item:focus,a.cke_path_item:active{background-color:#ccc;color:#333;text-shadow:0 1px 0 rgba(255,255,255,.5);-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;-moz-box-shadow:0 0 4px rgba(0,0,0,.5) inset,0 1px 0 rgba(255,255,255,.5);-webkit-box-shadow:0 0 4px rgba(0,0,0,.5) inset,0 1px 0 rgba(255,255,255,.5);box-shadow:0 0 4px rgba(0,0,0,.5) inset,0 1px 0 rgba(255,255,255,.5)}
.cke_hc a.cke_path_item:hover,.cke_hc a.cke_path_item:focus,.cke_hc a.cke_path_item:active{border:2px solid;padding:1px 2px}
.cke_button__source_label,.cke_button__sourcedialog_label{display:inline}
.cke_combo__fontsize .cke_combo_text{width:30px}
.cke_combopanel__fontsize{width:120px}
.cke_source{font-family:'Courier New',Monospace;font-size:small;background-color:#fff;white-space:pre}
.cke_wysiwyg_frame,.cke_wysiwyg_div{background-color:#fff}
.cke_chrome{visibility:inherit}
.cke_voice_label{display:none}
legend.cke_voice_label{display:none}
.cke_button__about_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -0px !important}
.cke_button__bold_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -32px !important}
.cke_button__italic_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -64px !important}
.cke_button__strike_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -96px !important}
.cke_button__subscript_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -128px !important}
.cke_button__superscript_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -160px !important}
.cke_button__underline_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -192px !important}
.cke_button__bidiltr_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -224px !important}
.cke_button__bidirtl_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -256px !important}
.cke_button__blockquote_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -288px !important}
.cke_rtl .cke_button__copy_icon,.cke_mixed_dir_content .cke_rtl .cke_button__copy_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -320px !important}
.cke_ltr .cke_button__copy_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -352px !important}
.cke_rtl .cke_button__cut_icon,.cke_mixed_dir_content .cke_rtl .cke_button__cut_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -384px !important}
.cke_ltr .cke_button__cut_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -416px !important}
.cke_rtl .cke_button__paste_icon,.cke_mixed_dir_content .cke_rtl .cke_button__paste_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -448px !important}
.cke_ltr .cke_button__paste_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -480px !important}
.cke_button__bgcolor_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -512px !important}
.cke_button__textcolor_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -544px !important}
.cke_rtl .cke_button__templates_icon,.cke_mixed_dir_content .cke_rtl .cke_button__templates_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -576px !important}
.cke_ltr .cke_button__templates_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -608px !important}
.cke_button__creatediv_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -640px !important}
.cke_rtl .cke_button__bulletedlist_icon,.cke_mixed_dir_content .cke_rtl .cke_button__bulletedlist_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -672px !important}
.cke_ltr .cke_button__bulletedlist_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -704px !important}
.cke_rtl .cke_button__numberedlist_icon,.cke_mixed_dir_content .cke_rtl .cke_button__numberedlist_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -736px !important}
.cke_ltr .cke_button__numberedlist_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -768px !important}
.cke_rtl .cke_button__indent_icon,.cke_mixed_dir_content .cke_rtl .cke_button__indent_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -800px !important}
.cke_ltr .cke_button__indent_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -832px !important}
.cke_rtl .cke_button__outdent_icon,.cke_mixed_dir_content .cke_rtl .cke_button__outdent_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -864px !important}
.cke_ltr .cke_button__outdent_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -896px !important}
.cke_rtl .cke_button__find_icon,.cke_mixed_dir_content .cke_rtl .cke_button__find_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -928px !important}
.cke_ltr .cke_button__find_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -960px !important}
.cke_button__replace_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -992px !important}
.cke_button__flash_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1024px !important}
.cke_button__button_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1056px !important}
.cke_button__checkbox_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1088px !important}
.cke_button__form_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1120px !important}
.cke_button__hiddenfield_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1152px !important}
.cke_button__imagebutton_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1184px !important}
.cke_button__radio_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1216px !important}
.cke_rtl .cke_button__select_icon,.cke_mixed_dir_content .cke_rtl .cke_button__select_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1248px !important}
.cke_ltr .cke_button__select_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1280px !important}
.cke_rtl .cke_button__textarea_icon,.cke_mixed_dir_content .cke_rtl .cke_button__textarea_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1312px !important}
.cke_ltr .cke_button__textarea_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1344px !important}
.cke_rtl .cke_button__textfield_icon,.cke_mixed_dir_content .cke_rtl .cke_button__textfield_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1376px !important}
.cke_ltr .cke_button__textfield_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1408px !important}
.cke_button__horizontalrule_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1440px !important}
.cke_button__iframe_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1472px !important}
.cke_button__image_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1504px !important}
.cke_button__justifyblock_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1536px !important}
.cke_button__justifycenter_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1568px !important}
.cke_button__justifyleft_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1600px !important}
.cke_button__justifyright_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1632px !important}
.cke_rtl .cke_button__anchor_icon,.cke_mixed_dir_content .cke_rtl .cke_button__anchor_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1664px !important}
.cke_ltr .cke_button__anchor_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1696px !important}
.cke_button__link_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1728px !important}
.cke_button__unlink_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1760px !important}
.cke_button__maximize_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1792px !important}
.cke_rtl .cke_button__newpage_icon,.cke_mixed_dir_content .cke_rtl .cke_button__newpage_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1824px !important}
.cke_ltr .cke_button__newpage_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1856px !important}
.cke_rtl .cke_button__pagebreak_icon,.cke_mixed_dir_content .cke_rtl .cke_button__pagebreak_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1888px !important}
.cke_ltr .cke_button__pagebreak_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1920px !important}
.cke_rtl .cke_button__pastetext_icon,.cke_mixed_dir_content .cke_rtl .cke_button__pastetext_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1952px !important}
.cke_ltr .cke_button__pastetext_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -1984px !important}
.cke_rtl .cke_button__pastefromword_icon,.cke_mixed_dir_content .cke_rtl .cke_button__pastefromword_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2016px !important}
.cke_ltr .cke_button__pastefromword_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2048px !important}
.cke_rtl .cke_button__preview_icon,.cke_mixed_dir_content .cke_rtl .cke_button__preview_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2080px !important}
.cke_ltr .cke_button__preview_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2112px !important}
.cke_button__print_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2144px !important}
.cke_button__removeformat_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2176px !important}
.cke_button__save_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2208px !important}
.cke_rtl .cke_button__showblocks_icon,.cke_mixed_dir_content .cke_rtl .cke_button__showblocks_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2272px !important}
.cke_ltr .cke_button__showblocks_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2304px !important}
.cke_button__smiley_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2336px !important}
.cke_rtl .cke_button__source_icon,.cke_mixed_dir_content .cke_rtl .cke_button__source_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2368px !important}
.cke_ltr .cke_button__source_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2400px !important}
.cke_button__specialchar_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2432px !important}
.cke_button__table_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2464px !important}
.cke_button__scayt_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2240px !important}
.cke_rtl .cke_button__redo_icon,.cke_mixed_dir_content .cke_rtl .cke_button__redo_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2592px !important}
.cke_ltr .cke_button__redo_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2528px !important}
.cke_rtl .cke_button__undo_icon,.cke_mixed_dir_content .cke_rtl .cke_button__undo_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2560px !important}
.cke_ltr .cke_button__undo_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2496px !important}
.cke_rtl .cke_button__restore_icon,.cke_mixed_dir_content .cke_rtl .cke_button__restore_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3328px !important}
.cke_ltr .cke_button__restore_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2208px !important}
.cke_button__code_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3232px !important}
.cke_button__mention_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3264px !important}
.cke_button__handytabs_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3360px !important}
.cke_button__mathjax_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3296px !important}
.cke_button__tablecell_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2624px !important}
.cke_button__tablecell_insertBefore_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2688px !important}
.cke_button__tablecell_insertAfter_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2656px !important}
.cke_button__tablecell_delete_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2720px !important}
.cke_button__tablecell_merge_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2752px !important}
.cke_button__tablecell_split_horizontal_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2784px !important}
.cke_button__tablecell_split_vertical_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2816px !important}
.cke_button__tablecell_properties_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2848px !important}
.cke_button__tablecell_merge_right_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2880px !important}
.cke_button__tablecell_merge_down_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2912px !important}
.cke_button__tablerow_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2944px !important}
.cke_button__tablecolumn_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -2976px !important}
.cke_button__tabledelete_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3008px !important}
.cke_button__tablerow_insertBefore_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3040px !important}
.cke_button__tablerow_insertAfter_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3072px !important}
.cke_button__tablerow_delete_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3104px !important}
.cke_button__tablecolumn_insertBefore_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3136px !important}
.cke_button__tablecolumn_insertAfter_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3168px !important}
.cke_button__tablecolumn_delete_icon{background: url(/plugins/servlet/jeditor_ck_provider.jsp?file=skins/moonocolor/icons.png&t=2.3.7) no-repeat 0 -3200px !important}
.cke_wysiwyg_div p{padding: 5px 0; margin-top: 0 !important}
.cke_wysiwyg_div p:first-child{padding-top: 8px !important}