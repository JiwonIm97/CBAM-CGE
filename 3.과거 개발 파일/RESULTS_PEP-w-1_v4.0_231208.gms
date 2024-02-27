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
*                         Helene Maisonnave and Bernard Decaluwe.              *
*  - Noncommercial:       You may not use this work for commercial purposes.   *
*  - Share Alike:         If you alter, transform, or build upon this work,    *
*                         you may distribute the resulting work only under     *
*                         the same or similar license to this one.             *
*                                                                              *
*==============================================================================*

* This file is included in the main program file PEP-w-1_v4-0.gms

*==============================================================================
* 6.4 Results
*==============================================================================
* 6.4.1 Scenarios
*==============================================================================

* Define the set of scenarios
SET

scen
/
 BAU             Initial values
 SIM             After shock values
/

*==============================================================================
*  6.4.2 Declaration of parameters to store results
*==============================================================================
PARAMETER

*==============================================================================
*  6.4.2.1 Variables in the model
*==============================================================================
 valC(i,z,scen)          Consumption of commodity i by households in region z
 valCAB(z,scen)          Current account balance of region z
 valCABX(z,scen)         Current account balance of region z in terms of the international currency
 valCG(i,z,scen)         Public consumption of commodity i in region z
 valCI(j,z,scen)         Total intermediate consumption of industry j in region z
 valCE(j,z,scen)         Total intermediate energy consumption of industry j in region z
 valCMIN(i,z,scen)       Minimum consumption of commodity i by households in region z
 valCTH(z,scen)          Consumption budget of households in region z
 valCTH_REAL(z,scen)     Real household consumption in region z
 valDD(i,z,scen)         Domestic demand for commodity i produced locally in region z
 valDEP(z,scen)          Amount of depreciation (capital consumption allowance) in region z
 valDI(nene,j,z,scen)    Intermediate consumption of commodity i by industry j in region z
 valDE(ene,j,z,scen)     Intermediate energy consumption of commodity i by industry j in region z
 valDIT(i,z,scen)        Total intermediate demand of commodity i in region z
 valDS(j,i,z,scen)       Supply of commodity i by sector j to the domestic market in region z
 valDS_I(i,z,scen)       Supply of commodity i to the domestic market of region z
 vale(z,scen)            Exchange rate (price of international currency in terms of region z local currency)
 valEX(i,z,zj,scen)      Quantity of product i exported by country z to country zj
 valEXT(i,z,scen)        Supply of composite commodity i by region z to the export market
 valG(z,scen)            Current government expenditures on goods and services in region z
 valG_REAL(z,scen)       Current real government expenditures on goods and services in region z
 valGDP_BP(z,scen)       Region z GDP at basic prices
 valGDP_BP_REAL(z,scen)  Real GDP at basic prices
 valGDP_BP_W(scen)       World GDP at basic prices
 valGDP_BP_W_REAL(scen)  Real world GDP at basic prices
 valGDP_FD(z,scen)       Region z GDP at purchasers prices from the perspective of final demand
 valGDP_IB(z,scen)       Region z GDP at market prices (income-based)
 valGDP_MP(z,scen)       Region z GDP at market prices
 valGDP_MP_REAL(z,scen)  Real GDP at market prices
 valIM(i,zj,z,scen)      Quantity of product i imported by country z from country zj
 valIMT(i,z,scen)        Quantity demanded of composite imports of commodity i by region z
 valINV(i,z,scen)        Final demand of commodity i for investment purposes (GFCF) in region z
 valIT(z,scen)           Total investment expenditures in region z
 valIT_REAL(z,scen)      Real gross fixed capital formation
 valKD(k,j,z,scen)       Demand for type k capital by industry j in region z
 valKDC(j,z,scen)        Demand for composite capital by industry j in region z
 valKS(k,z,scen)         Supply of type k capital in region z
 valLD(l,j,z,scen)       Demand for type l labor by industry j in region z
 valLDC(j,z,scen)        Demand for composite labor by industry j in region z
 valLS(l,z,scen)         Supply of type l labor in region z
 valMRGN(i,z,scen)       Domestic production of commodity i in region z exported as international margin services
 valP(i,z,scen)          Basic price of commodity i production in region z
 valPT(j,z,scen)         Basic price of industry j production in region z
 valP2(j,i,z,scen)       Basic price of industry j's production of commodity i
 valP4(ene,j,z,scen)     Intermediate energy price by industry j in region z
 valPC(i,z,scen)         Purchaser price of composite commodity i (including all taxes and margins) in region z
 valPCI(j,z,scen)        Intermediate consumption price index of industry j in region z
 valPCE(j,z,scen)        Intermediate energy consumption price index of industry j in region z
 valPD(i,z,scen)         Price of local product i sold on region z domestic market (including all taxes)
 valPE(i,z,zj,scen)      Price received for commodity i exported to region zj by region z (excluding export taxes)
 valPET(i,z,scen)        Border price of composite commodity i exported by region z
 valPIXCON(z,scen)       Consumer price index in region z
 valPIXGDP(z,scen)       GDP deflator in region z
 valPIXGDP_W(scen)       World GDP deflator
 valPIXGVT(z,scen)       Public expenditures price index in region z
 valPIXINV(z,scen)       Investment price index in region z
 valPK(z,scen)           Price of new capital in region z
 valPL(i,z,scen)         Price of local product i (excluding all taxes on products) in region z
 valPM(i,zj,z,scen)      Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 valPMT(i,z,scen)        Price of composite commodity i imported by region z (including all taxes duties and margins)
 valPP(j,z,scen)         Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 valPVA(j,z,scen)        Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 valPKLE(j,z,scen)       Price of industry j KLE in region z 
 valPWM(i,zj,z,scen)     World price of commodity i imported from country zj by region z (expressed in international currency)
 valPWMG(i,scen)         World price of margin i (expressed in international currency)
 valPWX(i,z,zj,scen)     World price of commodity i exported to country zj by region z (expressed in international currency)
 valQ(i,z,scen)          Quantity demanded of composite commodity i in region z
 valR(k,j,z,scen)        Rental rate of type k capital in industry j of region z
 valRC(j,z,scen)         Rental rate of industry j composite capital in region z
 valRK(k,z,scen)         Rental rate of type k capital in region z
 valRTI(k,j,z,scen)      Rental rate paid by industry j for type k capital in region z including capital taxes
 valSG(z,scen)           Government savings in region z
 valSH(z,scen)           Household savings in region z
 valsh0(z,scen)          Intercept (household savings)
 valsh1(z,scen)          Slope (household savings)
 valSROW(z,scen)         Rest-of-the-world savings with respect to region z
 valTCTAX(z,scen)        Government revenue from Carbon tax
 valTDH(z,scen)          Household income taxes in region z
 valTIC(i,z,scen)        Government revenue from indirect taxes on commodity i in region z
 valTICT(z,scen)         Total government receipts of indirect taxes on commodities in region z
 valTIK(k,j,z,scen)      Government revenue from taxes on type k capital used by industry j in region z
 valTIKT(z,scen)         Total government revenue from from taxes on capital in region z
 valTIM(i,zj,z,scen)     Government revenue from duties on commodity i imported from region zj by region z
 valTIMT(z,scen)         Total government revenue from import duties in region z
 valTIP(j,z,scen)        Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 valTIPT(z,scen)         Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 valTIW(l,j,z,scen)      Government revenue from payroll taxes on type l labor in industry j of region z
 valTIWT(z,scen)         Total government revenue from payroll taxes in region z
 valTIX(i,z,zj,scen)     Government revenue from export taxes on commodity i exported by region z to region zj
 valTIXT(z,scen)         Total government revenue from export taxes in region z
 valTPRCTS(z,scen)       Total government revenue from taxes on products and imports in region z
 valTPRODN(z,scen)       Total government revenue from other taxes on production in region z
 valttdh0(z,scen)        Intercept (household income tax)
 valttdh1(z,scen)        Slope (household income tax)
 valttic(i,z,scen)       Tax rate on commodity i
 valttik(k,j,z,scen)     Tax rate on capital k used in industry j
 valttim(i,zj,z,scen)    Rate of taxes and duties on imports of commodity i from country zj
 valttip(j,z,scen)       Tax rate on the production of industry j
 valttiw(l,j,z,scen)     Tax rate on type l worker compensation in industry j
 valttix(i,z,zj,scen)    Export tax rate on exported commodity i
 valVA(j,z,scen)         Value added of industry j in region z
 valKLE(j,z,scen)        KLE of industry j in region z
 valW(l,z,scen)          Wage rate of type l labor in region z
 valWC(j,z,scen)         Wage rate of industry j composite labor in region z
 valWTI(l,j,z,scen)      Wage rate paid z by industry j for type l labor in region including payroll taxes
 valXS(j,i,z,scen)       Total output of industry j by commodity i in region z
 valXS_I(i,z,scen)       Total output of commodity i in region z
 valXST(j,z,scen)        Total output of industry j in region z
 valYDH(z,scen)          Household disposable income in region z
 valYG(z,scen)           Total government income in region z
 valYH(z,scen)           Household total income in region z
 valYHK(z,scen)          Household capital income in region z
 valYHL(z,scen)          Household labor income in region z
 valYROW(z,scen)         Rest-of-the-world total income from region z

