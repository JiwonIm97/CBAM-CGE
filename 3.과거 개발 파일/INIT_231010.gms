*==============================================================================*
*                                                                              *
*           Except where otherwise noted, this work is licensed under          *
*               http://creativecommons.org/licenses/by-nc-sa/3.0/              *
*                                                                              *
*                                                                              *
*  You are free to share, to copy, distribute and transmit the work under      *
*  the following conditions:                                                   *
*                                                                              *
*  - Attribution:         You must attribute the work to:                      *
*                         Veronique Robichaud, Andre Lemelin,                  *
*                         Bernard Decaluwe and Helene Maisonnave.              *
*  - Noncommercial:       You may not use this work for commercial purposes.   *
*  - Share Alike:         If you alter, transform, or build upon this work,    *
*                         you may distribute the resulting work only under     *
*                         the same or similar license to this one.             *
*                                                                              *
*==============================================================================*

* This file is included in the files CAL_B_line, BAU_SOLVE and SIM_SOLVE

*==============================================================================

*==============================================================================
* A. Initialization
*    Assignment of initial values to variables prior to resolution
*==============================================================================
*  A.1 Initialization for the first period
*==============================================================================
*   A.1.1 Volume variables
*==============================================================================
 CABX.L(z,t1)      = CABXO(z);
 C.L(i,z,t1)       = CO(i,z);
 CG.L(i,z,t1)      = CGO(i,z);
 CI.L(j,z,t1)      = CIO(j,z);
 CE.L(j,z,t1)      = CEO(j,z);
 CMIN.L(i,z,t1)    = CMINO(i,z);
 CTH_REAL.L(z,t1)  = CTH_REALO(z);
 DI.L(i,j,z,t1)    = DIO(i,j,z);
 DE.L(ene,j,z,t1)  = DEO(ene,j,z);
 DIT.L(i,z,t1)     = DITO(i,z);
 DD.L(i,z,t1)      = DDO(i,z);
 DS.L(j,i,z,t1)    = DSO(j,i,z);
 DS_I.L(i,z,t1)    = DSO_I(i,z);
 EX.L(i,z,zj,t1)   = EXO(i,z,zj);
 EXT.L(i,z,t1)     = EXTO(i,z);
 EXTT.L(j,i,z,t1)  = EXTTO(j,i,z);
* G_REAL.L(z,t1)    = G_REALO(z);
 GDP_BP_REAL.l(z,t1) = GDP_BP_REALO(z);
 GDP_MP_REAL.l(z,t1) = GDP_MP_REALO(z);
 GDP_BP_W_REAL.l(t1) = GDP_BP_W_REALO;
 IM.L(i,zj,z,t1)   = IMO(i,zj,z);
 IMT.L(i,z,t1)     = IMTO(i,z);
 IND.L(k,j,z,t1)   = INDO(k,j,z);
 INV.L(i,z,t1)     = INVO(i,z);
 IT_REAL.l(z,t1)   = IT_REALO(z);
 KD.L(k,j,z,t1)    = KDO(k,j,z);
 KDC.L(j,z,t1)     = KDCO(j,z);
 KS.L(k,z,t1)      = KSO(k,z);
 LD.L(l,j,z,t1)    = LDO(l,j,z);
 LDC.L(j,z,t1)     = LDCO(j,z);
 LS.L(l,z,t1)           = LSO(l,z);
 MRGN.L(i,z,t1)         = MRGNO(i,z);
 Q.L(i,z,t1)            = QO(i,z);
 VA.L(j,z,t1)           = VAO(j,z);
 KLE.L(j,z,t1)          = KLEO(j,z);
 XS.L(j,i,z,t1)         = XSO(j,i,z);
 XS_I.L(i,z,t1)         = XSO_I(i,z);
 XST.L(j,z,t1)          = XSTO(j,z);
 POWERQ.L(z,t1)         = POWERQO(z);
 EE.L(product,j,z,t1)   = EEO(product,j,z);
 NE.L(product,j,z,t1)   = NEO(product,j,z);
 EH.L(product,z,t1)     = EHO(product,z);
 CO2I.L(product,j,z,t1) = CO2IO(product,j,z);
 CO2H.L(product,z,t1)   = CO2HO(product,z);
 CH4I.L(product,j,z,t1) = CH4IO(product,j,z);
 CH4H.L(product,z,t1)   = CH4HO(product,z);
 N2OI.L(product,j,z,t1) = N2OIO(product,j,z);
 N2OH.L(product,z,t1)   = N2OHO(product,z);
