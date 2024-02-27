*==============================================================================
*   6.2.3.2 Assignment of solution values to result parameters
*==============================================================================

 valA_VA(z,time,'sim')       = A_VA.l(z,time);
 valC(i,z,time,'sim')        = C.l(i,z,time);
 valCAB(z,time,'sim')        = CAB.l(z,time);
 valCABX(z,time,'sim')       = CABX.l(z,time);
 valCG(i,z,time,'sim')       = CG.l(i,z,time);
 valCI(j,z,time,'sim')       = CI.l(j,z,time);
 valCMIN(i,z,time,'sim')     = CMIN.l(i,z,time);
 valCTH(z,time,'sim')        = CTH.l(z,time);
 valCTH_REAL(z,time,'sim')   = CTH_REAL.l(z,time);
 valDD(i,z,time,'sim')       = DD.l(i,z,time);
* valDEP(z,time,'sim')        = DEP.l(z,time);
 valDI(i,j,z,time,'sim')     = DI.l(i,j,z,time);
 valDIT(i,z,time,'sim')      = DIT.l(i,z,time);
 valDS(j,i,z,time,'sim')     = DS.l(j,i,z,time);
 valDS_I(i,z,time,'sim')     = DS_I.l(i,z,time);
 vale(z,time,'sim')          = e.l(z,time);
 valEX(i,z,zj,time,'sim')    = EX.l(i,z,zj,time);
 valEXT(i,z,time,'sim')      = EXT.l(i,z,time);
* valG(z,time,'sim')          = G.l(z,time);
* ValG_REAL(z,time,'sim')     = G_REAL.L(z,time);
 valGDP_BP(z,time,'sim')     = GDP_BP.l(z,time);
 valGDP_BP_REAL(z,time,'sim')= GDP_BP_REAL.l(z,time);
 valGDP_BP_W(time,'sim')     = GDP_BP_W.l(time);
 valGDP_BP_W_REAL(time,'sim')= GDP_BP_W_REAL.l(time);
 valGDP_FD(z,time,'sim')     = GDP_FD.l(z,time);
 valGDP_IB(z,time,'sim')     = GDP_IB.l(z,time);
 valGDP_MP(z,time,'sim')     = GDP_MP.l(z,time);
 valGDP_MP_REAL(z,time,'sim')= GDP_MP_REAL.l(z,time);
 valIM(i,zj,z,time,'sim')    = IM.l(i,zj,z,time);
 valIMT(i,z,time,'sim')      = IMT.l(i,z,time);
 valIND(k,j,z,time,'sim')    = IND.l(k,j,z,time);
 valINV(i,z,time,'sim')      = INV.l(i,z,time);
 valIR(z,time,'sim')         = IR.l(z,time);
 valIT(z,time,'sim')         = IT.l(z,time);
 valIT_REAL(z,time,'sim')    = IT_REAL.l(z,time);
 valKD(k,j,z,time,'sim')     = KD.l(k,j,z,time);
 valKDC(j,z,time,'sim')      = KDC.l(j,z,time);
 valKS(k,z,time,'sim')       = KS.l(k,z,time);
 valLD(l,j,z,time,'sim')     = LD.l(l,j,z,time);
 valLDC(j,z,time,'sim')      = LDC.l(j,z,time);
 valLS(l,z,time,'sim')       = LS.l(l,z,time);
 valMRGN(i,z,time,'sim')     = MRGN.l(i,z,time);
 valP(i,z,time,'sim')        = P.l(i,z,time);
 valPC(i,z,time,'sim')       = PC.l(i,z,time);
 valPCI(j,z,time,'sim')      = PCI.l(j,z,time);
 valPD(i,z,time,'sim')       = PD.l(i,z,time);
 valPE(i,z,zj,time,'sim')    = PE.l(i,z,zj,time);
 valPET(i,z,time,'sim')      = PET.l(i,z,time);
 valphi(z,time,'sim')        = phi.l(z,time);
 valPIXCON(z,time,'sim')     = PIXCON.l(z,time);
 valPIXGDP(z,time,'sim')     = PIXGDP.l(z,time);
 valPIXGDP_W(time,'sim')     = PIXGDP_W.l(time);
* valPIXGVT(z,time,'sim')     = PIXGVT.l(z,time);
 valPIXINV(z,time,'sim')     = PIXINV.l(z,time);
 valPK(z,time,'sim')         = PK.l(z,time);
 valPL(i,z,time,'sim')       = PL.l(i,z,time);
 valPM(i,zj,z,time,'sim')    = PM.l(i,zj,z,time);
 valPMT(i,z,time,'sim')      = PMT.l(i,z,time);
 valPP(j,z,time,'sim')       = PP.l(j,z,time);
 valPVA(j,Z,time,'sim')      = PVA.l(j,Z,time);
 valPWM(i,zj,z,time,'sim')   = PWM.l(i,zj,z,time);
 valPWMG(i,time,'sim')       = PWMG.l(i,time);
 valPWX(i,z,zj,time,'sim')   = PWX.l(i,z,zj,time);
 valQ(i,z,time,'sim')        = Q.l(i,z,time);
 valR(k,j,z,time,'sim')      = R.l(k,j,z,time);
 valRC(j,z,time,'sim')       = RC.l(j,z,time);
 valRTI(k,j,z,time,'sim')    = RTI.l(k,j,z,time);
 valSG(z,time,'sim')         = SG.l(z,time);
 valSH(z,time,'sim')         = SH.l(z,time);
