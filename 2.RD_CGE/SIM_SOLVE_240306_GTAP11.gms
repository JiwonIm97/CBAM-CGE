*==============================================================================
*  6.2.1.1 Choice of multifactor productivity
*==============================================================================
*  6.2.1.1.1 Input for multifactor productivity
*==============================================================================
* Multifactor productivity is retrieved from a model BAU solution with
* endogenous A_VA(z,time) in equation 3, and exogenous real GDPs, fixed at
* values that are projected using Four?, Benassy-Qu?r? and Fontagn? projected
* growth rates. So the solution is forced to follow the GDP projected growth
* paths. The solution values of A_VA are stored as parameter A_VA_RES.
*-------------------------------------------------------------------------------

PARAMETER
 A_VA_RES(z,time)     Value of A_VA to reproduce real GDP projections
 GX(z,time)           Current government expenditures on goods and services in region z
 G_REALX(z,time)      Current real government expenditures on goods and services in region z
 INDX(k,j,z,time)     Volume of new type k capital investment to industry j in region z
 sh0X(z,time)     Intercept (household savings)
 sh1X(z,time)     Household savings rate
;

$GDXIN Input_w-t\B_line_240219_GTAP11b.gdx
*$LOAD A_VA_RES, sh0X, sh1X, GX, G_REALX, INDX
$LOAD A_VA_RES, GX, G_REALX, INDX, sh1X, sh0X

display  A_VA_RES;
*$EXIT

*==============================================================================
*  6.2.1.1.2 Choice of multifactor productivity
*==============================================================================
* If you want to reproduce the real GDP projections, set:
 A_VA.FX(z,time)  = A_VA_RES(z,time);
* Otherwise, simply put A_VA equal to one:
* A_VA.FX(z,time)    = 1;

*==============================================================================
*   6.2.1.2 Choice of reference region
*==============================================================================
* By default, the reference region is USA,
 zr(z)           = no;
 zr('07_NAM')    = yes;
*zr('ChinaHK')   = yes;
 z1(z)           = NOT[zr(z)];

*==============================================================================
*   6.2.1.3 Choice between closures FE and FP
*==============================================================================
*$ontext
* FP CLOSURE: fixed PIXGDPs; numeraire is exchange rate of reference region
* The exchange rates are endogenous, except for the reference region.
 e.FX(zr,time)      = eO(zr);
 PIXGDP.FX(z,time)  = PIXGDPO(z)/sum(zr,eO(zr));
*$offtext

$ontext
* FE CLOSURE: fixed exchange rates; numeraire is PIXGDP of reference region
* The exchange rates can be fixed at arbitrary values
 PIXGDP.FX(zr,time)  = PIXGDPO(zr);
 e.FX(z,time)        = eO(z);
$offtext


*==============================================================================
*   Taking account of the existence or not of a feasible solution
*==============================================================================
PARAMETER
 SolStop
 If_Feasibl(time,scen)    Optimality status code
 StatSolver(time,scen)    Solver status code
 LastGood(scen)           Last feasible solution year
;
 SolStop = 0;
 LastGood(scen)=Endtime;
 file Status / 'Output_w-t/ModelStatus.xls'/;
* Column separator: 6 = tab-separated file
*                   5 = comma-separated file
     Status.pc=6;
* Number of decimal places (maximum 10)
     Status.nd=0;