* KK.L(k,j,z,t1)         = KKO(k,j,z);
 OBJ.L                  = 1;

*==============================================================================
*   A.1.2 Price variables
*==============================================================================
 e.L(z,t1)         = eO(z);
 IR.L(z,t1)        = IRO(z);
 P.L(i,z,t1)       = PO(i,z);
 P2.L(j,i,z,t1)    = PO2(j,i,z);
 P4.L(ene,j,z,t1)  = PO4(ene,j,z);
 PPOWER.L(z,t1)    = PPOWERO(z);
 PI.l(i,z,t1)      = PO(i,z);
 PT.L(j,z,t1)      = PTO(j,z);
 PP.L(j,z,t1)      = PPO(j,z);
 PC.L(i,z,t1)      = PCO(i,z);
 PCI.L(j,z,t1)     = PCIO(j,z);
 PCE.L(j,z,t1)     = PCEO(j,z);
 PD.L(i,z,t1)      = PDO(i,z);
 PE.L(i,z,zj,t1)   = PEO(i,z,zj);
 PET.L(i,z,t1)     = PETO(i,z);
 PIXCON.L(z,t1)    = PIXCONO(z);
 PIXGDP.L(z,t1)    = PIXGDPO(z);
 PIXGDP_W.L(t1)    = PIXGDP_WO;
* PIXGVT.L(z,t1)    = PIXGVTO(z);
 PIXINV.L(z,t1)    = PIXINVO(z);
 PK.L(z,t1)        = PKO(z);
 PL.L(i,z,t1)      = PLO(i,z);
 PM.L(i,zj,z,t1)   = PMO(i,zj,z);
 PMT.L(i,z,t1)     = PMTO(i,z);
 PP.L(j,z,t1)      = PPO(j,z);
 PVA.L(j,Z,t1)     = PVAO(j,Z);
 PKLE.L(j,Z,t1)    = PKLEO(j,Z);
 PWM.L(i,zj,z,t1)  = PWMO(i,zj,z);
 PWMG.L(i,t1)      = PWMGO(i);
 PWX.L(i,z,zj,t1)  = PWXO(i,z,zj);
 R.L(k,j,z,t1)     = RO(k,j,z);
 RC.L(j,z,t1)      = RCO(j,z);
 RTI.L(k,j,z,t1)   = RTIO(k,j,z);
 U.L(z,t1)         = UO(z);
 W.L(l,z,t1)       = WO(l,z);
 WC.L(j,z,t1)      = WCO(j,z);
 WTI.L(l,j,z,t1)   = WTIO(l,j,z);

*==============================================================================
*   A.1.3 Nominal (value) variables
*==============================================================================
 CAB.L(z,t1)       = CABO(z);
 CTH.L(z,t1)       = CTHO(z);
* DEP.L(z,t1)       = DEPO(z);
* G.L(z,t1)         = GO(z);
 GDP_BP.L(z,t1)    = GDP_BPO(z);
 GDP_BP_W.L(t1)    = SUM[z,GDP_BPO(z)];
 GDP_FD.L(z,t1)    = GDP_FDO(z);
 GDP_IB.L(z,t1)    = GDP_IBO(z);
 GDP_MP.L(z,t1)    = GDP_MPO(z);
 IT.L(z,t1)        = ITO(z);
 SG.L(z,t1)        = SGO(z);
 SH.L(z,t1)        = SHO(z);
 SROW.L(z,t1)      = SROWO(z);
 TDH.L(z,t1)       = TDHO(z);
 TIC.L(i,z,t1)     = TICO(i,z);
 TICT.L(z,t1)      = TICTO(z);
 TIK.L(k,j,z,t1)   = TIKO(k,j,z);
 TIKT.L(z,t1)      = TIKTO(z);
 TIM.L(i,zj,z,t1)  = TIMO(i,zj,z);
 TIMT.L(z,t1)      = TIMTO(z);
 TIP.L(j,z,t1)     = TIPO(j,z);
 TIPT.L(z,t1)      = TIPTO(z);
 TIW.L(l,j,z,t1)   = TIWO(l,j,z);
 TIWT.L(z,t1)      = TIWTO(z);
 TIX.L(i,z,zj,t1)  = TIXO(i,z,zj);
 TIXT.L(z,t1)      = TIXTO(z);
 TPRODN.l(z,t1)    = TPRODNO(z);
 TPRCTS.l(z,t1)    = TPRCTSO(z);
 YDH.L(z,t1)       = YDHO(z);
 YG.L(z,t1)        = YGO(z);
 YH.L(z,t1)        = YHO(z);
 YHK.L(z,t1)       = YHKO(z);
 YHL.L(z,t1)       = YHLO(z);
 YROW.L(z,t1)      = YROWO(z);

