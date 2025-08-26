# Filebeat

Filebeat는 경량화된 로그 수집기입니다.

서버에 에이전트 형식으로 설치해놓고 로그를 수집해서 전달하기 위한 목적으로 사용됩니다.

Filebeat는 사용자가 지정한 로그파일(경로)를 모니터링하고 로그이벤트를 수집하여 ElasticSearch 혹은 LogStash로 전달합니다.

## 사용법

```bash
docker-compose -f docker-compose.yml -f extensions/filebeat/filebeat-compose.yml up
```

## 설정

[`config/filebeat.yml`](./config/filebeat.yml) 파일을 수정하면 됩니다.

Filebeat 설정을 바꾸는 경우, Filebeat 컨테이너를 재시작해야합니다.

```console
docker-compose -f docker-compose.yml -f extensions/filebeat/filebeat-compose.yml restart filebeat
```

## 참조

- [filebeat-config]: https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-reference-yml.html
- [filebeat-docker]: https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html
- [filebeat-doc]: https://www.elastic.co/guide/en/beats/filebeat/current/index.html