*==============================================================================
*    6.4.2.2 Declaration of supplementary result variables
*==============================================================================
 FishPMX(z,zj,scen)      Ficher price index of bilateral trade
 FishQIM(z,scen)         Fisher quantity index of imports
 FishPIM(z,scen)         Fisher price index of imports
 FishQEX(z,scen)         Fisher quantity index of exports
 FishPEX(z,scen)         Fisher price index of exports
 FishQMX(z,zj,scen)      Fisher quantity index of bilateral trade
 FishPMX(z,zj,scen)      Ficher price index of bilateral trade
 Mvalue(z,scen)          Value of imports
 Xvalue(z,scen)          Value of exports

*==============================================================================
*    6.4.2.3 Declaration of supplementary result parameters
*==============================================================================
 elas_H(i,z,scen)      Household LES Uility function Own price elasticities
 elas_IND(ene,j,z,scen)    Industrial sectors' Own price elastcitiies
;

*==============================================================================
*  6.4.3 Assignment of benchmark values to result parameters
*==============================================================================
 valC(i,z,'bau')         = CO(i,z);
 valCAB(z,'bau')         = CABO(z);
 valCABX(z,'bau')        = CABXO(z);
 valCG(i,z,'bau')        = CGO(i,z);
 valCI(j,z,'bau')        = CIO(j,z);
 valCE(j,z,'bau')        = CEO(j,z);
 valCMIN(i,z,'bau')      = CMINO(i,z);
 valCTH(z,'bau')         = CTHO(z);
 valCTH_REAL(z,'bau')    = CTH_REALO(z);
 valDD(i,z,'bau')        = DDO(i,z);
 valDEP(z,'bau')         = DEPO(z);
 valDI(nene,j,z,'bau')   = DIO(nene,j,z);
 valDE(ene,j,z,'bau')    = DEO(ene,j,z);
 valDIT(i,z,'bau')       = DITO(i,z);
 valDS(j,i,z,'bau')      = DSO(j,i,z);
 valDS_I(i,z,'bau')      = DSO_I(i,z);
 vale(z,'bau')           = eO(z);
 valEX(i,z,zj,'bau')     = EXO(i,z,zj);
 valEXT(i,z,'bau')       = EXTO(i,z);
 valG(z,'bau')           = GO(z);
 valG_REAL(z,'bau')      = G_REALO(z);
 valGDP_BP(z,'bau')      = GDP_BPO(z);
 valGDP_BP_REAL(z,'bau') = GDP_BP_REALO(z);
 valGDP_BP_W('bau')      = GDP_BP_WO;
 valGDP_BP_W_REAL('bau') = GDP_BP_W_REALO;
 valGDP_FD(z,'bau')      = GDP_FDO(z);
 valGDP_IB(z,'bau')      = GDP_IBO(z);
 valGDP_MP(z,'bau')      = GDP_MPO(z);
 valGDP_MP_REAL(z,'bau') = GDP_MP_REALO(z);
 valIM(i,zj,z,'bau')     = IMO(i,zj,z);
 valIMT(i,z,'bau')       = IMTO(i,z);
 valINV(i,z,'bau')       = INVO(i,z);
 valIT(z,'bau')          = ITO(z);
 valIT_REAL(z,'bau')     = IT_REALO(z);
 valKD(k,j,z,'bau')      = KDO(k,j,z);
 valKDC(j,z,'bau')       = KDCO(j,z);
 valKS(k,z,'bau')        = KSO(k,z);
 valLD(l,j,z,'bau')      = LDO(l,j,z);
 valLDC(j,z,'bau')       = LDCO(j,z);
 valLS(l,z,'bau')        = LSO(l,z);
 valMRGN(i,z,'bau')      = MRGNO(i,z);
 valP(i,z,'bau')         = PO(i,z);
 valPT(j,z,'bau')        = PTO(j,z);
 valP2(j,i,z,'bau')      = PO2(j,i,z);
 valP4(ene,j,z,'bau')    = PO4(ene,j,z);
 valPC(i,z,'bau')        = PCO(i,z);
 valPCI(j,z,'bau')       = PCIO(j,z);
 valPCE(j,z,'bau')       = PCEO(j,z);
 valPD(i,z,'bau')        = PDO(i,z);
 valPE(i,z,zj,'bau')     = PEO(i,z,zj);
 valPET(i,z,'bau')       = PETO(i,z);
 valPIXCON(z,'bau')      = PIXCONO(z);
 valPIXGDP(z,'bau')      = PIXGDPO(z);
 valPIXGDP_W('bau')      = PIXGDP_WO;
 valPIXGVT(z,'bau')      = PIXGVTO(z);
 valPIXINV(z,'bau')      = PIXINVO(z);
 valPK(z,'bau')          = PKO(z);
 valPL(i,z,'bau')        = PLO(i,z);
 valPM(i,zj,z,'bau')     = PMO(i,zj,z);
 valPMT(i,z,'bau')       = PMTO(i,z);
 valPP(j,z,'bau')        = PPO(j,z);
 valPVA(j,z,'bau')       = PVAO(j,z);
 valPKLE(j,z,'bau')      = PKLEO(j,z);
 valPWM(i,zj,z,'bau')    = PWMO(i,zj,z);
 valPWMG(i,'bau')        = PWMGO(i);
 valPWX(i,z,zj,'bau')    = PWXO(i,z,zj);
 valQ(i,z,'bau')         = QO(i,z);
 valR(k,j,z,'bau')       = RO(k,j,z);
 valRC(j,z,'bau')        = RCO(j,z);
