-----------------------------------------------
-- Export file for user ASSISTANT            --
-- Created by SADMIN on 26.05.2014, 23:31:56 --
-----------------------------------------------

set define off
spool assistant_objects.log

prompt
prompt Creating table ACC_ALLOCATION_ARTICLES_T
prompt ========================================
prompt
create table ASSISTANT.ACC_ALLOCATION_ARTICLES_T
(
  id_                NUMBER not null,
  name_              VARCHAR2(500 CHAR) not null,
  periodical_        VARCHAR2(500 CHAR),
  start_date_        DATE not null,
  active_            VARCHAR2(1 CHAR) not null,
  parent_article_id_ NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATION_ARTICLES_T
  add constraint ARTICLES_ALLOC_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATION_ARTICLES_T
  add constraint ARTICLES_ALLOC__UN unique (NAME_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACC_CURRENCY_T
prompt =============================
prompt
create table ASSISTANT.ACC_CURRENCY_T
(
  name_        VARCHAR2(10 CHAR) not null,
  abriveature_ VARCHAR2(3 CHAR) not null,
  qoute_       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_CURRENCY_T
  add constraint CURRENCY_PK primary key (NAME_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_CURRENCY_T
  add constraint CURRENCY_UN unique (ABRIVEATURE_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACC_ALLOCATIONS_T
prompt ================================
prompt
create table ASSISTANT.ACC_ALLOCATIONS_T
(
  id_         NUMBER not null,
  name_       VARCHAR2(500 CHAR),
  article_id_ NUMBER not null,
  date_       DATE not null,
  summ_       NUMBER not null,
  curren_     VARCHAR2(3 CHAR) not null,
  mandatory_  VARCHAR2(1 CHAR) not null,
  active_     VARCHAR2(1 CHAR) not null,
  manual_     VARCHAR2(1 CHAR) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATIONS_T
  add constraint ALLOCATION_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATIONS_T
  add constraint ALLOCATION_UN unique (NAME_, ARTICLE_ID_, DATE_, SUMM_, CURREN_, MANDATORY_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATIONS_T
  add constraint ALLOC_ARTICLES_ALLOC_FK foreign key (ARTICLE_ID_)
  references ASSISTANT.ACC_ALLOCATION_ARTICLES_T (ID_);
alter table ASSISTANT.ACC_ALLOCATIONS_T
  add constraint ALLOC_CURRENCY_FK foreign key (CURREN_)
  references ASSISTANT.ACC_CURRENCY_T (ABRIVEATURE_);

prompt
prompt Creating table ACC_KINDS_STORE_T
prompt ================================
prompt
create table ASSISTANT.ACC_KINDS_STORE_T
(
  id_   NUMBER not null,
  name_ VARCHAR2(255 CHAR) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_KINDS_STORE_T
  add constraint KINDS_STORE__PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_KINDS_STORE_T
  add constraint KINDS_STORE___UN unique (NAME_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACC_POCKETS_T
prompt ============================
prompt
create table ASSISTANT.ACC_POCKETS_T
(
  id_            NUMBER not null,
  name_          VARCHAR2(200 CHAR),
  kind_store_id_ NUMBER not null,
  summ_          NUMBER not null,
  curren_        VARCHAR2(3 CHAR) not null,
  active_        VARCHAR2(1 CHAR) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_POCKETS_T
  add constraint POCKETS_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_POCKETS_T
  add constraint POCKETS__UNV1 unique (NAME_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_POCKETS_T
  add constraint POCKETS_CURRENCY__FK foreign key (CURREN_)
  references ASSISTANT.ACC_CURRENCY_T (ABRIVEATURE_);
alter table ASSISTANT.ACC_POCKETS_T
  add constraint POCKETS_KINDS_STORE__FK foreign key (KIND_STORE_ID_)
  references ASSISTANT.ACC_KINDS_STORE_T (ID_);

prompt
prompt Creating table ACC_ALLOCATION_PAYS_T
prompt ====================================
prompt
create table ASSISTANT.ACC_ALLOCATION_PAYS_T
(
  id_         NUMBER not null,
  alloc_id_   NUMBER not null,
  summ_       NUMBER,
  curren_     VARCHAR2(3 CHAR) not null,
  pocket_id_  NUMBER not null,
  active_     VARCHAR2(1 CHAR) not null,
  summ_minus_ NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATION_PAYS_T
  add constraint ALLOCATION_PAYS__PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_ALLOCATION_PAYS_T
  add constraint ALLOC_PAYS_ALLOCATIONS_FK foreign key (ALLOC_ID_)
  references ASSISTANT.ACC_ALLOCATIONS_T (ID_);
alter table ASSISTANT.ACC_ALLOCATION_PAYS_T
  add constraint ALLOC_PAYS_POCKETS_FK foreign key (POCKET_ID_)
  references ASSISTANT.ACC_POCKETS_T (ID_);

prompt
prompt Creating table PPL_PEOPLES_T
prompt ============================
prompt
create table ASSISTANT.PPL_PEOPLES_T
(
  id_          NUMBER not null,
  family_      VARCHAR2(20 CHAR),
  name_        VARCHAR2(20 CHAR),
  father_name_ VARCHAR2(20 CHAR),
  birthday_    DATE,
  comments_    VARCHAR2(500 CHAR)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.PPL_PEOPLES_T
  add constraint PEOPLES_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACC_CREDITS_T
prompt ============================
prompt
create table ASSISTANT.ACC_CREDITS_T
(
  id_           NUMBER not null,
  who_id_       NUMBER not null,
  summ_         NUMBER not null,
  curren_       VARCHAR2(3 CHAR) not null,
  dead_line_    DATE,
  pocket_id_    NUMBER not null,
  profit_type_  VARCHAR2(10 CHAR),
  profit_value_ NUMBER,
  when_         DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_CREDITS_T
  add constraint CREDITS_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_CREDITS_T
  add constraint CREDITS__PEOPLES__FK foreign key (WHO_ID_)
  references ASSISTANT.PPL_PEOPLES_T (ID_);
alter table ASSISTANT.ACC_CREDITS_T
  add constraint CREDITS__POCKETS__FK foreign key (POCKET_ID_)
  references ASSISTANT.ACC_POCKETS_T (ID_);

prompt
prompt Creating table ACC_LOOKUP_T
prompt ===========================
prompt
create table ASSISTANT.ACC_LOOKUP_T
(
  id_               NUMBER not null,
  name_             VARCHAR2(50 CHAR) not null,
  value_display_    VARCHAR2(100 CHAR) not null,
  value_return_     VARCHAR2(100 CHAR) not null,
  output_prioritet_ NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_LOOKUP_T
  add constraint ACC_LOOKUP_PK1 primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_LOOKUP_T
  add constraint ACC_LOOKUP_UK1 unique (NAME_, VALUE_DISPLAY_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACC_MINUS_HEADERS_T
prompt ==================================
prompt
create table ASSISTANT.ACC_MINUS_HEADERS_T
(
  id_         NUMBER not null,
  alloc_id_   NUMBER not null,
  date_       DATE not null,
  summ_       NUMBER not null,
  comment_    VARCHAR2(200 CHAR),
  curr_quote_ NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_MINUS_HEADERS_T
  add constraint MINUS_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_MINUS_HEADERS_T
  add constraint MINUS_ALLOCATION_FK foreign key (ALLOC_ID_)
  references ASSISTANT.ACC_ALLOCATIONS_T (ID_);

prompt
prompt Creating table ACC_MINUS_SITES_T
prompt ================================
prompt
create table ASSISTANT.ACC_MINUS_SITES_T
(
  id_           NUMBER not null,
  alloc_pay_id_ NUMBER not null,
  summ_         NUMBER not null,
  comment_      VARCHAR2(200 CHAR),
  minus_id_     NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_MINUS_SITES_T
  add constraint MINUS_SITES_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_MINUS_SITES_T
  add constraint MINUS_SITES_UK unique (MINUS_ID_, ALLOC_PAY_ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_MINUS_SITES_T
  add constraint MINUS_SITES_ALLOCATIONS_FK foreign key (ALLOC_PAY_ID_)
  references ASSISTANT.ACC_ALLOCATION_PAYS_T (ID_);
alter table ASSISTANT.ACC_MINUS_SITES_T
  add constraint MINUS_SITES_MINUS_FK foreign key (MINUS_ID_)
  references ASSISTANT.ACC_MINUS_HEADERS_T (ID_);

prompt
prompt Creating table ACC_OPPORTUNITY_T
prompt ================================
prompt
create table ASSISTANT.ACC_OPPORTUNITY_T
(
  id_       NUMBER not null,
  name_     VARCHAR2(1000 CHAR) not null,
  date_     DATE not null,
  variaty_  NUMBER not null,
  summ_     NUMBER not null,
  curren_   VARCHAR2(3 CHAR) not null,
  comments_ VARCHAR2(200 CHAR)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_OPPORTUNITY_T
  add constraint OPPORTUNITY_PK primary key (ID_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_OPPORTUNITY_T
  add constraint OPPORTUNITY_UN unique (NAME_, DATE_)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 167
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSISTANT.ACC_OPPORTUNITY_T
  add constraint OPPORTUNITY_CURRENCY_FK foreign key (CURREN_)
  references ASSISTANT.ACC_CURRENCY_T (ABRIVEATURE_);

prompt
prompt Creating sequence ACC_ALLOCATION_ARTICLES_S
prompt ===========================================
prompt
create sequence ASSISTANT.ACC_ALLOCATION_ARTICLES_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_ALLOCATION_PAYS_S
prompt =======================================
prompt
create sequence ASSISTANT.ACC_ALLOCATION_PAYS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_ALLOCATIONS_S
prompt ===================================
prompt
create sequence ASSISTANT.ACC_ALLOCATIONS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 51
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_CREDITS_S
prompt ===============================
prompt
create sequence ASSISTANT.ACC_CREDITS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 11
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_CURRENCY_S
prompt ================================
prompt
create sequence ASSISTANT.ACC_CURRENCY_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_KINDS_STORE_S
prompt ===================================
prompt
create sequence ASSISTANT.ACC_KINDS_STORE_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_LOOKUP_S
prompt ==============================
prompt
create sequence ASSISTANT.ACC_LOOKUP_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 51
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_MINUS_HEADERS_S
prompt =====================================
prompt
create sequence ASSISTANT.ACC_MINUS_HEADERS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_MINUS_SITES_S
prompt ===================================
prompt
create sequence ASSISTANT.ACC_MINUS_SITES_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 301
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_OPPORTUNITY_S
prompt ===================================
prompt
create sequence ASSISTANT.ACC_OPPORTUNITY_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;

prompt
prompt Creating sequence ACC_POCKETS_S
prompt ===============================
prompt
create sequence ASSISTANT.ACC_POCKETS_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 91
increment by 1
cache 10;

prompt
prompt Creating sequence PPL_PEOPLES_S
prompt ===============================
prompt
create sequence ASSISTANT.PPL_PEOPLES_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 10;

prompt
prompt Creating view ACC_ALLOCATIONS_V
prompt ===============================
prompt
create or replace force view assistant.acc_allocations_v as
select a.id_,
       a.name_,
       a.article_id_ article_id_,
       aa.name_ article_name_,
       a.date_,
       a.summ_,
       nvl((select sum(ap.summ_) - sum(summ_minus_)
             from acc_allocation_pays_t ap
            where ap.alloc_id_ = a.id_
              and ap.active_ = 'Y'),
           0) summ_have_,
       nvl(round((select sum(ap.summ_) - sum(summ_minus_)
                    from acc_allocation_pays_t ap
                   where ap.alloc_id_ = a.id_
                     and ap.active_ = 'Y') * 100 / a.summ_,
                 2),
           0) || '%' summ_have_procent_,
       nvl((select sum(m.summ_)
             from acc_minus_headers_t m
            where m.alloc_id_ = a.id_),
           0) summ_min_,
       a.curren_,
       a.mandatory_
  from acc_allocations_t a, acc_allocation_articles_t aa
 where a.article_id_ = aa.id_;

prompt
prompt Creating view ACC_POCKETS_V
prompt ===========================
prompt
create or replace force view assistant.acc_pockets_v as
select p.id_ id_,
       p.name_ name_,
       p.kind_store_id_ kind_store_id_,
       ks.name_ kind_store_name_,
       p.summ_ summ_,
       (select nvl(sum(ap.summ_),0)
          from assistant.acc_allocation_pays_t ap
         where p.id_ = ap.pocket_id_) summ_busy_,
       (p.summ_ - (select nvl(sum(ap.summ_),0)
                     from assistant.acc_allocation_pays_t ap
                    where p.id_ = ap.pocket_id_)) summ_avlb_,
       p.curren_ curren_,
       p.active_
  from assistant.acc_pockets_t p, assistant.acc_kinds_store_t ks
  where p.kind_store_id_ = ks.id_;

prompt
prompt Creating view ACC_ALLOCATION_PAYS_V
prompt ===================================
prompt
create or replace force view assistant.acc_allocation_pays_v as
select ap.id_,
       ap.alloc_id_,
       ap.summ_             summ_pay_,
       ap.curren_,
       ap.pocket_id_,
       a.name_              alloc_name_,
       a.article_name_      alloc_article_name_,
       a.date_              alloc_date_,
       a.summ_              summ_alloc_,
       a.summ_have_         alloc_summ_have_,
       a.summ_have_procent_ alloc_summ_have_procent_,
       a.curren_            alloc_curen_,
       a.mandatory_         alloc_mandatory_,
       p.summ_busy_         pck_summ_busy_,
       p.summ_avlb_         pck_summ_avlb_,
       ap.summ_minus_,
       ap.active_,
       p.name_              pck_name_,
       p.kind_store_id_     pck_kind_store_id_,
       p.summ_              pck_summ_,
       p.active_            pck_active_
  from acc_allocation_pays_t ap, acc_allocations_v a, acc_pockets_v p
 where a.id_ = ap.alloc_id_
   and p.id_ = ap.pocket_id_;

prompt
prompt Creating package ACC_CHECKERS
prompt =============================
prompt
create or replace package assistant.acc_checkers is
  -- Author  : DKHARIN
  -- Created : 08.03.2014 21:00:06
  -- Purpose : ACCOUNTENT CHECKERS

  function check_object_exists(p_id                 number,
                               p_object_name        varchar2,
                               p_parent_object_name varchar2) return varchar2;

  function check_object_exists(p_id          number,
                               p_object_name varchar2) return varchar2;

  function check_object_activity(p_id                 number,
                                 p_object_name        varchar2,
                                 p_parent_object_name varchar2)
    return varchar2;

  function check_object_activity(p_id          number,
                                 p_object_name varchar2) return varchar2;

  function check_exsts_act_alloc_by_artcl(p_article_id acc_allocations_t.article_id_%type)
    return varchar2;

end acc_checkers;
/

prompt
prompt Creating package ACC_MAIN
prompt =========================
prompt
create or replace package assistant.acc_main is
  -- Author  : DKHARIN
  -- Created : 08.03.2014 18:35:51
  -- Purpose : ACCOUNTENT

  function get_lookup_value(p_lookup_name    varchar2,
                            p_lookup_display varchar2) return varchar2;

  function get_acc_object_currency(p_id number, p_object_name varchar2)
    return varchar2;

  function get_acc_object_summ(p_id number, p_object_name varchar2)
    return varchar2;

  function get_acc_object_table(p_acc_object_name varchar2) return varchar2;

  function get_acc_object_parent_column(p_acc_parent_name varchar2)
    return varchar2;

  function get_currency_qoute(p_abriveature acc_currency_t.abriveature_%type)
    return number;

  procedure allocation_article_add(p_name              acc_allocation_articles_t.name_%type,
                                   p_periodical        acc_allocation_articles_t.periodical_%type,
                                   p_start_date        acc_allocation_articles_t.start_date_%type,
                                   p_parent_article_id acc_allocation_articles_t.parent_article_id_%type);

  procedure allocation_article_upd(p_id                acc_allocation_articles_t.id_%type,
                                   p_name              acc_allocation_articles_t.name_%type,
                                   p_periodical        acc_allocation_articles_t.periodical_%type,
                                   p_start_date        acc_allocation_articles_t.start_date_%type,
                                   p_active            acc_allocation_articles_t.active_%type,
                                   p_parent_article_id acc_allocation_articles_t.parent_article_id_%type);

  procedure allocation_add(p_name       acc_allocations_t.name_%type,
                           p_article_id acc_allocations_t.article_id_%type,
                           p_date       acc_allocations_t.date_%type,
                           p_mandatory  acc_allocations_t.mandatory_%type,
                           p_summ       acc_allocations_t.summ_%type,
                           p_curren     acc_allocations_t.curren_%type);

  procedure allocation_upd(p_id         acc_allocations_t.id_%type,
                           p_name       acc_allocations_t.name_%type,
                           p_article_id acc_allocations_t.article_id_%type,
                           p_date       acc_allocations_t.date_%type,
                           p_mandatory  acc_allocations_t.mandatory_%type,
                           p_summ       acc_allocations_t.summ_%type,
                           p_active     acc_allocations_t.active_%type);

  procedure allocation_pay_add(p_alloc_id  acc_allocation_pays_t.alloc_id_%type,
                               p_summ      acc_allocation_pays_t.summ_%type,
                               p_pocket_id acc_allocation_pays_t.pocket_id_%type);

  procedure allocation_pay_upd(p_id         acc_allocation_pays_t.id_%type,
                               p_summ       acc_allocation_pays_t.summ_%type,
                               p_pocket_id  acc_allocation_pays_t.pocket_id_%type,
                               p_summ_minus acc_allocation_pays_t.summ_minus_%type);

  procedure allocation_pay_deactive(p_id acc_allocation_pays_t.id_%type);

  procedure credit_add(p_who_id       acc_credits_t.who_id_%type,
                       p_summ         acc_credits_t.summ_%type,
                       p_dead_line    acc_credits_t.dead_line_%type,
                       p_pocket_id    acc_credits_t.pocket_id_%type,
                       p_profit_type  acc_credits_t.profit_type_%type,
                       p_profit_value acc_credits_t.profit_value_%type,
                       p_when         acc_credits_t.when_%type);

  procedure kind_store_add(p_name acc_kinds_store_t.name_%type);

  procedure kind_store_upd(p_id   acc_kinds_store_t.id_%type,
                           p_name acc_kinds_store_t.name_%type);

  procedure kind_store_del(p_id acc_kinds_store_t.id_%type);

  procedure pocket_add(p_name          acc_pockets_t.name_%type,
                       p_kind_store_id acc_pockets_t.kind_store_id_%type,
                       p_summ          acc_pockets_t.summ_%type,
                       p_curren        acc_pockets_t.curren_%type);

  procedure pocket_upd(p_id            acc_pockets_t.id_%type,
                       p_name          acc_pockets_t.name_%type,
                       p_kind_store_id acc_pockets_t.kind_store_id_%type,
                       p_summ          acc_pockets_t.summ_%type,
                       p_active        acc_pockets_t.active_%type);

  procedure minus_add(p_alloc_id   acc_minus_headers_t.alloc_id_%type,
                      p_date       acc_minus_headers_t.date_%type,
                      p_summ       acc_minus_headers_t.summ_%type,
                      p_comment    acc_minus_headers_t.comment_%type,
                      p_curr_quote acc_minus_headers_t.curr_quote_%type);

  function minus_header_add(p_alloc_id acc_minus_headers_t.alloc_id_%type,
                            p_date     acc_minus_headers_t.date_%type,
                            p_summ     acc_minus_headers_t.summ_%type,
                            p_comment  acc_minus_headers_t.comment_%type)
    return number;

  procedure minus_sites_add(p_minus_id     acc_minus_sites_t.minus_id_%type,
                            p_alloc_pay_id acc_minus_sites_t.alloc_pay_id_%type,
                            p_summ         acc_minus_sites_t.summ_%type,
                            p_comment      acc_minus_sites_t.comment_%type);
end acc_main;
/

prompt
prompt Creating package body ACC_CHECKERS
prompt ==================================
prompt
create or replace package body assistant.acc_checkers is
  -- Author  : DKHARIN
  -- Created : 08.03.2014 21:00:06
  -- Purpose : ACCOUNTENT CHECKERS

  function check_object_exists(p_id                 number,
                               p_object_name        varchar2,
                               p_parent_object_name varchar2) return varchar2 as
    v_result number;
    v_sql    varchar2(500char);
    v_id     varchar2(30char);
  begin
    v_id  := acc_main.get_acc_object_parent_column(p_acc_parent_name => p_parent_object_name);
    v_sql := 'select count(1) from dual where exists     
(select p.id_ from ' ||
             acc_main.get_acc_object_table(p_object_name) || ' p where p.' || v_id ||
             ' = ' || p_id || ')';
----------------
dbms_output.put_line(v_sql);
----------------
    execute immediate v_sql
      into v_result;
    if v_result = 1 then
      return 'Y';
    else
      return 'N';
    end if;
  exception
    when others then
      raise_application_error(-20001,'ERROR  CHECK OBJECT EXISTS!!!', true);
  end;

  function check_object_exists(p_id          number,
                               p_object_name varchar2) return varchar2 as
    v_result varchar2(1 char);
  begin
    v_result := check_object_exists(p_id                 => p_id,
                                    p_object_name        => p_object_name,
                                    p_parent_object_name => 'NONE');
    return v_result;
  end;

  function check_object_activity(p_id                 number,
                                 p_object_name        varchar2,
                                 p_parent_object_name varchar2)
    return varchar2 as
    v_result number;
    v_sql    varchar2(500char);
    v_id     varchar2(30char);
  begin
    v_id  := acc_main.get_acc_object_parent_column(p_acc_parent_name => p_parent_object_name);
    v_sql := 'select count(1) from dual where exists     
(select p.id_ from ' ||
             acc_main.get_acc_object_table(p_object_name) || ' p where p.' || v_id ||
             ' = ' || p_id || q'[ and p.active_ = 'Y')]';
    execute immediate v_sql
      into v_result;
    if v_result = 1 then
      return 'Y';
    end if;
    return 'N';
  exception
    when others then
      raise_application_error(-20001,'ERROR  CHECK OBJECT ACTIVITY!!!', true);
  end;

  function check_object_activity(p_id          number,
                                 p_object_name varchar2) return varchar2 as
    v_result varchar2(1 char);
  begin
    v_result := check_object_activity(p_id                 => p_id,
                                      p_object_name        => p_object_name,
                                      p_parent_object_name => 'NONE');
    return v_result;
  
  end;

  function check_exsts_act_alloc_by_artcl(p_article_id acc_allocations_t.article_id_%type)
    return varchar2 as
    v_result varchar2(1 char);
  begin
    select count(active_)
      into v_result
      from acc_allocations_t a
     where a.active_ = 'Y'
       and a.article_id_ = p_article_id;
    if v_result > 0 then
      return 'Y';
    else
      return 'N';
    end if;
  exception
    when others then
      raise_application_error(-20001,'ERROR  CHECK EXISTS ACTIVE ALLOCATION BY ALLOCATION ARTICLE!!!', true);
  end;

begin
  null;
end acc_checkers;
/

prompt
prompt Creating package body ACC_MAIN
prompt ==============================
prompt
create or replace package body assistant.acc_main is
  -- Author  : DKHARIN
  -- Created : 08.03.2014 18:35:51
  -- Purpose : ACCOUNTENT

  custom_error exception;

  function get_lookup_value(p_lookup_name    varchar2,
                            p_lookup_display varchar2) return varchar2 as
    v_result varchar2(30 char);
  begin
    select l.value_return_
      into v_result
      from acc_lookup_t l
     where upper(l.value_display_) = upper(p_lookup_display)
       and upper(l.name_) = upper(p_lookup_name);
    return v_result;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET LOOKUP VALUE!!!', true);
  end;

  function get_acc_object_currency(p_id number, p_object_name varchar2)
    return varchar2 as
    v_result varchar2(3 char);
    v_sql    varchar2(500 char);
  begin
    v_sql := 'select p.curren_ from ' ||
             acc_main.get_acc_object_table(p_object_name) ||
             ' p where p.id_ = ' || p_id;
    execute immediate v_sql
      into v_result;
    if v_result is not null then
      return v_result;
    end if;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET CURRENCY!!!', true);
  end;

  function get_acc_object_summ(p_id number, p_object_name varchar2)
    return varchar2 as
    v_result number;
    v_sql    varchar2(500 char);
  begin
    v_sql := 'select p.summ_ from ' ||
             acc_main.get_acc_object_table(p_object_name) ||
             ' p where p.id_ = ' || p_id;
    execute immediate v_sql
      into v_result;
    if v_result is not null then
      return v_result;
    end if;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET SUMM!!!', true);
  end;

  function get_acc_object_table(p_acc_object_name varchar2) return varchar2 as
    v_result varchar2(30 char);
  begin
    v_result := get_lookup_value(p_lookup_name    => 'ACC_OBJECTS',
                                 p_lookup_display => p_acc_object_name);
    return v_result;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET TABLE!!!', true);
  end;

  function get_acc_object_parent_column(p_acc_parent_name varchar2)
    return varchar2 as
    v_result varchar2(30 char);
  begin
    v_result := get_lookup_value(p_lookup_name    => 'ACC_OBJECTS_PARENT_COLUMNS',
                                 p_lookup_display => p_acc_parent_name);
    return v_result;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET COLUMN!!!', true);
  end;

  function get_currency_qoute(p_abriveature acc_currency_t.abriveature_%type)
    return number as
    v_result number;
  begin
    select c.qoute_
      into v_result
      from acc_currency_t c
     where c.abriveature_ = p_abriveature;
    return v_result;
  exception
    when others then
      raise_application_error(-20001, 'ERROR GET CURRENCY QOUTE!!!', true);
  end;

  procedure allocation_article_add(p_name              acc_allocation_articles_t.name_%type,
                                   p_periodical        acc_allocation_articles_t.periodical_%type,
                                   p_start_date        acc_allocation_articles_t.start_date_%type,
                                   p_parent_article_id acc_allocation_articles_t.parent_article_id_%type) as
    v_id     acc_allocation_articles_t.id_%type := acc_allocation_articles_s.nextval;
    v_active acc_allocation_articles_t.active_%type := 'Y';
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_parent_article_id,
                                        p_object_name => 'ALLOCATION_ARTICLE') then
      raise_application_error(-20001,
                              'ERROR | CPECIFIED PARENT ALLOCATION ARTICLE NOT EXISTS ! p_parent_article_id :' ||
                              p_parent_article_id,
                              true);
    end if;
    insert into acc_allocation_articles_t
      (id_, name_, periodical_, start_date_, active_, parent_article_id_)
    values
      (v_id,
       p_name,
       p_periodical,
       p_start_date,
       v_active,
       p_parent_article_id);
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR ADD ALLOCATION ARTICLE!!!',
                              true);
  end;

  procedure allocation_article_upd(p_id                acc_allocation_articles_t.id_%type,
                                   p_name              acc_allocation_articles_t.name_%type,
                                   p_periodical        acc_allocation_articles_t.periodical_%type,
                                   p_start_date        acc_allocation_articles_t.start_date_%type,
                                   p_active            acc_allocation_articles_t.active_%type,
                                   p_parent_article_id acc_allocation_articles_t.parent_article_id_%type) as
  
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'ALLOCATION_ARTICLE') then
      raise_application_error(-20001, 'ERROR | object not found', true);
    end if;
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_parent_article_id,
                                        p_object_name => 'ALLOCATION_ARTICLE') then
      raise_application_error(-20001,
                              'ERROR | CPECIFIED PARENT ALLOCATION ARTICLE NOT EXISTS ! p_parent_article_id :' ||
                              p_parent_article_id,
                              true);
    end if;
    if p_active = 'N' and
       'Y' =
       acc_checkers.check_exsts_act_alloc_by_artcl(p_article_id => p_id) then
      raise_application_error(-20001,
                              'ERROR | exists depended allocation',
                              true);
    end if;
    update acc_allocation_articles_t a
       set a.name_              = p_name,
           a.periodical_        = p_periodical,
           a.start_date_        = p_start_date,
           a.active_            = p_active,
           a.parent_article_id_ = p_parent_article_id
     where a.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | failed update allocation article',
                              true);
  end;

  procedure allocation_add(p_name       acc_allocations_t.name_%type,
                           p_article_id acc_allocations_t.article_id_%type,
                           p_date       acc_allocations_t.date_%type,
                           p_mandatory  acc_allocations_t.mandatory_%type,
                           p_summ       acc_allocations_t.summ_%type,
                           p_curren     acc_allocations_t.curren_%type) as
    v_id     acc_allocations_t.id_%type := acc_allocations_s.nextval;
    v_active acc_allocations_t.active_%type := 'Y';
    v_date   acc_allocations_t.date_%type := sysdate;
    v_manual acc_allocations_t.manual_%type := 'Y';
  begin
    if p_date is not null then
      v_date := p_date;
    end if;
    insert into acc_allocations_t
      (id_,
       name_,
       article_id_,
       date_,
       summ_,
       curren_,
       mandatory_,
       active_,
       manual_)
    values
      (v_id,
       p_name,
       p_article_id,
       v_date,
       p_summ,
       p_curren,
       p_mandatory,
       v_active,
       v_manual);
  exception
    when others then
      raise_application_error(-20001, 'ERROR | ALLOCATION ADD', true);
  end;

  procedure allocation_upd(p_id         acc_allocations_t.id_%type,
                           p_name       acc_allocations_t.name_%type,
                           p_article_id acc_allocations_t.article_id_%type,
                           p_date       acc_allocations_t.date_%type,
                           p_mandatory  acc_allocations_t.mandatory_%type,
                           p_summ       acc_allocations_t.summ_%type,
                           p_active     acc_allocations_t.active_%type) as
    v_summ      acc_allocations_v.summ_%type;
    v_pays_summ acc_allocations_v.summ_have_%type;
    v_summ_min  acc_allocations_v.summ_min_%type;
    v_curren    acc_allocations_v.curren_%type;
  begin
    --!! check that protect active (check min, pays, summ)
    if 'Y' <>
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'ALLOCATION') then
      raise_application_error(-20001,
                              'ERROR | CPECIFIED ALLOCATION NOT FOUND',
                              true);
    end if;
    select t.summ_, t.summ_have_, t.summ_min_, t.curren_
      into v_summ, v_pays_summ, v_summ_min, v_curren
      from acc_allocations_v t
     where t.id_ = p_id;
    if 'Y' =
       acc_checkers.check_object_exists(p_id                 => p_id,
                                        p_object_name        => 'MINUS',
                                        p_parent_object_name => 'ALLOCATION') then
      if p_summ < v_summ_min then
        raise_application_error(-20001,
                                'ERROR | NEED MORE GOLD!!! NOT LESS THEN ' ||
                                v_summ_min || 'v_curren',
                                true);
      end if;
    end if;
    update acc_allocations_t a
       set a.name_       = p_name,
           a.article_id_ = p_article_id,
           a.date_       = p_date,
           a.summ_       = p_summ,
           a.mandatory_  = p_mandatory,
           a.active_     = p_active
     where a.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | FAILED ALLOCATION UPDATE',
                              true);
  end;

  procedure allocation_pay_add(p_alloc_id  acc_allocation_pays_t.alloc_id_%type,
                               p_summ      acc_allocation_pays_t.summ_%type,
                               p_pocket_id acc_allocation_pays_t.pocket_id_%type) as
    v_id         acc_allocation_pays_t.id_%type := acc_allocation_pays_s.nextval;
    v_active     acc_allocation_pays_t.active_%type := 'Y';
    v_curren     acc_allocation_pays_t.curren_%type := get_acc_object_currency(p_pocket_id,
                                                                               'POCKET');
    v_summ_minus acc_allocation_pays_t.summ_minus_%type := 0;
  begin
    if 'N' =
       acc_checkers.check_object_activity(p_id          => p_pocket_id,
                                          p_object_name => 'POCKET') then
      raise_application_error(-20001,
                              'ERROR | CPECIFIED POCKET NOT ACTIVITY',
                              true);
    end if;
    if v_curren <> get_acc_object_currency(p_alloc_id, 'ALLOCATION') then
      raise_application_error(-20001,
                              'ERROR | NOT MATCH CURRENS ALLOCATION PAY and POCKET',
                              true);
    end if;
    if p_summ > get_acc_object_summ(p_pocket_id, 'POCKET') then
      raise_application_error(-20001,
                              'ERROR | SUMM ALLOCATION PAY GRATHER SUMM POCKET',
                              true);
    end if;
    insert into acc_allocation_pays_t
      (id_, alloc_id_, summ_, curren_, pocket_id_, active_, summ_minus_)
    values
      (v_id,
       p_alloc_id,
       p_summ,
       v_curren,
       p_pocket_id,
       v_active,
       v_summ_minus);
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ALLOCATION PAY ADD FAILED',
                              true);
  end;

  procedure allocation_pay_upd(p_id         acc_allocation_pays_t.id_%type,
                               p_summ       acc_allocation_pays_t.summ_%type,
                               p_pocket_id  acc_allocation_pays_t.pocket_id_%type,
                               p_summ_minus acc_allocation_pays_t.summ_minus_%type) as
    v_pck_summ_avlb acc_allocation_pays_v.pck_summ_avlb_%type;
    v_alloc_summ    acc_allocation_pays_v.summ_alloc_%type;
    v_summ_pay      acc_allocation_pays_v.summ_pay_%type;
    v_curren        acc_allocation_pays_v.curren_%type := get_acc_object_currency(p_id          => p_id,
                                                                                  p_object_name => 'ALLOCATION_PAY');
  
    v_summ_min acc_allocations_v.summ_min_%type;
  begin
    select ap.summ_pay_, ap.pck_summ_avlb_, ap.summ_alloc_
      into v_summ_pay, v_pck_summ_avlb, v_alloc_summ
      from acc_allocation_pays_v ap
     where ap.id_ = p_id;
    if v_curren <>
       get_acc_object_currency(p_id          => p_pocket_id,
                               p_object_name => 'POCKET') then
      raise_application_error(-20001,
                              'ERROR | WRONG CURRENCY SELECTED ALLOCATION POCKET',
                              true);
    end if;
    if p_summ > (v_pck_summ_avlb + v_summ_pay) then
      raise_application_error(-20001,
                              'ERROR | SUMM ALLOCATION PAY GRATHER SUMM POCKET !!!',
                              true);
    end if;
  
    select a.summ_min_
      into v_summ_min
      from acc_allocations_v a
     where a.id_ = p_id;
    if p_summ > v_summ_min then
      raise_application_error(-20001,
                              'ERROR | SUMM MINUS GRATHER SUMM ALLOCATION !!!',
                              true);
    end if;
  
    /*    dbms_output.put_line(p_summ || ',' || p_pocket_id || ',' ||
    p_summ_minus);*/
    update acc_allocation_pays_t ap
       set ap.summ_       = p_summ,
           ap.pocket_id_  = p_pocket_id,
           ap.summ_minus_ = p_summ_minus
     where ap.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ERROR  ALLOCATION PAY UPD!!!',
                              true);
  end;

  procedure allocation_pay_deactive(p_id acc_allocation_pays_t.id_%type) as
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'ALLOCATION_PAY') then
      raise_application_error(-20001,
                              'ERROR | ERROR ALLOCATION PAY NOT EXISTS!!!',
                              true);
    end if;
    update acc_allocation_pays_t ap
       set ap.active_ = 'N'
     where ap.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ERROR  ALLOCATION PAY DEACTIVE!!!',
                              true);
  end;

  procedure credit_add(p_who_id       acc_credits_t.who_id_%type,
                       p_summ         acc_credits_t.summ_%type,
                       p_dead_line    acc_credits_t.dead_line_%type,
                       p_pocket_id    acc_credits_t.pocket_id_%type,
                       p_profit_type  acc_credits_t.profit_type_%type,
                       p_profit_value acc_credits_t.profit_value_%type,
                       p_when         acc_credits_t.when_%type) as
    v_summ_avlb acc_pockets_v.summ_avlb_%type;
  begin
    select p.summ_avlb_
      into v_summ_avlb
      from acc_pockets_v p
     where p.id_ = p_pocket_id;
    if p_summ <= v_summ_avlb then
      insert into acc_credits_t
        (who_id_,
         summ_,
         dead_line_,
         pocket_id_,
         profit_type_,
         profit_value_,
         when_)
      values
        (p_who_id,
         p_summ,
         p_dead_line,
         p_pocket_id,
         p_profit_type,
         p_profit_value,
         p_when);
    else
      null;
    end if;
  exception
    when others then
      raise_application_error(-20001, 'ERROR | ERROR  CREDIT ADD!!!', true);
  end;

  procedure kind_store_add(p_name acc_kinds_store_t.name_%type) as
    v_id acc_kinds_store_t.id_%type := acc_kinds_store_s.nextval;
  begin
    insert into acc_kinds_store_t
      (id_, name_)
    values
      (v_id, upper(p_name));
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ERROR  KIND STORE ADD!!!',
                              true);
  end;

  procedure kind_store_upd(p_id   acc_kinds_store_t.id_%type,
                           p_name acc_kinds_store_t.name_%type) as
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'KIND_STORE') then
      raise_application_error(-20001,
                              'ERROR | SPECIFIED KIND STORE NOT EXISTS | kind_sore_id: ' || p_id,
                              true);
    end if;
    if 'Y' =
       acc_checkers.check_object_exists(p_id                 => p_id,
                                        p_object_name        => 'POCKET',
                                        p_parent_object_name => 'KIND_STORE') then
      raise_application_error(-20001,
                              'ERROR | EXISTS DEPENDING POCKET !!!',
                              true);
    end if;
    update acc_kinds_store_t ks
       set ks.name_ = upper(p_name)
     where ks.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ERROR  KIND STORE UPDATE!!!',
                              true);
  end;

  procedure kind_store_del(p_id acc_kinds_store_t.id_%type) as
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'KIND_STORE') then
      raise_application_error(-20001,
                              'ERROR | SPECIFIED KIND STORE NOT EXISTS !!!',
                              true);
    end if;
    if 'Y' =
       acc_checkers.check_object_exists(p_id                 => p_id,
                                        p_object_name        => 'POCKET',
                                        p_parent_object_name => 'KIND_STORE') then
      raise_application_error(-20001,
                              'ERROR | EXISTS DEPENDED POCKET',
                              true);
    end if;
    delete from acc_kinds_store_t ks where ks.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR | ERROR  DELETE KIND STORE!!!',
                              true);
  end;

  procedure pocket_add(p_name          acc_pockets_t.name_%type,
                       p_kind_store_id acc_pockets_t.kind_store_id_%type,
                       p_summ          acc_pockets_t.summ_%type,
                       p_curren        acc_pockets_t.curren_%type) as
    v_id     acc_pockets_t.id_%type := acc_pockets_s.nextval;
    v_active acc_pockets_t.active_%type := 'Y';
  begin
    insert into acc_pockets_t
      (id_, name_, kind_store_id_, summ_, curren_, active_)
    values
      (v_id, p_name, p_kind_store_id, p_summ, p_curren, v_active);
  exception
    when others then
      raise_application_error(-20001, 'ERROR  POCKET ADD!!!', false);
  end;

  procedure pocket_upd(p_id            acc_pockets_t.id_%type,
                       p_name          acc_pockets_t.name_%type,
                       p_kind_store_id acc_pockets_t.kind_store_id_%type,
                       p_summ          acc_pockets_t.summ_%type,
                       p_active        acc_pockets_t.active_%type) as
    v_summ_busy acc_pockets_v.summ_busy_%type;
    v_summ      acc_pockets_v.summ_%type;
  begin
    if 'N' =
       acc_checkers.check_object_exists(p_id          => p_id,
                                        p_object_name => 'POCKET') then
      raise_application_error(-20001,
                              'ERROR | SPECIFIED POCKET NOT EXISTS !!!',
                              true);
    end if;
    --!! check protect active
    if 'Y' =
       acc_checkers.check_object_exists(p_id                 => p_id,
                                        p_object_name        => 'ALLOCATION_PAY',
                                        p_parent_object_name => 'POCKET') then
      select p.summ_, p.summ_busy_
        into v_summ, v_summ_busy
        from acc_pockets_v p
       where p.id_ = p_id;
      -- !! credit summ
      if p_summ < v_summ_busy then
        raise_application_error(-20001,
                                'SUMM LESS THAN SUMM DEPENDENT ALLOCATION PAY !!!',
                                true);
      end if;
    end if;
    update acc_pockets_t p
       set p.name_          = p_name,
           p.kind_store_id_ = p_kind_store_id,
           p.summ_          = p_summ,
           p.active_        = p_active
     where p.id_ = p_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR  |  ERROR POCKET UPDATE',
                              true);
  end;

  procedure minus_add(p_alloc_id   acc_minus_headers_t.alloc_id_%type,
                      p_date       acc_minus_headers_t.date_%type,
                      p_summ       acc_minus_headers_t.summ_%type,
                      p_comment    acc_minus_headers_t.comment_%type,
                      p_curr_quote acc_minus_headers_t.curr_quote_%type) as
    cursor c_all_pays is
      select *
        from acc_allocation_pays_v ap
       where ap.alloc_id_ = p_alloc_id
         and ap.active_ = 'Y';
    v_all_pay        acc_allocation_pays_v%rowtype;
    v_summ_spend     acc_minus_headers_t.summ_%type := 0;
    v_summ_spend_cur acc_minus_headers_t.summ_%type := 0;
    v_summ_have      number;
    v_minus_id       acc_minus_headers_t.id_%type;
  begin
    if 'Y' <>
       acc_checkers.check_object_activity(p_id          => p_alloc_id,
                                          p_object_name => 'ALLOCATION') then
      raise_application_error(-20001,
                              'ERROR  | ALLOCATION NOT ACTIVE !!!',
                              true);
    end if;
    select summ_have_
      into v_summ_have
      from acc_allocations_v a
     where a.id_ = p_alloc_id;
    if v_summ_have < p_summ then
      raise_application_error(-20001,
                              'ERROR  |  INSUFFICIENT ALLOCATED MONEY !!!',
                              true);
    end if;
    v_minus_id := minus_header_add(p_alloc_id => p_alloc_id,
                                   p_date     => p_date,
                                   p_summ     => p_summ,
                                   p_comment  => p_comment);
    open c_all_pays;
    loop
      fetch c_all_pays
        into v_all_pay;
      if v_all_pay.summ_pay_ <=
         (v_all_pay.summ_minus_ + p_summ - v_summ_spend) then
        v_summ_spend_cur := v_all_pay.summ_pay_ - v_all_pay.summ_minus_;
        allocation_pay_upd(p_id         => v_all_pay.id_,
                           p_summ       => v_all_pay.summ_pay_,
                           p_pocket_id  => v_all_pay.pocket_id_,
                           p_summ_minus => v_all_pay.summ_pay_);
        minus_sites_add(p_minus_id     => v_minus_id,
                        p_alloc_pay_id => v_all_pay.id_,
                        p_summ         => v_summ_spend_cur,
                        p_comment      => '');
        pocket_upd(p_id            => v_all_pay.pocket_id_,
                   p_name          => v_all_pay.pck_name_,
                   p_kind_store_id => v_all_pay.pck_kind_store_id_,
                   p_summ          => (v_all_pay.pck_summ_ -
                                      v_summ_spend_cur),
                   p_active        => v_all_pay.pck_active_);
        allocation_pay_deactive(p_id => v_all_pay.id_);
        v_summ_spend := v_summ_spend + v_summ_spend_cur;
      else
        v_summ_spend_cur := p_summ - v_summ_spend;
        allocation_pay_upd(p_id         => v_all_pay.id_,
                           p_summ       => v_all_pay.summ_pay_,
                           p_pocket_id  => v_all_pay.pocket_id_,
                           p_summ_minus => (v_all_pay.summ_minus_ + p_summ -
                                           v_summ_spend));
        minus_sites_add(p_minus_id     => v_minus_id,
                        p_alloc_pay_id => v_all_pay.id_,
                        p_summ         => v_summ_spend_cur,
                        p_comment      => '');
        pocket_upd(p_id            => v_all_pay.pocket_id_,
                   p_name          => v_all_pay.pck_name_,
                   p_kind_store_id => v_all_pay.pck_kind_store_id_,
                   p_summ          => (v_all_pay.pck_summ_ -
                                      v_summ_spend_cur),
                   p_active        => v_all_pay.pck_active_);
        v_summ_spend := p_summ;
      end if;
      exit when v_summ_spend = p_summ;
    end loop;
    close c_all_pays;
  exception
    when others then
      raise_application_error(-20001, 'ERROR  |  FAILED MINUS ADD', true);
  end;

  function minus_header_add(p_alloc_id acc_minus_headers_t.alloc_id_%type,
                            p_date     acc_minus_headers_t.date_%type,
                            p_summ     acc_minus_headers_t.summ_%type,
                            p_comment  acc_minus_headers_t.comment_%type)
    return number as
    v_id         acc_minus_headers_t.id_%type := acc_minus_headers_s.nextval;
    v_curren     acc_allocations_t.curren_%type := get_acc_object_currency(p_id          => p_alloc_id,
                                                                           p_object_name => 'ALLOCATION');
    v_curr_quote acc_minus_headers_t.curr_quote_%type;
  begin
    --!! summ
    --!! refactor curr_quote (history)
    v_curr_quote := get_currency_qoute(p_abriveature => v_curren);
    insert into acc_minus_headers_t
      (id_, alloc_id_, date_, summ_, comment_, curr_quote_)
    values
      (v_id, p_alloc_id, p_date, p_summ, p_comment, v_curr_quote);
    return v_id;
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR  |  FAILED MINUS HEADER ADD',
                              true);
  end;

  procedure minus_sites_add(p_minus_id     acc_minus_sites_t.minus_id_%type,
                            p_alloc_pay_id acc_minus_sites_t.alloc_pay_id_%type,
                            p_summ         acc_minus_sites_t.summ_%type,
                            p_comment      acc_minus_sites_t.comment_%type) as
    v_id acc_minus_sites_t.minus_id_%type := acc_minus_sites_s.nextval;
  begin
    insert into acc_minus_sites_t
      (id_, minus_id_, alloc_pay_id_, summ_, comment_)
    values
      (v_id, p_minus_id, p_alloc_pay_id, p_summ, p_comment);
  exception
    when others then
      raise_application_error(-20001,
                              'ERROR  |  FAILED MINUS SITE ADD',
                              true);
  end;
begin
  null;
end acc_main;
/

prompt
prompt Creating trigger ACC_ALLOCATION_ARTICLES_ADD
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_allocation_articles_add
before insert on assistant.acc_allocation_articles_t
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_allocation_articles_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_ALLOCATION_PAYS_ADD
prompt ========================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_allocation_pays_add
  before insert on assistant.acc_allocation_pays_t
  for each row
declare
begin

  if :new.id_ is null then
    select assistant.acc_allocation_pays_s.nextval into :new.id_ from dual;
  end if;

  if :new.active_ is null then
    :new.active_ := 'Y';
  end if;

end;
/

prompt
prompt Creating trigger ACC_ALLOCATIONS_ADD
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_allocations_add
before insert on assistant.acc_allocations_t
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_allocations_s.nextval
      into :new.id_
      from dual;
  end if;  
end;
/

prompt
prompt Creating trigger ACC_CREDITS_ADD
prompt ================================
prompt
create or replace trigger assistant.acc_credits_add
  before insert or update on assistant.acc_credits_t
  for each row
declare
  v_pck assistant.acc_pockets_v%rowtype;
begin
  if :new.id_ is null then
      select assistant.acc_credits_s.nextval into :new.id_ from dual;
    end if;
  select *
    into v_pck
    from assistant.acc_pockets_v p
   where :new.pocket_id_ = p.id_;
   
  :new.curren_ := v_pck.curren_;
  
  if :new.summ_ <= v_pck.summ_avlb_ then
    :new.curren_ := v_pck.curren_;
  else
  null;
  end if;
  
end;
/

prompt
prompt Creating trigger ACC_KINDS_STORE_ADD
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_kinds_store_add
before insert on assistant.acc_kinds_store_t
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_kinds_store_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_LOOKUP_ADD
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_lookup_add
before insert on assistant.acc_lookup_t
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_lookup_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_MINUS_HEADERS_ADD
prompt ======================================
prompt
CREATE OR REPLACE TRIGGER ASSISTANT.
assistant.acc_minus_headers_add
before insert on assistant.ACC_MINUS_HEADERS_T
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_minus_headers_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_MINUS_SITES_ADD
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER ASSISTANT.
assistant.acc_minus_sites_add
before insert on assistant.ACC_MINUS_siteS_T
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_minus_sites_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_OPPORTUNITY_ADD
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_opportunity_add
before insert on assistant.acc_opportunity_t
for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_opportunity_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/

prompt
prompt Creating trigger ACC_POCKETS_ADD
prompt ================================
prompt
CREATE OR REPLACE TRIGGER assistant.acc_pockets_add
  before insert on assistant.acc_pockets_t
  for each row
declare
begin
  if :new.id_ is null then
    select assistant.acc_pockets_s.nextval into :new.id_ from dual;
  end if;
  if :new.active_ is null then
    :new.active_ := 'Y';
  end if;
end;
/

prompt
prompt Creating trigger PPL_PEOPLES_ADD
prompt ================================
prompt
CREATE OR REPLACE TRIGGER ASSISTANT.
assistant.ppl_peoples_add
before insert on assistant.PPL_PEOPLES_T
for each row
declare
begin
  if :new.id_ is null then
    select assistant.ppl_peoples_s.nextval
      into :new.id_
      from dual;
  end if;
end;
/


spool off
