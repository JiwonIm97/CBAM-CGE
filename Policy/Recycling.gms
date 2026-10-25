* ==============================================================================
* Policy/Recycling.gms
* CBAM revenue allocation and use shares
* Include BEFORE Model.gms, AFTER calibration and population loading.
* ==============================================================================

PARAMETERS
    rcy_share(z,zj)  "Share of collector z revenue allocated to region zj"
    rcy_hh(z)        "Household transfer share of received revenue"
    rcy_gov(z)       "Government retention share of received revenue"
    rcy_lab(z)       "Labor tax reduction share of received revenue"
    rcy_prd(z)       "Renewable subsidy share of received revenue"
    rcy_chk(z)       "Row sum of rcy_share: zero or one"

    rcy_weight(z)    "Allocation weight across overseas recipient regions"
    rcy_use_chk(z)   "Sum of revenue-use shares within receiving region"
;

SCALARS
    rcy_tol         "Tolerance for allocation-share checks" / 1e-8 /
;

* ------------------------------------------------------------------------------
* Initial policy state: no CBAM revenue allocation.
* Scenario files will assign rcy_share and instrument-use shares.
* ------------------------------------------------------------------------------

rcy_share(z,zj) = 0;

rcy_hh(z)  = 0;
rcy_gov(z) = 0;
rcy_lab(z) = 0;
rcy_prd(z) = 0;

rcy_chk(z)     = 0;
rcy_use_chk(z) = 0;

* ------------------------------------------------------------------------------
* Population weights across recipient regions in z5.
* POPO is benchmark population; its common unit cancels in the ratio.
* ------------------------------------------------------------------------------

rcy_weight(z) = 0;
rcy_weight(z5) = POPO(z5) / sum(zj$z5(zj), POPO(zj));

* ------------------------------------------------------------------------------
* Revenue-transfer macros: preserve the existing currency conversion.
*
* RCY_IN  : total receipts, including domestic allocation,
*           expressed in the receiving region's model currency.
* RCY_INF : receipts from foreign collecting regions,
*           expressed in the receiving region's model currency.
* RCY_OUTF: transfers to foreign recipients,
*           expressed in the collecting region's model currency.
* ------------------------------------------------------------------------------

$macro RCY_IN(zz)   [e(zz)*SUM(zjj,rcy_share(zjj,zz)*TCBAM(zjj)/e(zjj))]
$macro RCY_INF(zz)  [e(zz)*SUM(zjj$(NOT SAMEAS(zjj,zz)),rcy_share(zjj,zz)*TCBAM(zjj)/e(zjj))]
$macro RCY_OUTF(zz) [TCBAM(zz)*SUM(zjj$(NOT SAMEAS(zjj,zz)),rcy_share(zz,zjj))]
