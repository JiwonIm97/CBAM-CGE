*==============================================================================
* Init_Closure.gms
* GTAP12 / CBAM: initialization, structural zeros and benchmark closure
* Original model attribution: Veronique Robichaud, Andre Lemelin,
* Helene Maisonnave and Bernard Decaluwe.
* Original license: https://creativecommons.org/licenses/by-nc-sa/3.0/
*==============================================================================

* 6.1 Benchmark starting levels

* Volume variables
CABX.L(z)                    = CABXO(z);
C.L(i,z)                     = CO(i,z);
CG.L(i,z)                    = CGO(i,z);
CI.L(j,z)                    = CIO(j,z);
CE.L(j,z)                    = CEO(j,z);
CMIN.L(i,z)                  = CMINO(i,z);
CTH_REAL.L(z)                = CTH_REALO(z);
DI.L(nene,j,z)               = DIO(nene,j,z);
DE.L(ene,j,z)                = DEO(ene,j,z);
DIT.L(i,z)                   = DITO(i,z);
DD.L(i,z)                    = DDO(i,z);
DS.L(j,i,z)                  = DSO(j,i,z);
DS_I.L(i,z)                  = DSO_I(i,z);
EX.L(i,z,zj)                 = EXO(i,z,zj);
EXT.L(i,z)                   = EXTO(i,z);
EXTT.L(j,i,z)                = EXTTO(j,i,z);
G_REAL.L(z)                  = G_REALO(z);
GDP_BP_REAL.L(z)             = GDP_BP_REALO(z);
GDP_MP_REAL.L(z)             = GDP_MP_REALO(z);
GDP_BP_W_REAL.L              = GDP_BP_W_REALO;
IM.L(i,zj,z)                 = IMO(i,zj,z);
IMT.L(i,z)                   = IMTO(i,z);
INV.L(i,z)                   = INVO(i,z);
IT_REAL.L(z)                 = IT_REALO(z);
KD.L(k,j,z)                  = KDO(k,j,z);
KDC.L(j,z)                   = KDCO(j,z);
KS.L(k,z)                    = KSO(k,z);
LD.L(l,j,z)                  = LDO(l,j,z);
LDC.L(j,z)                   = LDCO(j,z);
LS.L(l,z)                    = LSO(l,z);
MRGN.L(i,z)                  = MRGNO(i,z);
Q.L(i,z)                     = QO(i,z);
VA.L(j,z)                    = VAO(j,z);
KLE.L(j,z)                   = KLEO(j,z);
XS.L(j,i,z)                  = XSO(j,i,z);
XS_I.L(i,z)                  = XSO_I(i,z);
XST.L(j,z)                   = XSTO(j,z);
POWERQ.L(z)                  = POWERQO(z);
EE.L(product,j,z)            = EEO(product,j,z);
NE.L(product,j,z)            = NEO(product,j,z);
EH.L(product,z)              = EHO(product,z);
CO2I.L(product,j,z)          = CO2IO(product,j,z);
CO2H.L(product,z)            = CO2HO(product,z);

* Price variables
e.L(z)                       = eO(z);
P.L(i,z)                     = PO(i,z);
P2.L(j,i,z)                  = PO2(j,i,z);
P4.L(ene,j,z)                = PO4(ene,j,z);
PPOWER.L(z)                  = PPOWERO(z);
PI.L(i,z)                    = PO(i,z);
PT.L(j,z)                    = PTO(j,z);
PP.L(j,z)                    = PPO(j,z);
PC.L(i,z)                    = PCO(i,z);
PCI.L(j,z)                   = PCIO(j,z);
PCE.L(j,z)                   = PCEO(j,z);
PD.L(i,z)                    = PDO(i,z);
PE.L(i,z,zj)                 = PEO(i,z,zj);
PET.L(i,z)                   = PETO(i,z);
PIXCON.L(z)                  = PIXCONO(z);
PIXGDP.L(z)                  = PIXGDPO(z);
PIXGDP_W.L                   = PIXGDP_WO;
PIXGVT.L(z)                  = PIXGVTO(z);
PIXINV.L(z)                  = PIXINVO(z);
PK.L(z)                      = PKO(z);
PL.L(i,z)                    = PLO(i,z);
PM.L(i,zj,z)                 = PMO(i,zj,z);
PMT.L(i,z)                   = PMTO(i,z);
PVA.L(j,z)                   = PVAO(j,z);
PKLE.L(j,z)                  = PKLEO(j,z);
PWM.L(i,zj,z)                = PWMO(i,zj,z);
PWMG.L(i)                    = PWMGO(i);
PWX.L(i,z,zj)                = PWXO(i,z,zj);
R.L(k,j,z)                   = RO(k,j,z);
RC.L(j,z)                    = RCO(j,z);
RK.L(k,z)                    = RKO(k,z);
RTI.L(k,j,z)                 = RTIO(k,j,z);
W.L(l,z)                     = WO(l,z);
WC.L(j,z)                    = WCO(j,z);
WTI.L(l,j,z)                 = WTIO(l,j,z);

