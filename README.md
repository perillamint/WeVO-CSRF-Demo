# WeVO CSRF command injection PoC
## 주의
이 스크립트를 구동함으로서 발생하는 문제에 대해서는 어떤 책임도 지지 않습니다. Use at your own risk.

# 실행 방법
1. WeVO 라우터의 LAN 포트와 컴퓨터를 이더넷 케이블로 연결한다.
2. WeVO 라우터와 연결된 컴퓨터 인터페이스의 IP를 192.168.10.2 로 설정한다.
3. PoC 디렉터리에서 npm install 을 실행한다.
4. PoC 디렉터리에서 npm start 를 실행한 뒤 http://localhost:8080 으로 접속한다

# 권장 사항
익스플로잇 상태를 확인하고 싶다면, WeVO 라우터에 디버그 헤더를 땜해서 UART 연결을 하는 것이 권장된다.

W2914NS, Hi1200AC, 11AC NAS Router 의 핀아웃과 보율 설정은 다음과 같다

#### 핀아웃
1. Vcc (3V3)
2. Rx
3. Tx
4. GND

#### 보율 설정
57600 8N1
