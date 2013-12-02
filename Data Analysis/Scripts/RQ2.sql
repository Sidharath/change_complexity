select  mods, hunk_dist, indent_sum,
loc,  hlen, maxcy, 
 totcy from change_decay_1000 c, cmetrics_sum s, git_commit g 
where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;