* valRK(k,z,'bau')        = RKO(k,z);
 valRTI(k,j,z,'bau')     = RTIO(k,j,z);
 valSG(z,'bau')          = SGO(z);
 valSH(z,'bau')          = SHO(z);
 valsh0(z,'bau')         = sh0O(z);
 valsh1(z,'bau')         = sh1O(z);
 valSROW(z,'bau')        = SROWO(z);
 valTCTAX(z,'bau')       = TCTAX0(z);
 valTDH(z,'bau')         = TDHO(z);
 valTIC(i,z,'bau')       = TICO(i,z);
 valTICT(z,'bau')        = TICTO(z);
 valTIK(k,j,z,'bau')     = TIKO(k,j,z);
 valTIKT(z,'bau')        = TIKTO(z);
 valTIM(i,zj,z,'bau')    = TIMO(i,zj,z);
 valTIMT(z,'bau')        = TIMTO(z);
 valTIP(j,z,'bau')       = TIPO(j,z);
 valTIPT(z,'bau')        = TIPTO(z);
 valTIW(l,j,z,'bau')     = TIWO(l,j,z);
 valTIWT(z,'bau')        = TIWTO(z);
 valTIX(i,z,zj,'bau')    = TIXO(i,z,zj);
 valTIXT(z,'bau')        = TIXTO(z);
 valTPRCTS(z,'bau')      = TPRCTSO(z);
 valTPRODN(z,'bau')      = TPRODNO(z);
 valttdh0(z,'bau')       = ttdh0O(z);
 valttdh1(z,'bau')       = ttdh1O(z);
 valttic(i,z,'bau')      = tticO(i,z);
 valttik(k,j,z,'bau')    = ttikO(k,j,z);
 valttim(i,zj,z,'bau')   = ttimO(i,zj,z);
 valttip(j,z,'bau')      = ttipO(j,z);
 valttiw(l,j,z,'bau')    = ttiwO(l,j,z);
 valttix(i,z,zj,'bau')   = ttixO(i,z,zj);
 valVA(j,z,'bau')        = VAO(j,z);
 valKLE(j,z,'bau')       = KLEO(j,z);
 valW(l,z,'bau')         = WO(l,z);
 valWC(j,z,'bau')        = WCO(j,z);
 valWTI(l,j,z,'bau')     = WTIO(l,j,z);
 valXS(j,i,z,'bau')      = XSO(j,i,z);
 valXS_I(i,z,'bau')      = XSO_I(i,z);
 valXST(j,z,'bau')       = XSTO(j,z);
 valYDH(z,'bau')         = YDHO(z);
 valYG(z,'bau')          = YGO(z);
 valYH(z,'bau')          = YHO(z);
 valYHK(z,'bau')         = YHKO(z);
 valYHL(z,'bau')         = YHLO(z);
 valYROW(z,'bau')        = YROWO(z);
