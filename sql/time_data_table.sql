create table all_race_soha_time_milli_summary (
  race_date integer
  , race_id text
  , ketto_toroku_bango character varying(10)
  , kyori integer
  , course_type text
  , time_avg numeric
  , time_min numeric
  , time_max numeric
  , time_recent numeric
  , time_avg_m1 numeric
  , time_avg_m2 numeric
  , time_avg_m3 numeric
  , time_avg_m4 numeric
  , time_avg_m5 numeric
  , time_avg_m6 numeric
  , time_avg_m7 numeric
  , time_avg_p1 numeric
  , time_avg_p2 numeric
  , time_avg_p3 numeric
  , time_avg_p4 numeric
  , time_avg_p5 numeric
  , time_avg_p6 numeric
  , time_avg_p7 numeric
  , time_min_m1 numeric
  , time_min_m2 numeric
  , time_min_m3 numeric
  , time_min_m4 numeric
  , time_min_m5 numeric
  , time_min_m6 numeric
  , time_min_m7 numeric
  , time_min_p1 numeric
  , time_min_p2 numeric
  , time_min_p3 numeric
  , time_min_p4 numeric
  , time_min_p5 numeric
  , time_min_p6 numeric
  , time_min_p7 numeric
  , time_max_m1 numeric
  , time_max_m2 numeric
  , time_max_m3 numeric
  , time_max_m4 numeric
  , time_max_m5 numeric
  , time_max_m6 numeric
  , time_max_m7 numeric
  , time_max_p1 numeric
  , time_max_p2 numeric
  , time_max_p3 numeric
  , time_max_p4 numeric
  , time_max_p5 numeric
  , time_max_p6 numeric
  , time_max_p7 numeric
  , time_recent_m1 numeric
  , time_recent_m2 numeric
  , time_recent_m3 numeric
  , time_recent_m4 numeric
  , time_recent_m5 numeric
  , time_recent_m6 numeric
  , time_recent_m7 numeric
  , time_recent_p1 numeric
  , time_recent_p2 numeric
  , time_recent_p3 numeric
  , time_recent_p4 numeric
  , time_recent_p5 numeric
  , time_recent_p6 numeric
  , time_recent_p7 numeric
) ;

create index idx_all_race_soha_time_milli_summary_id
  on all_race_soha_time_milli_summary(race_id,ketto_toroku_bango);

create index idx_all_race_soha_time_milli_summary_kb
  on all_race_soha_time_milli_summary(ketto_toroku_bango);

create index idx_all_race_soha_time_milli_summary_rd
  on all_race_soha_time_milli_summary(race_id);

