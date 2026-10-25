* ==============================================================================
* CGE_Results.gms
* ==============================================================================

*==============================================================================
* Reporting
*==============================================================================
 valgamma_LES(i,z,sim)          = gamma_LES(i,z);
 valTCBAM(z,sim)                = TCBAM.l(z);
 valGDP_BP(z,sim)               = GDP_BP.l(z);
 valGDP_BP_REAL(z,sim)          = GDP_BP_REAL.l(z);
 valPIXGDP(z,sim)               = PIXGDP.l(z);
 valCTAX(z,sim)                 = CTAX.L(z);
 valCP(z,sim)                   = CP.L(z);
 valTCTAX(z,sim)                = TCTAX.L(z);
 valSH(z,sim)                   = SH.l(z);
 valKLE(j,z,sim)                = KLE.l(j,z);
 valPC(i,z,sim)                 = PC.l(i,z);
 valPOWER(power,i,z,sim)        = XS.L(power,i,z);
 valC(i,z,sim)                  = C.l(i,z);
 valCAB(z,sim)                  = CAB.l(z);
 valCABX(z,sim)                 = CABX.l(z);
 valCG(i,z,sim)                 = CG.l(i,z);
 valCI(j,z,sim)                 = CI.l(j,z);
 valCE(j,z,sim)                 = CE.l(j,z);
 valCMIN(i,z,sim)               = CMIN.l(i,z);
 valCTH(z,sim)                  = CTH.l(z);
 valCTH_REAL(z,sim)             = CTH_REAL.l(z);
 valDD(i,z,sim)                 = DD.l(i,z);
 valDEP(z,sim)                  = DEP.l(z);
 valDI(nene,j,z,sim)            = DI.l(nene,j,z);
 valDE(ene,j,z,sim)             = DE.l(ene,j,z);
 valDIT(i,z,sim)                = DIT.l(i,z);
 valDS(j,i,z,sim)               = DS.l(j,i,z);
 valDS_I(i,z,sim)               = DS_I.l(i,z);
 vale(z,sim)                    = e.l(z);
 valEX(i,z,zj,sim)              = EX.l(i,z,zj);
 valEXT(i,z,sim)                = EXT.l(i,z);
 valG(z,sim)                    = G.l(z);
 valG_REAL(z,sim)               = G_REAL.l(z);
 valGDP_BP_W(sim)               = GDP_BP_W.l;
 valGDP_BP_W_REAL(sim)          = GDP_BP_W_REAL.l;
 valGDP_FD(z,sim)               = GDP_FD.l(z);
 valGDP_IB(z,sim)               = GDP_IB.l(z);
 valGDP_MP(z,sim)               = GDP_MP.l(z);
 valGDP_MP_REAL(z,sim)          = GDP_MP_REAL.l(z);
 valIM(i,zj,z,sim)              = IM.l(i,zj,z);
 valIMT(i,z,sim)                = IMT.l(i,z);
 valINV(i,z,sim)                = INV.l(i,z);
 valIT(z,sim)                   = IT.l(z);
 valIT_REAL(z,sim)              = IT_REAL.l(z);
 valKD(k,j,z,sim)               = KD.l(k,j,z);
 valKDC(j,z,sim)                = KDC.l(j,z);
 valKS(k,z,sim)                 = KS.l(k,z);
 valLD(l,j,z,sim)               = LD.l(l,j,z);
 valLDC(j,z,sim)                = LDC.l(j,z);
 valLS(l,z,sim)                 = LS.l(l,z);
 valMRGN(i,z,sim)               = MRGN.l(i,z);
 valP(i,z,sim)                  = P.l(i,z);
 valPT(j,z,sim)                 = PT.l(j,z);
 valP2(j,i,z,sim)               = P2.l(j,i,z);
 valP4(ene,j,z,sim)             = P4.l(ene,j,z);
 valPCI(j,z,sim)                = PCI.l(j,z);
 valPCE(j,z,sim)                = PCE.l(j,z);
 valPD(i,z,sim)                 = PD.l(i,z);
 valPE(i,z,zj,sim)              = PE.l(i,z,zj);
 valPET(i,z,sim)                = PET.l(i,z);
 valPIXCON(z,sim)               = PIXCON.l(z);
 valPIXGDP_W(sim)               = PIXGDP_W.l;
 valPIXGVT(z,sim)               = PIXGVT.l(z);
 valPIXINV(z,sim)               = PIXINV.l(z);
 valPK(z,sim)                   = PK.l(z);
 valPL(i,z,sim)                 = PL.l(i,z);
 valPM(i,zj,z,sim)              = PM.l(i,zj,z);
 valPMT(i,z,sim)                = PMT.l(i,z);
 valPP(j,z,sim)                 = PP.l(j,z);
 valPVA(j,z,sim)                = PVA.l(j,z);
 valPKLE(j,z,sim)               = PKLE.l(j,z);
 valPWM(i,zj,z,sim)             = PWM.l(i,zj,z);
 valPWMG(i,sim)                 = PWMG.l(i);
 valPWX(i,z,zj,sim)             = PWX.l(i,z,zj);
 valQ(i,z,sim)                  = Q.l(i,z);
 valR(k,j,z,sim)                = R.l(k,j,z);
 valRC(j,z,sim)                 = RC.l(j,z);
 valRK(k,z,sim)                 = RK.l(k,z);
 valRTI(k,j,z,sim)              = RTI.l(k,j,z);
 valSG(z,sim)                   = SG.l(z);
 valsh0(z,sim)                  = sh0.l(z);
 valsh1(z,sim)                  = sh1.l(z);
 valSROW(z,sim)                 = SROW.l(z);
 valTDH(z,sim)                  = TDH.l(z);
 valTIC(i,z,sim)                = TIC.l(i,z);
 valTICT(z,sim)                 = TICT.l(z);
 valTIK(k,j,z,sim)              = TIK.l(k,j,z);
 valTIKT(z,sim)                 = TIKT.l(z);
 valTIM(i,zj,z,sim)             = TIM.l(i,zj,z);
 valTIMT(z,sim)                 = TIMT.l(z);
 valTIP(j,z,sim)                = TIP.l(j,z);
 valTIPT(z,sim)                 = TIPT.l(z);
 valTIW(l,j,z,sim)              = TIW.l(l,j,z);
 valTIWT(z,sim)                 = TIWT.l(z);
 valTIX(i,z,zj,sim)             = TIX.l(i,z,zj);
 valTIXT(z,sim)                 = TIXT.l(z);
 valTPRCTS(z,sim)               = TPRCTS.l(z);
 valTPRODN(z,sim)               = TPRODN.l(z);
 valttdh0(z,sim)                = ttdh0.l(z);
 valttdh1(z,sim)                = ttdh1.l(z);
 valttic(i,z,sim)               = ttic.l(i,z);
 valttik(k,j,z,sim)             = ttik.l(k,j,z);
 valttim(i,zj,z,sim)            = ttim.l(i,zj,z);
 valttip(j,z,sim)               = ttip.l(j,z);
 valttiw(l,j,z,sim)             = ttiw.l(l,j,z);
 valttix(i,z,zj,sim)            = ttix.l(i,z,zj);
 valVA(j,z,sim)                 = VA.l(j,z);
 valW(l,z,sim)                  = W.l(l,z);
 valWC(j,z,sim)                 = WC.l(j,z);
 valWTI(l,j,z,sim)              = WTI.l(l,j,z);
 valXS(j,i,z,sim)               = XS.l(j,i,z);
 valXS_I(i,z,sim)               = XS_I.l(i,z);
 valYDH(z,sim)                  = YDH.l(z);
 valYG(z,sim)                   = YG.l(z);
 valYH(z,sim)                   = YH.l(z);
 valYHK(z,sim)                  = YHK.l(z);
 valYHL(z,sim)                  = YHL.l(z);
 valYROW(z,sim)                 = YROW.l(z);
 valEV(z,sim)                   = (valCTH(z,sim) - sum(i, valPC(i,z,sim)*CMINO(i,z)))*exp(sum(i, gamma_LES(i,z)*(log(PCO(i,z)) - log(valPC(i,z,sim))))) - (CTHO(z) - sum(i, PCO(i,z)*valCMIN(i,z,sim)));
 valLEON(z,sim)                 = LEON.L(z);
 valEE(p_coal,j,z,sim)          = EEI(p_coal,j,z)*DE.L('02_COAL',j,z);
 valEE(p_oil,j,z,sim)           = EEI(p_oil,j,z)*DE.L('03_OIL',j,z);
 valEE(p_gas,j,z,sim)           = EEI(p_gas,j,z)*DE.L('04_GAS',j,z);
 valEE(p_oilproduct,j,z,sim)    = EEI(p_oilproduct,j,z)*DE.L('10_PETROLCOAL',j,z);
 valEE(p_elec,j,z,sim)          = EEI(p_elec,j,z)*DE.L('18_ELEC',j,z);
 valNE(p_coal,j,z,sim)          = NEI(p_coal,j,z)*DE.L('02_COAL',j,z);
 valNE(p_oil,j,z,sim)           = NEI(p_oil,j,z)*DE.L('03_OIL',j,z);
 valNE(p_gas,j,z,sim)           = NEI(p_gas,j,z)*DE.L('04_GAS',j,z);
 valNE(p_oilproduct,j,z,sim)    = NEI(p_oilproduct,j,z)*DE.L('10_PETROLCOAL',j,z);
 valNE(p_elec,j,z,sim)          = NEI(p_elec,j,z)*DE.L('18_ELEC',j,z);
 valEH(p_coal,z,sim)            = EHI(p_coal,z)*C.L('02_COAL',z);
 valEH(p_oil,z,sim)             = EHI(p_oil,z)*C.L('03_OIL',z);
 valEH(p_gas,z,sim)             = EHI(p_gas,z)*C.L('04_GAS',z);
 valEH(p_oilproduct,z,sim)      = EHI(p_oilproduct,z)*C.L('10_PETROLCOAL',z);
 valEH(p_elec,z,sim)            = EHI(p_elec,z)*C.L('18_ELEC',z);
