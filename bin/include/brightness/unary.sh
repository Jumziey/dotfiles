increment() {
  CURRENT="$1"
  if [[ $CURRENT -lt 10 ]]; then
    echo "10"
  elif [[ $CURRENT -eq 100 ]]; then
    echo "100"
  else
    ((NEW = "$CURRENT" + 10))
    echo "$NEW"
  fi
}

decrement() {
  CURRENT="$1"
  if [[ $CURRENT -le 10 ]]; then
    echo "1"
  else
    ((NEW = "$CURRENT" - 10))
    echo "$NEW"
  fi
}

percentSign() {
  val="$1"
  if [[ $val -le 1 ]]; then
    echo ""
  else
    echo "%"
  fi
}
