# CBAM-CGE Model

이 프로젝트는 글로벌 CGE 모형을 이용하여 탄소국경조정제도(Carbon Border Adjustment Mechanism, CBAM)의 도입 효과와 CBAM 세수의 환류 방식에 따른 경제적 영향을 분석하기 위한 모형이다.

이 모형은 기준 시나리오와 CBAM 도입 시나리오를 분리하여 실행하며, CBAM 세수를 재생에너지, 노동, 가계 등 다양한 경로로 환류할 수 있도록 구성하였다.

## 1. 폴더 구조

```text
CBAM/
├── Run_Master.gms
├── Sets.gms
├── PAR.gms
├── CAL.gms
├── Model.gms
├── Init_Closure.gms
│
├── Policy/
│   └── Recycling.gms
│
├── Scenario/
│   ├── ScenarioList.gms
│   ├── RunScenario.gms
│   ├── Reset_Policy.gms
│   ├── Apply_Policy.gms
│   ├── _CarbonPrice_Path.gms
│   ├── S0_BASE.gms
│   ├── S1_CBAM_EU.gms
│   ├── S2_CBAM_RENEW.gms
│   ├── S3_CBAM_LAB.gms
│   ├── S4_CBAM_HH.gms
│   └── ScenarioList.gms
│
├── Results_format/
│   ├── Declare_Results.gms
│   ├── CGE_Results.gms
│   └── Unload.gms
│
├── Input_WEB/
├── Input_w-1/
├── Output_w-1/
└── Verify/
```

## 2. 주요 파일

| 파일                     | 역할                                        |
| ---------------------- | ----------------------------------------- |
| `Run_Master.gms`       | 모형 실행 진입점, 전역 스위치 설정 및 벤치마크 검증            |
| `Sets.gms`             | 국가, 산업, 상품 및 CBAM 대상 지역·부문 집합 정의          |
| `PAR.gms`              | 파라미터 선언, GTAP 기반 GDX 자료 로드 및 외생가격 설정      |
| `CAL.gms`              | 소득, 세율, CES·CET·LES, 에너지 및 CO₂ 관련 파라미터 보정 |
| `Model.gms`            | 모형 변수와 방정식 정의                             |
| `Init_Closure.gms`     | 변수 초기값, 외생·내생 변수 및 모형 클로저 설정              |
| `Policy/Recycling.gms` | CBAM 세수 환류 관련 스위치, 배분행렬 및 집계 매크로 정의       |

## 3. 시나리오 구성

| 파일                  | 설명                    | 출력 파일                         |
| ------------------- | --------------------- | ----------------------------- |
| `S0_BASE.gms`       | 기준 시나리오               | `Output_w-1/1_BASE.gdx`       |
| `S1_CBAM_EU.gms`    | CBAM 세수를 부과국에 귀속      | `Output_w-1/2_CBAM_EU.gdx`    |
| `S2_CBAM_RENEW.gms` | CBAM 세수를 재생에너지 부문에 환류 | `Output_w-1/3_CBAM_RENEW.gdx` |
| `S3_CBAM_LAB.gms`   | CBAM 세수를 노동 관련 경로로 환류 | `Output_w-1/4_CBAM_LAB.gdx`   |
| `S4_CBAM_HH.gms`    | CBAM 세수를 가계에 환류       | `Output_w-1/5_CBAM_HH.gdx`    |

`ScenarioList.gms`에서 실행할 시나리오를 지정하며, `RunScenario.gms`가 각 시나리오 파일을 순차적으로 호출한다.

`Reset_Policy.gms`는 이전 시나리오에서 적용된 정책 변수와 스위치를 초기화한다.

`Apply_Policy.gms`는 현재 시나리오의 배분조건을 점검한 후 필요한 정책 도구변수를 내생화한다.

## 4. 핵심 설계

CBAM 정책과 세수 환류 구조는 다음 세 요소를 중심으로 구성된다.

| 구분          | 모형 요소                                     | 의미                                  |
| ----------- | ----------------------------------------- | ----------------------------------- |
| CBAM 징수국    | `z3`                                      | CBAM을 부과하고 세수를 징수하는 국가 또는 지역        |
| 국가 간 세수 배분  | `rcy_share(z,zj)`                         | 징수국 `z`에서 수령국 `zj`로 이전되는 CBAM 세수 비중 |
| 수령국 내 환류 방식 | `rcy_hh`, `rcy_gov`, `rcy_lab`, `rcy_prd` | 가계, 정부, 노동 또는 생산 부문으로의 환류 방식        |

### 4.1 국가 간 세수 배분

`rcy_share(z,zj)`는 CBAM 세수의 국가 간 배분행렬이다.

* 행 인덱스 `z`: CBAM 세수를 징수한 국가
* 열 인덱스 `zj`: CBAM 세수를 수령하는 국가
* 값: 징수된 세수 중 수령국에 배분되는 비중

각 징수국에 대해 배분비중의 합은 원칙적으로 1이 되어야 한다.

```gams
sum(zj, rcy_share(z,zj)) = 1
```

실제 모형에서는 `Apply_Policy.gms`에서 배분비중의 정합성을 점검한다.

### 4.2 환류 방식