comment on table all_race_soha_time_milli_summary is 'all_race_soha_time_milli_summary';
comment on column all_race_soha_time_milli_summary.race_date is 'race_date';
comment on column all_race_soha_time_milli_summary.race_id is 'race_id';
comment on column all_race_soha_time_milli_summary.ketto_toroku_bango is 'ketto_toroku_bango';
comment on column all_race_soha_time_milli_summary.kyori is 'kyori';
comment on column all_race_soha_time_milli_summary.course_type is 'course_type';
comment on column all_race_soha_time_milli_summary.time_avg is 'time_avg';
comment on column all_race_soha_time_milli_summary.time_min is 'time_min';
comment on column all_race_soha_time_milli_summary.time_max is 'time_max';
comment on column all_race_soha_time_milli_summary.time_recent is 'time_recent';
comment on column all_race_soha_time_milli_summary.time_avg_m1 is 'time_avg_m1';
comment on column all_race_soha_time_milli_summary.time_avg_m2 is 'time_avg_m2';
comment on column all_race_soha_time_milli_summary.time_avg_m3 is 'time_avg_m3';
comment on column all_race_soha_time_milli_summary.time_avg_m4 is 'time_avg_m4';
comment on column all_race_soha_time_milli_summary.time_avg_m5 is 'time_avg_m5';
comment on column all_race_soha_time_milli_summary.time_avg_m6 is 'time_avg_m6';
comment on column all_race_soha_time_milli_summary.time_avg_m7 is 'time_avg_m7';
comment on column all_race_soha_time_milli_summary.time_avg_p1 is 'time_avg_p1';
comment on column all_race_soha_time_milli_summary.time_avg_p2 is 'time_avg_p2';
comment on column all_race_soha_time_milli_summary.time_avg_p3 is 'time_avg_p3';
comment on column all_race_soha_time_milli_summary.time_avg_p4 is 'time_avg_p4';
comment on column all_race_soha_time_milli_summary.time_avg_p5 is 'time_avg_p5';
comment on column all_race_soha_time_milli_summary.time_avg_p6 is 'time_avg_p6';
comment on column all_race_soha_time_milli_summary.time_avg_p7 is 'time_avg_p7';
comment on column all_race_soha_time_milli_summary.time_min_m1 is 'time_min_m1';
comment on column all_race_soha_time_milli_summary.time_min_m2 is 'time_min_m2';
comment on column all_race_soha_time_milli_summary.time_min_m3 is 'time_min_m3';
comment on column all_race_soha_time_milli_summary.time_min_m4 is 'time_min_m4';
comment on column all_race_soha_time_milli_summary.time_min_m5 is 'time_min_m5';
comment on column all_race_soha_time_milli_summary.time_min_m6 is 'time_min_m6';
comment on column all_race_soha_time_milli_summary.time_min_m7 is 'time_min_m7';
comment on column all_race_soha_time_milli_summary.time_min_p1 is 'time_min_p1';
comment on column all_race_soha_time_milli_summary.time_min_p2 is 'time_min_p2';
comment on column all_race_soha_time_milli_summary.time_min_p3 is 'time_min_p3';
comment on column all_race_soha_time_milli_summary.time_min_p4 is 'time_min_p4';
comment on column all_race_soha_time_milli_summary.time_min_p5 is 'time_min_p5';
comment on column all_race_soha_time_milli_summary.time_min_p6 is 'time_min_p6';
comment on column all_race_soha_time_milli_summary.time_min_p7 is 'time_min_p7';
comment on column all_race_soha_time_milli_summary.time_max_m1 is 'time_max_m1';
comment on column all_race_soha_time_milli_summary.time_max_m2 is 'time_max_m2';
comment on column all_race_soha_time_milli_summary.time_max_m3 is 'time_max_m3';
comment on column all_race_soha_time_milli_summary.time_max_m4 is 'time_max_m4';
comment on column all_race_soha_time_milli_summary.time_max_m5 is 'time_max_m5';
comment on column all_race_soha_time_milli_summary.time_max_m6 is 'time_max_m6';
comment on column all_race_soha_time_milli_summary.time_max_m7 is 'time_max_m7';
comment on column all_race_soha_time_milli_summary.time_max_p1 is 'time_max_p1';
comment on column all_race_soha_time_milli_summary.time_max_p2 is 'time_max_p2';
comment on column all_race_soha_time_milli_summary.time_max_p3 is 'time_max_p3';
comment on column all_race_soha_time_milli_summary.time_max_p4 is 'time_max_p4';
comment on column all_race_soha_time_milli_summary.time_max_p5 is 'time_max_p5';
comment on column all_race_soha_time_milli_summary.time_max_p6 is 'time_max_p6';
comment on column all_race_soha_time_milli_summary.time_max_p7 is 'time_max_p7';
comment on column all_race_soha_time_milli_summary.time_recent_m1 is 'time_recent_m1';
comment on column all_race_soha_time_milli_summary.time_recent_m2 is 'time_recent_m2';
comment on column all_race_soha_time_milli_summary.time_recent_m3 is 'time_recent_m3';
comment on column all_race_soha_time_milli_summary.time_recent_m4 is 'time_recent_m4';
comment on column all_race_soha_time_milli_summary.time_recent_m5 is 'time_recent_m5';
comment on column all_race_soha_time_milli_summary.time_recent_m6 is 'time_recent_m6';
comment on column all_race_soha_time_milli_summary.time_recent_m7 is 'time_recent_m7';
comment on column all_race_soha_time_milli_summary.time_recent_p1 is 'time_recent_p1';
comment on column all_race_soha_time_milli_summary.time_recent_p2 is 'time_recent_p2';
comment on column all_race_soha_time_milli_summary.time_recent_p3 is 'time_recent_p3';
comment on column all_race_soha_time_milli_summary.time_recent_p4 is 'time_recent_p4';
comment on column all_race_soha_time_milli_summary.time_recent_p5 is 'time_recent_p5';
comment on column all_race_soha_time_milli_summary.time_recent_p6 is 'time_recent_p6';
comment on column all_race_soha_time_milli_summary.time_recent_p7 is 'time_recent_p7';