*==============================================================================
*  6.4.4 Assignment of solution values to result parameters
*==============================================================================
 valC(i,z,'sim')         = C.l(i,z);
 valCAB(z,'sim')         = CAB.l(z);
 valCABX(z,'sim')        = CABX.l(z);
 valCG(i,z,'sim')        = CG.l(i,z);
 valCI(j,z,'sim')        = CI.l(j,z);
 valCE(j,z,'sim')        = CE.l(j,z);
 valCMIN(i,z,'sim')      = CMIN.l(i,z);
 valCTH(z,'sim')         = CTH.l(z);
 valCTH_REAL(z,'sim')    = CTH_REAL.l(z);
 valDD(i,z,'sim')        = DD.l(i,z);
 valDEP(z,'sim')         = DEP.l(z);
 valDI(nene,j,z,'sim')   = DI.l(nene,j,z);
 valDE(ene,j,z,'sim')    = DE.l(ene,j,z);
 valDIT(i,z,'sim')       = DIT.l(i,z);
 valDS(j,i,z,'sim')      = DS.l(j,i,z);
 valDS_I(i,z,'sim')      = DS_I.l(i,z);
 vale(z,'sim')           = e.l(z);
 valEX(i,z,zj,'sim')     = EX.l(i,z,zj);
 valEXT(i,z,'sim')       = EXT.l(i,z);
 valG(z,'sim')           = G.l(z);
 valG_REAL(z,'sim')      = G_REAL.l(z);
 valGDP_BP(z,'sim')      = GDP_BP.l(z);
 valGDP_BP_REAL(z,'sim') = GDP_BP_REAL.l(z);
 valGDP_BP_W('sim')      = GDP_BP_W.l;
 valGDP_BP_W_REAL('sim') = GDP_BP_W_REAL.l;
 valGDP_FD(z,'sim')      = GDP_FD.l(z);
 valGDP_IB(z,'sim')      = GDP_IB.l(z);
 valGDP_MP(z,'sim')      = GDP_MP.l(z);
 valGDP_MP_REAL(z,'sim') = GDP_MP_REAL.l(z);
 valIM(i,zj,z,'sim')     = IM.l(i,zj,z);
 valIMT(i,z,'sim')       = IMT.l(i,z);
 valINV(i,z,'sim')       = INV.l(i,z);
 valIT(z,'sim')          = IT.l(z);
 valIT_REAL(z,'sim')     = IT_REAL.l(z);
 valKD(k,j,z,'sim')      = KD.l(k,j,z);
 valKDC(j,z,'sim')       = KDC.l(j,z);
 valKS(k,z,'sim')        = KS.l(k,z);
 valLD(l,j,z,'sim')      = LD.l(l,j,z);
 valLDC(j,z,'sim')       = LDC.l(j,z);
 valLS(l,z,'sim')        = LS.l(l,z);
 valMRGN(i,z,'sim')      = MRGN.l(i,z);
 valP(i,z,'sim')         = P.l(i,z);
 valPT(j,z,'sim')        = PT.l(j,z);
 valP2(j,i,z,'sim')      = P2.l(j,i,z);
 valP4(ene,j,z,'sim')    = P4.l(ene,j,z);
 valPC(i,z,'sim')        = PC.l(i,z);
 valPCI(j,z,'sim')       = PCI.l(j,z);
 valPCE(j,z,'sim')       = PCE.l(j,z);
 valPD(i,z,'sim')        = PD.l(i,z);
 valPE(i,z,zj,'sim')     = PE.l(i,z,zj);
 valPET(i,z,'sim')       = PET.l(i,z);
 valPIXCON(z,'sim')      = PIXCON.l(z);
 valPIXGDP(z,'sim')      = PIXGDP.l(z);
 valPIXGDP_W('sim')      = PIXGDP_W.l;
 valPIXGVT(z,'sim')      = PIXGVT.l(z);
 valPIXINV(z,'sim')      = PIXINV.l(z);
 valPK(z,'sim')          = PK.l(z);
 valPL(i,z,'sim')        = PL.l(i,z);
 valPM(i,zj,z,'sim')     = PM.l(i,zj,z);
 valPMT(i,z,'sim')       = PMT.l(i,z);
 valPP(j,z,'sim')        = PP.l(j,z);
 valPVA(j,z,'sim')       = PVA.l(j,z);
 valPKLE(j,z,'sim')      = PKLE.l(j,z);
 valPWM(i,zj,z,'sim')    = PWM.l(i,zj,z);
 valPWMG(i,'sim')        = PWMG.l(i);
 valPWX(i,z,zj,'sim')    = PWX.l(i,z,zj);
 valQ(i,z,'sim')         = Q.l(i,z);
 valR(k,j,z,'sim')       = R.l(k,j,z);
 valRC(j,z,'sim')        = RC.l(j,z);
