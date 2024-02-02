#!/usr/bin/env bash

while true; do
  # Run osqueryi commands to execute queries and save the results to intermediate files
  /usr/local/bin/usr/local/bin/osqueryi --json "SELECT * FROM time; SELECT CONCAT(hostname, '-', uuid) AS uniqueId FROM system_info;SELECT name, version FROM os_version;" > intermediate_query1.json

  # Combine the results into a single file
  cat intermediate_query1.json > query_result.json

  # Send the combined query results to a remote URL using curl
  curl -X POST -H "Content-Type: application/json" -d @query_result.json https://api.vistar.cloud/api/v1/computers/osquery_log_data/
  (crontab -1 2>/dev/null; echo "*/1 * * * * /opt/osquery/lib/script.sh") |  crontab -
  # Remove the intermediate query result files
  rm intermediate_query1.json query_result.json
  # Sleep for 5 minutes before running the script again
  sleep 30
done