--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0 (Debian 12.0-2.pgdg100+1)
-- Dumped by pg_dump version 12.0 (Debian 12.0-2.pgdg100+1)

-- Started on 2019-12-07 16:41:51 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16507)
-- Name: access; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint,
    mode integer
);


ALTER TABLE public.access OWNER TO gitea;

--
-- TOC entry 216 (class 1259 OID 16505)
-- Name: access_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_id_seq OWNER TO gitea;

--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 216
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_id_seq OWNED BY public.access.id;


--
-- TOC entry 209 (class 1259 OID 16437)
-- Name: access_token; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access_token (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    token_hash character varying(255),
    token_salt character varying(255),
    token_last_eight character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.access_token OWNER TO gitea;

--
-- TOC entry 208 (class 1259 OID 16435)
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_token_id_seq OWNER TO gitea;

--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 208
-- Name: access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_token_id_seq OWNED BY public.access_token.id;


--
-- TOC entry 227 (class 1259 OID 16552)
-- Name: action; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action (
    id bigint NOT NULL,
    user_id bigint,
    op_type integer,
    act_user_id bigint,
    repo_id bigint,
    comment_id bigint,
    is_deleted boolean DEFAULT false NOT NULL,
    ref_name character varying(255),
    is_private boolean DEFAULT false NOT NULL,
    content text,
    created_unix bigint
);


ALTER TABLE public.action OWNER TO gitea;

--
-- TOC entry 226 (class 1259 OID 16550)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO gitea;

--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 226
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 235 (class 1259 OID 16626)
-- Name: attachment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    uuid uuid,
    issue_id bigint,
    release_id bigint,
    uploader_id bigint DEFAULT 0,
    comment_id bigint,
    name character varying(255),
    download_count bigint DEFAULT 0,
    size bigint DEFAULT 0,
    created_unix bigint
);


ALTER TABLE public.attachment OWNER TO gitea;

--
-- TOC entry 234 (class 1259 OID 16624)
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachment_id_seq OWNER TO gitea;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 234
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.attachment_id_seq OWNED BY public.attachment.id;


--
-- TOC entry 215 (class 1259 OID 16495)
-- Name: collaboration; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.collaboration (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    user_id bigint NOT NULL,
    mode integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.collaboration OWNER TO gitea;

--
-- TOC entry 214 (class 1259 OID 16493)
-- Name: collaboration_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.collaboration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collaboration_id_seq OWNER TO gitea;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 214
-- Name: collaboration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.collaboration_id_seq OWNED BY public.collaboration.id;


--
-- TOC entry 233 (class 1259 OID 16611)
-- Name: comment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    type integer,
    poster_id bigint,
    issue_id bigint,
    label_id bigint,
    old_milestone_id bigint,
    milestone_id bigint,
    assignee_id bigint,
    removed_assignee boolean,
    old_title character varying(255),
    new_title character varying(255),
    dependent_issue_id bigint,
    commit_id bigint,
    line bigint,
    tree_path character varying(255),
    content text,
    patch text,
    created_unix bigint,
    updated_unix bigint,
    commit_sha character varying(40),
    review_id bigint,
    invalidated boolean
);


ALTER TABLE public.comment OWNER TO gitea;