수령국에 배분된 CBAM 세수는 다음과 같은 방식으로 환류할 수 있다.

| 변수        | 환류 대상       |
| --------- | ----------- |
| `rcy_hh`  | 가계          |
| `rcy_gov` | 정부          |
| `rcy_lab` | 노동          |
| `rcy_prd` | 생산 또는 특정 산업 |

각 시나리오는 해당 환류수단과 관련된 정책 도구변수를 내생화하고, 나머지 수단은 비활성화하는 방식으로 구성된다.

## 5. 배분비중 변경

### 5.1 인구 또는 1인당 GDP 기준 배분

세수를 인구, 1인당 GDP 또는 두 지표의 결합가중치에 따라 배분하려면 `Policy/Recycling.gms`의 `rcy_share(z,zj)` 계산식을 수정한다.

예를 들어 수령국의 인구 비중을 기준으로 배분할 경우 다음과 같은 형태로 설정할 수 있다.

```gams
rcy_share(z,zj)
    = population(zj)
    / sum(zz, population(zz));
```

인구와 1인당 GDP를 함께 사용할 경우에는 두 지표를 정규화한 뒤 가중평균하여 적용할 수 있다.

### 5.2 부분 환류

CBAM 세수의 일부만 다른 국가에 이전하고 나머지를 징수국이 보유하도록 설정할 수 있다.

예를 들어 EU가 징수한 세수 중 70%를 EU에 귀속하고 30%를 다른 국가에 배분하는 경우:

```gams
rcy_share('07_EU','07_EU') = 0.7;
```

나머지 30%에 대해서는 다른 수령국의 배분비중을 추가로 설정해야 한다.

```gams
sum(zj, rcy_share('07_EU',zj)) = 1;
```

이 조건이 충족되지 않으면 세수의 과소배분 또는 중복배분이 발생할 수 있다.

## 6. 모형 실행

모형은 `Run_Master.gms`를 통해 실행한다.

```text
Run_Master.gms
```

기본 실행 과정은 다음과 같다.

1. 집합과 입력자료를 불러온다.
2. 기준연도 자료를 이용해 모형을 보정한다.
3. 초기값과 클로저를 설정한다.
4. `ScenarioList.gms`에 등록된 시나리오를 순차적으로 실행한다.
5. 시나리오별 결과를 `Output_w-1` 폴더에 저장한다.
6. 필요한 경우 `Verify` 폴더의 기준 결과와 비교한다.

## 7. 결과 저장

결과 보고와 저장은 `Results_format` 폴더에서 관리한다.

| 파일                    | 역할                        |
| --------------------- | ------------------------- |
| `Declare_Results.gms` | 시나리오 결과 저장용 파라미터 선언       |
| `CGE_Results.gms`     | 시나리오 반복문 안에서 결과값 적재       |
| `Unload.gms`          | 지정된 파일명으로 결과를 GDX 형식으로 저장 |

`Unload.gms`는 `%1` 인수를 GDX 파일명으로 사용한다.

```gams
$batinclude Results_format/Unload.gms 1_BASE
```

위 명령을 사용할 경우 결과는 다음과 같이 저장된다.

```text
Output_w-1/1_BASE.gdx
```

## 8. 시나리오 실행 구조

시나리오 실행 흐름은 다음과 같다.

```text
Run_Master.gms
    ↓
ScenarioList.gms
    ↓
RunScenario.gms
    ↓
Reset_Policy.gms
    ↓
개별 시나리오 파일
    ↓
Apply_Policy.gms
    ↓
Model Solve
    ↓
Results_format/
    ↓
Output_w-1/*.gdx
```

새로운 시나리오를 추가하려면 다음 절차를 따른다.

1. `Scenario/` 폴더에 새로운 시나리오 파일을 생성한다.
2. 시나리오 파일에서 정책 스위치와 환류 방식을 설정한다.
3. `ScenarioList.gms`에 신규 시나리오를 추가한다.
4. 결과 GDX 파일명을 지정한다.
5. `Run_Master.gms`를 실행한다.

## 9. 유의사항

* 새로운 시나리오를 추가할 때에는 먼저 `Reset_Policy.gms`를 호출하여 이전 시나리오의 정책 설정이 남지 않도록 해야 한다.
* `rcy_share(z,zj)`의 배분비중 합이 1인지 반드시 확인해야 한다.
* 환류수단을 변경할 경우 관련 정책 도구변수의 외생·내생 상태를 함께 점검해야 한다.
* `.lst`, `.log`, `.lxi` 파일은 실행 과정에서 생성되는 결과 파일이므로 일반적으로 Git 추적 대상에서 제외하는 것이 좋다.
* 입력자료와 GDX 파일을 외부에 공개할 경우 자료의 사용권한과 라이선스를 먼저 확인해야 한다.

## 10. Git 관리 권장사항

다음과 같은 실행 결과 파일은 `.gitignore`에 추가하는 것을 권장한다.

```gitignore
*.lst
*.log
*.lxi
```

필요한 경우 대용량 GDX 파일도 제외할 수 있다.

```gitignore
*.gdx
```

단, 모형 실행에 필수적인 입력 GDX 파일까지 제외되지 않도록 주의해야 한다.