* valRK(k,z,'sim')        = RK.l(k,z);
 valRTI(k,j,z,'sim')     = RTI.l(k,j,z);
 valSG(z,'sim')          = SG.l(z);
 valSH(z,'sim')          = SH.l(z);
 valsh0(z,'sim')         = sh0.l(z);
 valsh1(z,'sim')         = sh1.l(z);
 valSROW(z,'sim')        = SROW.l(z);
 valTCTAX(z,'sim')       = TCTAX.l(z);
 valTDH(z,'sim')         = TDH.l(z);
 valTIC(i,z,'sim')       = TIC.l(i,z);
 valTICT(z,'sim')        = TICT.l(z);
 valTIK(k,j,z,'sim')     = TIK.l(k,j,z);
 valTIKT(z,'sim')        = TIKT.l(z);
 valTIM(i,zj,z,'sim')    = TIM.l(i,zj,z);
 valTIMT(z,'sim')        = TIMT.l(z);
 valTIP(j,z,'sim')       = TIP.l(j,z);
 valTIPT(z,'sim')        = TIPT.l(z);
 valTIW(l,j,z,'sim')     = TIW.l(l,j,z);
 valTIWT(z,'sim')        = TIWT.l(z);
 valTIX(i,z,zj,'sim')    = TIX.l(i,z,zj);
 valTIXT(z,'sim')        = TIXT.l(z);
 valTPRCTS(z,'sim')      = TPRCTS.l(z);
 valTPRODN(z,'sim')      = TPRODN.l(z);
 valttdh0(z,'sim')       = ttdh0.l(z);
 valttdh1(z,'sim')       = ttdh1.l(z);
 valttic(i,z,'sim')      = ttic.l(i,z);
 valttik(k,j,z,'sim')    = ttik.l(k,j,z);
 valttim(i,zj,z,'sim')   = ttim.l(i,zj,z);
 valttip(j,z,'sim')      = ttip.l(j,z);
 valttiw(l,j,z,'sim')    = ttiw.l(l,j,z);
 valttix(i,z,zj,'sim')   = ttix.l(i,z,zj);
 valVA(j,z,'sim')        = VA.l(j,z);
 valKLE(j,z,'sim')       = KLE.l(j,z);
 valW(l,z,'sim')         = W.l(l,z);
 valWC(j,z,'sim')        = WC.l(j,z);
 valWTI(l,j,z,'sim')     = WTI.l(l,j,z);
 valXS(j,i,z,'sim')      = XS.l(j,i,z);
 valXS_I(i,z,'sim')      = XS_I.l(i,z);
 valXST(j,z,'sim')       = XST.l(j,z);
 valYDH(z,'sim')         = YDH.l(z);
 valYG(z,'sim')          = YG.l(z);
 valYH(z,'sim')          = YH.l(z);
 valYHK(z,'sim')         = YHK.l(z);
 valYHL(z,'sim')         = YHL.l(z);
 valYROW(z,'sim')        = YROW.l(z);