* valsh0(z,time,'sim')        = sh0.l(z,time);
* valsh1(z,time,'sim')        = sh1.l(z,time);
 valSROW(z,time,'sim')       = SROW.l(z,time);
 valTDH(z,time,'sim')        = TDH.l(z,time);
 valTIC(i,z,time,'sim')      = TIC.l(i,z,time);
 valTICT(z,time,'sim')       = TICT.l(z,time);
 valTIK(k,j,z,time,'sim')    = TIK.l(k,j,z,time);
 valTIKT(z,time,'sim')       = TIKT.l(z,time);
 valTIM(i,zj,z,time,'sim')   = TIM.l(i,zj,z,time);
 valTIMT(z,time,'sim')       = TIMT.l(z,time);
 valTIP(j,z,time,'sim')      = TIP.l(j,z,time);
 valTIPT(z,time,'sim')       = TIPT.l(z,time);
 valTIW(l,j,z,time,'sim')    = TIW.l(l,j,z,time);
 valTIWT(z,time,'sim')       = TIWT.l(z,time);
 valTIX(i,z,zj,time,'sim')   = TIX.l(i,z,zj,time);
 valTIXT(z,time,'sim')       = TIXT.l(z,time);
 valTPRCTS(z,time,'sim')     = TPRCTS.l(z,time);
 valTPRODN(z,time,'sim')     = TPRODN.l(z,time);
 valttdh0(z,time,'sim')      = ttdh0.l(z,time);
 valttdh1(z,time,'sim')      = ttdh1.l(z,time);
 valttic(i,z,time,'sim')     = ttic.l(i,z,time);
 valttik(k,j,z,time,'sim')   = ttik.l(k,j,z,time);
 valttim(i,zj,z,time,'sim')  = ttim.l(i,zj,z,time);
 valttip(j,z,time,'sim')     = ttip.l(j,z,time);
 valttiw(l,j,z,time,'sim')   = ttiw.l(l,j,z,time);
 valttix(i,z,zj,time,'sim')  = ttix.l(i,z,zj,time);
 valU(z,time,'sim')          = U.l(z,time);
 valVA(j,z,time,'sim')       = VA.l(j,z,time);
 valW(l,z,time,'sim')        = W.l(l,z,time);
 valWC(j,z,time,'sim')       = WC.l(j,z,time);
 valWTI(l,j,z,time,'sim')    = WTI.l(l,j,z,time);
 valXS(j,i,z,time,'sim')     = XS.l(j,i,z,time);
 valXS_I(i,z,time,'sim')     = XS_I.l(i,z,time);
 valXST(j,z,time,'sim')      = XST.l(j,z,time);
 valYDH(z,time,'sim')        = YDH.l(z,time);
 valYG(z,time,'sim')         = YG.l(z,time);
 valYH(z,time,'sim')         = YH.l(z,time);
 valYHK(z,time,'sim')        = YHK.l(z,time);
 valYHL(z,time,'sim')        = YHL.l(z,time);
 valYROW(z,time,'sim')       = YROW.l(z,time);
 
 valEE(p_coal,j,z,time,'sim') =  EEI(p_coal,j,z)*(AEEI(z,time))*DI.L('02_COAL',j,z,time);
 valEE(p_oil,j,z,time,'sim')  =  EEI(p_oil,j,z)*(AEEI(z,time))*DI.L('03_OIL',j,z,time);
 valEE(p_gas,j,z,time,'sim')  =  EEI(p_gas,j,z)*(AEEI(z,time))*DI.L('04_GAS',j,z,time);
 valEE(p_oilproduct,j,z,time,'sim')  =  EEI(p_oilproduct,j,z)*(AEEI(z,time))*DI.L('10_PETROLCOAL',j,z,time);
 valEE(p_elecheat,j,z,time,'sim')  =  EEI(p_elecheat,j,z)*(AEEI(z,time))*DI.L('18_ELEC',j,z,time);

 valNE(p_coal,j,z,time,'sim') =  NEI(p_coal,j,z)*(AEEI(z,time))*DI.L('02_COAL',j,z,time);
 valNE(p_oil,j,z,time,'sim')  =  NEI(p_oil,j,z)*(AEEI(z,time))*DI.L('03_OIL',j,z,time);
 valNE(p_gas,j,z,time,'sim')  =  NEI(p_gas,j,z)*(AEEI(z,time))*DI.L('04_GAS',j,z,time);
 valNE(p_oilproduct,j,z,time,'sim')  =  NEI(p_oilproduct,j,z)*(AEEI(z,time))*DI.L('10_PETROLCOAL',j,z,time);
 valNE(p_elecheat,j,z,time,'sim')  =  NEI(p_elecheat,j,z)*(AEEI(z,time))*DI.L('18_ELEC',j,z,time);

 valEH(p_coal,z,time,'sim') =  EHI(p_coal,z)*(AEEI(z,time))*C.L('02_COAL',z,time);
 valEH(p_oil,z,time,'sim')  =  EHI(p_oil,z)*(AEEI(z,time))*C.L('03_OIL',z,time);
 valEH(p_gas,z,time,'sim')  =  EHI(p_gas,z)*(AEEI(z,time))*C.L('04_GAS',z,time); 
 valEH(p_oilproduct,z,time,'sim')  =  EHI(p_oilproduct,z)*(AEEI(z,time))*C.L('10_PETROLCOAL',z,time);
 valEH(p_elecheat,z,time,'sim')  =  EHI(p_elecheat,z)*(AEEI(z,time))*C.L('18_ELEC',z,time);

 valCO2I(product,j,z,time,'sim')  = valEE(product,j,z,time,'sim')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 valCO2NE(product,j,z,time,'sim') = valNE(product,j,z,time,'sim')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF')*(1-GHGsEF(product,'Stored_rate')) ;

 valCO2I2(j,z,time,'sim')  = sum(product,valCO2I(product,j,z,time,'sim'));
 valCO2NE2(j,z,time,'sim') = sum(product,valCO2NE(product,j,z,time,'sim'));

 valTCO2I(z,time,'sim') = sum((product,j),valCO2I(product,j,z,time,'sim'));
 valTCO2NE(z,time,'sim') = sum((product,j),valCO2NE(product,j,z,time,'sim'));

 valCO2H(product,z,time,'sim') = valEH(product,z,time,'sim')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 valTCO2H(z,time,'sim') = sum((product),valCO2H(product,z,time,'sim'));

 valTCO2(z,time,'sim') =  valTCO2H(z,time,'sim') + valTCO2I(z,time,'sim') +valTCO2NE(z,time,'sim') ;

 valTFC(product,time,z,'sim') = valEH(product,z,time,'sim') + Sum(j5,valEE(product,j5,z,time,'sim'))+Sum(j,valNE(product,j,z,time,'sim'));
 valNEA_TFC(product,time,'sim') = sum(NEA,valEH(product,NEA,time,'sim')) + Sum((j5,NEA),valEE(product,j5,NEA,time,'sim'))+Sum((j,NEA),valNE(product,j,NEA,time,'sim'));

 valKOR_TFC(product,time,'sim') = valEH(product,'01_KOR',time,'sim') + Sum(j5,valEE(product,j5,'01_KOR',time,'sim'))+Sum(j,valNE(product,j,'01_KOR',time,'sim'));
 valCHN_TFC(product,time,'sim') = valEH(product,'02_CHN',time,'sim') + Sum(j5,valEE(product,j5,'02_CHN',time,'sim'))+Sum(j,valNE(product,j,'02_CHN',time,'sim'));
 valJPN_TFC(product,time,'sim') = valEH(product,'03_JPN',time,'sim') + Sum(j5,valEE(product,j5,'03_JPN',time,'sim'))+Sum(j,valNE(product,j,'03_JPN',time,'sim'));

 valPOWER(power,i,z,time,'sim')  = XS.l(power,i,z,time);

 valElecGen('19_eNuclear',z,time,'sim') = DS.l('19_eNuclear','18_ELEC',z,time)*EGINucGWh('19_eNuclear',z); 
 valElecGen('20_eCoal',z,time,'sim')    = DS.l('20_eCoal','18_ELEC',z,time)*EGICoalGWh('20_eCoal',z); 
 valElecGen('21_eGas',z,time,'sim')     = DS.l('21_eGas','18_ELEC',z,time)*EGIGasGWh('21_eGas',z); 
 valElecGen('22_eOil',z,time,'sim')     = DS.l('22_eOil','18_ELEC',z,time)*EGIOilGWh('22_eOil',z); 
 valElecGen('23_eWind',z,time,'sim')    = DS.l('23_eWind','18_ELEC',z,time)*EGIWindGWh('23_eWind',z); 
 valElecGen('24_eSolar',z,time,'sim')   = DS.l('24_eSolar','18_ELEC',z,time)*EGISolarGWh('24_eSolar',z); 
 valElecGen('25_eHydro',z,time,'sim')   = DS.l('25_eHydro','18_ELEC',z,time)*EGIHydroGWh('25_eHydro',z); 
 valElecGen('26_eOther',z,time,'sim')   = DS.l('26_eOther','18_ELEC',z,time)*EGIOtherGWh('26_eOther',z); 

