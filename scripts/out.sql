--compare the raw values of cmetrics (traditional measures) with change_complexity measures at each commit
\o '~/mining_procedure/complexity/r/in/complexity.in'
select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_complexity c, cmetrics_sum s where c.commit = s.commit;
\o

--uses the table cmetrics_dif, which is the difference between the traditional complexity measures at each revision, also dumps the change complexity measures for comparison purposes
\o '~/mining_procedure/complexity/r/in/difference.in'
select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_complexity c, cmetrics_dif s, git_commit g where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;
\o

--sum of change complexity measures, and compare with traditional complexity measures at each commit
--\o '~/mining_procedure/complexity/r/in/change_sum.in'
--select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_sum c, cmetrics_sum s, git_commit g where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;
--\o

--Same as previous, but only consider the last 1000 commits when summing CCM
\o '~/mining_procedure/complexity/r/in/change_decay_1000.in'
select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_decay_1000 c, cmetrics_sum s, git_commit g where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;
\o

--the traditional measures calculated on only the files that had changed
\o '~/mining_procedure/complexity/r/in/sc_cc.in'
select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_complexity c, cmetrics_change s, git_commit g where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;
\o

--the traditional measures calculated on only the files that had changed, compared to CCM at last 1000 changes
\o '~/mining_procedure/complexity/r/in/sc_dk.in'
select files, mods, hunks, hunk_dist, indent_sum, indent_std_dev, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from change_decay_1000 c, cmetrics_change s, git_commit g where c.commit = s.commit and s.commit = g.commit order by committer_dt asc;
\o


--ts.plot in R shows definite changes
--first few 1000 commits aren't interesting
\o '~/mining_procedure/complexity/r/in/date.in'
select extract(year from committer_dt) yr, extract(month from committer_dt) mn, loc, funcs, blks, coml, hlen, hlevel, hmd, maxcy, mincy, avgcy, medcy, totcy from cmetrics_sum s, git_commit g where g.commit = s.commit order by committer_dt asc;
\o

--httpd_complex_herraiz
--revs vs standard complexity
-- (loc - blks - coml) as sloc, Gives negative numbers !?
--maxcy, mincy, avgcy, medcy, coml, 
\o '~/mining_procedure/complexity/r/in/file_complex.in'
select revs, age, coms, loc, adds+ removes as churn, adds, removes, hunks, funcs, hlen, hlevel, hmd, totcy as cyclomatic from file_complex f, file_cc c where c.path = f.path;
\o