* Household direct CO2 emissions: ktCO2
 valCO2H(product,z,sim) = 0;
 valCO2H(product,z,sim)$(
       p_coal(product)
    OR p_oil(product)
    OR p_gas(product)
    OR p_oilproduct(product)
) = valEH(product,z,sim)
    *41.868
    *GHGsEF(product,'CO2EF')
    *(44/12)
    *0.001
    *GWP('CO2EF');

 valTCO2H(z,sim) = sum(product,valCO2H(product,z,sim));
 valTFC_com(product,z,sim)      = valEH(product,z,sim) + sum(j5,valEE(product,j5,z,sim))+sum(j,valNE(product,j,z,sim));
 valTFC_ind(j,z,sim)            = sum(product,valEE(product,j,z,sim)+valNE(product,j,z,sim));
 valTFC(z,sim)                  = sum(product, valTFC_com(product,z,sim));
 valCO2I(product,j,z,sim)       = valEE(product,j,z,sim)*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 valCO2NE(product,j,z,sim)      = valNE(product,j,z,sim)*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF')*(1-GHGsEF(product,'Stored_rate')) ;
 valCO2I2(j,z,sim)              = sum(product,valCO2I(product,j,z,sim));
 valCO2NE2(j,z,sim)             = sum(product,valCO2NE(product,j,z,sim));
 valTCO22(j,z,sim)              = valCO2I2(j,z,sim)+valCO2NE2(j,z,sim);
 valTCO2I(z,sim)                = sum((product,j),valCO2I(product,j,z,sim));
 valTCO2NE(z,sim)               = sum((product,j),valCO2NE(product,j,z,sim));
 valTCO2(z,sim)                 = valTCO2I(z,sim) + valTCO2NE(z,sim) + valTCO2H(z,sim);
 valKOR_TFC(product,sim)        = valEH(product,'01_KOR',sim) + Sum(j5,valEE(product,j5,'01_KOR',sim))+Sum(j,valNE(product,j,'01_KOR',sim));

