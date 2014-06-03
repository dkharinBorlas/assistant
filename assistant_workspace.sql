set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
begin
select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';
execute immediate 'alter session set nls_numeric_characters=''.,''';
end;
/
prompt  WORKSPACE 4876305109140723
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   15:36 Tuesday June 3, 2014
--   Exported By:     ASSISTANT
--   Export Type:     Workspace Export
--   Version:         4.2.4.00.08
--   Instance ID:     69424340661477
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_040200
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>4876305109140723);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace ASSISTANT...
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
end;
/
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 4878127686140859
 ,p_provisioning_company_id => 4876305109140723
 ,p_short_name => 'ASSISTANT'
 ,p_display_name => 'ASSISTANT'
 ,p_first_schema_provisioned => 'ASSISTANT'
 ,p_company_schemas => 'ASSISTANT'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'ASSISTAN'
 ,p_path_prefix => 'ASSISTANT'
 ,p_workspace_image => wwv_flow_api.g_varchar2_table
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_api.create_user_groups (
  p_id => 2390300038204280,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 2390215481204279,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 2390120135204272,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '4876212352140723',
  p_user_name    => 'ASSISTANT',
  p_first_name   => '',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> '',
  p_web_password => 'B9FC8CD2CDC9C0744B81E05EFAAEB93E',
  p_web_password_format => 'HEX_ENCODED_DIGEST_V2',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'ASSISTANT',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201405251123','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--Application Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2614428419810366,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P13_W2596214570676415',
    p_attribute_value => '2614131044810285____2614131044810285');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2668422105822138,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P18_W2665119855785495',
    p_attribute_value => '2668128787822083____2668128787822083');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2701708233564571,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P405_W3852329031687921',
    p_attribute_value => '3853503855690337____REPORT');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2712401782609839,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P22_W2699213684563927',
    p_attribute_value => '2712131789609810____2712131789609810');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2734120071710531,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P706_R28719711014469983_SORT',
    p_attribute_value => 'fsp_sort_6_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2734221109710783,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P7_R40282027968411412_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2734417815712003,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P547_W12110932631570416',
    p_attribute_value => '12131926001571445____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2478411071825698,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P2_W2474128414805205',
    p_attribute_value => '2478114575825533____2478114575825533');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2423319750679138,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2423423637679238,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____3328003692130542');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2423520093679377,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '100');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2434203612538163,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____1550029190194632');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2438212533701230,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P260_W40585608941890825',
    p_attribute_value => '40587517034894377____40587517034894377');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2438316681703216,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P386_R121204124843870496_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2480220389849550,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P58_W193057228298179754',
    p_attribute_value => '193058123804179762____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2480301462850166,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P123_R155207503157382410_SORT',
    p_attribute_value => 'fsp_sort_3_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2510416470896853,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P4005_W48422219241609962',
    p_attribute_value => '48424005315623443____48424005315623443');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2512114584901290,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P54_R201238512231343527_SORT',
    p_attribute_value => 'fsp_sort_4_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2512306550901537,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P394_W193082012240308753',
    p_attribute_value => '193082822794308759____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2514201374904312,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P4400_W27796519609844319',
    p_attribute_value => '27798220762844327____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2516127640122675,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P4307_R262121216799808381_SORT',
    p_attribute_value => 'fsp_sort_5_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2568610136913429,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P7_W2562212743666412',
    p_attribute_value => '2568316313913400____2568316313913400');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2570131897917891,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P4200_R98042408475113688_SORT',
    p_attribute_value => 'fsp_sort_2_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2520315676207762,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4350_P25_W9307709001462905',
    p_attribute_value => '9309908769463151____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2520604676207961,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'PERSISTENT_ITEM_P25_DATE',
    p_attribute_value => '.125');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2522326103208447,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4350_P29_W9294827650405715',
    p_attribute_value => '9296821143409975____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2534121302388747,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P102_R170976026405541124_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2551108227526852,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P4_W2544000711501362',
    p_attribute_value => '2550807684526799____2550807684526799');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2752418281595508,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_100_P24_W2748305345593259',
    p_attribute_value => '2752119646595478____2752119646595478');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2758109650620952,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P300_R274135113431934049_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2760112074621618,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP4000_P423_R172114705298474212_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2404210933652780,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4350_P55_W10236304983033455',
    p_attribute_value => '10238325656034902____10238325656034902');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 2406209626668586,
    p_user_id => 'ASSISTANT',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____3521529006112497');
end;
/
----------------
--service mods
--
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406011122','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406011124','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406030431','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406030449','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406021512','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406010348','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010402','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010442','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010451','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010530','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 4,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010530','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406010939','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010941','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406011423','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 4,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406011424','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406011449','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406031531','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406010830','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406010832','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406031152','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'ASSISTANT',
    p_access_date => to_date('201406031210','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406031227','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201406031247','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201405291447','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'ASSISTANT',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_040200',
    p_access_date => to_date('201405291503','YYYYMMDDHH24MI'),
    p_ip_address => '0:0:0:0:0:0:0:1',
    p_remote_user => 'apex',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...news
--
begin
null;
end;
/
--
prompt ...links
--
begin
null;
end;
/
--
prompt ...bugs
--
begin
null;
end;
/
--
prompt ...events
--
begin
null;
end;
/
--
prompt ...features
--
begin
null;
end;
/
--
prompt ...tasks
--
begin
null;
end;
/
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...task defaults
--
begin
null;
end;
/
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'ASSISTANT';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA ASSISTANT - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_040200
-- Exported 15:36 Tuesday June 3, 2014 by: ASSISTANT
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 15:36 Tuesday June 3, 2014 by: ASSISTANT
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'ASSISTANT';
 
end;
/

commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