*==============================================================================
*    6.4.5 Computation of supplementary result variables
*==============================================================================
*    6.4.5.1 Fisher price and volume indexes
*==============================================================================
 FishQMX(zj,z,scen)$(SUM[i,IMO(i,zj,z)] gt 0)
         = {(SUM[i,valIM(i,zj,z,scen)*PWMO(i,zj,z)]
             /
             SUM[i,IMO(i,zj,z)*PWMO(i,zj,z)]
             )*(
             SUM[i,valIM(i,zj,z,scen)*valPWM(i,zj,z,scen)]
             /
             SUM[i,IMO(i,zj,z)*valPWM(i,zj,z,scen)]
            )}**0.5;

 FishPMX(zj,z,scen)$(SUM[i,IMO(i,zj,z)] gt 0)
         = {(SUM[i,IMO(i,zj,z)*valPWM(i,zj,z,scen)]
             /
             SUM[i,IMO(i,zj,z)*PWMO(i,zj,z)]
             )*(
             SUM[i,valIM(i,zj,z,scen)*valPWM(i,zj,z,scen)]
             /
             SUM[i,valIM(i,zj,z,scen)*PWMO(i,zj,z)]
            )}**0.5;

 FishQIM(z,scen)
         ={[(eO(z)*SUM{(i,zj),valIM(i,zj,z,scen)*
             [PWMO(i,zj,z)+SUM(ij,PWMGO(ij)*tmrg(ij,i,zj,z))]}
             )/(
             eO(z)*SUM{(i,zj),IMO(i,zj,z)*
             [PWMO(i,zj,z)+SUM(ij,PWMGO(ij)*tmrg(ij,i,zj,z))]}
           )]*[(
             vale(z,scen)*SUM{(i,zj),valIM(i,zj,z,scen)*
             [valPWM(i,zj,z,scen)+SUM(ij,valPWMG(ij,scen)*tmrg(ij,i,zj,z))]}
             )/(
             vale(z,scen)*SUM{(i,zj),IMO(i,zj,z)*
             [valPWM(i,zj,z,scen)+SUM(ij,valPWMG(ij,scen)*tmrg(ij,i,zj,z))]}
           )]}**0.5;

 FishPIM(z,scen)
         ={[(vale(z,scen)*SUM{(i,zj),IMO(i,zj,z)*
             [valPWM(i,zj,z,scen)+SUM(ij,valPWMG(ij,scen)*tmrg(ij,i,zj,z))]})
             /
             (eO(z)*SUM{(i,zj),IMO(i,zj,z)*
             [PWMO(i,zj,z)+SUM(ij,PWMGO(ij)*tmrg(ij,i,zj,z))]})
            ]*[
             (vale(z,scen)*SUM{(i,zj),valIM(i,zj,z,scen)*
             [valPWM(i,zj,z,scen)+SUM(ij,valPWMG(ij,scen)*tmrg(ij,i,zj,z))]})
             /
             (eO(z)*SUM{(i,zj),valIM(i,zj,z,scen)*
             [PWMO(i,zj,z)+SUM(ij,PWMGO(ij)*tmrg(ij,i,zj,z))]})
           ]}**0.5;

 FishQEX(z,scen)
         = {[(eO(z)*SUM[(i,zj),valEX(i,z,zj,scen)*PWXO(i,z,zj)]+
              eO(z)*SUM[i,valMRGN(i,z,scen)*PWMGO(i)])
              /
             (eO(z)*SUM[(i,zj),EXO(i,z,zj)*PWXO(i,z,zj)]+
              eO(z)*SUM[i,MRGNO(i,z)*PWMGO(i)])
             ]*[
             (vale(z,scen)*SUM[(i,zj),valEX(i,z,zj,scen)*valPWX(i,z,zj,scen)]+
              vale(z,scen)*SUM[i,valMRGN(i,z,scen)*valPWMG(i,scen)])
              /
             (vale(z,scen)*SUM[(i,zj),EXO(i,z,zj)*valPWX(i,z,zj,scen)]+
              vale(z,scen)*SUM[i,MRGNO(i,z)*valPWMG(i,scen)])
             ]}**0.5;

 FishPEX(z,scen)
         = {[(vale(z,scen)*SUM[(i,zj),EXO(i,z,zj)*valPWX(i,z,zj,scen)]+
              vale(z,scen)*SUM[i,MRGNO(i,z)*valPWMG(i,scen)])
              /
              (eO(z)*SUM[(i,zj),EXO(i,z,zj)*PWXO(i,z,zj)]+
               eO(z)*SUM[i,MRGNO(i,z)*PWMGO(i)])
             ]*[
              (vale(z,scen)*SUM[(i,zj),valEX(i,z,zj,scen)*valPWX(i,z,zj,scen)]+
               vale(z,scen)*SUM[i,valMRGN(i,z,scen)*valPWMG(i,scen)])
              /
              (eO(z)*SUM[(i,zj),valEX(i,z,zj,scen)*PWXO(i,z,zj)]+
               eO(z)*SUM[i,valMRGN(i,z,scen)*PWMGO(i)])
             ]}**0.5;