* Nominal variables
CAB.L(z)                     = CABO(z);
CTH.L(z)                     = CTHO(z);
DEP.L(z)                     = DEPO(z);
G.L(z)                       = GO(z);
GDP_BP.L(z)                  = GDP_BPO(z);
GDP_BP_W.L                   = SUM(z,GDP_BPO(z)/eO(z));
GDP_FD.L(z)                  = GDP_FDO(z);
GDP_IB.L(z)                  = GDP_IBO(z);
GDP_MP.L(z)                  = GDP_MPO(z);
IT.L(z)                      = ITO(z);
SG.L(z)                      = SGO(z);
SH.L(z)                      = SHO(z);
SROW.L(z)                    = SROWO(z);
TCTAX.L(z)                   = TCTAX0(z);
TDH.L(z)                     = TDHO(z);
TIC.L(i,z)                   = TICO(i,z);
TICT.L(z)                    = TICTO(z);
TIK.L(k,j,z)                 = TIKO(k,j,z);
TIKT.L(z)                    = TIKTO(z);
TIM.L(i,zj,z)                = TIMO(i,zj,z);
TIMT.L(z)                    = TIMTO(z);
TIP.L(j,z)                   = TIPO(j,z);
TIPT.L(z)                    = TIPTO(z);
TIW.L(l,j,z)                 = TIWO(l,j,z);
TIWT.L(z)                    = TIWTO(z);
TIX.L(i,z,zj)                = TIXO(i,z,zj);
TIXT.L(z)                    = TIXTO(z);
TPRODN.L(z)                  = TPRODNO(z);
TPRCTS.L(z)                  = TPRCTSO(z);
YDH.L(z)                     = YDHO(z);
YG.L(z)                      = YGO(z);
YH.L(z)                      = YHO(z);
YHK.L(z)                     = YHKO(z);
YHL.L(z)                     = YHLO(z);
YROW.L(z)                    = YROWO(z);
CP.L(z)                      = 0;
TCBAM.L(z)                   = 0;


* 6.1.4 Validate structural-zero assumptions before imposing bounds.
abort$(smin((j,z),XSTO(j,z)) < 0)
    "Negative benchmark output: repair calibration before closure.";
abort$(smin((k,j,z),KDO(k,j,z)) < 0)
    "Negative benchmark capital demand: inspect residual capital income.";
abort$(sum((j,z)$(ACTIVE_J(j,z) AND INACTIVE_J(j,z)),1) > 0)
    "ACTIVE_J and INACTIVE_J overlap.";
abort$(sum((j,z)$(NOT ACTIVE_J(j,z) AND NOT INACTIVE_J(j,z)),1) > 0)
    "Activity domains do not cover all industry-region pairs.";
abort$(sum((j,z)$(INACTIVE_J(j,z) AND XSTO(j,z) <> 0),1) > 0)
    "INACTIVE_J contains nonzero benchmark output.";
abort$(sum((j,z)$((CEO(j,z)=0) AND
    (sum(ene,abs(DEO(ene,j,z)))>0)),1) > 0)
    "Zero composite energy with nonzero component inputs: repair calibration.";

* 6.1.5 Lower bounds. Apply BEFORE fixed values.
* Relative bounds preserve benchmark scale; zero bases remain zero.
* KD/KS upper bounds are restored to support changing kmob on reinitialization.
KD.UP(k,j,z) = inf;
KS.LO(k,z)   = 0;
KS.UP(k,z)   = inf;

