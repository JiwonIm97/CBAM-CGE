$if not set GRID_R_STEP $setglobal GRID_R_STEP 10
$if not set GRID_A_STEP $setglobal GRID_A_STEP 10

* ==============================================================
* Scenario/Run_Policy_Grid.gms
*
* EU carbon price: USD 100/tCO2 at sim=7.
* r = share of EU CBAM revenue transferred abroad.
* a = share allocated to the FIRST instrument in each pair.
*
* Required:
* Run_Master.gms must save a fresh, successfully solved benchmark
* to Output_w-1/CBAM_GRID_START.gdx before running scenarios.
*
* Each grid case:
* 1. Restore benchmark variable records and attributes.
* 2. Reset policy and configure r, a and instruments.
* 3. Initialize active instrument allocation shares.
* 4. Follow the existing carbon-price path through sim=7.
* ==============================================================

SETS
    g_mix / REN_HH, LAB_HH, REN_LAB /
    g_pct / 0*100 /
;

ALIAS (g_pct, gr, ga);

SETS
    g_done(g_mix,gr,ga)
    g_active_case(g_mix,gr,ga)
;

SCALARS
    g_r_step / %GRID_R_STEP% /
    g_a_step / %GRID_A_STEP% /
    g_r
    g_a
    g_sim_now
;

PARAMETERS
    g_weight(z)
    g_ren_base(z)
    g_lab_base(z)

    g_EV(g_mix,gr,ga,z)
    g_CO2(g_mix,gr,ga,z)
    g_GDP_REAL(g_mix,gr,ga,z)
    g_CTH_REAL(g_mix,gr,ga,z)
    g_CPI(g_mix,gr,ga,z)

    g_TCBAM(g_mix,gr,ga,z)
    g_RCY_IN(g_mix,gr,ga,z)
    g_RCY_HH(g_mix,gr,ga,z)
    g_RCY_REN(g_mix,gr,ga,z)
    g_RCY_LAB(g_mix,gr,ga,z)
    g_modelstat(g_mix,gr,ga)
    g_solvestat(g_mix,gr,ga)
;


* --------------------------------------------------------------
* 1. Grid and recipient checks
* --------------------------------------------------------------

abort$(g_r_step <= 0 or g_a_step <= 0)
    "Grid steps must be positive", g_r_step, g_a_step;

abort$(mod(100,g_r_step) <> 0 or mod(100,g_a_step) <> 0
    or g_r_step <> round(g_r_step) or g_a_step <> round(g_a_step))
    "Grid steps must be positive integer divisors of 100", g_r_step, g_a_step;

abort$(card(sim) < 7)
    "The existing carbon-price path requires at least seven sim entries";

abort$(card(z5) <> 3
    or not z5('04_IND')
    or not z5('10_OLMIC')
    or not z5('11_OLI'))
    "Check recipients: IND, OLMIC and OLI";

abort$(smin(z5,POPO(z5)) <= 0)
    "Recipient population must be positive", POPO;

* Benchmark population weights.
g_weight(z) = 0;

g_weight(z5)
    = POPO(z5)/sum(zj$z5(zj),POPO(zj));

g_done(g_mix,gr,ga) = no;
g_active_case(g_mix,gr,ga) = no;

* --------------------------------------------------------------
* 2. Grid loop
* --------------------------------------------------------------