*==============================================================================
*  % change results
*==============================================================================
 d_A_VA(z,time,'sim')               = (valA_VA(z,time,'sim')/valA_VA(z,time,'bau')-1)*100;              
 d_C(i,z,time,'sim')                = (valC(i,z,time,'sim')/valC(i,z,time,'bau')-1)*100;                
 d_CAB(z,time,'sim')                = (valCAB(z,time,'sim')/valCAB(z,time,'bau')-1)*100;               
 d_CABX(z,time,'sim')               = (valCABX(z,time,'sim')/valCABX(z,time,'bau')-1)*100;              
 d_CG(i,z,time,'sim')               = (valCG(i,z,time,'sim')/valCG(i,z,time,'bau')-1)*100;                
 d_CI(j,z,time,'sim')               = (valCI(j,z,time,'sim')/valCI(j,z,time,'bau')-1)*100;                
 d_CMIN(i,z,time,'sim')             = (valCMIN(i,z,time,'sim')/valCMIN(i,z,time,'bau')-1)*100;                         
 d_CTH(z,time,'sim')                = (valCTH(z,time,'sim')/valCTH(z,time,'bau')-1)*100;                                    
 d_CTH_REAL(z,time,'sim')           = (valCTH_REAL(z,time,'sim')/valCTH_REAL(z,time,'bau')-1)*100;           
 d_DD(i,z,time,'sim')               = (valDD(i,z,time,'sim')/valDD(i,z,time,'bau')-1)*100;              
