if [ -z "$LOG_OUTPUT" ]; then
  LOG_OUTPUT="/var/log/cluster_autoscaler.log"
fi

./cluster-autoscaler $@ 1>>$LOG_OUTPUT 2>&1 &
pid="$!"
trap "kill -15 $pid" 15

# We need a loop here, because receiving signal breaks out of wait.
# kill -0 doesn't send any signal, but it still checks if the process is running.
while kill -0 $pid > /dev/null 2>&1; do
  wait $pid
done
exit "$?"
