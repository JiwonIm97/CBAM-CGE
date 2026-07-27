# **CBAM** 

# **1. 폴더 구조**



CBAM/

├── Run\_Master.gms              실행 진입점 · $setglobal 스위치 · 벤치마크 검증 게이트

├── Sets.gms                         집합, CBAM 지역/부문 매핑

├── PAR.gms                         파라미터 선언 + GTAP GDX 로드 + 외생가격

├── CAL.gms                         벤치마크 보정 (소득·세율·CES/CET/LES·CO2·에너지)

├── Policy/

│   └── Recycling.gms               ★ 환류 스위치 선언 + 집계 매크로

├── Model.gms                        변수·방정식 (5.4 환류 도구 방정식 추가)

├── Init\_Closure.gms                 변수 초기값 · 자본이동성 · 클로저

├── Scenario/

│   ├── ScenarioList.gms            실행 목록 (한 줄 = 한 시나리오)

│   ├── RunScenario.gms             batinclude 러너

│   ├── Reset\_Policy.gms            시나리오 간 상태 초기화

│   ├── Apply\_Policy.gms            ★ 배분 정합성 검증 + 도구변수 자유화

│   ├── \_CarbonPrice\_Path.gms       CBAM 시나리오 공통 탄소가격 경로

│   ├── S0\_BASE.gms                 → Output\_w-1/1\_BASE.gdx

│   ├── S1\_CBAM\_EU.gms              → 2\_CBAM\_EU.gdx

│   ├── S2\_CBAM\_RENEW.gms           → 3\_CBAM\_RENEW.gdx

│   ├── S3\_CBAM\_LAB.gms             → 4\_CBAM\_LAB.gdx

│   └── S4\_CBAM\_HH.gms              → 5\_CBAM\_HH.gdx

└── Results\_format/

&#x20;   ├── Declare\_Results.gms         val\* 리포팅 파라미터 선언

&#x20;   ├── CGE\_Results.gms             loop(sim) 내부 결과 적재

&#x20;   └── Unload.gms                  batinclude(%1 = GDX 파일명)



# **2. 핵심 설계**

CBAM 도입 및 세수 순환 시나리오의 핵심 설계는 아래와 같음.

||구조|의미|
|-|-|-|
|누가 징수하는가|집합 `z3`|CBAM 부과국|
|누구에게 얼마가 가는가|`rcy\_share(z,zj)`|징수국 → 수령국 배분행렬|
|수령국이 어디에 쓰는가|`rcy\_hh / rcy\_gov / rcy\_lab / rcy\_prd`|환류 수단|





\*\*배분 비중을 인구·1인당GDP 가중으로 바꾸고 싶으면 `rcy\_share` 수정
부분 환류(예: 30%만 개도국으로)는 `rcy\_share('07\_EU','07\_EU')=0.7` 등 추가 가능

