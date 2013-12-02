select  mods,  hunk_dist, indent_sum, 
 loc, hlevel, 
 maxcy, totcy from change_complexity c, cmetrics_change s, git_commit g 
where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;