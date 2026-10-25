# CBAM-CGE-V2

Version 2 of the CBAM CGE model, maintained on the `v2` branch of
[JiwonIm97/CBAM-CGE](https://github.com/JiwonIm97/CBAM-CGE).
The existing `main` branch retains version 1.

## Scope

Static multi-region CGE model of EU carbon pricing, CBAM, and revenue recycling.
This version contains the model, input preparation code, five basic policy
scenarios, regional results reporting, and a general policy grid.
Figure production and development comparison tools are maintained separately.

The standalone 50:50 scenario and paper-specific selected-policy detail exports
have been removed. Population weights determine overseas recipient allocations.

## Files

| Location | Purpose |
| --- | --- |
| `Run_Master.gms` | Entry point and execution switches |
| `Sets.gms`, `PAR.gms`, `CAL.gms` | Sets, input loading, and calibration |
| `Model.gms`, `Init_Closure.gms` | Equations, initialization, and closure |
| `Policy/Recycling.gms` | Revenue allocation and transfer definitions |
| `Scenario/` | Basic scenarios and policy grid exploration |
| `Results_format/` | Reporting and GDX export |
| `Input_w-1/` | Economic-data aggregation and parameter import ranges |
| `Input_WEB/` | Energy-balance preprocessing |

## Requirements and local data

GAMS with CONOPT4 is required. GAMS 40.1.1 was used during preparation.
Run commands from the repository root. Local datasets and generated results are
excluded from Git tracking.

Required local economic input: `Input_w-1/DATA_AGG_GTAP12.gdx`.
With the default Excel refresh enabled, supply `Input_w-1/PAR.xls` and
`Input_WEB/DATA_WEB_2023.xlsx`, and working GDXXRW/Excel automation.
With `--REBUILD_XLS=0`, supply the already converted
`Input_w-1/PAR.gdx` and `Input_WEB/DATA_WEB_2023_raw.gdx` instead.
Refresh cached GDX inputs when source workbooks change.

The economic aggregation script additionally requires
`Input_w-1/GTAP12_basedata.gdx` and `Input_w-1/GTAP12_parameters.gdx`.
Input data must be obtained separately.

## Run

```powershell
# Default: benchmark followed by policy grid exploration
gams Run_Master.gms lo=3

# Use existing spreadsheet-derived GDX inputs
gams Run_Master.gms --REBUILD_XLS=0 lo=3

# Benchmark only
gams Run_Master.gms --RUN_CBAM_GRID=0 lo=3

# Select basic scenarios instead of the grid
gams Run_Master.gms --RUN_CBAM_GRID=0 --RUN_S0_BASE=1 --RUN_S1_CBAM_EU=1 lo=3

# Coarser policy grid
gams Run_Master.gms --GRID_R_STEP=50 --GRID_A_STEP=50 lo=3
```

Basic scenario switches: `RUN_S0_BASE`, `RUN_S1_CBAM_EU`, `RUN_S2_CBAM_RENEW`,
`RUN_S3_CBAM_LAB`, and `RUN_S4_CBAM_HH`. All default to zero.
`RUN_BENCHMARK` and `RUN_CBAM_GRID` default to one. Grid runs require a fresh
benchmark in the same execution.

The grid explores REN_HH, LAB_HH, and REN_LAB pairs. The overseas recycling share
and within-pair allocation share each range from 0 to 100%, in 10% steps by
default: 363 representations. Steps must be positive integer divisors of 100.
Boundary representations can describe the same economic policy.
The seven-step price path ends at USD 100/tCO2.

Grid outcomes are written to `Output_w-1/CBAM_GRID_100.gdx`.
`g_done` identifies completed cases; sparse numerical zeros alone do not identify
missing cases. Monetary model quantities use USD 10 billion units, and grid
combustion CO2 is reported in ktCO2. Industry/technology detail for figure
production is not exported by the policy grid.
