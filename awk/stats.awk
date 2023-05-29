# FS: file separator
# OFS: output file separator
# NR: line number
# NF: field number

# before iterate each line. ofter do variable initialization
BEGIN{
  sum = 0
}
# iterate each line
{
  # printf "%d: %d\n", NR-1, $1
  c[NR-1] = $1
  sum += c[NR-1]
}
# after iterate each line
END{
  d = 3
  len = length(c)
  sum = td(sum, d)
  avg = td(sum / length(c), d)
  Q1 = td(quartile(c, 1), d)
  Q2 = td(quartile(c, 2), d)
  Q3 = td(quartile(c, d), d)
  min = td(c[0], d)
  max = td(c[length(c) - 1], d)

  len_len = length(sprintf("%d", len))
  len_sum = length(sprintf("%.3f", sum))
  len_avg = length(sprintf("%.3f", avg))

  len_min = length(sprintf("%.3f", min))
  len_max = length(sprintf("%.3f", max))
	len_Q1 = length(sprintf("%.3f", Q1))
	len_Q2 = length(sprintf("%.3f", Q2))
	len_Q3 = length(sprintf("%.3f", Q3))

  format =\
  "%-"len_len"s %-"len_sum"s %-"len_avg"s "\
  "%-"len_min"s %-"len_Q1"s %-"len_Q2"s %-"len_Q3"s %-"len_max"s\n"
  printf(format,
         "len", "sum", "avg",
         "min", "Q1", "Q2", "Q3", "max")
  printf(format,
         pd("=", len_len),
         pd("=", len_sum),
         pd("=", len_avg),

         pd("=", len_min),
         pd("=", len_Q1),
         pd("=", len_Q2),
         pd("=", len_Q3),
         pd("=", len_max))
  printf(format,
         len, sum, avg,
         min, Q1, Q2, Q3, max)
}

# trunc decimel
function td(num, f) {
  return sprintf("%."f"f", num) + 0.0
}

function quartile(nums, p) {
  i = (p / 4) * length(nums)
  if (i > int(i)) { # float
    return c[int(i) + 1]
  } else { # int
    return (c[i] + c[i]) / 2
  }
}

function pd(c, n) {
  res = ""
  for (i=0; i < n; i++)
    res = res c
  return res
  }