LD.LO(l,j,z)                 = 1e-6*LDO(l,j,z);
LDC.LO(j,z)                  = 1e-6*LDCO(j,z);
KD.LO(k,j,z)                 = 1e-6*KDO(k,j,z);
KDC.LO(j,z)                  = 1e-6*KDCO(j,z);
KLE.LO(j,z)                  = 1e-6*KLEO(j,z);
CE.LO(j,z)                   = 1e-6*CEO(j,z);
WTI.LO(l,j,z)                = 1e-6*WTIO(l,j,z);
WC.LO(j,z)                   = 1e-6*WCO(j,z);
RC.LO(j,z)                   = 1e-6*RCO(j,z);
R.LO(k,j,z)                  = 1e-6*RO(k,j,z);
RTI.LO(k,j,z)                = 1e-6*RTIO(k,j,z);
DS_I.LO(i,z)                 = 1e-6*DSO_I(i,z);
EXT.LO(i,z)                  = 1e-6*EXTO(i,z);
EX.LO(i,z,zj)                = 1e-6*EXO(i,z,zj);
IM.LO(i,zj,z)                = 1e-6*IMO(i,zj,z);
IMT.LO(i,z)                  = 1e-6*IMTO(i,z);
VA.LO(j,z)                   = 1e-6*VAO(j,z);
XS.LO(j,i,z)                 = 1e-6*XSO(j,i,z);
XS_I.LO(i,z)                 = 1e-6*XSO_I(i,z);
XST.LO(j,z)                  = 1e-6*XSTO(j,z);
PE.LO(i,z,zj)                = 1e-6*PEO(i,z,zj);
PET.LO(i,z)                  = 1e-6*PETO(i,z);
PK.LO(z)                     = 1e-6*PKO(z);
PL.LO(i,z)                   = 1e-6*PLO(i,z);
PM.LO(i,zj,z)                = 1e-6*PMO(i,zj,z);
PMT.LO(i,z)                  = 1e-6*PMTO(i,z);
PP.LO(j,z)                   = 1e-6*PPO(j,z);
PVA.LO(j,z)                  = 1e-6*PVAO(j,z);
PWM.LO(i,zj,z)               = 1e-6*PWMO(i,zj,z);
PWMG.LO(i)                   = 1e-6*PWMGO(i);
PWX.LO(i,z,zj)               = 1e-6*PWXO(i,z,zj);
PCE.LO(j,z)                  = 1e-6*PCEO(j,z);
e.LO(z)                      = 1e-6*eO(z);
W.LO(l,z)                    = 1e-6*WO(l,z);
PC.LO(i,z)                   = 1e-6*PCO(i,z);
PIXCON.LO(z)                 = 1e-6*PIXCONO(z);
PIXGDP.LO(z)                 = 1e-6*PIXGDPO(z);
PIXINV.LO(z)                 = 1e-6*PIXINVO(z);
PIXGVT.LO(z)                 = 1e-6*PIXGVTO(z);
PIXGDP_W.LO                  = 1e-6*PIXGDP_WO;
PPOWER.LO(z)                 = 1e-6*PPOWERO(z);

P2.LO(j,i,z)$(ACTIVE_J(j,z) AND XSO(j,i,z)>0) = 1e-6*PO2(j,i,z);
P4.LO(ene,j,z)$(ACTIVE_J(j,z) AND DEO(ene,j,z)>0) = 1e-6*PO4(ene,j,z);
PCI.LO(j,z)$(ACTIVE_J(j,z) AND CIO(j,z)>0) = 1e-6*PCIO(j,z);
PKLE.LO(j2,z)$(ACTIVE_J(j2,z) AND KLEO(j2,z)>0) = 1e-6*PKLEO(j2,z);