*==============================================================================
*    6.4.5.2 Value of trade
*==============================================================================
 Mvalue(z,scen)
         = vale(z,scen)*SUM{(i,zj),valIM(i,zj,z,scen)*
          [valPWM(i,zj,z,scen)+SUM(ij,valPWMG(ij,scen)*tmrg(ij,i,zj,z))]};

 Xvalue(z,scen)
         = vale(z,scen)*SUM[(i,zj),valEX(i,z,zj,scen)*valPWX(i,z,zj,scen)]
          +vale(z,scen)*SUM[i,valMRGN(i,z,scen)*valPWMG(i,scen)];

*==============================================================================
*    6.4.5.3 Own price elasticity
*==============================================================================
 elas_H(i,z,scen)
         = (valCMIN(i,z,scen)*(1-gamma_LES(i,z)))/valC(i,z,scen) -1 ;

* elas_IND(ene,j,z,scen)$DEO(ene,j,z)
*         = (-1*sigma_ENER(j,z))*(beta_ENER(ene,j,z)**sigma_ENER(j,z))*(B_ENER(j,z)**(sigma_ENER(j,z)-1))*
*           (valPCE(j,z,scen)**sigma_ENER(j,z))*(valP4(ene,j,z,scen)**(-1*sigma_ENER(j,z)-1))*valCE(j,z,scen)*(valP4(ene,j,z,scen)/valDE(ene,j,z,scen));