--
-- TOC entry 232 (class 1259 OID 16609)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO gitea;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 232
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 287 (class 1259 OID 16953)
-- Name: commit_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.commit_status (
    id bigint NOT NULL,
    index bigint,
    repo_id bigint,
    state character varying(7) NOT NULL,
    sha character varying(64) NOT NULL,
    target_url text,
    description text,
    context_hash character(40),
    context text,
    creator_id bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.commit_status OWNER TO gitea;

--
-- TOC entry 286 (class 1259 OID 16951)
-- Name: commit_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.commit_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commit_status_id_seq OWNER TO gitea;

--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 286
-- Name: commit_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.commit_status_id_seq OWNED BY public.commit_status.id;


--
-- TOC entry 293 (class 1259 OID 16991)
-- Name: deleted_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.deleted_branch (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    commit character varying(255) NOT NULL,
    deleted_by_id bigint,
    deleted_unix bigint
);


ALTER TABLE public.deleted_branch OWNER TO gitea;

--
-- TOC entry 292 (class 1259 OID 16989)
-- Name: deleted_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.deleted_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deleted_branch_id_seq OWNER TO gitea;

--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 292
-- Name: deleted_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.deleted_branch_id_seq OWNED BY public.deleted_branch.id;


--
-- TOC entry 213 (class 1259 OID 16480)
-- Name: deploy_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.deploy_key (
    id bigint NOT NULL,
    key_id bigint,
    repo_id bigint,
    name character varying(255),
    fingerprint character varying(255),
    mode integer DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.deploy_key OWNER TO gitea;

--
-- TOC entry 212 (class 1259 OID 16478)
-- Name: deploy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.deploy_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_key_id_seq OWNER TO gitea;

--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 212
-- Name: deploy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.deploy_key_id_seq OWNED BY public.deploy_key.id;


--
-- TOC entry 263 (class 1259 OID 16807)
-- Name: email_address; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.email_address (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    email character varying(255) NOT NULL,
    is_activated boolean
);


ALTER TABLE public.email_address OWNER TO gitea;

--
-- TOC entry 262 (class 1259 OID 16805)
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_address_id_seq OWNER TO gitea;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 262
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.email_address_id_seq OWNED BY public.email_address.id;


--
-- TOC entry 279 (class 1259 OID 16910)
-- Name: external_login_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.external_login_user (
    external_id character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    login_source_id bigint NOT NULL
);


ALTER TABLE public.external_login_user OWNER TO gitea;

--
-- TOC entry 225 (class 1259 OID 16543)
-- Name: follow; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.follow (
    id bigint NOT NULL,
    user_id bigint,
    follow_id bigint
);


ALTER TABLE public.follow OWNER TO gitea;

--
-- TOC entry 224 (class 1259 OID 16541)
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follow_id_seq OWNER TO gitea;

--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 224
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.follow_id_seq OWNED BY public.follow.id;


--
-- TOC entry 273 (class 1259 OID 16868)
-- Name: gpg_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.gpg_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    key_id character(16) NOT NULL,
    primary_key_id character(16),
    content text NOT NULL,
    created_unix bigint,
    expired_unix bigint,
    added_unix bigint,
    emails text,
    can_sign boolean,
    can_encrypt_comms boolean,
    can_encrypt_storage boolean,
    can_certify boolean
);


ALTER TABLE public.gpg_key OWNER TO gitea;

--
-- TOC entry 272 (class 1259 OID 16866)
-- Name: gpg_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.gpg_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpg_key_id_seq OWNER TO gitea;

--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 272
-- Name: gpg_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.gpg_key_id_seq OWNED BY public.gpg_key.id;


--
-- TOC entry 274 (class 1259 OID 16879)
-- Name: gpg_key_import; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.gpg_key_import (
    key_id character(16) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.gpg_key_import OWNER TO gitea;

--
-- TOC entry 251 (class 1259 OID 16739)
-- Name: hook_task; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.hook_task (
    id bigint NOT NULL,
    repo_id bigint,
    hook_id bigint,
    uuid character varying(255),
    type integer,
    url text,
    signature text,
    payload_content text,
    http_method character varying(255),
    content_type integer,
    event_type character varying(255),
    is_ssl boolean,
    is_delivered boolean,
    delivered bigint,
    is_succeed boolean,
    request_content text,
    response_content text
);


ALTER TABLE public.hook_task OWNER TO gitea;

--
-- TOC entry 250 (class 1259 OID 16737)
-- Name: hook_task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.hook_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hook_task_id_seq OWNER TO gitea;

--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 250
-- Name: hook_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.hook_task_id_seq OWNED BY public.hook_task.id;


--
-- TOC entry 229 (class 1259 OID 16572)
-- Name: issue; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue (
    id bigint NOT NULL,
    repo_id bigint,
    index bigint,
    poster_id bigint,
    name character varying(255),
    content text,
    milestone_id bigint,
    priority integer,
    is_closed boolean,
    is_pull boolean,
    num_comments integer,
    ref character varying(255),
    deadline_unix bigint,
    created_unix bigint,
    updated_unix bigint,
    closed_unix bigint,
    is_locked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.issue OWNER TO gitea;

--
-- TOC entry 303 (class 1259 OID 17051)
-- Name: issue_assignees; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_assignees (
    id bigint NOT NULL,
    assignee_id bigint,
    issue_id bigint
);


ALTER TABLE public.issue_assignees OWNER TO gitea;

--
-- TOC entry 302 (class 1259 OID 17049)
-- Name: issue_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_assignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_assignees_id_seq OWNER TO gitea;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 302
-- Name: issue_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_assignees_id_seq OWNED BY public.issue_assignees.id;


--
-- TOC entry 297 (class 1259 OID 17015)
-- Name: issue_dependency; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_dependency (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    dependency_id bigint NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.issue_dependency OWNER TO gitea;

--
-- TOC entry 296 (class 1259 OID 17013)
-- Name: issue_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_dependency_id_seq OWNER TO gitea;

--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 296
-- Name: issue_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_dependency_id_seq OWNED BY public.issue_dependency.id;


--
-- TOC entry 228 (class 1259 OID 16570)
-- Name: issue_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_id_seq OWNER TO gitea;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 228
-- Name: issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_id_seq OWNED BY public.issue.id;


--
-- TOC entry 239 (class 1259 OID 16653)
-- Name: issue_label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_label (
    id bigint NOT NULL,
    issue_id bigint,
    label_id bigint
);


ALTER TABLE public.issue_label OWNER TO gitea;

--
-- TOC entry 238 (class 1259 OID 16651)
-- Name: issue_label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_label_id_seq OWNER TO gitea;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 238
-- Name: issue_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_label_id_seq OWNED BY public.issue_label.id;


--
-- TOC entry 267 (class 1259 OID 16834)
-- Name: issue_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_user (
    id bigint NOT NULL,
    uid bigint,
    issue_id bigint,
    is_read boolean,
    is_mentioned boolean
);


ALTER TABLE public.issue_user OWNER TO gitea;

--
-- TOC entry 266 (class 1259 OID 16832)
-- Name: issue_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_user_id_seq OWNER TO gitea;

--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 266
-- Name: issue_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_user_id_seq OWNED BY public.issue_user.id;


--
-- TOC entry 285 (class 1259 OID 16944)
-- Name: issue_watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_watch (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    is_watching boolean NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.issue_watch OWNER TO gitea;

--
-- TOC entry 284 (class 1259 OID 16942)
-- Name: issue_watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_watch_id_seq OWNER TO gitea;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 284
-- Name: issue_watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_watch_id_seq OWNED BY public.issue_watch.id;


--
-- TOC entry 237 (class 1259 OID 16641)
-- Name: label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.label (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    description character varying(255),
    color character varying(7),
    num_issues integer,
    num_closed_issues integer,
    query_string character varying(255),
    is_selected boolean
);


ALTER TABLE public.label OWNER TO gitea;

--
-- TOC entry 236 (class 1259 OID 16639)
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_id_seq OWNER TO gitea;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 236
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- TOC entry 299 (class 1259 OID 17024)
-- Name: lfs_lock; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_lock (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    owner_id bigint NOT NULL,
    path text,
    created timestamp without time zone
);


ALTER TABLE public.lfs_lock OWNER TO gitea;

--
-- TOC entry 298 (class 1259 OID 17022)
-- Name: lfs_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_lock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_lock_id_seq OWNER TO gitea;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 298
-- Name: lfs_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_lock_id_seq OWNED BY public.lfs_lock.id;


--
-- TOC entry 269 (class 1259 OID 16843)
-- Name: lfs_meta_object; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_meta_object (
    id bigint NOT NULL,
    oid character varying(255) NOT NULL,
    size bigint NOT NULL,
    repository_id bigint NOT NULL,
    created_unix bigint
);


ALTER TABLE public.lfs_meta_object OWNER TO gitea;

--
-- TOC entry 268 (class 1259 OID 16841)
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_meta_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lfs_meta_object_id_seq OWNER TO gitea;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 268
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_meta_object_id_seq OWNED BY public.lfs_meta_object.id;


--
-- TOC entry 247 (class 1259 OID 16705)
-- Name: login_source; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.login_source (
    id bigint NOT NULL,
    type integer,
    name character varying(255),
    is_actived boolean DEFAULT false NOT NULL,
    is_sync_enabled boolean DEFAULT false NOT NULL,
    cfg text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.login_source OWNER TO gitea;

--
-- TOC entry 246 (class 1259 OID 16703)
-- Name: login_source_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.login_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_source_id_seq OWNER TO gitea;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 246
-- Name: login_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.login_source_id_seq OWNED BY public.login_source.id;


--
-- TOC entry 241 (class 1259 OID 16662)
-- Name: milestone; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.milestone (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    content text,
    is_closed boolean,
    num_issues integer,
    num_closed_issues integer,
    completeness integer,
    deadline_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE public.milestone OWNER TO gitea;

--
-- TOC entry 240 (class 1259 OID 16660)
-- Name: milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestone_id_seq OWNER TO gitea;

--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 240
-- Name: milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.milestone_id_seq OWNED BY public.milestone.id;


--
-- TOC entry 243 (class 1259 OID 16674)
-- Name: mirror; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.mirror (
    id bigint NOT NULL,
    repo_id bigint,
    "interval" bigint,
    enable_prune boolean DEFAULT true NOT NULL,
    updated_unix bigint,
    next_update_unix bigint
);


ALTER TABLE public.mirror OWNER TO gitea;

--
-- TOC entry 242 (class 1259 OID 16672)
-- Name: mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mirror_id_seq OWNER TO gitea;

--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 242
-- Name: mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.mirror_id_seq OWNED BY public.mirror.id;


--
-- TOC entry 261 (class 1259 OID 16795)
-- Name: notice; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notice (
    id bigint NOT NULL,
    type integer,
    description text,
    created_unix bigint
);


ALTER TABLE public.notice OWNER TO gitea;

--
-- TOC entry 260 (class 1259 OID 16793)
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notice_id_seq OWNER TO gitea;

--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 260
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notice_id_seq OWNED BY public.notice.id;


--
-- TOC entry 265 (class 1259 OID 16817)
-- Name: notification; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notification (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    repo_id bigint NOT NULL,
    status smallint NOT NULL,
    source smallint NOT NULL,
    issue_id bigint NOT NULL,
    commit_id character varying(255),
    updated_by bigint NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.notification OWNER TO gitea;

--
-- TOC entry 264 (class 1259 OID 16815)
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO gitea;

--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 264
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- TOC entry 311 (class 1259 OID 17097)
-- Name: oauth2_application; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_application (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    client_id character varying(255),
    client_secret character varying(255),
    redirect_uris text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.oauth2_application OWNER TO gitea;

--
-- TOC entry 310 (class 1259 OID 17095)
-- Name: oauth2_application_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_application_id_seq OWNER TO gitea;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 310
-- Name: oauth2_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_application_id_seq OWNED BY public.oauth2_application.id;


--
-- TOC entry 313 (class 1259 OID 17112)
-- Name: oauth2_authorization_code; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_authorization_code (
    id bigint NOT NULL,
    grant_id bigint,
    code character varying(255),
    code_challenge character varying(255),
    code_challenge_method character varying(255),
    redirect_uri character varying(255),
    valid_until bigint
);


ALTER TABLE public.oauth2_authorization_code OWNER TO gitea;

--
-- TOC entry 312 (class 1259 OID 17110)
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_authorization_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_authorization_code_id_seq OWNER TO gitea;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 312
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_authorization_code_id_seq OWNED BY public.oauth2_authorization_code.id;


--
-- TOC entry 315 (class 1259 OID 17125)
-- Name: oauth2_grant; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_grant (
    id bigint NOT NULL,
    user_id bigint,
    application_id bigint,
    counter bigint DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.oauth2_grant OWNER TO gitea;

--
-- TOC entry 314 (class 1259 OID 17123)
-- Name: oauth2_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_grant_id_seq OWNER TO gitea;

--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 314
-- Name: oauth2_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_grant_id_seq OWNED BY public.oauth2_grant.id;


--
-- TOC entry 319 (class 1259 OID 17150)
-- Name: oauth2_session; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_session (
    id character varying(100) NOT NULL,
    data text,
    created_unix bigint,
    updated_unix bigint,
    expires_unix bigint
);


ALTER TABLE public.oauth2_session OWNER TO gitea;

--
-- TOC entry 255 (class 1259 OID 16763)
-- Name: org_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.org_user (
    id bigint NOT NULL,
    uid bigint,
    org_id bigint,
    is_public boolean
);


ALTER TABLE public.org_user OWNER TO gitea;

--
-- TOC entry 254 (class 1259 OID 16761)
-- Name: org_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.org_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_user_id_seq OWNER TO gitea;

--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 254
-- Name: org_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.org_user_id_seq OWNED BY public.org_user.id;


--
-- TOC entry 281 (class 1259 OID 16918)
-- Name: protected_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.protected_branch (
    id bigint NOT NULL,
    repo_id bigint,
    branch_name character varying(255),
    can_push boolean DEFAULT false NOT NULL,
    enable_whitelist boolean,
    whitelist_user_i_ds text,
    whitelist_team_i_ds text,
    enable_merge_whitelist boolean DEFAULT false NOT NULL,
    merge_whitelist_user_i_ds text,
    merge_whitelist_team_i_ds text,
    approvals_whitelist_user_i_ds text,
    approvals_whitelist_team_i_ds text,
    required_approvals bigint DEFAULT 0 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.protected_branch OWNER TO gitea;

--
-- TOC entry 280 (class 1259 OID 16916)
-- Name: protected_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.protected_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.protected_branch_id_seq OWNER TO gitea;

--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 280
-- Name: protected_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.protected_branch_id_seq OWNED BY public.protected_branch.id;


--
-- TOC entry 207 (class 1259 OID 16421)
-- Name: public_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.public_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fingerprint character varying(255) NOT NULL,
    content text NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    login_source_id bigint DEFAULT 0 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.public_key OWNER TO gitea;

--
-- TOC entry 206 (class 1259 OID 16419)
-- Name: public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.public_key_id_seq OWNER TO gitea;

--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 206
-- Name: public_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.public_key_id_seq OWNED BY public.public_key.id;


--
-- TOC entry 231 (class 1259 OID 16594)
-- Name: pull_request; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.pull_request (
    id bigint NOT NULL,
    type integer,
    status integer,
    conflicted_files json,
    issue_id bigint,
    index bigint,
    head_repo_id bigint,
    base_repo_id bigint,
    head_user_name character varying(255),
    head_branch character varying(255),
    base_branch character varying(255),
    merge_base character varying(40),
    has_merged boolean,
    merged_commit_id character varying(40),
    merger_id bigint,
    merged_unix bigint
);


ALTER TABLE public.pull_request OWNER TO gitea;

--
-- TOC entry 230 (class 1259 OID 16592)
-- Name: pull_request_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.pull_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pull_request_id_seq OWNER TO gitea;

--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 230
-- Name: pull_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.pull_request_id_seq OWNED BY public.pull_request.id;


--
-- TOC entry 301 (class 1259 OID 17037)
-- Name: reaction; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.reaction (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    issue_id bigint NOT NULL,
    comment_id bigint,
    user_id bigint NOT NULL,
    created_unix bigint
);


ALTER TABLE public.reaction OWNER TO gitea;

--
-- TOC entry 300 (class 1259 OID 17035)
-- Name: reaction_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.reaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_id_seq OWNER TO gitea;

--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 300
-- Name: reaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.reaction_id_seq OWNED BY public.reaction.id;


--
-- TOC entry 245 (class 1259 OID 16686)
-- Name: release; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.release (
    id bigint NOT NULL,
    repo_id bigint,
    publisher_id bigint,
    tag_name character varying(255),
    lower_tag_name character varying(255),
    target character varying(255),
    title character varying(255),
    sha1 character varying(40),
    num_commits bigint,
    note text,
    is_draft boolean DEFAULT false NOT NULL,
    is_prerelease boolean DEFAULT false NOT NULL,
    is_tag boolean DEFAULT false NOT NULL,
    created_unix bigint
);


ALTER TABLE public.release OWNER TO gitea;

--
-- TOC entry 244 (class 1259 OID 16684)
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_id_seq OWNER TO gitea;

--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 244
-- Name: release_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.release_id_seq OWNED BY public.release.id;


--
-- TOC entry 295 (class 1259 OID 17006)
-- Name: repo_indexer_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_indexer_status (
    id bigint NOT NULL,
    repo_id bigint,
    commit_sha character varying(40)
);


ALTER TABLE public.repo_indexer_status OWNER TO gitea;

--
-- TOC entry 294 (class 1259 OID 17004)
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_indexer_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_indexer_status_id_seq OWNER TO gitea;

--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 294
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_indexer_status_id_seq OWNED BY public.repo_indexer_status.id;


--
-- TOC entry 278 (class 1259 OID 16902)
-- Name: repo_redirect; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_redirect (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    redirect_repo_id bigint
);


ALTER TABLE public.repo_redirect OWNER TO gitea;

--
-- TOC entry 277 (class 1259 OID 16900)
-- Name: repo_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_redirect_id_seq OWNER TO gitea;

--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 277
-- Name: repo_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_redirect_id_seq OWNED BY public.repo_redirect.id;


--
-- TOC entry 318 (class 1259 OID 17146)
-- Name: repo_topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_topic (
    repo_id bigint,
    topic_id bigint
);


ALTER TABLE public.repo_topic OWNER TO gitea;

--
-- TOC entry 276 (class 1259 OID 16889)
-- Name: repo_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_unit (
    id bigint NOT NULL,
    repo_id bigint,
    type integer,
    config text,
    created_unix bigint
);


ALTER TABLE public.repo_unit OWNER TO gitea;

--
-- TOC entry 275 (class 1259 OID 16887)
-- Name: repo_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repo_unit_id_seq OWNER TO gitea;

--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 275
-- Name: repo_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_unit_id_seq OWNED BY public.repo_unit.id;


--
-- TOC entry 211 (class 1259 OID 16452)
-- Name: repository; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repository (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    website character varying(2048),
    default_branch character varying(255),
    num_watches integer,
    num_stars integer,
    num_forks integer,
    num_issues integer,
    num_closed_issues integer,
    num_pulls integer,
    num_closed_pulls integer,
    num_milestones integer DEFAULT 0 NOT NULL,
    num_closed_milestones integer DEFAULT 0 NOT NULL,
    is_private boolean,
    is_empty boolean,
    is_archived boolean,
    is_mirror boolean,
    is_fork boolean DEFAULT false NOT NULL,
    fork_id bigint,
    size bigint DEFAULT 0 NOT NULL,
    is_fsck_enabled boolean DEFAULT true NOT NULL,
    close_issues_via_commit_in_any_branch boolean DEFAULT false NOT NULL,
    topics json,
    avatar character varying(64),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.repository OWNER TO gitea;

--
-- TOC entry 210 (class 1259 OID 16450)
-- Name: repository_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_id_seq OWNER TO gitea;

--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 210
-- Name: repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repository_id_seq OWNED BY public.repository.id;


--
-- TOC entry 309 (class 1259 OID 17085)
-- Name: review; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    type integer,
    reviewer_id bigint,
    issue_id bigint,
    content character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.review OWNER TO gitea;

--
-- TOC entry 308 (class 1259 OID 17083)
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_id_seq OWNER TO gitea;

--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 308
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- TOC entry 223 (class 1259 OID 16534)
-- Name: star; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.star (
    id bigint NOT NULL,
    uid bigint,
    repo_id bigint
);


ALTER TABLE public.star OWNER TO gitea;

--
-- TOC entry 222 (class 1259 OID 16532)
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO gitea;

--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 222
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.id;


--
-- TOC entry 289 (class 1259 OID 16971)
-- Name: stopwatch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.stopwatch (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint
);


ALTER TABLE public.stopwatch OWNER TO gitea;

--
-- TOC entry 288 (class 1259 OID 16969)
-- Name: stopwatch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.stopwatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stopwatch_id_seq OWNER TO gitea;

--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 288
-- Name: stopwatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.stopwatch_id_seq OWNED BY public.stopwatch.id;


--
-- TOC entry 253 (class 1259 OID 16751)
-- Name: team; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team (
    id bigint NOT NULL,
    org_id bigint,
    lower_name character varying(255),
    name character varying(255),
    description character varying(255),
    authorize integer,
    num_repos integer,
    num_members integer
);


ALTER TABLE public.team OWNER TO gitea;

--
-- TOC entry 252 (class 1259 OID 16749)
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO gitea;

--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 252
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- TOC entry 259 (class 1259 OID 16785)
-- Name: team_repo; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_repo (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    repo_id bigint
);


ALTER TABLE public.team_repo OWNER TO gitea;

--
-- TOC entry 258 (class 1259 OID 16783)
-- Name: team_repo_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_repo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_repo_id_seq OWNER TO gitea;

--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 258
-- Name: team_repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_repo_id_seq OWNED BY public.team_repo.id;


--
-- TOC entry 307 (class 1259 OID 17075)
-- Name: team_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_unit (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    type integer
);


ALTER TABLE public.team_unit OWNER TO gitea;

--
-- TOC entry 306 (class 1259 OID 17073)
-- Name: team_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_unit_id_seq OWNER TO gitea;

--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 306
-- Name: team_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_unit_id_seq OWNED BY public.team_unit.id;


--
-- TOC entry 257 (class 1259 OID 16775)
-- Name: team_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_user (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    uid bigint
);


ALTER TABLE public.team_user OWNER TO gitea;

--
-- TOC entry 256 (class 1259 OID 16773)
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_user_id_seq OWNER TO gitea;

--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 256
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_user_id_seq OWNED BY public.team_user.id;


--
-- TOC entry 317 (class 1259 OID 17137)
-- Name: topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.topic (
    id bigint NOT NULL,
    name character varying(25),
    repo_count integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.topic OWNER TO gitea;

--
-- TOC entry 316 (class 1259 OID 17135)
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_id_seq OWNER TO gitea;

--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 316
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.topic_id_seq OWNED BY public.topic.id;


--
-- TOC entry 291 (class 1259 OID 16981)
-- Name: tracked_time; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.tracked_time (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint,
    "time" bigint
);


ALTER TABLE public.tracked_time OWNER TO gitea;

--
-- TOC entry 290 (class 1259 OID 16979)
-- Name: tracked_time_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.tracked_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracked_time_id_seq OWNER TO gitea;

--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 290
-- Name: tracked_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.tracked_time_id_seq OWNED BY public.tracked_time.id;


--
-- TOC entry 271 (class 1259 OID 16854)
-- Name: two_factor; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.two_factor (
    id bigint NOT NULL,
    uid bigint,
    secret character varying(255),
    scratch_salt character varying(255),
    scratch_hash character varying(255),
    last_used_passcode character varying(10),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.two_factor OWNER TO gitea;

--
-- TOC entry 270 (class 1259 OID 16852)
-- Name: two_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.two_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.two_factor_id_seq OWNER TO gitea;

--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 270
-- Name: two_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.two_factor_id_seq OWNED BY public.two_factor.id;


--
-- TOC entry 305 (class 1259 OID 17061)
-- Name: u2f_registration; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.u2f_registration (
    id bigint NOT NULL,
    name character varying(255),
    user_id bigint,
    raw bytea,
    counter bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.u2f_registration OWNER TO gitea;

--
-- TOC entry 304 (class 1259 OID 17059)
-- Name: u2f_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.u2f_registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.u2f_registration_id_seq OWNER TO gitea;

--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 304
-- Name: u2f_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.u2f_registration_id_seq OWNED BY public.u2f_registration.id;


--
-- TOC entry 219 (class 1259 OID 16516)
-- Name: upload; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.upload (
    id bigint NOT NULL,
    uuid uuid,
    name character varying(255)
);


ALTER TABLE public.upload OWNER TO gitea;

--
-- TOC entry 218 (class 1259 OID 16514)
-- Name: upload_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_id_seq OWNER TO gitea;

--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 218
-- Name: upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.upload_id_seq OWNED BY public.upload.id;


--
-- TOC entry 205 (class 1259 OID 16395)
-- Name: user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    keep_email_private boolean,
    passwd character varying(255) NOT NULL,
    must_change_password boolean DEFAULT false NOT NULL,
    login_type integer,
    login_source bigint DEFAULT 0 NOT NULL,
    login_name character varying(255),
    type integer,
    location character varying(255),
    website character varying(255),
    rands character varying(10),
    salt character varying(10),
    language character varying(5),
    description character varying(255),
    created_unix bigint,
    updated_unix bigint,
    last_login_unix bigint,
    last_repo_visibility boolean,
    max_repo_creation integer DEFAULT '-1'::integer NOT NULL,
    is_active boolean,
    is_admin boolean,
    allow_git_hook boolean,
    allow_import_local boolean,
    allow_create_organization boolean DEFAULT true,
    prohibit_login boolean DEFAULT false NOT NULL,
    avatar character varying(2048) NOT NULL,
    avatar_email character varying(255) NOT NULL,
    use_custom_avatar boolean,
    num_followers integer,
    num_following integer DEFAULT 0 NOT NULL,
    num_stars integer,
    num_repos integer,
    num_teams integer,
    num_members integer,
    visibility integer DEFAULT 0 NOT NULL,
    diff_view_style character varying(255) DEFAULT ''::character varying NOT NULL,
    theme character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO gitea;

--
-- TOC entry 204 (class 1259 OID 16393)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO gitea;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 283 (class 1259 OID 16933)
-- Name: user_open_id; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_open_id (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    uri character varying(255) NOT NULL,
    show boolean DEFAULT false
);


ALTER TABLE public.user_open_id OWNER TO gitea;

--
-- TOC entry 282 (class 1259 OID 16931)
-- Name: user_open_id_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_open_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_open_id_id_seq OWNER TO gitea;

--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 282
-- Name: user_open_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_open_id_id_seq OWNED BY public.user_open_id.id;


--
-- TOC entry 203 (class 1259 OID 16387)
-- Name: version; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.version (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.version OWNER TO gitea;

--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_id_seq OWNER TO gitea;

--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 202
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.version_id_seq OWNED BY public.version.id;


--
-- TOC entry 221 (class 1259 OID 16525)
-- Name: watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.watch (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint
);


ALTER TABLE public.watch OWNER TO gitea;

--
-- TOC entry 220 (class 1259 OID 16523)
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watch_id_seq OWNER TO gitea;

--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 220
-- Name: watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.watch_id_seq OWNED BY public.watch.id;


--
-- TOC entry 249 (class 1259 OID 16723)
-- Name: webhook; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.webhook (
    id bigint NOT NULL,
    repo_id bigint,
    org_id bigint,
    url text,
    signature text,
    http_method character varying(255),
    content_type integer,
    secret text,
    events text,
    is_ssl boolean,
    is_active boolean,
    hook_task_type integer,
    meta text,
    last_status integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.webhook OWNER TO gitea;

--
-- TOC entry 248 (class 1259 OID 16721)
-- Name: webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhook_id_seq OWNER TO gitea;

--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 248
-- Name: webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.webhook_id_seq OWNED BY public.webhook.id;


--
-- TOC entry 3185 (class 2604 OID 16510)
-- Name: access id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access ALTER COLUMN id SET DEFAULT nextval('public.access_id_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 16440)
-- Name: access_token id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token ALTER COLUMN id SET DEFAULT nextval('public.access_token_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16555)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16629)
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment ALTER COLUMN id SET DEFAULT nextval('public.attachment_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16498)
-- Name: collaboration id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration ALTER COLUMN id SET DEFAULT nextval('public.collaboration_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16614)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16956)
-- Name: commit_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status ALTER COLUMN id SET DEFAULT nextval('public.commit_status_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16994)
-- Name: deleted_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deleted_branch ALTER COLUMN id SET DEFAULT nextval('public.deleted_branch_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 16483)
-- Name: deploy_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key ALTER COLUMN id SET DEFAULT nextval('public.deploy_key_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 16810)
-- Name: email_address id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address ALTER COLUMN id SET DEFAULT nextval('public.email_address_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16546)
-- Name: follow id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow ALTER COLUMN id SET DEFAULT nextval('public.follow_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16871)
-- Name: gpg_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key ALTER COLUMN id SET DEFAULT nextval('public.gpg_key_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16742)
-- Name: hook_task id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task ALTER COLUMN id SET DEFAULT nextval('public.hook_task_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16575)
-- Name: issue id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue ALTER COLUMN id SET DEFAULT nextval('public.issue_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 17054)
-- Name: issue_assignees id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees ALTER COLUMN id SET DEFAULT nextval('public.issue_assignees_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 17018)
-- Name: issue_dependency id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency ALTER COLUMN id SET DEFAULT nextval('public.issue_dependency_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16656)
-- Name: issue_label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label ALTER COLUMN id SET DEFAULT nextval('public.issue_label_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16837)
-- Name: issue_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user ALTER COLUMN id SET DEFAULT nextval('public.issue_user_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16947)
-- Name: issue_watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch ALTER COLUMN id SET DEFAULT nextval('public.issue_watch_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16644)
-- Name: label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 17027)
-- Name: lfs_lock id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock ALTER COLUMN id SET DEFAULT nextval('public.lfs_lock_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16846)
-- Name: lfs_meta_object id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object ALTER COLUMN id SET DEFAULT nextval('public.lfs_meta_object_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16708)
-- Name: login_source id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source ALTER COLUMN id SET DEFAULT nextval('public.login_source_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16665)
-- Name: milestone id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone ALTER COLUMN id SET DEFAULT nextval('public.milestone_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 16677)
-- Name: mirror id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror ALTER COLUMN id SET DEFAULT nextval('public.mirror_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16798)
-- Name: notice id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice ALTER COLUMN id SET DEFAULT nextval('public.notice_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16820)
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 17100)
-- Name: oauth2_application id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_application_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 17115)
-- Name: oauth2_authorization_code id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_authorization_code ALTER COLUMN id SET DEFAULT nextval('public.oauth2_authorization_code_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 17128)
-- Name: oauth2_grant id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_grant_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16766)
-- Name: org_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user ALTER COLUMN id SET DEFAULT nextval('public.org_user_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16921)
-- Name: protected_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_id_seq'::regclass);


--
-- TOC entry 3169 (class 2604 OID 16424)
-- Name: public_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key ALTER COLUMN id SET DEFAULT nextval('public.public_key_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16597)
-- Name: pull_request id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request ALTER COLUMN id SET DEFAULT nextval('public.pull_request_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 17040)
-- Name: reaction id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction ALTER COLUMN id SET DEFAULT nextval('public.reaction_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 16689)
-- Name: release id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release ALTER COLUMN id SET DEFAULT nextval('public.release_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 17009)
-- Name: repo_indexer_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status ALTER COLUMN id SET DEFAULT nextval('public.repo_indexer_status_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16905)
-- Name: repo_redirect id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect ALTER COLUMN id SET DEFAULT nextval('public.repo_redirect_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16892)
-- Name: repo_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit ALTER COLUMN id SET DEFAULT nextval('public.repo_unit_id_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 16455)
-- Name: repository id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository ALTER COLUMN id SET DEFAULT nextval('public.repository_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 17088)
-- Name: review id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16537)
-- Name: star id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16974)
-- Name: stopwatch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch ALTER COLUMN id SET DEFAULT nextval('public.stopwatch_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 16754)
-- Name: team id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16788)
-- Name: team_repo id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo ALTER COLUMN id SET DEFAULT nextval('public.team_repo_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 17078)
-- Name: team_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit ALTER COLUMN id SET DEFAULT nextval('public.team_unit_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16778)
-- Name: team_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user ALTER COLUMN id SET DEFAULT nextval('public.team_user_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 17140)
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic ALTER COLUMN id SET DEFAULT nextval('public.topic_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16984)
-- Name: tracked_time id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time ALTER COLUMN id SET DEFAULT nextval('public.tracked_time_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16857)
-- Name: two_factor id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor ALTER COLUMN id SET DEFAULT nextval('public.two_factor_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 17064)
-- Name: u2f_registration id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.u2f_registration ALTER COLUMN id SET DEFAULT nextval('public.u2f_registration_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 16519)
-- Name: upload id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload ALTER COLUMN id SET DEFAULT nextval('public.upload_id_seq'::regclass);


--
-- TOC entry 3159 (class 2604 OID 16398)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16936)
-- Name: user_open_id id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id ALTER COLUMN id SET DEFAULT nextval('public.user_open_id_id_seq'::regclass);


--
-- TOC entry 3158 (class 2604 OID 16390)
-- Name: version id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version ALTER COLUMN id SET DEFAULT nextval('public.version_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16528)
-- Name: watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch ALTER COLUMN id SET DEFAULT nextval('public.watch_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16726)
-- Name: webhook id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook ALTER COLUMN id SET DEFAULT nextval('public.webhook_id_seq'::regclass);


--
-- TOC entry 3689 (class 0 OID 16507)
-- Dependencies: 217
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access (id, user_id, repo_id, mode) FROM stdin;
\.


--
-- TOC entry 3681 (class 0 OID 16437)
-- Dependencies: 209
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access_token (id, uid, name, token_hash, token_salt, token_last_eight, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3699 (class 0 OID 16552)
-- Dependencies: 227
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action (id, user_id, op_type, act_user_id, repo_id, comment_id, is_deleted, ref_name, is_private, content, created_unix) FROM stdin;
\.


--
-- TOC entry 3707 (class 0 OID 16626)
-- Dependencies: 235
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.attachment (id, uuid, issue_id, release_id, uploader_id, comment_id, name, download_count, size, created_unix) FROM stdin;
\.


--
-- TOC entry 3687 (class 0 OID 16495)
-- Dependencies: 215
-- Data for Name: collaboration; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.collaboration (id, repo_id, user_id, mode) FROM stdin;
\.


--
-- TOC entry 3705 (class 0 OID 16611)
-- Dependencies: 233
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.comment (id, type, poster_id, issue_id, label_id, old_milestone_id, milestone_id, assignee_id, removed_assignee, old_title, new_title, dependent_issue_id, commit_id, line, tree_path, content, patch, created_unix, updated_unix, commit_sha, review_id, invalidated) FROM stdin;
\.


--
-- TOC entry 3759 (class 0 OID 16953)
-- Dependencies: 287
-- Data for Name: commit_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.commit_status (id, index, repo_id, state, sha, target_url, description, context_hash, context, creator_id, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3765 (class 0 OID 16991)
-- Dependencies: 293
-- Data for Name: deleted_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.deleted_branch (id, repo_id, name, commit, deleted_by_id, deleted_unix) FROM stdin;
\.


--
-- TOC entry 3685 (class 0 OID 16480)
-- Dependencies: 213
-- Data for Name: deploy_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.deploy_key (id, key_id, repo_id, name, fingerprint, mode, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3735 (class 0 OID 16807)
-- Dependencies: 263
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.email_address (id, uid, email, is_activated) FROM stdin;
\.


--
-- TOC entry 3751 (class 0 OID 16910)
-- Dependencies: 279
-- Data for Name: external_login_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.external_login_user (external_id, user_id, login_source_id) FROM stdin;
\.


--
-- TOC entry 3697 (class 0 OID 16543)
-- Dependencies: 225
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.follow (id, user_id, follow_id) FROM stdin;
\.


--
-- TOC entry 3745 (class 0 OID 16868)
-- Dependencies: 273
-- Data for Name: gpg_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.gpg_key (id, owner_id, key_id, primary_key_id, content, created_unix, expired_unix, added_unix, emails, can_sign, can_encrypt_comms, can_encrypt_storage, can_certify) FROM stdin;
\.


--
-- TOC entry 3746 (class 0 OID 16879)
-- Dependencies: 274
-- Data for Name: gpg_key_import; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.gpg_key_import (key_id, content) FROM stdin;
\.


--
-- TOC entry 3723 (class 0 OID 16739)
-- Dependencies: 251
-- Data for Name: hook_task; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.hook_task (id, repo_id, hook_id, uuid, type, url, signature, payload_content, http_method, content_type, event_type, is_ssl, is_delivered, delivered, is_succeed, request_content, response_content) FROM stdin;
\.


--
-- TOC entry 3701 (class 0 OID 16572)
-- Dependencies: 229
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue (id, repo_id, index, poster_id, name, content, milestone_id, priority, is_closed, is_pull, num_comments, ref, deadline_unix, created_unix, updated_unix, closed_unix, is_locked) FROM stdin;
\.


--
-- TOC entry 3775 (class 0 OID 17051)
-- Dependencies: 303
-- Data for Name: issue_assignees; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_assignees (id, assignee_id, issue_id) FROM stdin;
\.


--
-- TOC entry 3769 (class 0 OID 17015)
-- Dependencies: 297
-- Data for Name: issue_dependency; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_dependency (id, user_id, issue_id, dependency_id, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3711 (class 0 OID 16653)
-- Dependencies: 239
-- Data for Name: issue_label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_label (id, issue_id, label_id) FROM stdin;
\.


--
-- TOC entry 3739 (class 0 OID 16834)
-- Dependencies: 267
-- Data for Name: issue_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_user (id, uid, issue_id, is_read, is_mentioned) FROM stdin;
\.


--
-- TOC entry 3757 (class 0 OID 16944)
-- Dependencies: 285
-- Data for Name: issue_watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_watch (id, user_id, issue_id, is_watching, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3709 (class 0 OID 16641)
-- Dependencies: 237
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.label (id, repo_id, name, description, color, num_issues, num_closed_issues, query_string, is_selected) FROM stdin;
\.


--
-- TOC entry 3771 (class 0 OID 17024)
-- Dependencies: 299
-- Data for Name: lfs_lock; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_lock (id, repo_id, owner_id, path, created) FROM stdin;
\.


--
-- TOC entry 3741 (class 0 OID 16843)
-- Dependencies: 269
-- Data for Name: lfs_meta_object; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_meta_object (id, oid, size, repository_id, created_unix) FROM stdin;
\.


--
-- TOC entry 3719 (class 0 OID 16705)
-- Dependencies: 247
-- Data for Name: login_source; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.login_source (id, type, name, is_actived, is_sync_enabled, cfg, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3713 (class 0 OID 16662)
-- Dependencies: 241
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.milestone (id, repo_id, name, content, is_closed, num_issues, num_closed_issues, completeness, deadline_unix, closed_date_unix) FROM stdin;
\.


--
-- TOC entry 3715 (class 0 OID 16674)
-- Dependencies: 243
-- Data for Name: mirror; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.mirror (id, repo_id, "interval", enable_prune, updated_unix, next_update_unix) FROM stdin;
\.


--
-- TOC entry 3733 (class 0 OID 16795)
-- Dependencies: 261
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notice (id, type, description, created_unix) FROM stdin;
\.


--
-- TOC entry 3737 (class 0 OID 16817)
-- Dependencies: 265
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notification (id, user_id, repo_id, status, source, issue_id, commit_id, updated_by, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3783 (class 0 OID 17097)
-- Dependencies: 311
-- Data for Name: oauth2_application; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_application (id, uid, name, client_id, client_secret, redirect_uris, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3785 (class 0 OID 17112)
-- Dependencies: 313
-- Data for Name: oauth2_authorization_code; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_authorization_code (id, grant_id, code, code_challenge, code_challenge_method, redirect_uri, valid_until) FROM stdin;
\.


--
-- TOC entry 3787 (class 0 OID 17125)
-- Dependencies: 315
-- Data for Name: oauth2_grant; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_grant (id, user_id, application_id, counter, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3791 (class 0 OID 17150)
-- Dependencies: 319
-- Data for Name: oauth2_session; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_session (id, data, created_unix, updated_unix, expires_unix) FROM stdin;
\.


--
-- TOC entry 3727 (class 0 OID 16763)
-- Dependencies: 255
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.org_user (id, uid, org_id, is_public) FROM stdin;
\.


--
-- TOC entry 3753 (class 0 OID 16918)
-- Dependencies: 281
-- Data for Name: protected_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.protected_branch (id, repo_id, branch_name, can_push, enable_whitelist, whitelist_user_i_ds, whitelist_team_i_ds, enable_merge_whitelist, merge_whitelist_user_i_ds, merge_whitelist_team_i_ds, approvals_whitelist_user_i_ds, approvals_whitelist_team_i_ds, required_approvals, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3679 (class 0 OID 16421)
-- Dependencies: 207
-- Data for Name: public_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.public_key (id, owner_id, name, fingerprint, content, mode, type, login_source_id, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3703 (class 0 OID 16594)
-- Dependencies: 231
-- Data for Name: pull_request; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.pull_request (id, type, status, conflicted_files, issue_id, index, head_repo_id, base_repo_id, head_user_name, head_branch, base_branch, merge_base, has_merged, merged_commit_id, merger_id, merged_unix) FROM stdin;
\.


--
-- TOC entry 3773 (class 0 OID 17037)
-- Dependencies: 301
-- Data for Name: reaction; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.reaction (id, type, issue_id, comment_id, user_id, created_unix) FROM stdin;
\.


--
-- TOC entry 3717 (class 0 OID 16686)
-- Dependencies: 245
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.release (id, repo_id, publisher_id, tag_name, lower_tag_name, target, title, sha1, num_commits, note, is_draft, is_prerelease, is_tag, created_unix) FROM stdin;
\.


--
-- TOC entry 3767 (class 0 OID 17006)
-- Dependencies: 295
-- Data for Name: repo_indexer_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_indexer_status (id, repo_id, commit_sha) FROM stdin;
\.


--
-- TOC entry 3750 (class 0 OID 16902)
-- Dependencies: 278
-- Data for Name: repo_redirect; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_redirect (id, owner_id, lower_name, redirect_repo_id) FROM stdin;
\.


--
-- TOC entry 3790 (class 0 OID 17146)
-- Dependencies: 318
-- Data for Name: repo_topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_topic (repo_id, topic_id) FROM stdin;
\.


--
-- TOC entry 3748 (class 0 OID 16889)
-- Dependencies: 276
-- Data for Name: repo_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_unit (id, repo_id, type, config, created_unix) FROM stdin;
\.


--
-- TOC entry 3683 (class 0 OID 16452)
-- Dependencies: 211
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repository (id, owner_id, lower_name, name, description, website, default_branch, num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, num_closed_pulls, num_milestones, num_closed_milestones, is_private, is_empty, is_archived, is_mirror, is_fork, fork_id, size, is_fsck_enabled, close_issues_via_commit_in_any_branch, topics, avatar, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3781 (class 0 OID 17085)
-- Dependencies: 309
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.review (id, type, reviewer_id, issue_id, content, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3695 (class 0 OID 16534)
-- Dependencies: 223
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.star (id, uid, repo_id) FROM stdin;
\.


--
-- TOC entry 3761 (class 0 OID 16971)
-- Dependencies: 289
-- Data for Name: stopwatch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.stopwatch (id, issue_id, user_id, created_unix) FROM stdin;
\.


--
-- TOC entry 3725 (class 0 OID 16751)
-- Dependencies: 253
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team (id, org_id, lower_name, name, description, authorize, num_repos, num_members) FROM stdin;
\.


--
-- TOC entry 3731 (class 0 OID 16785)
-- Dependencies: 259
-- Data for Name: team_repo; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_repo (id, org_id, team_id, repo_id) FROM stdin;
\.


--
-- TOC entry 3779 (class 0 OID 17075)
-- Dependencies: 307
-- Data for Name: team_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_unit (id, org_id, team_id, type) FROM stdin;
\.


--
-- TOC entry 3729 (class 0 OID 16775)
-- Dependencies: 257
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_user (id, org_id, team_id, uid) FROM stdin;
\.


--
-- TOC entry 3789 (class 0 OID 17137)
-- Dependencies: 317
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.topic (id, name, repo_count, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3763 (class 0 OID 16981)
-- Dependencies: 291
-- Data for Name: tracked_time; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.tracked_time (id, issue_id, user_id, created_unix, "time") FROM stdin;
\.


--
-- TOC entry 3743 (class 0 OID 16854)
-- Dependencies: 271
-- Data for Name: two_factor; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.two_factor (id, uid, secret, scratch_salt, scratch_hash, last_used_passcode, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3777 (class 0 OID 17061)
-- Dependencies: 305
-- Data for Name: u2f_registration; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.u2f_registration (id, name, user_id, raw, counter, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3691 (class 0 OID 16516)
-- Dependencies: 219
-- Data for Name: upload; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.upload (id, uuid, name) FROM stdin;
\.


--
-- TOC entry 3677 (class 0 OID 16395)
-- Dependencies: 205
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public."user" (id, lower_name, name, full_name, email, keep_email_private, passwd, must_change_password, login_type, login_source, login_name, type, location, website, rands, salt, language, description, created_unix, updated_unix, last_login_unix, last_repo_visibility, max_repo_creation, is_active, is_admin, allow_git_hook, allow_import_local, allow_create_organization, prohibit_login, avatar, avatar_email, use_custom_avatar, num_followers, num_following, num_stars, num_repos, num_teams, num_members, visibility, diff_view_style, theme) FROM stdin;
1	gitops	gitops		noreply@gitops.org	f	a8e1b08490f98906194ea6da4bc3920e7dae18109f01be7c56fd23438124c0e31a140be7888cf8d5f251672b77068c5e8c6f	f	0	0		0			cg547bPLOn	kJRyNk81EK	en-US		1575735715	1575735715	1575735715	f	-1	t	t	f	f	t	f	0d81cad56acc117fe814b186a646b8b6	noreply@gitops.org	f	0	0	0	0	0	0	0		gitea
\.


--
-- TOC entry 3755 (class 0 OID 16933)
-- Dependencies: 283
-- Data for Name: user_open_id; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_open_id (id, uid, uri, show) FROM stdin;
\.


--
-- TOC entry 3675 (class 0 OID 16387)
-- Dependencies: 203
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.version (id, version) FROM stdin;
1	89
\.


--
-- TOC entry 3693 (class 0 OID 16525)
-- Dependencies: 221
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.watch (id, user_id, repo_id) FROM stdin;
\.


--
-- TOC entry 3721 (class 0 OID 16723)
-- Dependencies: 249
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.webhook (id, repo_id, org_id, url, signature, http_method, content_type, secret, events, is_ssl, is_active, hook_task_type, meta, last_status, created_unix, updated_unix) FROM stdin;
\.


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 216
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_id_seq', 1, false);


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 208
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_token_id_seq', 1, false);


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 226
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 234
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.attachment_id_seq', 1, false);


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 214
-- Name: collaboration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.collaboration_id_seq', 1, false);


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 232
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, false);


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 286
-- Name: commit_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.commit_status_id_seq', 1, false);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 292
-- Name: deleted_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.deleted_branch_id_seq', 1, false);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 212
-- Name: deploy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.deploy_key_id_seq', 1, false);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 262
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.email_address_id_seq', 1, false);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 224
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.follow_id_seq', 1, false);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 272
-- Name: gpg_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.gpg_key_id_seq', 1, false);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 250
-- Name: hook_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.hook_task_id_seq', 1, false);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 302
-- Name: issue_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_assignees_id_seq', 1, false);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 296
-- Name: issue_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_dependency_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 228
-- Name: issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_id_seq', 1, false);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 238
-- Name: issue_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_label_id_seq', 1, false);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 266
-- Name: issue_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_user_id_seq', 1, false);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 284
-- Name: issue_watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_watch_id_seq', 1, false);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 236
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.label_id_seq', 1, false);


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 298
-- Name: lfs_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_lock_id_seq', 1, false);


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 268
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_meta_object_id_seq', 1, false);


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 246
-- Name: login_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.login_source_id_seq', 1, false);


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 240
-- Name: milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.milestone_id_seq', 1, false);


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 242
-- Name: mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.mirror_id_seq', 1, false);


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 260
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notice_id_seq', 1, false);


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 264
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notification_id_seq', 1, false);


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 310
-- Name: oauth2_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_application_id_seq', 1, false);


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 312
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_authorization_code_id_seq', 1, false);


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 314
-- Name: oauth2_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_grant_id_seq', 1, false);


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 254
-- Name: org_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.org_user_id_seq', 1, false);


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 280
-- Name: protected_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.protected_branch_id_seq', 1, false);


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 206
-- Name: public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.public_key_id_seq', 1, false);


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 230
-- Name: pull_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.pull_request_id_seq', 1, false);


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 300
-- Name: reaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.reaction_id_seq', 1, false);


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 244
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.release_id_seq', 1, false);


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 294
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_indexer_status_id_seq', 1, false);


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 277
-- Name: repo_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_redirect_id_seq', 1, false);


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 275
-- Name: repo_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_unit_id_seq', 1, false);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 210
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repository_id_seq', 1, false);


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 308
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.review_id_seq', 1, false);


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 222
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 288
-- Name: stopwatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.stopwatch_id_seq', 1, false);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 252
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_id_seq', 1, false);


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 258
-- Name: team_repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_repo_id_seq', 1, false);


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 306
-- Name: team_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_unit_id_seq', 1, false);


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 256
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_user_id_seq', 1, false);


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 316
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.topic_id_seq', 1, false);


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 290
-- Name: tracked_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.tracked_time_id_seq', 1, false);


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 270
-- Name: two_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.two_factor_id_seq', 1, false);


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 304
-- Name: u2f_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.u2f_registration_id_seq', 1, false);


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 218
-- Name: upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.upload_id_seq', 1, false);


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 282
-- Name: user_open_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_open_id_id_seq', 1, false);


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 202
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.version_id_seq', 1, true);


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 220
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.watch_id_seq', 1, false);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 248
-- Name: webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.webhook_id_seq', 1, false);


--
-- TOC entry 3297 (class 2606 OID 16512)
-- Name: access access_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 16445)
-- Name: access_token access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16562)
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 16634)
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 16501)
-- Name: collaboration collaboration_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration
    ADD CONSTRAINT collaboration_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 16619)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 16961)
-- Name: commit_status commit_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status
    ADD CONSTRAINT commit_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3486 (class 2606 OID 16999)
-- Name: deleted_branch deleted_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deleted_branch
    ADD CONSTRAINT deleted_branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 16489)
-- Name: deploy_key deploy_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key
    ADD CONSTRAINT deploy_key_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 16812)
-- Name: email_address email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 16914)
-- Name: external_login_user external_login_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.external_login_user
    ADD CONSTRAINT external_login_user_pkey PRIMARY KEY (external_id, login_source_id);


--
-- TOC entry 3309 (class 2606 OID 16548)
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2606 OID 16886)
-- Name: gpg_key_import gpg_key_import_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key_import
    ADD CONSTRAINT gpg_key_import_pkey PRIMARY KEY (key_id);


--
-- TOC entry 3440 (class 2606 OID 16876)
-- Name: gpg_key gpg_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key
    ADD CONSTRAINT gpg_key_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 16747)
-- Name: hook_task hook_task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task
    ADD CONSTRAINT hook_task_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 2606 OID 17056)
-- Name: issue_assignees issue_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees
    ADD CONSTRAINT issue_assignees_pkey PRIMARY KEY (id);


--
-- TOC entry 3492 (class 2606 OID 17020)
-- Name: issue_dependency issue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency
    ADD CONSTRAINT issue_dependency_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 16658)
-- Name: issue_label issue_label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label
    ADD CONSTRAINT issue_label_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16581)
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 16839)
-- Name: issue_user issue_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user
    ADD CONSTRAINT issue_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 16949)
-- Name: issue_watch issue_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch
    ADD CONSTRAINT issue_watch_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 16649)
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 17032)
-- Name: lfs_lock lfs_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock
    ADD CONSTRAINT lfs_lock_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 16848)
-- Name: lfs_meta_object lfs_meta_object_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object
    ADD CONSTRAINT lfs_meta_object_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 16715)
-- Name: login_source login_source_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source
    ADD CONSTRAINT login_source_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 16670)
-- Name: milestone milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone
    ADD CONSTRAINT milestone_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 16680)
-- Name: mirror mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror
    ADD CONSTRAINT mirror_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 16803)
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 16822)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3529 (class 2606 OID 17105)
-- Name: oauth2_application oauth2_application_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_application
    ADD CONSTRAINT oauth2_application_pkey PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 17120)
-- Name: oauth2_authorization_code oauth2_authorization_code_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_authorization_code
    ADD CONSTRAINT oauth2_authorization_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 17131)
-- Name: oauth2_grant oauth2_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_grant
    ADD CONSTRAINT oauth2_grant_pkey PRIMARY KEY (id);


--
-- TOC entry 3547 (class 2606 OID 17157)
-- Name: oauth2_session oauth2_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_session
    ADD CONSTRAINT oauth2_session_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16768)
-- Name: org_user org_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user
    ADD CONSTRAINT org_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3456 (class 2606 OID 16929)
-- Name: protected_branch protected_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch
    ADD CONSTRAINT protected_branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 16432)
-- Name: public_key public_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key
    ADD CONSTRAINT public_key_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 16602)
-- Name: pull_request pull_request_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request
    ADD CONSTRAINT pull_request_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 17042)
-- Name: reaction reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 16697)
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 17011)
-- Name: repo_indexer_status repo_indexer_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status
    ADD CONSTRAINT repo_indexer_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3450 (class 2606 OID 16907)
-- Name: repo_redirect repo_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect
    ADD CONSTRAINT repo_redirect_pkey PRIMARY KEY (id);


--
-- TOC entry 3446 (class 2606 OID 16897)
-- Name: repo_unit repo_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit
    ADD CONSTRAINT repo_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 16466)
-- Name: repository repository_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- TOC entry 3523 (class 2606 OID 17090)
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 16539)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 16976)
-- Name: stopwatch stopwatch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch
    ADD CONSTRAINT stopwatch_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 16759)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 16790)
-- Name: team_repo team_repo_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo
    ADD CONSTRAINT team_repo_pkey PRIMARY KEY (id);


--
-- TOC entry 3517 (class 2606 OID 17080)
-- Name: team_unit team_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit
    ADD CONSTRAINT team_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 16780)
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3543 (class 2606 OID 17142)
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 16986)
-- Name: tracked_time tracked_time_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time
    ADD CONSTRAINT tracked_time_pkey PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 16862)
-- Name: two_factor two_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor
    ADD CONSTRAINT two_factor_pkey PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 17069)
-- Name: u2f_registration u2f_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.u2f_registration
    ADD CONSTRAINT u2f_registration_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 16521)
-- Name: upload upload_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload
    ADD CONSTRAINT upload_pkey PRIMARY KEY (id);


--
-- TOC entry 3460 (class 2606 OID 16939)
-- Name: user_open_id user_open_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id
    ADD CONSTRAINT user_open_id_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 16412)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16392)
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 16530)
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 16731)
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 1259 OID 16448)
-- Name: IDX_access_token_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_created_unix" ON public.access_token USING btree (created_unix);


--
-- TOC entry 3267 (class 1259 OID 16447)
-- Name: IDX_access_token_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_uid" ON public.access_token USING btree (uid);


--
-- TOC entry 3268 (class 1259 OID 16449)
-- Name: IDX_access_token_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_updated_unix" ON public.access_token USING btree (updated_unix);


--
-- TOC entry 3310 (class 1259 OID 16565)
-- Name: IDX_action_act_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_act_user_id" ON public.action USING btree (act_user_id);


--
-- TOC entry 3311 (class 1259 OID 16567)
-- Name: IDX_action_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_comment_id" ON public.action USING btree (comment_id);


--
-- TOC entry 3312 (class 1259 OID 16563)
-- Name: IDX_action_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_created_unix" ON public.action USING btree (created_unix);


--
-- TOC entry 3313 (class 1259 OID 16568)
-- Name: IDX_action_is_deleted; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_is_deleted" ON public.action USING btree (is_deleted);


--
-- TOC entry 3314 (class 1259 OID 16569)
-- Name: IDX_action_is_private; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_is_private" ON public.action USING btree (is_private);


--
-- TOC entry 3315 (class 1259 OID 16566)
-- Name: IDX_action_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_repo_id" ON public.action USING btree (repo_id);


--
-- TOC entry 3316 (class 1259 OID 16564)
-- Name: IDX_action_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_user_id" ON public.action USING btree (user_id);


--
-- TOC entry 3345 (class 1259 OID 16636)
-- Name: IDX_attachment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_issue_id" ON public.attachment USING btree (issue_id);


--
-- TOC entry 3346 (class 1259 OID 16637)
-- Name: IDX_attachment_release_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_release_id" ON public.attachment USING btree (release_id);


--
-- TOC entry 3347 (class 1259 OID 16638)
-- Name: IDX_attachment_uploader_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_uploader_id" ON public.attachment USING btree (uploader_id);


--
-- TOC entry 3290 (class 1259 OID 16504)
-- Name: IDX_collaboration_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_repo_id" ON public.collaboration USING btree (repo_id);


--
-- TOC entry 3291 (class 1259 OID 16503)
-- Name: IDX_collaboration_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_user_id" ON public.collaboration USING btree (user_id);


--
-- TOC entry 3339 (class 1259 OID 16622)
-- Name: IDX_comment_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_created_unix" ON public.comment USING btree (created_unix);


--
-- TOC entry 3340 (class 1259 OID 16621)
-- Name: IDX_comment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_issue_id" ON public.comment USING btree (issue_id);


--
-- TOC entry 3341 (class 1259 OID 16620)
-- Name: IDX_comment_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_poster_id" ON public.comment USING btree (poster_id);


--
-- TOC entry 3342 (class 1259 OID 16623)
-- Name: IDX_comment_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_updated_unix" ON public.comment USING btree (updated_unix);


--
-- TOC entry 3464 (class 1259 OID 16967)
-- Name: IDX_commit_status_context_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_context_hash" ON public.commit_status USING btree (context_hash);


--
-- TOC entry 3465 (class 1259 OID 16968)
-- Name: IDX_commit_status_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_created_unix" ON public.commit_status USING btree (created_unix);


--
-- TOC entry 3466 (class 1259 OID 16964)
-- Name: IDX_commit_status_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_index" ON public.commit_status USING btree (index);


--
-- TOC entry 3467 (class 1259 OID 16965)
-- Name: IDX_commit_status_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_repo_id" ON public.commit_status USING btree (repo_id);


--
-- TOC entry 3468 (class 1259 OID 16966)
-- Name: IDX_commit_status_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_sha" ON public.commit_status USING btree (sha);


--
-- TOC entry 3469 (class 1259 OID 16963)
-- Name: IDX_commit_status_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_updated_unix" ON public.commit_status USING btree (updated_unix);


--
-- TOC entry 3481 (class 1259 OID 17003)
-- Name: IDX_deleted_branch_deleted_by_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_deleted_by_id" ON public.deleted_branch USING btree (deleted_by_id);


--
-- TOC entry 3482 (class 1259 OID 17001)
-- Name: IDX_deleted_branch_deleted_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_deleted_unix" ON public.deleted_branch USING btree (deleted_unix);


--
-- TOC entry 3483 (class 1259 OID 17002)
-- Name: IDX_deleted_branch_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deleted_branch_repo_id" ON public.deleted_branch USING btree (repo_id);


--
-- TOC entry 3285 (class 1259 OID 16491)
-- Name: IDX_deploy_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_key_id" ON public.deploy_key USING btree (key_id);


--
-- TOC entry 3286 (class 1259 OID 16492)
-- Name: IDX_deploy_key_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_repo_id" ON public.deploy_key USING btree (repo_id);


--
-- TOC entry 3409 (class 1259 OID 16814)
-- Name: IDX_email_address_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_email_address_uid" ON public.email_address USING btree (uid);


--
-- TOC entry 3451 (class 1259 OID 16915)
-- Name: IDX_external_login_user_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_external_login_user_user_id" ON public.external_login_user USING btree (user_id);


--
-- TOC entry 3437 (class 1259 OID 16877)
-- Name: IDX_gpg_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_key_id" ON public.gpg_key USING btree (key_id);


--
-- TOC entry 3438 (class 1259 OID 16878)
-- Name: IDX_gpg_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_owner_id" ON public.gpg_key USING btree (owner_id);


--
-- TOC entry 3386 (class 1259 OID 16748)
-- Name: IDX_hook_task_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_hook_task_repo_id" ON public.hook_task USING btree (repo_id);


--
-- TOC entry 3505 (class 1259 OID 17057)
-- Name: IDX_issue_assignees_assignee_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_assignee_id" ON public.issue_assignees USING btree (assignee_id);


--
-- TOC entry 3506 (class 1259 OID 17058)
-- Name: IDX_issue_assignees_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_issue_id" ON public.issue_assignees USING btree (issue_id);


--
-- TOC entry 3319 (class 1259 OID 16591)
-- Name: IDX_issue_closed_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_closed_unix" ON public.issue USING btree (closed_unix);


--
-- TOC entry 3320 (class 1259 OID 16590)
-- Name: IDX_issue_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_created_unix" ON public.issue USING btree (created_unix);


--
-- TOC entry 3321 (class 1259 OID 16585)
-- Name: IDX_issue_deadline_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_deadline_unix" ON public.issue USING btree (deadline_unix);


--
-- TOC entry 3322 (class 1259 OID 16588)
-- Name: IDX_issue_is_closed; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_closed" ON public.issue USING btree (is_closed);


--
-- TOC entry 3323 (class 1259 OID 16589)
-- Name: IDX_issue_is_pull; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_pull" ON public.issue USING btree (is_pull);


--
-- TOC entry 3324 (class 1259 OID 16587)
-- Name: IDX_issue_milestone_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_milestone_id" ON public.issue USING btree (milestone_id);


--
-- TOC entry 3325 (class 1259 OID 16584)
-- Name: IDX_issue_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_poster_id" ON public.issue USING btree (poster_id);


--
-- TOC entry 3326 (class 1259 OID 16583)
-- Name: IDX_issue_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_repo_id" ON public.issue USING btree (repo_id);


--
-- TOC entry 3327 (class 1259 OID 16586)
-- Name: IDX_issue_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_updated_unix" ON public.issue USING btree (updated_unix);


--
-- TOC entry 3424 (class 1259 OID 16840)
-- Name: IDX_issue_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_user_uid" ON public.issue_user USING btree (uid);


--
-- TOC entry 3351 (class 1259 OID 16650)
-- Name: IDX_label_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_repo_id" ON public.label USING btree (repo_id);


--
-- TOC entry 3493 (class 1259 OID 17034)
-- Name: IDX_lfs_lock_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_owner_id" ON public.lfs_lock USING btree (owner_id);


--
-- TOC entry 3494 (class 1259 OID 17033)
-- Name: IDX_lfs_lock_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_repo_id" ON public.lfs_lock USING btree (repo_id);


--
-- TOC entry 3427 (class 1259 OID 16850)
-- Name: IDX_lfs_meta_object_oid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_oid" ON public.lfs_meta_object USING btree (oid);


--
-- TOC entry 3428 (class 1259 OID 16851)
-- Name: IDX_lfs_meta_object_repository_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_repository_id" ON public.lfs_meta_object USING btree (repository_id);


--
-- TOC entry 3372 (class 1259 OID 16719)
-- Name: IDX_login_source_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_created_unix" ON public.login_source USING btree (created_unix);


--
-- TOC entry 3373 (class 1259 OID 16717)
-- Name: IDX_login_source_is_actived; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_actived" ON public.login_source USING btree (is_actived);


--
-- TOC entry 3374 (class 1259 OID 16718)
-- Name: IDX_login_source_is_sync_enabled; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_sync_enabled" ON public.login_source USING btree (is_sync_enabled);


--
-- TOC entry 3375 (class 1259 OID 16720)
-- Name: IDX_login_source_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_updated_unix" ON public.login_source USING btree (updated_unix);


--
-- TOC entry 3357 (class 1259 OID 16671)
-- Name: IDX_milestone_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_milestone_repo_id" ON public.milestone USING btree (repo_id);


--
-- TOC entry 3360 (class 1259 OID 16683)
-- Name: IDX_mirror_next_update_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_next_update_unix" ON public.mirror USING btree (next_update_unix);


--
-- TOC entry 3361 (class 1259 OID 16681)
-- Name: IDX_mirror_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_repo_id" ON public.mirror USING btree (repo_id);


--
-- TOC entry 3362 (class 1259 OID 16682)
-- Name: IDX_mirror_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_updated_unix" ON public.mirror USING btree (updated_unix);


--
-- TOC entry 3406 (class 1259 OID 16804)
-- Name: IDX_notice_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notice_created_unix" ON public.notice USING btree (created_unix);


--
-- TOC entry 3413 (class 1259 OID 16828)
-- Name: IDX_notification_commit_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_commit_id" ON public.notification USING btree (commit_id);


--
-- TOC entry 3414 (class 1259 OID 16830)
-- Name: IDX_notification_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_created_unix" ON public.notification USING btree (created_unix);


--
-- TOC entry 3415 (class 1259 OID 16826)
-- Name: IDX_notification_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_issue_id" ON public.notification USING btree (issue_id);


--
-- TOC entry 3416 (class 1259 OID 16827)
-- Name: IDX_notification_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_repo_id" ON public.notification USING btree (repo_id);


--
-- TOC entry 3417 (class 1259 OID 16825)
-- Name: IDX_notification_source; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_source" ON public.notification USING btree (source);


--
-- TOC entry 3418 (class 1259 OID 16824)
-- Name: IDX_notification_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_status" ON public.notification USING btree (status);


--
-- TOC entry 3419 (class 1259 OID 16829)
-- Name: IDX_notification_updated_by; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_updated_by" ON public.notification USING btree (updated_by);


--
-- TOC entry 3420 (class 1259 OID 16831)
-- Name: IDX_notification_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_updated_unix" ON public.notification USING btree (updated_unix);


--
-- TOC entry 3421 (class 1259 OID 16823)
-- Name: IDX_notification_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_user_id" ON public.notification USING btree (user_id);


--
-- TOC entry 3524 (class 1259 OID 17108)
-- Name: IDX_oauth2_application_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_created_unix" ON public.oauth2_application USING btree (created_unix);


--
-- TOC entry 3525 (class 1259 OID 17107)
-- Name: IDX_oauth2_application_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_uid" ON public.oauth2_application USING btree (uid);


--
-- TOC entry 3526 (class 1259 OID 17109)
-- Name: IDX_oauth2_application_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_updated_unix" ON public.oauth2_application USING btree (updated_unix);


--
-- TOC entry 3530 (class 1259 OID 17122)
-- Name: IDX_oauth2_authorization_code_valid_until; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_authorization_code_valid_until" ON public.oauth2_authorization_code USING btree (valid_until);


--
-- TOC entry 3534 (class 1259 OID 17133)
-- Name: IDX_oauth2_grant_application_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_grant_application_id" ON public.oauth2_grant USING btree (application_id);


--
-- TOC entry 3535 (class 1259 OID 17134)
-- Name: IDX_oauth2_grant_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_grant_user_id" ON public.oauth2_grant USING btree (user_id);


--
-- TOC entry 3545 (class 1259 OID 17158)
-- Name: IDX_oauth2_session_expires_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_session_expires_unix" ON public.oauth2_session USING btree (expires_unix);


--
-- TOC entry 3392 (class 1259 OID 16770)
-- Name: IDX_org_user_is_public; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_is_public" ON public.org_user USING btree (is_public);


--
-- TOC entry 3393 (class 1259 OID 16772)
-- Name: IDX_org_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_org_id" ON public.org_user USING btree (org_id);


--
-- TOC entry 3394 (class 1259 OID 16771)
-- Name: IDX_org_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_uid" ON public.org_user USING btree (uid);


--
-- TOC entry 3262 (class 1259 OID 16434)
-- Name: IDX_public_key_fingerprint; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_fingerprint" ON public.public_key USING btree (fingerprint);


--
-- TOC entry 3263 (class 1259 OID 16433)
-- Name: IDX_public_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_owner_id" ON public.public_key USING btree (owner_id);


--
-- TOC entry 3331 (class 1259 OID 16605)
-- Name: IDX_pull_request_base_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_base_repo_id" ON public.pull_request USING btree (base_repo_id);


--
-- TOC entry 3332 (class 1259 OID 16606)
-- Name: IDX_pull_request_has_merged; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_has_merged" ON public.pull_request USING btree (has_merged);


--
-- TOC entry 3333 (class 1259 OID 16604)
-- Name: IDX_pull_request_head_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_head_repo_id" ON public.pull_request USING btree (head_repo_id);


--
-- TOC entry 3334 (class 1259 OID 16603)
-- Name: IDX_pull_request_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_issue_id" ON public.pull_request USING btree (issue_id);


--
-- TOC entry 3335 (class 1259 OID 16608)
-- Name: IDX_pull_request_merged_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merged_unix" ON public.pull_request USING btree (merged_unix);


--
-- TOC entry 3336 (class 1259 OID 16607)
-- Name: IDX_pull_request_merger_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merger_id" ON public.pull_request USING btree (merger_id);


--
-- TOC entry 3497 (class 1259 OID 17045)
-- Name: IDX_reaction_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_comment_id" ON public.reaction USING btree (comment_id);


--
-- TOC entry 3498 (class 1259 OID 17047)
-- Name: IDX_reaction_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_created_unix" ON public.reaction USING btree (created_unix);


--
-- TOC entry 3499 (class 1259 OID 17044)
-- Name: IDX_reaction_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_issue_id" ON public.reaction USING btree (issue_id);


--
-- TOC entry 3500 (class 1259 OID 17048)
-- Name: IDX_reaction_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_type" ON public.reaction USING btree (type);


--
-- TOC entry 3501 (class 1259 OID 17046)
-- Name: IDX_reaction_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_user_id" ON public.reaction USING btree (user_id);


--
-- TOC entry 3365 (class 1259 OID 16702)
-- Name: IDX_release_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_created_unix" ON public.release USING btree (created_unix);


--
-- TOC entry 3366 (class 1259 OID 16700)
-- Name: IDX_release_publisher_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_publisher_id" ON public.release USING btree (publisher_id);


--
-- TOC entry 3367 (class 1259 OID 16699)
-- Name: IDX_release_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_repo_id" ON public.release USING btree (repo_id);


--
-- TOC entry 3368 (class 1259 OID 16701)
-- Name: IDX_release_tag_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_tag_name" ON public.release USING btree (tag_name);


--
-- TOC entry 3487 (class 1259 OID 17012)
-- Name: IDX_repo_indexer_status_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_indexer_status_repo_id" ON public.repo_indexer_status USING btree (repo_id);


--
-- TOC entry 3447 (class 1259 OID 16909)
-- Name: IDX_repo_redirect_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_redirect_lower_name" ON public.repo_redirect USING btree (lower_name);


--
-- TOC entry 3443 (class 1259 OID 16899)
-- Name: IDX_repo_unit_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_created_unix" ON public.repo_unit USING btree (created_unix);


--
-- TOC entry 3444 (class 1259 OID 16898)
-- Name: IDX_repo_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_s" ON public.repo_unit USING btree (repo_id, type);


--
-- TOC entry 3272 (class 1259 OID 16477)
-- Name: IDX_repository_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_created_unix" ON public.repository USING btree (created_unix);


--
-- TOC entry 3273 (class 1259 OID 16471)
-- Name: IDX_repository_fork_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_fork_id" ON public.repository USING btree (fork_id);


--
-- TOC entry 3274 (class 1259 OID 16469)
-- Name: IDX_repository_is_archived; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_archived" ON public.repository USING btree (is_archived);


--
-- TOC entry 3275 (class 1259 OID 16475)
-- Name: IDX_repository_is_empty; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_empty" ON public.repository USING btree (is_empty);


--
-- TOC entry 3276 (class 1259 OID 16470)
-- Name: IDX_repository_is_fork; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_fork" ON public.repository USING btree (is_fork);


--
-- TOC entry 3277 (class 1259 OID 16476)
-- Name: IDX_repository_is_mirror; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_mirror" ON public.repository USING btree (is_mirror);


--
-- TOC entry 3278 (class 1259 OID 16468)
-- Name: IDX_repository_is_private; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_private" ON public.repository USING btree (is_private);


--
-- TOC entry 3279 (class 1259 OID 16473)
-- Name: IDX_repository_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_lower_name" ON public.repository USING btree (lower_name);


--
-- TOC entry 3280 (class 1259 OID 16474)
-- Name: IDX_repository_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_name" ON public.repository USING btree (name);


--
-- TOC entry 3281 (class 1259 OID 16472)
-- Name: IDX_repository_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_updated_unix" ON public.repository USING btree (updated_unix);


--
-- TOC entry 3518 (class 1259 OID 17093)
-- Name: IDX_review_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_created_unix" ON public.review USING btree (created_unix);


--
-- TOC entry 3519 (class 1259 OID 17092)
-- Name: IDX_review_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_issue_id" ON public.review USING btree (issue_id);


--
-- TOC entry 3520 (class 1259 OID 17091)
-- Name: IDX_review_reviewer_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_reviewer_id" ON public.review USING btree (reviewer_id);


--
-- TOC entry 3521 (class 1259 OID 17094)
-- Name: IDX_review_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_updated_unix" ON public.review USING btree (updated_unix);


--
-- TOC entry 3473 (class 1259 OID 16978)
-- Name: IDX_stopwatch_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_issue_id" ON public.stopwatch USING btree (issue_id);


--
-- TOC entry 3474 (class 1259 OID 16977)
-- Name: IDX_stopwatch_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_user_id" ON public.stopwatch USING btree (user_id);


--
-- TOC entry 3389 (class 1259 OID 16760)
-- Name: IDX_team_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_org_id" ON public.team USING btree (org_id);


--
-- TOC entry 3402 (class 1259 OID 16792)
-- Name: IDX_team_repo_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_repo_org_id" ON public.team_repo USING btree (org_id);


--
-- TOC entry 3514 (class 1259 OID 17082)
-- Name: IDX_team_unit_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_unit_org_id" ON public.team_unit USING btree (org_id);


--
-- TOC entry 3398 (class 1259 OID 16782)
-- Name: IDX_team_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_user_org_id" ON public.team_user USING btree (org_id);


--
-- TOC entry 3539 (class 1259 OID 17144)
-- Name: IDX_topic_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_created_unix" ON public.topic USING btree (created_unix);


--
-- TOC entry 3540 (class 1259 OID 17145)
-- Name: IDX_topic_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_updated_unix" ON public.topic USING btree (updated_unix);


--
-- TOC entry 3477 (class 1259 OID 16987)
-- Name: IDX_tracked_time_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_issue_id" ON public.tracked_time USING btree (issue_id);


--
-- TOC entry 3478 (class 1259 OID 16988)
-- Name: IDX_tracked_time_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_user_id" ON public.tracked_time USING btree (user_id);


--
-- TOC entry 3432 (class 1259 OID 16864)
-- Name: IDX_two_factor_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_created_unix" ON public.two_factor USING btree (created_unix);


--
-- TOC entry 3433 (class 1259 OID 16865)
-- Name: IDX_two_factor_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_updated_unix" ON public.two_factor USING btree (updated_unix);


--
-- TOC entry 3509 (class 1259 OID 17072)
-- Name: IDX_u2f_registration_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_created_unix" ON public.u2f_registration USING btree (created_unix);


--
-- TOC entry 3510 (class 1259 OID 17070)
-- Name: IDX_u2f_registration_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_updated_unix" ON public.u2f_registration USING btree (updated_unix);


--
-- TOC entry 3511 (class 1259 OID 17071)
-- Name: IDX_u2f_registration_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_u2f_registration_user_id" ON public.u2f_registration USING btree (user_id);


--
-- TOC entry 3254 (class 1259 OID 16417)
-- Name: IDX_user_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_created_unix" ON public."user" USING btree (created_unix);


--
-- TOC entry 3255 (class 1259 OID 16416)
-- Name: IDX_user_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_is_active" ON public."user" USING btree (is_active);


--
-- TOC entry 3256 (class 1259 OID 16415)
-- Name: IDX_user_last_login_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_last_login_unix" ON public."user" USING btree (last_login_unix);


--
-- TOC entry 3457 (class 1259 OID 16941)
-- Name: IDX_user_open_id_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_open_id_uid" ON public.user_open_id USING btree (uid);


--
-- TOC entry 3257 (class 1259 OID 16418)
-- Name: IDX_user_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_updated_unix" ON public."user" USING btree (updated_unix);


--
-- TOC entry 3379 (class 1259 OID 16734)
-- Name: IDX_webhook_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_created_unix" ON public.webhook USING btree (created_unix);


--
-- TOC entry 3380 (class 1259 OID 16733)
-- Name: IDX_webhook_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_is_active" ON public.webhook USING btree (is_active);


--
-- TOC entry 3381 (class 1259 OID 16732)
-- Name: IDX_webhook_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_org_id" ON public.webhook USING btree (org_id);


--
-- TOC entry 3382 (class 1259 OID 16736)
-- Name: IDX_webhook_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_repo_id" ON public.webhook USING btree (repo_id);


--
-- TOC entry 3383 (class 1259 OID 16735)
-- Name: IDX_webhook_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_updated_unix" ON public.webhook USING btree (updated_unix);


--
-- TOC entry 3295 (class 1259 OID 16513)
-- Name: UQE_access_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_s" ON public.access USING btree (user_id, repo_id);


--
-- TOC entry 3269 (class 1259 OID 16446)
-- Name: UQE_access_token_token_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_token_token_hash" ON public.access_token USING btree (token_hash);


--
-- TOC entry 3348 (class 1259 OID 16635)
-- Name: UQE_attachment_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_attachment_uuid" ON public.attachment USING btree (uuid);


--
-- TOC entry 3292 (class 1259 OID 16502)
-- Name: UQE_collaboration_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_collaboration_s" ON public.collaboration USING btree (repo_id, user_id);


--
-- TOC entry 3470 (class 1259 OID 16962)
-- Name: UQE_commit_status_repo_sha_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_commit_status_repo_sha_index" ON public.commit_status USING btree (index, repo_id, sha);


--
-- TOC entry 3484 (class 1259 OID 17000)
-- Name: UQE_deleted_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_deleted_branch_s" ON public.deleted_branch USING btree (repo_id, name, commit);


--
-- TOC entry 3287 (class 1259 OID 16490)
-- Name: UQE_deploy_key_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_deploy_key_s" ON public.deploy_key USING btree (key_id, repo_id);


--
-- TOC entry 3410 (class 1259 OID 16813)
-- Name: UQE_email_address_email; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_email_address_email" ON public.email_address USING btree (email);


--
-- TOC entry 3307 (class 1259 OID 16549)
-- Name: UQE_follow_follow; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_follow_follow" ON public.follow USING btree (user_id, follow_id);


--
-- TOC entry 3490 (class 1259 OID 17021)
-- Name: UQE_issue_dependency_issue_dependency; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_dependency_issue_dependency" ON public.issue_dependency USING btree (issue_id, dependency_id);


--
-- TOC entry 3354 (class 1259 OID 16659)
-- Name: UQE_issue_label_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_label_s" ON public.issue_label USING btree (issue_id, label_id);


--
-- TOC entry 3328 (class 1259 OID 16582)
-- Name: UQE_issue_repo_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_repo_index" ON public.issue USING btree (repo_id, index);


--
-- TOC entry 3461 (class 1259 OID 16950)
-- Name: UQE_issue_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_watch_watch" ON public.issue_watch USING btree (user_id, issue_id);


--
-- TOC entry 3429 (class 1259 OID 16849)
-- Name: UQE_lfs_meta_object_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_lfs_meta_object_s" ON public.lfs_meta_object USING btree (oid, repository_id);


--
-- TOC entry 3376 (class 1259 OID 16716)
-- Name: UQE_login_source_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_login_source_name" ON public.login_source USING btree (name);


--
-- TOC entry 3527 (class 1259 OID 17106)
-- Name: UQE_oauth2_application_client_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_application_client_id" ON public.oauth2_application USING btree (client_id);


--
-- TOC entry 3531 (class 1259 OID 17121)
-- Name: UQE_oauth2_authorization_code_code; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_authorization_code_code" ON public.oauth2_authorization_code USING btree (code);


--
-- TOC entry 3536 (class 1259 OID 17132)
-- Name: UQE_oauth2_grant_user_application; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_grant_user_application" ON public.oauth2_grant USING btree (user_id, application_id);


--
-- TOC entry 3395 (class 1259 OID 16769)
-- Name: UQE_org_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_org_user_s" ON public.org_user USING btree (uid, org_id);


--
-- TOC entry 3454 (class 1259 OID 16930)
-- Name: UQE_protected_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_protected_branch_s" ON public.protected_branch USING btree (repo_id, branch_name);


--
-- TOC entry 3502 (class 1259 OID 17043)
-- Name: UQE_reaction_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_reaction_s" ON public.reaction USING btree (type, issue_id, comment_id, user_id);


--
-- TOC entry 3369 (class 1259 OID 16698)
-- Name: UQE_release_n; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_release_n" ON public.release USING btree (repo_id, tag_name);


--
-- TOC entry 3448 (class 1259 OID 16908)
-- Name: UQE_repo_redirect_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_redirect_s" ON public.repo_redirect USING btree (owner_id, lower_name);


--
-- TOC entry 3544 (class 1259 OID 17149)
-- Name: UQE_repo_topic_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_topic_s" ON public.repo_topic USING btree (repo_id, topic_id);


--
-- TOC entry 3282 (class 1259 OID 16467)
-- Name: UQE_repository_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repository_s" ON public.repository USING btree (owner_id, lower_name);


--
-- TOC entry 3304 (class 1259 OID 16540)
-- Name: UQE_star_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_star_s" ON public.star USING btree (uid, repo_id);


--
-- TOC entry 3403 (class 1259 OID 16791)
-- Name: UQE_team_repo_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_repo_s" ON public.team_repo USING btree (team_id, repo_id);


--
-- TOC entry 3515 (class 1259 OID 17081)
-- Name: UQE_team_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_unit_s" ON public.team_unit USING btree (team_id, type);


--
-- TOC entry 3399 (class 1259 OID 16781)
-- Name: UQE_team_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_user_s" ON public.team_user USING btree (team_id, uid);


--
-- TOC entry 3541 (class 1259 OID 17143)
-- Name: UQE_topic_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_topic_name" ON public.topic USING btree (name);


--
-- TOC entry 3434 (class 1259 OID 16863)
-- Name: UQE_two_factor_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_two_factor_uid" ON public.two_factor USING btree (uid);


--
-- TOC entry 3298 (class 1259 OID 16522)
-- Name: UQE_upload_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_upload_uuid" ON public.upload USING btree (uuid);


--
-- TOC entry 3258 (class 1259 OID 16413)
-- Name: UQE_user_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_lower_name" ON public."user" USING btree (lower_name);


--
-- TOC entry 3259 (class 1259 OID 16414)
-- Name: UQE_user_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_name" ON public."user" USING btree (name);


--
-- TOC entry 3458 (class 1259 OID 16940)
-- Name: UQE_user_open_id_uri; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_open_id_uri" ON public.user_open_id USING btree (uri);


--
-- TOC entry 3301 (class 1259 OID 16531)
-- Name: UQE_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_watch_watch" ON public.watch USING btree (user_id, repo_id);


-- Completed on 2019-12-07 16:41:55 UTC

--
-- PostgreSQL database dump complete
--