* d_DEP(z,time,'sim')                = (valDEP(z,time,'sim')/valDEP(z,time,'bau')-1)*100;               
* d_DI(i,j,z,time,'sim')             = (valDI(i,j,z,time,'sim')/valDI(i,j,z,time,'bau')-1)*100;            
 d_DIT(i,z,time,'sim')              = (valDIT(i,z,time,'sim')/valDIT(i,z,time,'bau')-1)*100;              
* d_DS(j,i,z,time,'sim')             = (valDS(j,i,z,time,'sim')/valDS(j,i,z,time,'bau')-1)*100;            
* d_DS_I(i,z,time,'sim')             = (valDS_I(i,z,time,'sim')/valDS_I(i,z,time,'bau')-1)*100;            
 d_e(z,time,'sim')                  = (vale(z,time,'sim')/vale(z,time,'bau')-1)*100;                 
* d_EX(i,z,zj,time,'sim')            = (valEX(i,z,zj,time,'sim')/valEX(i,z,zj,time,'bau')-1)*100;                     
 d_EXT(i,z,time,'sim')              = (valEXT(i,z,time,'sim')/valEXT(i,z,time,'bau')-1)*100;             
* d_G(z,time,'sim')                  = (valG(z,time,'sim')/valG(z,time,'bau') -1)*100;                 
* d_G_REAL(z,time,'sim')             = (valG_REAL(z,time,'sim')/valG_REAL(z,time,'bau')-1)*100;            
 d_GDP_BP(z,time,'sim')             = (valGDP_BP(z,time,'sim')/valGDP_BP(z,time,'bau')-1)*100;            
 d_GDP_BP_REAL(z,time,'sim')        = (valGDP_BP_REAL(z,time,'sim')/valGDP_BP_REAL(z,time,'bau')-1)*100;          
 d_GDP_BP_W(time,'sim')             = (valGDP_BP_W(time,'sim')/valGDP_BP_W(time,'bau')-1)*100;             
 d_GDP_BP_W_REAL(time,'sim')        = (valGDP_BP_W_REAL(time,'sim')/valGDP_BP_W_REAL(time,'bau')-1)*100;       
 d_GDP_FD(z,time,'sim')             = (valGDP_FD(z,time,'sim')/valGDP_FD(z,time,'bau')-1)*100;             
 d_GDP_IB(z,time,'sim')             = (valGDP_IB(z,time,'sim')/valGDP_IB(z,time,'bau')-1)*100;            
 d_GDP_MP(z,time,'sim')             = (valGDP_MP(z,time,'sim')/valGDP_MP(z,time,'bau')-1)*100;
 d_GDP_MP_REAL(z,time,'sim')        = (valGDP_MP_REAL(z,time,'sim')/valGDP_MP_REAL(z,time,'bau')-1)*100;       
* d_IM(i,zj,z,time,'sim')            = (valIM(i,zj,z,time,'sim')/valIM(i,zj,z,time,'bau')-1)*100;           
 d_IMT(i,z,time,'sim')              = (valIMT(i,z,time,'sim')/valIMT(i,z,time,'bau')-1)*100; 
* d_IND(k,j,z,time,'sim')            = (valIND(k,j,z,time,'sim')/valIND(k,j,z,time,'bau')-1)*100;            
 d_INV(i,z,time,'sim')              = (valINV(i,z,time,'sim')/valINV(i,z,time,'bau')-1)*100;             
 d_IR(z,time,'sim')                 = (valIR(z,time,'sim')/valIR(z,time,'bau')-1)*100;                
 d_IT(z,time,'sim')                 = (valIT(z,time,'sim')/valIT(z,time,'bau')-1)*100; 
 d_IT_REAL(z,time,'sim')            = (valIT_REAL(z,time,'sim')/valIT_REAL(z,time,'bau')-1)*100; 