* 6.1.6 Structural zeros. These MUST follow lower-bound assignments.
* No entry of absent activities or absent CES inputs is modeled.
XST.FX(j,z)$INACTIVE_J(j,z) = 0;
CI.FX(j,z)$INACTIVE_J(j,z) = 0;
CE.FX(j,z)$INACTIVE_J(j,z) = 0;
VA.FX(j,z)$INACTIVE_J(j,z) = 0;
KLE.FX(j,z)$INACTIVE_J(j,z) = 0;
KDC.FX(j,z)$INACTIVE_J(j,z) = 0;
LDC.FX(j,z)$INACTIVE_J(j,z) = 0;
LD.FX(l,j,z)$INACTIVE_J(j,z) = 0;
KD.FX(k,j,z)$INACTIVE_J(j,z) = 0;
DI.FX(nene,j,z)$INACTIVE_J(j,z) = 0;
DE.FX(ene,j,z)$INACTIVE_J(j,z) = 0;
XS.FX(j,i,z)$INACTIVE_J(j,z) = 0;
DS.FX(j,i,z)$INACTIVE_J(j,z) = 0;
EXTT.FX(j,i,z)$INACTIVE_J(j,z) = 0;
TIP.FX(j,z)$INACTIVE_J(j,z) = 0;
TIW.FX(l,j,z)$INACTIVE_J(j,z) = 0;
TIK.FX(k,j,z)$INACTIVE_J(j,z) = 0;
PVA.FX(j,z)$INACTIVE_J(j,z) = 1;
DE.FX(ene,j,z)$(DEO(ene,j,z) = 0) = 0;
LD.FX(l,j,z)$(LDO(l,j,z) = 0) = 0;
KD.FX(k,j,z)$(KDO(k,j,z) = 0) = 0;
CI.FX(j,z)$(CIO(j,z) = 0) = 0;
CE.FX(j,z)$(CEO(j,z) = 0) = 0;
VA.FX(j,z)$(VAO(j,z) = 0) = 0;
LDC.FX(j,z)$(LDCO(j,z) = 0) = 0;
KDC.FX(j,z)$(KDCO(j,z) = 0) = 0;

* 6.2 Capital mobility: original economic assumption retained.
* kmob=1: each of cap, land, natr is mobile across its benchmark-using
* sectors within a region; each type's total supply is fixed.
* kmob=0: sector-specific quantities are fixed; EQ57 is not generated.
* This does not model capital accumulation or international capital mobility.
kmob = 1;
KD.FX(k,j,z)$(kmob eq 0) = KDO(k,j,z);
KS.FX(k,z)$(kmob eq 1)  = KSO(k,z);
KS.FX(k,z)$(KSO(k,z) = 0) = 0;

* 6.3 FP closure: one reference region, regional GDP-price normalization.
abort$(card(zr) ne 1) "Exactly one reference region is required.";
abort$(sum(z$(zr(z) AND z1(z)),1) > 0)
    "Reference region must not belong to Z1.";
abort$(card(z1) ne card(z)-card(zr))
    "Z1 must contain all non-reference regions.";

e.FX(zr)        = eO(zr);
PIXGDP.FX(z)    = PIXGDPO(z);

* 6.3.2 Other benchmark closure rules.
* CABX = CAB/(PIXGDP_W*e): real international-currency current account.
CMIN.FX(i,z)    = CMINO(i,z);
CABX.FX(z1)     = CABXO(z1);
LS.FX(l,z)      = LSO(l,z);
G_REAL.FX(z)    = G_REALO(z);
sh0.FX(z)       = sh0O(z);
sh1.FX(z)       = sh1O(z);
ttdh0.FX(z)     = ttdh0O(z);
ttdh1.FX(z)     = ttdh1O(z);
ttic.FX(i,z)    = tticO(i,z);
ttik.FX(k,j,z)  = ttikO(k,j,z);
ttim.FX(i,zj,z) = ttimO(i,zj,z);
ttiw.FX(l,j,z)  = ttiwO(l,j,z);
ttip.FX(j,z)    = ttipO(j,z);
ttix.FX(i,z,zj) = ttixO(i,z,zj);
CTAX.FX(z)      = CTAX0(z);
CP.FX(z)        = 0;

* Benchmark recycling instruments: no recycling.
* Configure rcy_* flags and RCY transfers in the existing policy code.
* Do not solve with active recycling equations until the companion
* Apply_Policy.gms has released the matching variables.
deltattip.FX(j,z)   = 0;
ttip_share.FX(j,z)  = 0;
deltattiw.FX(l,j,z) = 0;
ttiw_share.FX(l,j,z)= 0;

* Do not fix TCBAM, SG, IT or LEON here: retain their model roles.
* Do not add another fiscal deduction for production/labor tax recycling.
*==============================================================================