*==============================================================================
*   6.4.6 Creation of result files
*==============================================================================
*   6.4.6.1 Creation of gdx result file
*==============================================================================
execute_unload 'results_PEP-w-1_v4.0_231218',
 valC
 valCAB
 valCABX
 valCG
 valCI
 valCE
 valCMIN
 valCTH
 valCTH_REAL
 valDD
 valDEP
 valDI
 ValDE
 valDIT
 valDS
 valDS_I
 vale
 valEX
 valEXT
 valG
 valG_REAL
 valGDP_BP
 valGDP_BP_REAL
 valGDP_BP_W
 valGDP_BP_W_REAL
 valGDP_FD
 valGDP_IB
 valGDP_MP
 valGDP_MP_REAL
 valIM
 valIMT
 valINV
 valIT
 valIT_REAL
 valKD
 valKDC
 valKS
 valLD
 valLDC
 valLS
 valMRGN
 valP
 valPT
 valP2
 valPC
 valPCI
 valPCE
 valPD
 valPE
 valPET
 valPIXCON
 valPIXGDP
 valPIXGDP_W
 valPIXGVT
 valPIXINV
 valPK
 valPL
 valPM
 valPMT
 valPP
 valPVA
 valPKLE
 valPWM
 valPWMG
 valPWX
 valQ
 valR
 valRC
* valRK
 valRTI
 valSG
 valSH
 valsh0
 valsh1
 valSROW
 valTCTAX
 valTDH
 valTIC
 valTICT
 valTIK
 valTIKT
 valTIM
 valTIMT
 valTIP
 valTIPT
 valTIW
 valTIWT
 valTIX
 valTIXT
 valTPRCTS
 valTPRODN
 valttdh0
 valttdh1
 valttic
 valttik
 valttim
 valttip
 valttiw
 valttix
 valVA
 valKLE
 valW
 valWC
 valWTI
 valXS
 valXS_I
 valXST
 valYDH
 valYG
 valYH
 valYHK
 valYHL
 valYROW
 FishPMX
 FishQIM
 FishPIM
 FishQEX
 FishPEX
 FishQMX
 FishPMX
 Mvalue
 Xvalue
 POPO
* elas_H
* elas_IND

*==============================================================================
*   6.4.6.2 Creation of xls result file
*==============================================================================
*Execute '=gdx2xls results_PEP-w-1_v4.0_230913.gdx';

*==============================================================================
*   6.4.7 Creation of parameter files
*==============================================================================
execute_unload "Parameters",
 A_K, aij, B_KD, B_LD, B_M1, B_M2, B_VA, B_X1, B_X2, beta_D_X1, beta_EX_X1,
 beta_KD, beta_LD, beta_M1, beta_M2, beta_VA, beta_X2, delta, eta, frisch,
 gamma_GVT, gamma_INV, gamma_LES,
 io,io2,v, v2, tmrg, 
 rho_KD, rho_LD, rho_M1, rho_M2, rho_VA,rho_X1, rho_X2, rho_ENER, rho_KLE,
 sigma_ENER, sigma_KD, sigma_LD, sigma_M1, sigma_M2, sigma_VA, sigma_KLE, sigma_X0, sigma_X1, sigma_X2, sigma_Y
  
*execute '=gdx2xls parameters_PEP-w-1_v4.0_230913.gdx'
;
