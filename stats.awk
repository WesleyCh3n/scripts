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
  format = "%-5s %-5s %-5s\n"
  printf(format, "len", "sum", "avg")
  printf(format, padding("=", 5), padding("=", 5), padding("=", 5))
  printf(format, length(c), sum, sum / length(c))

  print ""

  Q1=quartile(c, 1)
  Q2=quartile(c, 2)
  Q3=quartile(c, 3)
  min=c[0]
  max=c[length(c) - 1]

  format = "%-5s %-5s %-5s %-5s %-5s\n"
  printf(format, "min", "Q1", "Q2", "Q3", "max")
  printf(format, padding("=", 5), padding("=", 5), padding("=", 5), padding("=", 5), padding("=", 5))
  printf("%.3f %.3f %.3f %.3f %.3f\n", min, Q1, Q2, Q3, max)
}

function quartile(nums, p) {
  i = (p / 4) * length(nums)
  if (i > int(i)) { # float
    return c[int(i) + 1]
  } else { # int
    return (c[i] + c[i]) / 2
  }
}

function padding(c, n) {
  res = ""
  for (i=0; i < n; i++)
    res = res c
  return res
  }