* d_KD(k,j,z,time,'sim')             = (valKD(k,j,z,time,'sim')/valKD(k,j,z,time,'bau')-1)*100;             
 d_KDC(j,z,time,'sim')              = (valKDC(j,z,time,'sim')/valKDC(j,z,time,'bau')-1)*100;             
* d_KS(k,z,time,'sim')               = (valKS(k,z,time,'sim')/valKS(k,z,time,'bau')-1)*100;              
* d_LD(l,j,z,time,'sim')             = (valLD(l,j,z,time,'sim')/valLD(l,j,z,time,'bau')-1)*100;            
 d_LDC(j,z,time,'sim')              = (valLDC(j,z,time,'sim')/valLDC(j,z,time,'bau')-1)*100;             
* d_LS(l,z,time,'sim')               = (valLS(l,z,time,'sim')/valLS(l,z,time,'bau')-1)*100;              
* d_MRGN(i,z,time,'sim')             = (valMRGN(i,z,time,'sim')/valMRGN(i,z,time,'bau')-1)*100;
 d_P(i,z,time,'sim')                = (valP(i,z,time,'sim')/valP(i,z,time,'bau')-1)*100;               
 d_PC(i,z,time,'sim')               = (valPC(i,z,time,'sim')/valPC(i,z,time,'bau')-1)*100;
 d_PCI(j,z,time,'sim')              = (valPCI(j,z,time,'sim')/valPCI(j,z,time,'bau')-1)*100;             
 d_PD(i,z,time,'sim')               = (valPD(i,z,time,'sim')/valPD(i,z,time,'bau')-1)*100;              
 d_PE(i,z,zj,time,'sim')            = (valPE(i,z,zj,time,'sim')/valPE(i,z,zj,time,'bau')-1)*100;           
 d_PET(i,z,time,'sim')              = (valPET(i,z,time,'sim')/valPET(i,z,time,'bau')-1)*100;              
 d_phi(z,time,'sim')                = (valphi(z,time,'sim')/valphi(z,time,'bau')-1)*100;               
 d_PIXCON(z,time,'sim')             = (valPIXCON(z,time,'sim')/valPIXCON(z,time,'bau')-1)*100;             
 d_PIXGDP(z,time,'sim')             = (valPIXGDP(z,time,'sim')/valPIXGDP(z,time,'bau')-1)*100; 
 d_PIXGDP_W(time,'sim')             = (valPIXGDP_W(time,'sim')/valPIXGDP_W(time,'bau')-1)*100;
* d_PIXGVT(z,time,'sim')             = (valPIXGVT(z,time,'sim')/valPIXGVT(z,time,'bau')-1)*100;
 d_PIXINV(z,time,'sim')             = (valPIXINV(z,time,'sim')/valPIXINV(z,time,'bau')-1)*100;
 d_PK(z,time,'sim')                 = (valPK(z,time,'sim')/valPK(z,time,'bau')-1)*100;               
 d_PL(i,z,time,'sim')               = (valPL(i,z,time,'sim')/valPL(i,z,time,'bau')-1)*100; 
* d_PM(i,zj,z,time,'sim')            = (valPM(i,zj,z,time,'sim')/valPM(i,zj,z,time,'bau')-1)*100;
 d_PMT(i,z,time,'sim')              = (valPMT(i,z,time,'sim')/valPMT(i,z,time,'bau')-1)*100;
 d_PP(j,z,time,'sim')               = (valPP(j,z,time,'sim')/valPP(j,z,time,'bau')-1)*100;
 d_PVA(j,Z,time,'sim')              = (valPVA(j,Z,time,'sim')/valPVA(j,Z,time,'bau')-1)*100;
* d_PWM(i,zj,z,time,'sim')           = (valPWM(i,zj,z,time,'sim')/valPWM(i,zj,z,time,'bau')-1)*100;
 d_PWMG(i,time,'sim')               = (valPWMG(i,time,'sim')/valPWMG(i,time,'bau')-1)*100;
* d_PWX(i,z,zj,time,'sim')           = (valPWX(i,z,zj,time,'sim')/valPWX(i,z,zj,time,'bau')-1)*100;
 d_Q(i,z,time,'sim')                = (valQ(i,z,time,'sim') /valQ(i,z,time,'bau')-1)*100;
* d_R(k,j,z,time,'sim')              = (valR(k,j,z,time,'sim')/valR(k,j,z,time,'bau')-1)*100;             
 d_RC(j,z,time,'sim')               = (valRC(j,z,time,'sim')/valRC(j,z,time,'bau')-1)*100;