* EndTime is the final year for model resolution.
* Parameter EndTime is defined in the main program.
LOOP[time$(time.val le EndTime),
* T(time) is a subset of set TIME. It was previously empty. It now contains
* a single element: it is the current value of the TIME index.
T(time) = YES;

*==============================================================================
*   6.2.1.4 Other exogenous variables
*==============================================================================
 G_REAL.FX(z,time)   = G_REALX(z,time);
 IND.fx(k,pub,z,time) = INDX(k,pub,z,time);
 sh0.fx(z,time)      = sh0X(z,time);
 sh1.fx(z,time)      = sh1X(z,time);
* ttdh0.fx(z,time)    = ttdh0O(z)*exogro(z,time);
 phi.fx(z,time)       = phiO(z);
 ttdh0.fx(z,time)    = ttdh0O(z);
 ttdh1.fx(z,time)    = ttdh1O(z);
 ttic.fx(i,z,time)   = tticO(i,z);
 ttik.fx(k,j,z,time) = ttikO(k,j,z);
 ttim.fx(i,zj,z,time)= ttimO(i,zj,z);
 ttip.fx(j,z,time)   = ttipO(j,z);
 ttiw.fx(l,j,z,time) = ttiwO(l,j,z);
 ttix.fx(i,z,zj,time)= ttixO(i,z,zj);
* CTAX.fX(z,time)     = CTAX1(z,time);
 CTAX.fX(z,time)     = CTAX0(z);

*==============================================================================
*   6.2.2.1 Initialisation
*==============================================================================

$INCLUDE INIT_240219.gms

*==============================================================================
*   6.1.1.1 Lower bounds on some variables
*==============================================================================
$Ontext
 LD.LO(l,j,z,time)$(ord(time) gt 1)   = 0.00001*LD.l(l,j,z,time-1);
 LDC.LO(j,z,time)$(ord(time) gt 1)    = 0.00001*LDC.l(j,z,time-1);
 RC.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*RC.l(j,z,time-1);
 WC.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*WC.l(j,z,time-1);
 R.LO(k,j,z,time)$(ord(time) gt 1)    = 0.00001*R.l(k,j,z,time-1);
 RTI.LO(k,j,z,time)$(ord(time) gt 1)  = 0.00001*RTI.l(k,j,z,time-1);
 U.LO(z,time)$(ord(time) gt 1)        = 0.00001*U.l(z,time-1);
 DS_I.LO(i,z,time)$(ord(time) gt 1)   = 0.00001*DS_I.l(i,z,time-1);
 EXT.LO(i,z,time)$(ord(time) gt 1)    = 0.00001*EXT.l(i,z,time-1);
 EX.LO(i,z,zj,time)$(ord(time) gt 1)  = 0.00001*EX.l(i,z,zj,time-1);
 EXTT.LO(j,i,z,time)$(ord(time) gt 1) = 0.00001*EXTT.l(j,i,z,time-1);
 IM.LO(i,zj,z,time)$(ord(time) gt 1)  = 0.00001*IM.l(i,zj,z,time-1);
 IMT.LO(i,z,time)$(ord(time) gt 1)    = 0.00001*IMT.l(i,z,time-1);

 KD.LO(k,j,z,time)$(ord(time) gt 1)   = 0.00001*KD.L(k,j,z,time-1);
 KDC.LO(j,z,time)$(ord(time) gt 1)    = 0.00001*KDC.L(j,z,time-1);
 VA.LO(j,z,time)$(ord(time) gt 1)      = 0.00001*VA.L(j,z,time-1);

 XS.LO(j,i,z,time)$(ord(time) gt 1)   = 0.00001*XS.L(j,i,z,time-1);
 XS_I.LO(i,z,time)$(ord(time) gt 1)   = 0.00001*XS_I.L(i,z,time-1);
 XST.LO(j,z,time)$(ord(time) gt 1)    = 0.00001*XST.L(j,z,time-1);

 C.LO(i,z,time)$(ord(time) gt 1)      = 0.00001*C.L(i,z,time-1);
 CG.LO(i,z,time)$(ord(time) gt 1)     = 0.00001*CG.L(i,z,time-1);
 CI.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*CI.L(j,z,time-1);
 CE.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*CE.L(j,z,time-1); 
 CMIN.LO(i,z,time)$(ord(time) gt 1)   = 0.00001*CMIN.L(i,z,time-1);
 CTH_REAL.LO(z,time)$(ord(time) gt 1) = 0.00001*CTH_REAL.l(z,time-1);
 DI.LO(i,j,z,time)$(ord(time) gt 1)   = 0.00001*DI.L(i,j,z,time-1);
 DE.LO(ene,j,z,time)$(ord(time) gt 1) = 0.00001*DE.L(ene,j,z,time-1);
 DIT.LO(i,z,time)$(ord(time) gt 1)    = 0.00001*DIT.L(i,z,time-1);
 DD.LO(i,z,time)$(ord(time) gt 1)     = 0.00001*DD.L(i,z,time-1);
 
 MRGN.LO(i,z,time)$(ord(time) gt 1)   = 0.00001*MRGN.L(i,z,time-1);
 Q.LO(i,z,time)$(ord(time) gt 1)      = 0.00001*Q.L(i,z,time-1);
 VA.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*VA.L(j,z,time-1);

 e.LO(z,time)$(ord(time) gt 1)        = 0.00001*e.L(z,time-1);
 IR.LO(z,time)$(ord(time) gt 1)       = 0.00001*IR.L(z,time-1);
 P.LO(i,z,time)$(ord(time) gt 1)      = 0.00001*P.L(i,z,time-1);
 P2.LO(j,i,z,time)$(ord(time) gt 1)   = 0.00001*P2.L(j,i,z,time-1);
 P4.LO(ene,j,z,time)$(ord(time) gt 1) = 0.00001*P4.L(ene,j,z,time-1);
 PPOWER.LO(z,time) $(ord(time) gt 1)  = 0.00001*PPOWER.L(z,time-1);
 PI.lO(i,z,time)$(ord(time) gt 1)     = 0.00001*PI.L(i,z,time-1);
 PT.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*PT.L(j,z,time-1);
 PP.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*PP.L(j,z,time-1); 
 PC.LO(i,z,time)$(ord(time) gt 1)     = 0.00001*PC.L(i,z,time-1);
 PCI.LO(j,z,time)$(ord(time) gt 1)    = 0.00001*PCI.L(j,z,time-1);
 PCE.LO(j,z,time)$(ord(time) gt 1)    = 0.00001*PCE.L(j,z,time-1);
 PD.LO(i,z,time)$(ord(time) gt 1)     = 0.00001*PD.L(i,z,time-1);
 PE.LO(i,z,zj,time)$(ord(time) gt 1)  = 0.00001*PE.L(i,z,zj,time-1);
 PET.LO(i,z,time)$(ord(time) gt 1)    = 0.00001*PET.L(i,z,time-1);
 PIXCON.LO(z,time)$(ord(time) gt 1)   = 0.00001*PIXCON.L(z,time-1);
 PIXGDP.LO(z,time)$(ord(time) gt 1)   = 0.00001*PIXGDP.L(z,time-1);
 PIXGDP_W.LO(time)$(ord(time) gt 1)   = 0.00001*PIXGDP_W.L(time-1);
 PIXGVT.LO(z,time)$(ord(time) gt 1)   = 0.00001*PIXGVT.L(z,time-1);
 PIXINV.LO(z,time)$(ord(time) gt 1)   = 0.00001*PIXINV.L(z,time-1);
 PK.LO(z,time)$(ord(time) gt 1)       = 0.00001*PK.L(z,time-1);
 PL.LO(i,z,time)$(ord(time) gt 1)     = 0.00001*PL.L(i,z,time-1);
 PM.LO(i,zj,z,time)$(ord(time) gt 1)  = 0.00001*PM.L(i,zj,z,time-1);
 PMT.LO(i,z,time)$(ord(time) gt 1)    = 0.00001*PMT.L(i,z,time-1);
 PP.LO(j,z,time)$(ord(time) gt 1)     = 0.00001*PP.L(j,z,time-1);
 PVA.LO(j,Z,time)$(ord(time) gt 1)    = 0.00001*PVA.L(j,Z,time-1);
 PKLE.LO(j,Z,time)$(ord(time) gt 1)   = 0.00001*PKLE.L(j,Z,time-1);
 PWM.LO(i,zj,z,time)$(ord(time) gt 1) = 0.00001*PWM.L(i,zj,z,time-1);
 PWMG.LO(i,time)$(ord(time) gt 1)     = 0.00001*PWMG.L(i,time-1);
 PWX.LO(i,z,zj,time) $(ord(time) gt 1) = 0.00001*PWX.L(i,z,zj,time-1);
$Offtext

*==============================================================================
*   6.1.3 Closures
*==============================================================================
*$ontext
* FP CLOSURE: fixed PIXGDPs; numeraire is exchange rate of reference region
* The exchange rates are endogenous, except for the reference region.
 e.FX(zr,time)      = eO(zr);
 PIXGDP.FX(z,time)  = PIXGDPO(z)/sum[zr,eO(zr)];
*$offtext

$ontext
* FE CLOSURE: fixed exchange rates; numeraire is PIXGDP of reference region
* The exchange rates can be fixed at arbitrary values
 PIXGDP.FX(zr,time)  = PIXGDPO(zr);
 e.FX(z,time)        = eO(z);
$offtext

*==============================================================================
*   6.2.2.2 Variables fixed each period according to their lagged values
*==============================================================================
 CABX.FX(z1,t1)      = CABXO(z1);
 CABX.FX(z1,time)$[ord(time) gt 1]
*                     = CABX.l(z1,time-1)*[1+growthz(z1)];
                     = CABX.l(z1,time-1)*[1+g_GDP(z1,time)];
                      
 CMIN.FX(i,z,t1)     = CMINO(i,z);
 CMIN.FX(i,z,time)$[ord(time) gt 1]
*                     = CMIN.l(i,z,time-1)*[1+growthz(z)];
                      = CMIN.l(i,z,time-1)*[1+g_GDP(z,time)];
                      
 KD.fx(k,j,z,t1)$KDO(k,j,z)
                     = KDO(k,j,z);
 KD.fx(k,j,z,time)${[ord(time) gt 1] and KDO(k,j,z)}
                     = KD.l(k,j,z,time-1)*[1-delta(z)]+IND.l(k,j,z,time-1);

 LS.FX(l,z,t1)       = LSO(l,z);
 LS.FX(l,z,time)$[ord(time) gt 1]
*                     = LS.l(l,z,time-1)*[1+growthz(z)];
                     = LS.l(l,z,time-1)*[1+g_POP(z,time)];
                    
* SH.fx(z,t1)         = SHO(z);
* SH.fx(z,time)$[ord(time) gt 1]
*                     = SH.l(z,time-1)*[1+growthz(z)];
*                     = SH.l(z,time-1)*[1+g_GDP(z,time)];                       

*==============================================================================
*   CTAX
*============================================================================== 

 CTAX.fX(z,t1)              = CTAX0(z);
 CTAX.fx(z,time)$[ord(time) gt 1]
*                            = CTAX_145(z,time);
                             = CTAX0(z);  

 CTAX.fX('01_KOR',t1)       = CTAX0('01_KOR');
 CTAX.fx('01_KOR',time)$[ord(time) gt 1]
                            = CTAX_145('01_KOR',time);  

*                            = CTAX_425('01_KOR',time);  
*                            = CTAX_565('01_KOR',time);  

* CTAX.fX('03_JPN',t1)       = CTAX0('03_JPN');
* CTAX.fx('03_JPN',time)$[ord(time) gt 1]
*                            = CTAX_565('03_JPN',time);  

* CTAX.fX('01_KOR',t1)       = CTAX0('01_KOR');
* CTAX.fx('01_KOR',time)$[ord(time) gt 1]
*                            = CTAX1('01_KOR',time);  

* CTAX.fx('01_KOR',time)$[ord(time) gt 3]
*                            =0.2;

*  ttip.fx('31_SER','01_KOR',time)$[ord(time) gt 1]
*                        = ttip.L('31_SER','01_KOR',time-1)*(1+0.01) ;

* ttic.fx(i,'01_KOR',time)$[ord(time) gt 1]
*                    = ttic.L(i,'01_KOR',time-1)*(1+0.05) ;

*  ttim.FX(ene,zj,'01_KOR',time)$[ord(time) gt 1]
*                    =   ttim.l(ene,zj,'01_KOR',time-1)*1.1 ;

*==============================================================================
*   6.2.2.3 Resolution
*==============================================================================

SOLVE PEPWT USING CNS;
*SOLVE PEPWT using NLP maximizing OBJ;
*SOLVE PEPWT USING MCP;

*==============================================================================
*   Taking account of the existence or not of a feasible solution
*==============================================================================
 If_Feasibl(time,'SIM') = PEPWT.modelstat;
 StatSolver(time,'SIM') = PEPWT.solvestat;

 Solstop = 1$(PEPWT.modelstat ne 16);
 LastGood('SIM')$(PEPWT.modelstat ne 16)= (time.val-1);

 put Status;
 put 'SIM', time.val, 'Optimality status', PEPWT.Tmodstat, 'Solver status', PEPWT.Tsolstat  /;

* The single element in subset T(time) is removed, and the subset is now empty.
T(time)          = NO;
* End of LOOP over time periods
];