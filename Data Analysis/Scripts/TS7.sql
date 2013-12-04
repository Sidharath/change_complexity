select  committer_dt, indent_sum
from change_complexity c, cmetrics_sum s ,git_commit g where c.commit = s.commit and 
s.commit=g.commit order by committer_dt asc;