* d_RTI(k,j,z,time,'sim')            = (valRTI(k,j,z,time,'sim')/valRTI(k,j,z,time,'bau')-1)*100;           
 d_SG(z,time,'sim')                 = (valSG(z,time,'sim')/valSG(z,time,'bau')-1)*100;                 
 d_SH(z,time,'sim')                 = (valSH(z,time,'sim')/valSH(z,time,'bau')-1)*100;                
* d_sh0(z,time,'sim')                = (valsh0(z,time,'sim')/valsh0(z,time,'bau')-1)*100;               
* d_sh1(z,time,'sim')                = (valsh1(z,time,'sim')/valsh1(z,time,'bau')-1)*100;               
 d_SROW(z,time,'sim')               = (valSROW(z,time,'sim')/valSROW(z,time,'bau')-1)*100;               
 d_TDH(z,time,'sim')                = (valTDH(z,time,'sim')/valTDH(z,time,'bau')-1)*100;  
* d_TIC(i,z,time,'sim')              = (valTIC(i,z,time,'sim')/valTIC(i,z,time,'bau')-1)*100;               
 d_TICT(z,time,'sim')               = (valTICT(z,time,'sim')/valTICT(z,time,'bau')-1)*100;              
* d_TIK(k,j,z,time,'sim')            = (valTIK(k,j,z,time,'sim')/valTIK(k,j,z,time,'bau')-1)*100;            
 d_TIKT(z,time,'sim')               = (valTIKT(z,time,'sim')/valTIKT(z,time,'bau')-1)*100;             
* d_TIM(i,zj,z,time,'sim')           = (valTIM(i,zj,z,time,'sim')/valTIM(i,zj,z,time,'bau')-1)*100;           
 d_TIMT(z,time,'sim')               = (valTIMT(z,time,'sim')/valTIMT(z,time,'bau')-1)*100; 
* d_TIP(j,z,time,'sim')              = (valTIP(j,z,time,'sim')/valTIP(j,z,time,'bau')-1)*100;             
 d_TIPT(z,time,'sim')               = (valTIPT(z,time,'sim')/valTIPT(z,time,'bau')-1)*100;              
* d_TIW(l,j,z,time,'sim')            = (valTIW(l,j,z,time,'sim')/valTIW(l,j,z,time,'bau')-1)*100;           
 d_TIWT(z,time,'sim')               = (valTIWT(z,time,'sim')/valTIWT(z,time,'bau')-1)*100;
* d_TIX(i,z,zj,time,'sim')           = (valTIX(i,z,zj,time,'sim')/valTIX(i,z,zj,time,'bau')-1)*100;
 d_TIXT(z,time,'sim')               = (valTIXT(z,time,'sim')/valTIXT(z,time,'bau')-1)*100;              
 d_TPRCTS(z,time,'sim')             = (valTPRCTS(z,time,'sim')/valTPRCTS(z,time,'bau')-1)*100;             
 d_TPRODN(z,time,'sim')             = (valTPRODN(z,time,'sim')/valTPRODN(z,time,'bau')-1)*100;              
* d_ttdh0(z,time,'sim')              = (valttdh0(z,time,'sim')/valttdh0(z,time,'bau')-1)*100; 
* d_ttdh1(z,time,'sim')              = (valttdh1(z,time,'sim')/valttdh1(z,time,'bau')-1)*100; 
* d_ttic(i,z,time,'sim')             = (valttic(i,z,time,'sim')/valttic(i,z,time,'bau')-1)*100; 
* d_ttik(k,j,z,time,'sim')           = (valttik(k,j,z,time,'sim')/valttik(k,j,z,time,'bau')-1)*100; 
* d_ttim(i,zj,z,time,'sim')          = (valttim(i,zj,z,time,'sim')/valttim(i,zj,z,time,'bau')-1)*100;        
* d_ttip(j,z,time,'sim')             = (valttip(j,z,time,'sim')/valttip(j,z,time,'bau')-1)*100;              
* d_ttiw(l,j,z,time,'sim')           = (valttiw(l,j,z,time,'sim')/valttiw(l,j,z,time,'bau')-1)*100;
* d_ttix(i,z,zj,time,'sim')          = (valttix(i,z,zj,time,'sim')/valttix(i,z,zj,time,'bau')-1)*100;
 d_U(z,time,'sim')                  = (valU(z,time,'sim')/valU(z,time,'bau')-1)*100;
 d_VA(j,z,time,'sim')               = (valVA(j,z,time,'sim')/valVA(j,z,time,'bau')-1)*100;
* d_W(l,z,time,'sim')                = (valW(l,z,time,'sim')/valW(l,z,time,'bau')-1)*100;
 d_WC(j,z,time,'sim')               = (valWC(j,z,time,'sim')/valWC(j,z,time,'bau')-1)*100;