*==============================================================================
* CBAM 환류 결과 저장
* sim 루프 내부에서 각 solve 직후 실행
*==============================================================================

*------------------------------------------------------------------------------
* A. Solve 상태
*------------------------------------------------------------------------------

valModelStat(sim) = CBAM.modelstat;
valSolveStat(sim) = CBAM.solvestat;
valNumDepnd(sim)  = CBAM.numdepnd;

*------------------------------------------------------------------------------
* B. 지역 간 배정액과 수령액
* FLOW는 국제 기준통화 표시이며, EU의 국내 배정분도 포함
*------------------------------------------------------------------------------

abort$(smin(z, e.L(z)) <= 0)
    "Nonpositive exchange rate in recycling reporting", sim;

valRCY_FLOW(z,zj,sim)
    = rcy_share(z,zj)*TCBAM.L(z)/e.L(z);

* 총수령액: 수령지역 통화로 환산
valRCY_IN(z,sim)
    = e.L(z)*sum(zj, valRCY_FLOW(zj,z,sim));

* 해외에서 받은 금액만 집계
valRCY_INF(z,sim)
    = e.L(z)*sum(zj$(not sameas(zj,z)),
                valRCY_FLOW(zj,z,sim));

* 해외 송금액: 징수지역 통화로 표시
valRCY_OUTF(z,sim)
    = e.L(z)*sum(zj$(not sameas(zj,z)),
                valRCY_FLOW(z,zj,sim));

