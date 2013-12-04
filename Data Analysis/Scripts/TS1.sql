select  committer_dt, files, mods, hunks, hunk_dist, indent_sum,
 indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, 
medcy, totcy from change_complexity c, cmetrics_sum s ,git_commit g where c.commit = s.commit and 
s.commit=g.commit order by committer_dt asc;