* d_WTI(l,j,z,time,'sim')            = (valWTI(l,j,z,time,'sim')/valWTI(l,j,z,time,'bau')-1)*100;
* d_XS(j,i,z,time,'sim')             = (valXS(j,i,z,time,'sim')/valXS(j,i,z,time,'bau')-1)*100;
 d_XS_I(i,z,time,'sim')             = (valXS_I(i,z,time,'sim')/valXS_I(i,z,time,'bau')-1)*100;
 d_XST(j,z,time,'sim')              = (valXST(j,z,time,'sim')/valXST(j,z,time,'bau')-1)*100;
 d_YDH(z,time,'sim')                = (valYDH(z,time,'sim')/valYDH(z,time,'bau')-1)*100;
 d_YG(z,time,'sim')                 = (valYG(z,time,'sim')/valYG(z,time,'bau')-1)*100;
 d_YH(z,time,'sim')                 = (valYH(z,time,'sim')/valYH(z,time,'bau')-1)*100;
 d_YHK(z,time,'sim')                = (valYHK(z,time,'sim')/valYHK(z,time,'bau')-1)*100;
 d_YHL(z,time,'sim')                = (valYHL(z,time,'sim')/valYHL(z,time,'bau')-1)*100;
 d_YROW(z,time,'sim')               = (valYROW(z,time,'sim')/valYROW(z,time,'bau')-1)*100;

* d_EE(product,j,z,time,'sim')       = (valEE(product,j,z,time,'sim')/valEE(product,j,z,time,'bau')-1)*100;
* d_NE(product,j,z,time,'sim')       = (valNE(product,j,z,time,'sim')/valNE(product,j,z,time,'bau')-1)*100;
* d_EH(product,z,time,'sim')         = (valEH(product,z,time,'sim')/valEH(product,z,time,'bau')-1)*100;
* d_TFC(product,time,z,'sim')        = (valTFC(product,time,z,'sim')/valTFC(product,time,z,'bau')-1)*100;
* d_NEA_TFC(product,time,'sim')      = (valNEA_TFC(product,time,'sim')/valNEA_TFC(product,time,'bau')-1)*100;
* d_KOR_TFC(product,time,'sim')      = (valKOR_TFC(product,time,'sim')/valKOR_TFC(product,time,'bau')-1)*100;
* d_CHN_TFC(product,time,'sim')      = (valCHN_TFC(product,time,'sim')/valCHN_TFC(product,time,'bau')-1)*100;
* d_JPN_TFC(product,time,'sim')      = (valJPN_TFC(product,time,'sim')/valJPN_TFC(product,time,'bau')-1)*100;

* d_CO2I(product,j,z,time,'sim')     = (valCO2I(product,j,z,time,'sim')/valCO2I(product,j,z,time,'bau')-1)*100;
* d_CO2NE(product,j,z,time,'sim')    = (valCO2NE(product,j,z,time,'sim')/valCO2NE(product,j,z,time,'bau')-1)*100;
* d_CO2H(product,z,time,'sim')       = (valCO2H(product,z,time,'sim')/valCO2H(product,z,time,'bau')-1)*100; 
* d_CO2I2(j,z,time,'sim')            = (valCO2I2(j,z,time,'sim')/valCO2I2(j,z,time,'bau')-1)*100;
* d_CO2NE2(j,z,time,'sim')           = (valCO2NE2(j,z,time,'sim')/valCO2NE2(j,z,time,'bau')-1)*100;
* d_TCO2I(z,time,'sim')              = (valTCO2I(z,time,'sim')/valTCO2I(z,time,'bau')-1)*100;
* d_TCO2NE(z,time,'sim')             = (valTCO2NE(z,time,'sim')/valTCO2NE(z,time,'bau')-1)*100;
* d_TCO2H(z,time,'sim')              = (valTCO2H(z,time,'sim')/valTCO2H(z,time,'bau')-1)*100;
* d_TCO2(z,time,'sim')               = (valTCO2(z,time,'sim')/valTCO2(z,time,'bau')-1)*100;
* d_POWER(power,i,z,time,'sim')      = (valPOWER(power,i,z,time,'sim')/valPOWER(power,i,z,time,'bau')-1)*100;
* d_ElecGen(j,z,time,'sim')          = (valElecGen(j,z,time,'sim') /valElecGen(j,z,time,'bau')-1)*100;