*------------------------------------------------------------------------------
* C. 수단별 실제 사용액
* HH에는 CBAM 세수 이전만 포함하며 국내 탄소세수 이전은 제외
* REN/LAB은 실제 세율 변화와 현재 과세표준으로 계산
*------------------------------------------------------------------------------

valRCY_HH(z,sim)
    = rcy_hh(z)*valRCY_IN(z,sim);

valRCY_REN(z,sim)
    = sum(j$(eREN(j) and ACTIVE_J(j,z)),
          (ttipO(j,z)-ttip.L(j,z))*PP.L(j,z)*XST.L(j,z));

valRCY_LAB(z,sim)
    = sum((l,j)$(J11(j) and ACTIVE_J(j,z) and LDO(l,j,z)>0),
          (ttiwO(l,j,z)-ttiw.L(l,j,z))*W.L(l,z)*LD.L(l,j,z));

valRCY_GOV(z,sim)
    = rcy_gov(z)*valRCY_IN(z,sim);

*------------------------------------------------------------------------------
* D. 예정 배정액과 실제 사용액 비교
*------------------------------------------------------------------------------

valRCY_REN_ERR(z,sim)
    = valRCY_REN(z,sim)
      -rcy_prd(z)*valRCY_IN(z,sim);

valRCY_LAB_ERR(z,sim)
    = valRCY_LAB(z,sim)
      -rcy_lab(z)*valRCY_IN(z,sim);

valRCY_BUDGET_ERR(z,sim)
    = valRCY_HH(z,sim)
      +valRCY_REN(z,sim)
      +valRCY_LAB(z,sim)
      +valRCY_GOV(z,sim)
      -valRCY_IN(z,sim);

valRCY_CHECK(sim)
    = smax(z,
        max(abs(valRCY_REN_ERR(z,sim)),
            abs(valRCY_LAB_ERR(z,sim)),
            abs(valRCY_BUDGET_ERR(z,sim)))
        /(1+abs(valRCY_IN(z,sim)))
      );

abort$(valRCY_CHECK(sim) > 1e-6)
    "CBAM recycling budget check failed",
    sim, valRCY_CHECK,
    valRCY_REN_ERR, valRCY_LAB_ERR, valRCY_BUDGET_ERR;
