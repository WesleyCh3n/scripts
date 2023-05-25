BEGIN{
  FS=OFS=","
}
NR > 1 {
  print $COL
}

END{ }