* d_CH4I(product,j,z,time,'sim')    
* d_CH4H(product,z,time,'sim')      
* d_N2OI(product,j,z,time,'sim')    
* d_N2OH(product,z,time,'sim')   


 execute_unload 'Simulation_Results_240125',
 valA_VA,
 valC,
 valCAB,
 valCABX,
 valCG,
 valCI,
 valCMIN,
 valCTH,
 valCTH_REAL,
 valDD,
 valDEP,
 valDI,
 valDIT,
 valDS,
 valDS_I,
 vale,
 valEXT,
 valG,
 valGDP_BP,
 valGDP_BP_REAL,
 valGDP_BP_W,
 valGDP_BP_W_REAL,
 valGDP_FD,
 valGDP_IB,
 valGDP_MP,
 valGDP_MP_REAL,
 valIM,
 valIMT,
 valIND,
 valINV,
 valIR,        
 valIT,      
 valIT_REAL,
 valKD,
 valKDC,
 valKS,
 valLD,
 valLDC,
 valLS,
 valMRGN,
 valP,
 valPC,
 valPCI,
 valPD,
 valPE,
 valPET,
 valphi,
 valPIXCON,
 valPIXGDP,
 valPIXGDP_W,
 valPIXGVT,
 valPIXINV,
 valPK,       
 valPL,
 valPM,
 valPMT,
 valPP,
 valPVA,
 valPWM,
 valPWMG,
 valPWX,
 valQ,
 valR,
 valRC,
 valRTI,
 valSG,        
 valSH,    
 valsh0,
 valsh1,
 valSROW,
 valTDH,
 valTIC,
 valTICT,
 valTIK,
 valTIKT,
 valTIM,
 valTIMT,
 valTIP,
 valTIPT,
 valTIW,
 valTIWT,
 valTIX,
 valTIXT,
 valTPRCTS,
 valTPRODN,
 valttdh0,
 valttdh1,
 valttic,
 valttik,
 valttim,
 valttip,
 valttiw,
 valttix,
 valU,           
 valVA,
 valW,
 valWC,
 valWTI,
 valXS, 
 valYDH,  
 valYG,         
 valYH,        
 valYHK,       
 valYHL,        
 valYROW,
 valEE,
 valNE,
* valEH,
 valCO2I,
 valCO2NE,
 valCO2H,
 valCO2I2,
 valCO2NE2,
 valTCO2I,
 valTCO2NE,
 valTCO2H,
 valTCO2,
 valTFC,
 valNEA_TFC,
 valKOR_TFC,
 valCHN_TFC,
 valJPN_TFC,
 valPOWER,
 valElecGen
* valCO2H,
* valCH4I,
* valCH4H,
* valN2OI,
* valN2OH
 d_A_VA,             
 d_C,               
 d_CAB,               
 d_CABX,              
 d_CG,              
 d_CI,              
 d_CMIN,            
 d_CTH,               
 d_CTH_REAL,          
 d_DD,              
 d_DEP,               
* d_DI,            
 d_DIT,             
* d_DS,            
 d_DS_I,            
 d_e,                 
* d_EX,           
 d_EXT,             
 d_G,                 
 d_G_REAL,            
 d_GDP_BP,            
 d_GDP_BP_REAL,       
 d_GDP_BP_W,            
 d_GDP_BP_W_REAL,       
 d_GDP_FD,            
 d_GDP_IB,            
 d_GDP_MP,            
 d_GDP_MP_REAL,       
 d_IM,           
 d_IMT,             
 d_IND,           
 d_INV,             
 d_IR,                
 d_IT,                
 d_IT_REAL,           
 d_KD,            
 d_KDC,             
 d_KS,              
 d_LD,            
 d_LDC,             
 d_LS,              
 d_MRGN,            
 d_P,               
 d_PC,              
 d_PCI,             
 d_PD,              
 d_PE,           
 d_PET,             
 d_phi,               
 d_PIXCON,            
 d_PIXGDP,            
 d_PIXGDP_W,            
 d_PIXGVT,            
 d_PIXINV,            
 d_PK,                
 d_PL,              
 d_PM,           
 d_PMT,             
 d_PP,              
 d_PVA,             
 d_PWM,          
 d_PWMG,              
 d_PWX,          
 d_Q,               
 d_R,             
 d_RC,              
 d_RTI,           
 d_SG,                
 d_SH,                
 d_sh0,               
 d_sh1,               
 d_SROW,              
 d_TDH,              
 d_TIC,             
 d_TICT,              
 d_TIK,           
 d_TIKT,              
 d_TIM,         
 d_TIMT,              
 d_TIP,             
 d_TIPT,              
 d_TIW,           
 d_TIWT,              
 d_TIX,          
 d_TIXT,              
 d_TPRCTS,            
 d_TPRODN,            
 d_ttdh0,             
 d_ttdh1,             
 d_ttic,            
 d_ttik,          
 d_ttim,         
 d_ttip,            
 d_ttiw,          
 d_ttix,         
 d_U,                 
 d_VA,              
 d_W,               
 d_WC,              
 d_WTI,           
 d_XS,            
 d_XS_I,            
 d_XST,             
 d_YDH,               
 d_YG,                
 d_YH,                
 d_YHK,               
 d_YHL,               
 d_YROW,              

 d_EE,      
 d_NE,      
 d_EH,        
 d_TFC,       
 d_NEA_TFC,     
 d_KOR_TFC,     
 d_CHN_TFC,     
 d_JPN_TFC,     

 d_CO2I,    
 d_CO2NE,   
 d_CO2H,
 d_CO2I2,           
 d_CO2NE2,          
 d_TCO2I,             
 d_TCO2NE,            
 d_TCO2H,             
 d_TCO2,              
 d_POWER,     
 d_ElecGen 

 ; 