*==============================================================================
*   A.1.4 Rates and intercepts
*==============================================================================
 phi.L(z,t1)       = phio(z);

*==============================================================================
*  A.2 Initialization for the following periods
*==============================================================================

IF{ord(time) gt 1,

*==============================================================================
*   A.2.1 Volume variables
*==============================================================================
* CABX.L(z,time)      = CABXO(z);
* C.L(i,z,time)       = CO(i,z);
* CG.L(i,z,time)      = CGO(i,z);
* CI.L(j,z,time)      = CIO(j,z);
* CE.L(j,z,time)      = CEO(j,z);
* CMIN.L(i,z,time)    = CMINO(i,z);
* CTH_REAL.L(z,time)  = CTH_REALO(z);
* DI.L(i,j,z,time)    = DIO(i,j,z);
* DE.L(ene,j,z,time)  = DEO(ene,j,z);
* DIT.L(i,z,time)     = DITO(i,z);
* DD.L(i,z,time)      = DDO(i,z);
* DS.L(j,i,z,time)    = DSO(j,i,z);
* DS_I.L(i,z,time)    = DSO_I(i,z);
* EX.L(i,z,zj,time)   = EXO(i,z,zj);
* EXT.L(i,z,time)     = EXTO(i,z);
* G_REAL.L(z,time)    = G_REALO(z);
* GDP_BP_REAL.l(z,time) = GDP_BP_REALO(z);
* GDP_MP_REAL.l(z,time) = GDP_MP_REALO(z);
* GDP_BP_W_REAL.l(time) = GDP_BP_W_REALO;
* IM.L(i,zj,z,time)   = IMO(i,zj,z);
* IMT.L(i,z,time)     = IMTO(i,z);
* IND.L(k,j,z,time)   = INDO(k,j,z);
* INV.L(i,z,time)     = INVO(i,z);
* IT_REAL.l(z,time)   = IT_REALO(z);
* KD.L(k,j,z,time)    = KDO(k,j,z);
* KDC.L(j,z,time)     = KDCO(j,z);
* KS.L(k,z,time)      = KSO(k,z);
* LD.L(l,j,z,time)    = LDO(l,j,z);
* LDC.L(j,z,time)     = LDCO(j,z);
* LS.L(l,z,time)      = LSO(l,z);
* MRGN.L(i,z,time)    = MRGNO(i,z);
* Q.L(i,z,time)         = QO(i,z);
* VA.L(j,z,time)        = VAO(j,z);
* KLE.L(j,z,time)       = KLEO(j,z);
* XS.L(j,i,z,time)      = XSO(j,i,z);
* XS_I.L(i,z,time)      = XSO_I(i,z);
* XST.L(j,z,time)       = XSTO(j,z);
* POWERQ.L(z,time)      = POWERQO(z);

 CABX.L(z,time)      = CABX.L(z,time-1);
 C.L(i,z,time)       = C.L(i,z,time-1);
 CG.L(i,z,time)      = CG.L(i,z,time-1);
 CI.L(j,z,time)      = CI.L(j,z,time-1);
 CE.L(j,z,time)      = CE.L(j,z,time-1); 
 CMIN.L(i,z,time)    = CMIN.L(i,z,time-1);
 CTH_REAL.L(z,time)  = CTH_REAL.l(z,time-1);
 DI.L(i,j,z,time)    = DI.L(i,j,z,time-1);
 DE.L(ene,j,z,time)  = DE.L(ene,j,z,time-1);
 DIT.L(i,z,time)     = DIT.L(i,z,time-1);
 DD.L(i,z,time)      = DD.L(i,z,time-1);
 DS.L(j,i,z,time)    = DS.L(j,i,z,time-1);
 DS_I.L(i,z,time)    = DS_I.L(i,z,time-1);
 EX.L(i,z,zj,time)   = EX.L(i,z,zj,time-1);
 EXT.L(i,z,time)     = EXT.L(i,z,time-1);
 EXTT.L(j,i,z,time)  = EXTT.L(j,i,z,time-1);
* G_REAL.L(z,time)    = G_REAL.L(z,time-1);
 GDP_BP_REAL.l(z,time) = GDP_BP_REAL.l(z,time-1);
 GDP_MP_REAL.l(z,time) = GDP_MP_REAL.l(z,time-1);
 GDP_BP_W_REAL.l(time) = SUM[z,GDP_BP_REAL.L(z,time)];
 IM.L(i,zj,z,time)   = IM.L(i,zj,z,time-1);
 IMT.L(i,z,time)     = IMT.L(i,z,time-1);
 IND.L(k,j,z,time)   = IND.L(k,j,z,time-1);
 INV.L(i,z,time)     = INV.L(i,z,time-1);
 IT_REAL.l(z,time)   = IT_REAL.l(z,time-1);
 KD.L(k,j,z,time)    = KD.L(k,j,z,time-1);
 KDC.L(j,z,time)     = KDC.L(j,z,time-1);
 KS.L(k,z,time)      = KS.L(k,z,time-1);
 LD.L(l,j,z,time)    = LD.L(l,j,z,time-1);
 LDC.l(j,z,time)     = LDC.l(j,z,time-1);
 LS.L(l,z,time)      = LS.L(l,z,time-1);
 MRGN.L(i,z,time)    = MRGN.L(i,z,time-1);
 Q.L(i,z,time)       = Q.L(i,z,time-1);
 VA.L(j,z,time)      = VA.L(j,z,time-1);
 KLE.L(j,z,time)     = KLE.L(j,z,time-1);
 XS.L(j,i,z,time)    = XS.L(j,i,z,time-1);
 XS_I.L(i,z,time)    = XS_I.L(i,z,time-1);
 XST.L(j,z,time)     = XST.L(j,z,time-1);
 POWERQ.L(z,time)    = POWERQ.L(z,time-1);
 EE.L(product,j,z,t1) = EE.L(product,j,z,time-1);
 NE.L(product,j,z,t1) = NE.L(product,j,z,time-1);
 EH.L(product,z,t1)   = EH.L(product,z,time-1);
 CO2I.L(product,j,z,t1) = CO2I.L(product,j,z,time-1);
 CO2H.L(product,z,t1)   = CO2H.L(product,z,time-1);
 CH4I.L(product,j,z,t1) = CH4I.L(product,j,z,time-1);
 CH4H.L(product,z,t1)   = CH4H.L(product,z,time-1);
 N2OI.L(product,j,z,t1) = N2OI.L(product,j,z,time-1);
 N2OH.L(product,z,t1)   = N2OH.L(product,z,time-1); 
* KK.L(k,j,z,time)       = KK.L(k,j,z,time-1);

 CABX.L(z,time)      = CABX.L(z,time-1)*(1+growthz(z));
 C.L(i,z,time)       = C.L(i,z,time-1)*(1+growthz(z));
 CG.L(i,z,time)      = CG.L(i,z,time-1)*(1+growthz(z));
 CI.L(j,z,time)      = CI.L(j,z,time-1)*(1+growthz(z));
 CE.L(j,z,time)      = CE.L(j,z,time-1)*(1+growthz(z)); 
 CMIN.L(i,z,time)    = CMIN.L(i,z,time-1)*(1+growthz(z));
 CTH_REAL.L(z,time)  = CTH_REAL.l(z,time-1)*(1+growthz(z));
 DI.L(i,j,z,time)    = DI.L(i,j,z,time-1)*(1+growthz(z));
 DE.L(ene,j,z,time)  = DE.L(ene,j,z,time-1)*(1+growthz(z));
 DIT.L(i,z,time)     = DIT.L(i,z,time-1)*(1+growthz(z));
 DD.L(i,z,time)      = DD.L(i,z,time-1)*(1+growthz(z));
 DS.L(j,i,z,time)    = DS.L(j,i,z,time-1)*(1+growthz(z));
 DS_I.L(i,z,time)    = DS_I.L(i,z,time-1)*(1+growthz(z));
 EX.L(i,z,zj,time)   = EX.L(i,z,zj,time-1)*(1+growthz(z));
 EXT.L(i,z,time)     = EXT.L(i,z,time-1)*(1+growthz(z));
 EXTT.L(j,i,z,time)  = EXTT.L(j,i,z,time-1)*(1+growthz(z));
* G_REAL.L(z,time)    = G_REAL.L(z,time-1)*(1+growthz(z));
 GDP_BP_REAL.l(z,time) = GDP_BP_REAL.l(z,time-1)*(1+growthz(z));
 GDP_MP_REAL.l(z,time) = GDP_MP_REAL.l(z,time-1)*(1+growthz(z));
 GDP_BP_W_REAL.l(time) = SUM[z,GDP_BP_REAL.L(z,time)];
 IM.L(i,zj,z,time)   = IM.L(i,zj,z,time-1)*(1+growthz(z));
 IMT.L(i,z,time)     = IMT.L(i,z,time-1)*(1+growthz(z));
 IND.L(k,j,z,time)   = IND.L(k,j,z,time-1)*(1+growthz(z));
 INV.L(i,z,time)     = INV.L(i,z,time-1)*(1+growthz(z));
 IT_REAL.l(z,time)   = IT_REAL.l(z,time-1)*(1+growthz(z));
 KD.L(k,j,z,time)    = KD.L(k,j,z,time-1)*(1+growthz(z));
 KDC.L(j,z,time)     = KDC.L(j,z,time-1)*(1+growthz(z));
 KS.L(k,z,time)      = KS.L(k,z,time-1)*(1+growthz(z));
 LD.L(l,j,z,time)    = LD.L(l,j,z,time-1)*(1+growthz(z));
 LDC.l(j,z,time)     = LDC.l(j,z,time-1)*(1+growthz(z));
 LS.L(l,z,time)      = LS.L(l,z,time-1)*(1+growthz(z));
 MRGN.L(i,z,time)    = MRGN.L(i,z,time-1)*(1+growthz(z));
 Q.L(i,z,time)       = Q.L(i,z,time-1)*(1+growthz(z));
 VA.L(j,z,time)      = VA.L(j,z,time-1)*(1+growthz(z));
 KLE.L(j,z,time)     = KLE.L(j,z,time-1)*(1+growthz(z));
 XS.L(j,i,z,time)    = XS.L(j,i,z,time-1)*(1+growthz(z));
 XS_I.L(i,z,time)    = XS_I.L(i,z,time-1)*(1+growthz(z));
 XST.L(j,z,time)     = XST.L(j,z,time-1)*(1+growthz(z));
 POWERQ.L(z,time)    = POWERQ.L(z,time-1)*(1+growthz(z));
* KK.L(k,j,z,time)    = KK.L(k,j,z,time-1)*(1+0.03);

*==============================================================================
*   A.2.2 Price variables
*==============================================================================
* e.L(z,time)         = eO(z);
* IR.L(z,time)        = IRO(z);
* P.L(i,z,time)       = PO(i,z);
* P2.L(j,i,z,time)    = PO2(j,i,z);
* P4.L(ene,j,z,time)  = PO4(ene,j,z);
* PPOWER.L(z,time)    = PPOWERO(z);
* PI.l(i,z,time)      = PO(i,z);
* PT.L(j,z,time)      = PTO(j,z);
* PP.L(j,z,time)      = PPO(j,z);
* PC.L(i,z,time)      = PCO(i,z);
* PCI.L(j,z,time)     = PCIO(j,z);
* PCE.L(j,z,time)     = PCEO(j,z);
* PD.L(i,z,time)      = PDO(i,z);
* PE.L(i,z,zj,time)   = PEO(i,z,zj);
* PET.L(i,z,time)     = PETO(i,z);
* PIXCON.L(z,time)    = PIXCONO(z);
* PIXGDP.L(z,time)    = PIXGDPO(z);
* PIXGDP_W.L(time)    = PIXGDP_WO;
* PIXGVT.L(z,time)    = PIXGVTO(z);
* PIXINV.L(z,time)    = PIXINVO(z);
* PK.L(z,time)        = PKO(z);
* PL.L(i,z,time)      = PLO(i,z);
* PM.L(i,zj,z,time)   = PMO(i,zj,z);
* PMT.L(i,z,time)     = PMTO(i,z);
* PP.L(j,z,time)      = PPO(j,z);
* PVA.L(j,Z,time)     = PVAO(j,Z);
* PKLE.L(j,Z,time)    = PKLEO(j,Z);
* PWM.L(i,zj,z,time)  = PWMO(i,zj,z);
* PWMG.L(i,time)      = PWMGO(i);
* PWX.L(i,z,zj,time)  = PWXO(i,z,zj);
* R.L(k,j,z,time)     = RO(k,j,z);
* RK.L(k,z,time)      = RKO(k,z);
* RC.L(j,z,time)      = RCO(j,z);
* RTI.L(k,j,z,time)   = RTIO(k,j,z);
* U.L(z,time)         = UO(z);
* W.L(l,z,time)       = WO(l,z);
* WC.L(j,z,time)      = WCO(j,z);
* WTI.L(l,j,z,time)   = WTIO(l,j,z);

 e.L(z,time)         = e.L(z,time-1);
 IR.L(z,time)        = IR.L(z,time-1);
 P.L(i,z,time)       = P.L(i,z,time-1);
 P2.L(j,i,z,time)    = P2.L(j,i,z,time-1);
 P4.L(ene,j,z,time)  = P4.L(ene,j,z,time-1);
 PPOWER.L(z,time)    = PPOWER.L(z,time-1);
 PI.l(i,z,time)      = PI.L(i,z,time-1);
 PT.L(j,z,time)      = PT.L(j,z,time-1);
 PP.L(j,z,time)      = PP.L(j,z,time-1); 
 PC.L(i,z,time)      = PC.L(i,z,time-1);
 PCI.L(j,z,time)     = PCI.L(j,z,time-1);
 PCE.L(j,z,time)     = PCE.L(j,z,time-1);
 PD.L(i,z,time)      = PD.L(i,z,time-1);
 PE.L(i,z,zj,time)   = PE.L(i,z,zj,time-1);
 PET.L(i,z,time)     = PET.L(i,z,time-1);
 PIXCON.L(z,time)    = PIXCON.L(z,time-1);
 PIXGDP.L(z,time)    = PIXGDP.L(z,time-1);
 PIXGDP_W.L(time)    = PIXGDP_W.L(time-1);
* PIXGVT.L(z,time)    = PIXGVT.L(z,time-1);
 PIXINV.L(z,time)    = PIXINV.L(z,time-1);
 PK.L(z,time)        = PK.L(z,time-1);
 PL.L(i,z,time)      = PL.L(i,z,time-1);
 PM.L(i,zj,z,time)   = PM.L(i,zj,z,time-1);
 PMT.L(i,z,time)     = PMT.L(i,z,time-1);
 PP.L(j,z,time)      = PP.L(j,z,time-1);
 PVA.L(j,Z,time)     = PVA.L(j,Z,time-1);
 PKLE.L(j,Z,time)    = PKLE.L(j,Z,time-1);
 PWM.L(i,zj,z,time)  = PWM.L(i,zj,z,time-1);
 PWMG.L(i,time)      = PWMG.L(i,time-1);
 PWX.L(i,z,zj,time)  = PWX.L(i,z,zj,time-1);
 R.L(k,j,z,time)     = R.L(k,j,z,time-1);
 RC.L(j,z,time)      = RC.L(j,z,time-1);
 RTI.L(k,j,z,time)   = RTI.L(k,j,z,time-1);
 U.L(z,time)         = U.L(z,time-1);
 W.L(l,z,time)       = W.L(l,z,time-1);
 WC.L(j,z,time)      = WC.L(j,z,time-1);
 WTI.L(l,j,z,time)   = WTI.L(l,j,z,time-1);

*==============================================================================
*   A.2.3 Nominal (value) variables
*==============================================================================
* CAB.L(z,time)       = CABO(z);
* CTH.L(z,time)       = CTHO(z);
* DEP.L(z,time)       = DEPO(z);
* G.L(z,time)         = GO(z);
* GDP_BP.L(z,time)    = GDP_BPO(z);
* GDP_BP_W.L(time)    = SUM[z,GDP_BPO(z)];
* GDP_FD.L(z,time)    = GDP_FDO(z);
* GDP_IB.L(z,time)    = GDP_IBO(z);
* GDP_MP.L(z,time)    = GDP_MPO(z);
* IT.L(z,time)        = ITO(z);
* SG.L(z,time)        = SGO(z);
* SH.L(z,time)        = SHO(z);
* SROW.L(z,time)      = SROWO(z);
* TDH.L(z,time)       = TDHO(z);
* TIC.L(i,z,time)     = TICO(i,z);
* TICT.L(z,time)      = TICTO(z);
* TIK.L(k,j,z,time)   = TIKO(k,j,z);
* TIKT.L(z,time)      = TIKTO(z);
* TIM.L(i,zj,z,time)  = TIMO(i,zj,z);
* TIMT.L(z,time)      = TIMTO(z);
* TIP.L(j,z,time)     = TIPO(j,z);
* TIPT.L(z,time)      = TIPTO(z);
* TIW.L(l,j,z,time)   = TIWO(l,j,z);
* TIWT.L(z,time)      = TIWTO(z);
* TIX.L(i,z,zj,time)  = TIXO(i,z,zj);
* TIXT.L(z,time)      = TIXTO(z);
* TPRODN.l(z,time)    = TPRODNO(z);
* TPRCTS.l(z,time)    = TPRCTSO(z);
* YDH.L(z,time)       = YDHO(z);
* YG.L(z,time)        = YGO(z);
* YH.L(z,time)        = YHO(z);
* YHK.L(z,time)       = YHKO(z);
* YHL.L(z,time)       = YHLO(z);
* YROW.L(z,time)      = YROWO(z);

 CAB.L(z,time)       = CAB.L(z,time-1);
 CTH.L(z,time)       = CTH.L(z,time-1);
* DEP.L(z,time)       = DEP.L(z,time-1);
* G.L(z,time)         = G.L(z,time-1);
 GDP_BP.L(z,time)    = GDP_BP.L(z,time-1);
 GDP_BP_W.L(time)    = SUM[z,GDP_BP.L(z,time)];
 GDP_FD.L(z,time)    = GDP_FD.L(z,time-1);
 GDP_IB.L(z,time)    = GDP_IB.L(z,time-1);
 GDP_MP.L(z,time)    = GDP_MP.L(z,time-1);
 IT.L(z,time)        = IT.L(z,time-1);
 SG.L(z,time)        = SG.L(z,time-1);
 SH.L(z,time)        = SH.L(z,time-1);
 SROW.L(z,time)      = SROW.L(z,time-1);
 TDH.L(z,time)       = TDH.L(z,time-1);
 TIC.L(i,z,time)     = TIC.L(i,z,time-1);
 TICT.L(z,time)      = TICT.L(z,time-1);
 TIK.L(k,j,z,time)   = TIK.L(k,j,z,time-1);
 TIKT.L(z,time)      = TIKT.L(z,time-1);
 TIM.L(i,zj,z,time)  = TIM.L(i,zj,z,time-1);
 TIMT.L(z,time)      = TIMT.L(z,time-1);
 TIP.L(j,z,time)     = TIP.L(j,z,time-1);
 TIPT.L(z,time)      = TIPT.L(z,time-1);
 TIW.L(l,j,z,time)   = TIW.L(l,j,z,time-1);
 TIWT.L(z,time)      = TIWT.L(z,time-1);
 TIX.L(i,z,zj,time)  = TIX.L(i,z,zj,time-1);
 TIXT.L(z,time)      = TIXT.L(z,time-1);
 TPRODN.l(z,time)    = TPRODN.l(z,time-1);
 TPRCTS.l(z,time)    = TPRCTS.l(z,time-1);
 YDH.L(z,time)       = YDH.L(z,time-1);
 YG.L(z,time)        = YG.L(z,time-1);
 YH.L(z,time)        = YH.L(z,time-1);
 YHK.L(z,time)       = YHK.L(z,time-1);
 YHL.L(z,time)       = YHL.L(z,time-1);
 YROW.L(z,time)      = YROW.L(z,time-1);

 CAB.L(z,time)       = CAB.L(z,time-1)*(1+growthz(z));
 CTH.L(z,time)       = CTH.L(z,time-1)*(1+growthz(z));
* DEP.L(z,time)       = DEP.L(z,time-1)*(1+0.03);
* G.L(z,time)         = G.L(z,time-1)*(1+growthz(z));
 GDP_BP.L(z,time)    = GDP_BP.L(z,time-1)*(1+growthz(z));
 GDP_BP_W.L(time)    = SUM[z,GDP_BP.L(z,time)];
 GDP_FD.L(z,time)    = GDP_FD.L(z,time-1)*(1+growthz(z));
 GDP_IB.L(z,time)    = GDP_IB.L(z,time-1)*(1+growthz(z));
 GDP_MP.L(z,time)    = GDP_MP.L(z,time-1)*(1+growthz(z));
 IT.L(z,time)        = IT.L(z,time-1)*(1+growthz(z));
 SG.L(z,time)        = SG.L(z,time-1)*(1+growthz(z));
 SH.L(z,time)        = SH.L(z,time-1)*(1+growthz(z));
 SROW.L(z,time)      = SROW.L(z,time-1)*(1+growthz(z));
 TDH.L(z,time)       = TDH.L(z,time-1)*(1+growthz(z));
 TIC.L(i,z,time)     = TIC.L(i,z,time-1)*(1+growthz(z));
 TICT.L(z,time)      = TICT.L(z,time-1)*(1+growthz(z));
 TIK.L(k,j,z,time)   = TIK.L(k,j,z,time-1)*(1+growthz(z));
 TIKT.L(z,time)      = TIKT.L(z,time-1)*(1+growthz(z));
 TIM.L(i,zj,z,time)  = TIM.L(i,zj,z,time-1)*(1+growthz(z));
 TIMT.L(z,time)      = TIMT.L(z,time-1)*(1+growthz(z));
 TIP.L(j,z,time)     = TIP.L(j,z,time-1)*(1+growthz(z));
 TIPT.L(z,time)      = TIPT.L(z,time-1)*(1+growthz(z));
 TIW.L(l,j,z,time)   = TIW.L(l,j,z,time-1)*(1+growthz(z));
 TIWT.L(z,time)      = TIWT.L(z,time-1)*(1+growthz(z));
 TIX.L(i,z,zj,time)  = TIX.L(i,z,zj,time-1)*(1+growthz(z));
 TIXT.L(z,time)      = TIXT.L(z,time-1)*(1+growthz(z));
 TPRODN.l(z,time)    = TPRODN.l(z,time-1)*(1+growthz(z));
 TPRCTS.l(z,time)    = TPRCTS.l(z,time-1)*(1+growthz(z));
 YDH.L(z,time)       = YDH.L(z,time-1)*(1+growthz(z));
 YG.L(z,time)        = YG.L(z,time-1)*(1+growthz(z));
 YH.L(z,time)        = YH.L(z,time-1)*(1+growthz(z));
 YHK.L(z,time)       = YHK.L(z,time-1)*(1+growthz(z));
 YHL.L(z,time)       = YHL.L(z,time-1)*(1+growthz(z));
 YROW.L(z,time)      = YROW.L(z,time-1)*(1+growthz(z));

*==============================================================================
*   A.2.4 Rates and intercepts
*==============================================================================
*  phi.L(z,time)       = phio(z);
 phi.L(z,time)       = phi.L(z,time-1);

* End of the IF command
};