loop((g_mix,gr,ga)$(
       mod(gr.val,g_r_step) = 0
   and mod(ga.val,g_a_step) = 0),

    g_r = gr.val/100;
    g_a = ga.val/100;
    g_sim_now = 0;

    g_active_case(g_mix,gr,ga) = yes;

* --------------------------------------------------------------
* 2.1 Restore the benchmark BEFORE resetting/applying policy.
*
* Load variable symbols explicitly.
* Do not reload grid parameters or accumulated results.
* Do not move this statement inside the sim loop.
* --------------------------------------------------------------

    execute_load "Output_w-1/CBAM_GRID_START.gdx",
        C, CABX, CG, CI, CE, CMIN, CTH_REAL,
        DD, DI, DE, DIT, DS, DS_I,
        EX, EXT, EXTT, G_REAL,
        GDP_BP_REAL, GDP_BP_W_REAL, GDP_MP_REAL,
        IM, IMT, INV, IT_REAL,
        KD, KDC, KS, LD, LDC, LS,
        MRGN, Q, VA, KLE, XS, XS_I, XST, POWERQ,

        e, P, P2, P3, P4, PPOWER, PI, PT,
        PC, PCI, PCE, PD, PE, PET,
        PIXCON, PIXGDP, PIXGDP_W, PIXGVT, PIXINV,
        PK, PL, PM, PMT, PP, PVA, PKLE,
        PWM, PWMG, PWX,
        R, RC, RK, RTI, W, WC, WTI, CTAX, CP,

        CAB, CTH, DEP, G,
        GDP_BP, GDP_BP_W, GDP_FD, GDP_MP, GDP_IB,
        IT, SG, SH, SROW,
        TDH, TCTAX, TIC, TICT, TIK, TIKT,
        TIM, TIMT, TIP, TIPT, TIW, TIWT, TIX, TIXT,
        TPRCTS, TPRODN,
        YDH, YG, YH, YHK, YHL, YROW, TCBAM,

        sh0, sh1, ttdh0, ttdh1,
        ttic, ttik, ttim, ttip, ttiw, ttix,
        LEON, deltattip, ttip_share, deltattiw, ttiw_share
    ;

$include "Scenario/Reset_Policy.gms"

* --------------------------------------------------------------
* 2.2 Set revenue destinations and instrument budget shares
* --------------------------------------------------------------

* EU households receive the retained share.
    rcy_share('07_EU','07_EU') = 1-g_r;
    rcy_share('07_EU',z5)     = g_r*g_weight(z5);

    rcy_hh('07_EU') = 1;

* Recipient instruments remain inactive when r=0.
    if(g_r > 0,

        if(sameas(g_mix,'REN_HH'),
            rcy_prd(z5) = g_a;
            rcy_hh(z5)  = 1-g_a;
        );

        if(sameas(g_mix,'LAB_HH'),
            rcy_lab(z5) = g_a;
            rcy_hh(z5)  = 1-g_a;
        );

        if(sameas(g_mix,'REN_LAB'),
            rcy_prd(z5) = g_a;
            rcy_lab(z5) = 1-g_a;
        );
    );

$include "Scenario/Apply_Policy.gms"

* --------------------------------------------------------------
* 2.3 Initialize allocation shares for active instruments
*
* These are allocation shares WITHIN each instrument.
* They differ from rcy_prd/rcy_lab, which allocate the total budget
* BETWEEN instruments.
*
* Change .L only; retain the bounds set by Apply_Policy.gms.
* --------------------------------------------------------------

* REN: same eligibility domain as EQ96.
    g_ren_base(z)
        = sum(j$(eREN(j) and ACTIVE_J(j,z)),
              XST.l(j,z)*PP.l(j,z));

* LAB: same eligibility domain as EQ99.
    g_lab_base(z)
        = sum((l,j)$(
                 J11(j)
             and ACTIVE_J(j,z)
             and LDO(l,j,z) > 0),
              W.l(l,z)*LD.l(l,j,z));

    abort$(sum(z$(
               rcy_prd(z) > 0
           and g_ren_base(z) <= 0),1) > 0)
        "Active REN instrument has no positive eligible output value",
        g_active_case, g_ren_base;

    abort$(sum(z$(
               rcy_lab(z) > 0
           and g_lab_base(z) <= 0),1) > 0)
        "Active LAB instrument has no positive eligible wage bill",
        g_active_case, g_lab_base;

    ttip_share.l(j,z)$(
           eREN(j)
       and ACTIVE_J(j,z)
       and rcy_prd(z) > 0
       and g_ren_base(z) > 0)
        = XST.l(j,z)*PP.l(j,z)/g_ren_base(z);

    ttiw_share.l(l,j,z)$(
           J11(j)
       and ACTIVE_J(j,z)
       and LDO(l,j,z) > 0
       and rcy_lab(z) > 0
       and g_lab_base(z) > 0)
        = W.l(l,z)*LD.l(l,j,z)/g_lab_base(z);

* --------------------------------------------------------------
* 2.4 Existing carbon-price continuation: sim=1,...,7
*
* The benchmark is restored once per grid case.
* Within this loop, retain each solution for the next price step.
* --------------------------------------------------------------

    loop(sim$(ord(sim) <= 7),

$include "Scenario/_CarbonPrice_Path.gms"

        g_sim_now = ord(sim);

        put_utility 'log'
            / 'GRID: mix=' g_mix.tl:0
              ' r=' g_r:0:2
              ' a=' g_a:0:2
              ' sim=' g_sim_now:0:0;

        solve CBAM using CNS;

* --------------------------------------------------------------
* 2.5 Validate before recording results
* --------------------------------------------------------------

        if(CBAM.solvestat <> 1
           or CBAM.modelstat <> 16
           or CBAM.numdepnd <> 0,

abort "Grid solve failed",
                g_active_case, g_r, g_a, g_sim_now;
        );

        if(smax(z,abs(LEON.l(z))) > 1e-6,

abort "Grid Walras residual exceeds tolerance",
                g_active_case, g_r, g_a, g_sim_now;
        );

$include "Results_format/CGE_Results.gms"

* --------------------------------------------------------------
* 2.6 Record the USD 100/tCO2 outcome
* --------------------------------------------------------------

        if(ord(sim) = 7,

            g_EV(g_mix,gr,ga,z)
                = valEV(z,sim);

* Combustion CO2: industry plus households.
            g_CO2(g_mix,gr,ga,z)
                = valTCO2I(z,sim)+valTCO2H(z,sim);

            g_GDP_REAL(g_mix,gr,ga,z)
                = valGDP_BP_REAL(z,sim);

            g_CTH_REAL(g_mix,gr,ga,z)
                = valCTH_REAL(z,sim);

            g_CPI(g_mix,gr,ga,z)
                = valPIXCON(z,sim);

* Current revenues and transfers in international currency.
            g_TCBAM(g_mix,gr,ga,z)
                = TCBAM.l(z)/e.l(z);

            g_RCY_IN(g_mix,gr,ga,z)
                = sum(zj,
                      rcy_share(zj,z)*TCBAM.l(zj)/e.l(zj));

            g_RCY_HH(g_mix,gr,ga,z)
                = rcy_hh(z)*g_RCY_IN(g_mix,gr,ga,z);

            g_RCY_REN(g_mix,gr,ga,z)
                = rcy_prd(z)*g_RCY_IN(g_mix,gr,ga,z);

            g_RCY_LAB(g_mix,gr,ga,z)
                = rcy_lab(z)*g_RCY_IN(g_mix,gr,ga,z);

            g_modelstat(g_mix,gr,ga)
                = CBAM.modelstat;

            g_solvestat(g_mix,gr,ga)
                = CBAM.solvestat;

            g_done(g_mix,gr,ga) = yes;
        );
    );

* Clear only the completed case.
* If execution aborts above, the failed case remains marked.
    g_active_case(g_mix,gr,ga) = no;
);

* --------------------------------------------------------------
* 3. Save completed grid
* --------------------------------------------------------------

execute_unload "Output_w-1/CBAM_GRID_100.gdx",
    g_mix, g_pct, g_done,
    g_r_step, g_a_step, g_weight,
    g_EV, g_CO2, g_GDP_REAL, g_CTH_REAL, g_CPI,
    g_TCBAM, g_RCY_IN, g_RCY_HH, g_RCY_REN, g_RCY_LAB,
    g_modelstat, g_solvestat;
