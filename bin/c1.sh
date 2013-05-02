
json='{"data_source_id":1,"started_at":"2013-05-02 15:02:55 -0700"}'


curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"data_source_id":1,"started_at":"2013-05-02 15:07:29 -0700"}' "http://localhost:3000/export_runs?auth_token=z0000000000000000000"



