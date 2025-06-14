1. VIRTUAL

ALTER TABLE users
ADD COLUMN full_name VARCHAR(104)
GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)) VIRTUAL;

- full_name은 테이블에 저장되지 않음.

- 조회할 때마다 first_name, last_name을 기반으로 실시간 계산됨.


2. STORED

ALTER TABLE users
ADD COLUMN full_name VARCHAR(104)
GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)) STORED;

- full_name은 테이블에 실제로 저장됨.
- 성능상 이점이 있음 (조회 속도 빠름).


🔚 정리
VIRTUAL: 가볍고 유연하지만 조회 성능은 느릴 수 있음. (기본값)

STORED: 빠른 조회와 인덱스 사용이 가능하지만 디스크 공간을 차지함.
