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

model_IAMC
/
 GUIDE-GLOBAL     Guide Global Model
/

variable_IAMC
/
 'Population'
 'Consumption'
 'GDP|MER'
/

year_IAMC
/
 2019, 2025
/

Industry(J)
/
 01_AGRICULT    Agricultural forest and fishery goods
 02_COAL        Coal
 03_OIL         Crude petroleum
 04_GAS         Natural gas Gas distribution
 05_MINING      Mined and quarried goods
 06_FOODPRO     Food beverages and tobacco products
 07_TEXTILES    Textile and leather products
 08_WOODPRO     Wood products
 09_PAPERPRO    Paper products
 10_PETROLCOAL  Petroleum and coal products
 11_CHEMICAL    Chemical products
 12_NONMET      Non-metallic mineral products
 13_IRONSTL     Primary iron and steel products
 14_NONFERR     Non-ferrous metal products
 15_MACHINE     Fabricated metal products Electronic and electrical equipment Machinery and equipment
 16_TRANSEQ     Motor vehicles Other transport equipment
 17_OTHERIND    Other manufactured products Water supply
 18_TnD         Transmission and Distribution
 19_eNuclear    Nuclear generation
 20_eCoal       Coal generation
 21_eGas        Gas generation
 22_eOil        Oil generation
 23_eWind       Wind generation
 24_eSolar      Solar generation
 25_eHydro      Hydro generation
 26_eOther      Other generation
 27_CONSTRUC    Construction
 28_LTRP        Land transport service(road rail)
 29_WTRP        Water transport service
 30_ATRP        Air transport service
 31_SER         Service

/

Commercial_J(J)
/
 28_LTRP        Land transport service(road rail)
 29_WTRP        Water transport service
 30_ATRP        Air transport service
 31_SER         Service
/

Food(I)
/
* 01_AGRICULT     Agricultural forest and fishery goods
 06_FOODPRO      Food beverages and tobacco products
/

Industrial_goods(I)
/
 05_MINING      Mined and quarried goods
 06_FOODPRO     Food beverages and tobacco products
 07_TEXTILES    Textile and leather products
 08_WOODPRO     Wood products
 09_PAPERPRO    Paper products
 10_PETROLCOAL  Petroleum and coal products
 11_CHEMICAL    Chemical products
 12_NONMET      Non-metallic mineral products
 13_IRONSTL     Primary iron and steel products
 14_NONFERR     Non-ferrous metal products
 15_MACHINE     Fabricated metal products Electronic and electrical equipment Machinery and equipment
 16_TRANSEQ     Motor vehicles Other transport equipment
 17_OTHERIND    Other manufactured products Water supply
* 18_ELEC         Electricity
* 19_CONSTRUC     Construction

/

Energy_goods(I)
/
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_GAS          Natural gas Gas distribution
 10_PETROLCOAL   Petroleum and coal products
 18_ELEC         Electricity
/

Services(I)
/
* 20_LTRP         Land transport service(road rail)
* 21_WTRP         Water transport service
* 22_ATRP         Air transport service
 23_SER          Service
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
 valPKLE(j,z,scen)       Price of industry j KLE in region z (including taxes on production directly related to the use of capital and labor)
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
 valCAPSTOCK(z,scen)     Value of Capital stock
*energy
 valEE(product,j,z,scen)   Intermediate energy consumption of commodity i by industry j in region z ktoe
 valNE(product,j,z,scen)   Intermediate non-energy consumption of commodity i by industry j in region z ktoe
 valEH(product,z,scen)     Energy consumption of commodity i by households in region z ktoe
 valCO2I(product,j,z,scen) Industry j CO2 emission in region z ktCO2
 valCO2H(product,z,scen)   Household CO2 emission in region z ktCO2
 valCH4I(product,j,z,scen) Industry j CH4 emission in region z tCO2eq
 valCH4H(product,z,scen)   Household CH4 emission in region z tCO2eq
 valN2OI(product,j,z,scen) Industry j N2O emission in region z tCO2eq
 valN2OH(product,z,scen)   Household N2O emission in region z tCO2eq

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
 valRK(k,z,'bau')        = RKO(k,z);
 valRTI(k,j,z,'bau')     = RTIO(k,j,z);
 valSG(z,'bau')          = SGO(z);
 valSH(z,'bau')          = SHO(z);
 valsh0(z,'bau')         = sh0O(z);
 valsh1(z,'bau')         = sh1O(z);
 valSROW(z,'bau')        = SROWO(z);
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
 valCAPSTOCK(z,'bau')    = KSTO(z);
 valEE(product,j,z,'bau')    = EEO(product,j,z);
 valNE(product,j,z,'bau')    = NEO(product,j,z);
 valEH(product,z,'bau')      = EHO(product,z);
 valCO2I(product,j,z,'bau')  = CO2IO(product,j,z);
 valCO2H(product,z,'bau')    = CO2HO(product,z);
 valCH4I(product,j,z,'bau')  = CH4IO(product,j,z);
 valCH4H(product,z,'bau')    = CH4HO(product,z);
 valN2OI(product,j,z,'bau')  = N2OIO(product,j,z);
 valN2OH(product,z,'bau')    = N2OHO(product,z);

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
 valRK(k,z,'sim')        = RK.l(k,z);
 valRTI(k,j,z,'sim')     = RTI.l(k,j,z);
 valSG(z,'sim')          = SG.l(z);
 valSH(z,'sim')          = SH.l(z);
 valsh0(z,'sim')         = sh0.l(z);
 valsh1(z,'sim')         = sh1.l(z);
 valSROW(z,'sim')        = SROW.l(z);
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
 valEE(product,j,z,'sim')    = EE.l(product,j,z);
 valNE(product,j,z,'sim')    = NE.l(product,j,z);
 valEH(product,z,'sim')      = EH.l(product,z);
 valCO2I(product,j,z,'sim')  = CO2I.l(product,j,z);
 valCO2H(product,z,'sim')    = CO2H.l(product,z);
 valCH4I(product,j,z,'sim')  = CH4IO(product,j,z);
 valCH4H(product,z,'sim')    = CH4HO(product,z);
 valN2OI(product,j,z,'sim')  = N2OIO(product,j,z);
 valN2OH(product,z,'sim')    = N2OHO(product,z);

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
*   6.4.6 Creation of result files
*==============================================================================
*   6.4.6.1 Creation of gdx result file
*==============================================================================
execute_unload 'results_PEP-w-1',
 valC
 valCAB
 valCABX
 valCG
 valCI
 valCMIN
 valCTH
 valCTH_REAL
 valDD
 valDEP
 valDI
 valDIT
 valDS
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
 valPC
 valPCI
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
 valPWM
 valPWMG
 valPWX
 valQ
 valR
 valRC
 valRK
 valRTI
 valSG
 valSH
 valsh0
 valsh1
 valSROW
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
 valW
 valWC
 valWTI
 valXS
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
* valINDE
* valHOHE
* valINDNE
* valHOHNE

*==============================================================================
*   6.4.6.2 Creation of xls result file
*==============================================================================
*Execute '=gdx2xls results_PEP-w-1.gdx';

*==============================================================================
*   6.4.7 Creation of parameter files
*==============================================================================
execute_unload "Parameters",
 A_K, aij, B_KD, B_LD, B_M1, B_M2, B_VA, B_X1, B_X2, beta_D_X1, beta_EX_X1,
 beta_KD, beta_LD, beta_M1, beta_M2, beta_VA, beta_X2, delta, eta, frisch,
 gamma_GVT, gamma_INV, gamma_LES, io, rho_KD, rho_LD, rho_M1, rho_M2, rho_VA,
 rho_X1, rho_X2, sigma_KD, sigma_LD, sigma_M1, sigma_M2, sigma_VA, sigma_X1,
 sigma_X2, sigma_Y, tmrg, v
*execute '=gdx2xls parameters.gdx';

*=======================Reporting IAMC Platform=================================
Parameter
IAMC(model_IAMC,scen,z,*,*,year_IAMC) IAMC Format,
USD2010(z,scen) 2019 to 2010
;

Scalar CF ktoe to Exajoule ;

CF = 0.000041868 ;
USD2010(z,scen) = (valPIXGDP(z,'bau')/valPIXGDP(z,scen))*(DEF2010('2010' ,'USDEF2010')/ DEF2010('2019' ,'USDEF2010'));

*Total population
IAMC(model_IAMC,'BAU',z,'Population','million','2019') = POPO(z);

*total consumption of all goods, by all consumers in a region
IAMC(model_IAMC,'BAU',z,'Consumption','billion US$2010/yr','2019') = sum(i,valDD(i,z,'bau'))*10*USD2010(z,'bau') ;

*GDP at market exchange rate
IAMC(model_IAMC,'BAU',z,'GDP|MER','billion US$2010/yr','2019') = GDPMER(z,'2019')/10**9*(valGDP_FD(z,'bau')/GDP_FDO(z))*USD2010(z,'bau') ;

*GDP at PPP exchange rate
IAMC(model_IAMC,'BAU',z,'GDP|PPP','billion US$2010/yr','2019') = (GDPMER(z,'2019')/10**9*PPPexr(z))*(valGDP_FD(z,'bau')/GDP_FDO(z))*USD2010(z,'bau') ;

*Macroeconomic capital stock
IAMC(model_IAMC,'BAU',z,'Capital Stock','billion US$2010/yr','2019') =  valCAPSTOCK(z,'bau')*10*USD2010(z,'bau') ;

*value added of the agricultural sector
IAMC(model_IAMC,'BAU',z,'Value Added|Agriculture','billion US$2010/yr','2019') = valVA('01_AGRICULT',z,'bau')*10*USD2010(z,'bau') ;

*value added of the commercial sector
IAMC(model_IAMC,'BAU',z,'Value Added|Commercial','billion US$2010/yr','2019') = sum(Commercial_J, valVA(Commercial_J,z,'bau'))*10*USD2010(z,'bau');

*Value Added|Industry
IAMC(model_IAMC,'BAU',z,'Value Added|Industry','billion US$2010/yr','2019') = sum(Industry, valVA(Industry,z,'bau'))*10*USD2010(z,'bau') ;

*value added of the chemical industries.
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Chemicals','billion US$2010/yr','2019') = valVA('11_CHEMICAL',z,'bau')*10*USD2010(z,'bau') ;

*value added of iron and steel production
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Iron and Steel','billion US$2010/yr','2019') = valVA('13_IRONSTL',z,'bau')*10*USD2010(z,'bau') ;

*value added of non-metallic minerals industries
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Metallic Minerals','billion US$2010/yr','2019') = valVA('12_NONMET',z,'bau')*10*USD2010(z,'bau') ;

*value added of the pulp and paper sector
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Pulp and Paper','billion US$2010/yr','2019') = valVA('08_WOODPRO',z,'bau')*10*USD2010(z,'bau') ;

*value added of the non-ferrous metals sector
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2019') = valVA('14_NONFERR',z,'bau')*10*USD2010(z,'bau') ;

*value added of all other industry sectors
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2019') =

IAMC(model_IAMC,'BAU',z,'Value Added|Industry','billion US$2010/yr','2019')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Chemicals','billion US$2010/yr','2019')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Iron and Steel','billion US$2010/yr','2019')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Metallic Minerals','billion US$2010/yr','2019')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Pulp and Paper','billion US$2010/yr','2019')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2019')
;

*production of the agriculture sector
IAMC(model_IAMC,'BAU',z,'Production|Agriculture|Value','billion US$2010/yr','2019') =   (valDS('01_AGRICULT',z,'bau')+ valEXT('01_AGRICULT',z,'bau'))*10*USD2010(z,'bau') ;

*production of the commercial sector
IAMC(model_IAMC,'BAU',z,'Production|Commerical|Value','billion US$2010/yr','2019') =  sum(Commercial_J, valXS(Commercial_J,z,'bau'))*10*USD2010(z,'bau') ;

*production of the industry sector
IAMC(model_IAMC,'BAU',z,'Production|Industry|Value','billion US$2010/yr','2019') =   sum(Industry, valXS(Industry,z,'bau'))*10*USD2010(z,'bau');

*production of chemicals
IAMC(model_IAMC,'BAU',z,'Production|Chemicals|Value','billion US$2010/yr','2019') =  (valDS('11_CHEMICAL',z,'bau')+ valEXT('11_CHEMICAL',z,'bau'))*10*USD2010(z,'bau') ;

*production of steel
IAMC(model_IAMC,'BAU',z,'Production|Iron and Steel|Value','billion US$2010/yr','2019') =  (valDS('13_IRONSTL',z,'bau')+ valEXT('13_IRONSTL',z,'bau'))*10*USD2010(z,'bau') ;

*production of non-metallic minerals
IAMC(model_IAMC,'BAU',z,'Production|Non-Metallic Minerals|Value','billion US$2010/yr','2019') =  (valDS('12_NONMET',z,'bau')+ valEXT('12_NONMET',z,'bau'))*10*USD2010(z,'bau') ;

*production of pulp and paper
IAMC(model_IAMC,'BAU',z,'Production|Pulp and Paper|Value','billion US$2010/yr','2019') =  (valDS('08_WOODPRO',z,'bau')+ valEXT('08_WOODPRO',z,'bau'))*10*USD2010(z,'bau') ;

*production of non-ferrous metals (e.g., aluminum)
IAMC(model_IAMC,'BAU',z,'Production|Non-Ferrous Metals|Value','billion US$2010/yr','2019') =  (valDS('14_NONFERR',z,'bau')+ valEXT('14_NONFERR',z,'bau'))*10*USD2010(z,'bau') ;

*production of other industry products
IAMC(model_IAMC,'BAU',z,'Production|Other Sector|Value','billion US$2010/yr','2019') =
IAMC(model_IAMC,'BAU',z,'Production|Industry|Value','billion US$2010/yr','2019')
-IAMC(model_IAMC,'BAU',z,'Production|Chemicals|Value','billion US$2010/yr','2019')
-IAMC(model_IAMC,'BAU',z,'Production|Iron and Steel|Value','billion US$2010/yr','2019')
-IAMC(model_IAMC,'BAU',z,'Production|Non-Metallic Minerals|Value','billion US$2010/yr','2019')
-IAMC(model_IAMC,'BAU',z,'Production|Pulp and Paper|Value','billion US$2010/yr','2019')
-IAMC(model_IAMC,'BAU',z,'Production|Non-Ferrous Metals|Value','billion US$2010/yr','2019')
;

*total government expenditure
IAMC(model_IAMC,'BAU',z,'Expenditure|Government','billion US$2010/yr','2019') = valG(z,'bau')*10*USD2010(z,'bau') ;

*government revenue
*IAMC(model_IAMC,'BAU',z,'Revenue|government','billion US$2010/yr','2019') =  ;

*government revenue from taxes
*IAMC(model_IAMC,'BAU',z,'Revenue|government|Tax','billion US$2010/yr','2019') =  ;

*Total household expenditure
IAMC(model_IAMC,'BAU',z,'Expenditure|Household','billion US$2010/yr','2019') = sum(i,valC(i,z,'bau'))*10*USD2010(z,'bau') ;

*Expenditure of households for industrial goods
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Industry','billion US$2010/yr','2019') = sum(Industrial_goods,valC(Industrial_goods,z,'bau'))*10*USD2010(z,'bau') ;

*Expenditure of households for energy
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Energy','billion US$2010/yr','2019') = sum(Energy_goods,valC(Energy_goods,z,'bau'))*10*USD2010(z,'bau');

*Expenditure of households for food
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Food','billion US$2010/yr','2019') = sum(Food,valC(Food,z,'bau'))*10*USD2010(z,'bau') ;

*Expenditure of households for services
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Services','billion US$2010/yr','2019') = sum(Services,valC(Services,z,'bau'))*10*USD2010(z,'bau') ;

*Total exports measured in monetary quantities.
IAMC(model_IAMC,'BAU',z,'Export','billion US$2010/yr','2019') = sum((i,zj),valEX(i,z,zj,'bau'))*10*USD2010(z,'bau') ;
*valEX(i,z,zj,'bau') Quantity of product i exported by country z to country zj

*Total imports measured in monetary quantities.
IAMC(model_IAMC,'BAU',z,'Import','billion US$2010/yr','2019') = sum((i,zj),valIM(i,zj,z,'bau'))*10*USD2010(z,'bau') ;
*valIM(i,zj,z,scen) Quantity of product i imported by country z from country zj

*Weighted trade tariff-average (regional and global indicator relevant)
IAMC(model_IAMC,'BAU',z,'Tariffs|Average','%','2019') =  [sum((i,zj),valTIM(i,zj,z,'bau'))/ sum((i,zj),valIM(i,zj,z,'bau'))]*100;

*CO2 emission
IAMC(model_IAMC,'BAU',z,'Emissions|CO2|Energy|Demand|Residential and Commercial','Mt CO2/yr','2019')  = {sum(product, valCO2I(product,'31_SER',z,'bau') +  valCO2H(product,z,'bau'))}/1000 ;
*IAMC(model_IAMC,'BAU',z,'Emissions|CO2|Energy|Demand|Residential and Commercial|Commercial','Mt CO2/yr','2019')  = {sum(product, valCO2I(product,'31_SER',z,'bau') +  valCO2H(product,z,'bau'))}/1000 ;


*CH4 emission
IAMC(model_IAMC,'BAU',z,'Emissions|CH4|Energy|Demand|Residential and Commercial','Mt CH4/yr','2019') = {sum(product, valCH4I(product,'31_SER',z,'bau') +  valCH4H(product,z,'bau'))}/1000000/GWP('CH4EF') ;

*N2O emission
IAMC(model_IAMC,'BAU',z,'Emissions|N2O|Energy|Demand|Residential and Commercial','kt N2O/yr','2019') = {sum(product, valN2OI(product,'31_SER',z,'bau') +  valN2OH(product,z,'bau'))}/1000000/GWP('N2OEF')*1000 ;

*Final energy
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial','EJ/yr','2019') = { sum((p_ftotal),valEE(p_ftotal,'31_SER',z,'BAU')) + sum(p_ftotal, valEH(p_ftotal,z,'BAU'))}*CF ;

IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Electricity','EJ/yr','2019')   = {valEE('p63_ELECTR','31_SER',z,'BAU') + valEH('p63_ELECTR',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases','EJ/yr','2019')         = {sum(p_gas, valEE(p_gas,'31_SER',z,'BAU') + valEH(p_gas,z,'BAU'))}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Heat','EJ/yr','2019')          = {valEE('p64_HEAT','31_SER',z,'BAU') + valEH('p64_HEAT',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids','EJ/yr','2019')        = {sum(p_coal, valEE(p_coal,'31_SER',z,'BAU') + valEH(p_coal,z,'BAU'))}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids','EJ/yr','2019')       = {sum(p_liquid, valEE(p_liquid,'31_SER',z,'BAU') + valEH(p_liquid,z,'BAU'))}*CF ;

*Solids
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|ANTCOAL','EJ/yr','2019') = {valEE('p3_ANTCOAL','31_SER',z,'BAU') + valEH('p3_ANTCOAL',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|COKCOAL','EJ/yr','2019') = {valEE('p4_COKCOAL','31_SER',z,'BAU') + valEH('p4_COKCOAL',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|BITCOAL','EJ/yr','2019') = {valEE('p5_BITCOAL','31_SER',z,'BAU') + valEH('p5_BITCOAL',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|SUBCOAL','EJ/yr','2019') = {valEE('p6_SUBCOAL','31_SER',z,'BAU') + valEH('p6_SUBCOAL',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|LIGNITE','EJ/yr','2019') = {valEE('p7_LIGNITE','31_SER',z,'BAU') + valEH('p7_LIGNITE',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|BKB','EJ/yr','2019')     = {valEE('p12_BKB','31_SER',z,'BAU') + valEH('p12_BKB',z,'BAU')}*CF ;

*Gases
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|GASWKSGS','EJ/yr','2019') = {valEE('p13_GASWKSGS','31_SER',z,'BAU') + valEH('p13_GASWKSGS',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|NATGAS','EJ/yr','2019')   = {valEE('p20_NATGAS','31_SER',z,'BAU') + valEH('p20_NATGAS',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|NGL','EJ/yr','2019')      = {valEE('p23_NGL','31_SER',z,'BAU') + valEH('p23_NGL',z,'BAU')}*CF ;

*Liquids - energy
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|LPG','EJ/yr','2019')           = {valEE('p29_LPG','31_SER',z,'BAU') +  valEH('p29_LPG',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIOGASO','EJ/yr','2019')    = {valEE('p30_NONBIOGASO','31_SER',z,'BAU') +  valEH('p30_NONBIOGASO',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|AVGAS','EJ/yr','2019')         = {valEE('p31_AVGAS','31_SER',z,'BAU') +  valEH('p31_AVGAS',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|JETGAS','EJ/yr','2019')        = {valEE('p32_JETGAS','31_SER',z,'BAU') +  valEH('p32_JETGAS',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIOJETK','EJ/yr','2019')    = {valEE('p33_NONBIOJETK','31_SER',z,'BAU')+  valEH('p33_NONBIOJETK',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|OTHKERO','EJ/yr','2019')       = {valEE('p34_OTHKERO','31_SER',z,'BAU') +  valEH('p34_OTHKERO',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIODIES','EJ/yr','2019')    = {valEE('p35_NONBIODIES','31_SER',z,'BAU') +  valEH('p35_NONBIODIES',z,'BAU')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|RESFUEL','EJ/yr','2019')       = {valEE('p36_RESFUEL','31_SER',z,'BAU') +  valEH('p36_RESFUEL',z,'BAU')}*CF ;

*==========================Sim=================================

*Total population
IAMC(model_IAMC,'BAU',z,'Population','million','2025') = POPO(z);

*total consumption of all goods, by all consumers in a region
IAMC(model_IAMC,'BAU',z,'Consumption','billion US$2010/yr','2025') = sum(i,valDD(i,z,'sim'))*10*USD2010(z,'sim') ;

*GDP at market exchange rate
IAMC(model_IAMC,'BAU',z,'GDP|MER','billion US$2010/yr','2025') = GDPMER(z,'2019')/10**9*(valGDP_FD(z,'sim')/GDP_FDO(z))*USD2010(z,'sim') ;

*GDP at PPP exchange rate
IAMC(model_IAMC,'BAU',z,'GDP|PPP','billion US$2010/yr','2025') = (GDPMER(z,'2019')/10**9*PPPexr(z))*(valGDP_FD(z,'sim')/GDP_FDO(z))*USD2010(z,'sim') ;

*Macroeconomic capital stock
IAMC(model_IAMC,'BAU',z,'Capital Stock','billion US$2010/yr','2025') =  valCAPSTOCK(z,'sim')*10*USD2010(z,'sim') ;

*value added of the agricultural sector
IAMC(model_IAMC,'BAU',z,'Value Added|Agriculture','billion US$2010/yr','2025') = valVA('01_AGRICULT',z,'sim')*10*USD2010(z,'sim') ;

*value added of the commercial sector
IAMC(model_IAMC,'BAU',z,'Value Added|Commercial','billion US$2010/yr','2025') = sum(Commercial_J, valVA(Commercial_J,z,'sim'))*10*USD2010(z,'sim') ;

*Value Added|Industry
IAMC(model_IAMC,'BAU',z,'Value Added|Industry','billion US$2010/yr','2025') = sum(Industry, valVA(Industry,z,'sim'))*10*USD2010(z,'sim') ;

*value added of the chemical industries.
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Chemicals','billion US$2010/yr','2025') = valVA('11_CHEMICAL',z,'sim')*10*USD2010(z,'sim') ;

*value added of iron and steel production
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Iron and Steel','billion US$2010/yr','2025') = valVA('13_IRONSTL',z,'sim')*10*USD2010(z,'sim') ;

*value added of non-metallic minerals industries
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Metallic Minerals','billion US$2010/yr','2025') = valVA('12_NONMET',z,'sim')*10*USD2010(z,'sim') ;

*value added of the pulp and paper sector
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Pulp and Paper','billion US$2010/yr','2025') = valVA('08_WOODPRO',z,'sim')*10*USD2010(z,'sim') ;

*value added of the non-ferrous metals sector
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2025') = valVA('14_NONFERR',z,'sim')*10*USD2010(z,'sim') ;

*value added of all other industry sectors
IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2025') =

IAMC(model_IAMC,'BAU',z,'Value Added|Industry','billion US$2010/yr','2025')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Chemicals','billion US$2010/yr','2025')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Iron and Steel','billion US$2010/yr','2025')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Metallic Minerals','billion US$2010/yr','2025')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Pulp and Paper','billion US$2010/yr','2025')
- IAMC(model_IAMC,'BAU',z,'Value Added|Industry|Non-Ferrous metals','billion US$2010/yr','2025')
;

*production of the agriculture sector
IAMC(model_IAMC,'BAU',z,'Production|Agriculture|Value','billion US$2010/yr','2025') =   (valDS('01_AGRICULT',z,'sim')+ valEXT('01_AGRICULT',z,'sim'))*10*USD2010(z,'sim') ;

*production of the commercial sector
IAMC(model_IAMC,'BAU',z,'Production|Commerical|Value','billion US$2010/yr','2025') =  sum(Commercial_J, valXS(Commercial_J,z,'sim'))*10*USD2010(z,'sim') ;

*production of the industry sector
IAMC(model_IAMC,'BAU',z,'Production|Industry|Value','billion US$2010/yr','2025') =   sum(Industry, valXS(Industry,z,'sim'))*10*USD2010(z,'sim');

*production of chemicals
IAMC(model_IAMC,'BAU',z,'Production|Chemicals|Value','billion US$2010/yr','2025') =  (valDS('11_CHEMICAL',z,'sim')+ valEXT('11_CHEMICAL',z,'sim'))*10*USD2010(z,'sim') ;

*production of steel
IAMC(model_IAMC,'BAU',z,'Production|Iron and Steel|Value','billion US$2010/yr','2025') =  (valDS('13_IRONSTL',z,'sim')+ valEXT('13_IRONSTL',z,'sim'))*10*USD2010(z,'sim') ;

*production of non-metallic minerals
IAMC(model_IAMC,'BAU',z,'Production|Non-Metallic Minerals|Value','billion US$2010/yr','2025') =  (valDS('12_NONMET',z,'sim')+ valEXT('12_NONMET',z,'sim'))*10*USD2010(z,'sim') ;

*production of pulp and paper
IAMC(model_IAMC,'BAU',z,'Production|Pulp and Paper|Value','billion US$2010/yr','2025') =  (valDS('08_WOODPRO',z,'sim')+ valEXT('08_WOODPRO',z,'sim'))*10*USD2010(z,'sim') ;

*production of non-ferrous metals (e.g., aluminum)
IAMC(model_IAMC,'BAU',z,'Production|Non-Ferrous Metals|Value','billion US$2010/yr','2025') =  (valDS('14_NONFERR',z,'sim')+ valEXT('14_NONFERR',z,'sim'))*10*USD2010(z,'sim') ;

*production of other industry products
IAMC(model_IAMC,'BAU',z,'Production|Other Sector|Value','billion US$2010/yr','2025') =
IAMC(model_IAMC,'BAU',z,'Production|Industry|Value','billion US$2010/yr','2025')
-IAMC(model_IAMC,'BAU',z,'Production|Chemicals|Value','billion US$2010/yr','2025')
-IAMC(model_IAMC,'BAU',z,'Production|Iron and Steel|Value','billion US$2010/yr','2025')
-IAMC(model_IAMC,'BAU',z,'Production|Non-Metallic Minerals|Value','billion US$2010/yr','2025')
-IAMC(model_IAMC,'BAU',z,'Production|Pulp and Paper|Value','billion US$2010/yr','2025')
-IAMC(model_IAMC,'BAU',z,'Production|Non-Ferrous Metals|Value','billion US$2010/yr','2025')
;

*total government expenditure
IAMC(model_IAMC,'BAU',z,'Expenditure|Government','billion US$2010/yr','2025') = valG(z,'sim')*10*USD2010(z,'sim') ;

*government revenue
*IAMC(model_IAMC,'BAU',z,'Revenue|government','billion US$2010/yr','2025') =  ;

*government revenue from taxes
*IAMC(model_IAMC,'BAU',z,'Revenue|government|Tax','billion US$2010/yr','2025') =  ;

*Total household expenditure
IAMC(model_IAMC,'BAU',z,'Expenditure|Household','billion US$2010/yr','2025') = sum(i,valC(i,z,'sim'))*10*USD2010(z,'sim') ;

*Expenditure of households for industrial goods
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Industry','billion US$2010/yr','2025') = sum(Industrial_goods,valC(Industrial_goods,z,'sim'))*10*USD2010(z,'sim') ;

*Expenditure of households for energy
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Energy','billion US$2010/yr','2025') = sum(Energy_goods,valC(Energy_goods,z,'sim'))*10*USD2010(z,'sim') ;

*Expenditure of households for food
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Food','billion US$2010/yr','2025') = sum(Food,valC(Food,z,'sim'))*10*USD2010(z,'sim') ;

*Expenditure of households for services
IAMC(model_IAMC,'BAU',z,'Expenditure|household|Services','billion US$2010/yr','2025') = sum(Services,valC(Services,z,'sim'))*10*USD2010(z,'sim') ;

*Total exports measured in monetary quantities.
IAMC(model_IAMC,'BAU',z,'Export','billion US$2010/yr','2025') = sum((i,zj),valEX(i,z,zj,'sim'))*10*USD2010(z,'sim') ;
*valEX(i,z,zj,'sim') Quantity of product i exported by country z to country zj

*Total imports measured in monetary quantities.
IAMC(model_IAMC,'BAU',z,'Import','billion US$2010/yr','2025') = sum((i,zj),valIM(i,zj,z,'sim'))*10*USD2010(z,'sim') ;
*valIM(i,zj,z,scen) Quantity of product i imported by country z from country zj

*Weighted trade tariff-average (regional and global indicator relevant)
IAMC(model_IAMC,'BAU',z,'Tariffs|Average','%','2025') =  [sum((i,zj),valTIM(i,zj,z,'sim'))/ sum((i,zj),valIM(i,zj,z,'sim'))]*100;

*CO2 emission
IAMC(model_IAMC,'BAU',z,'Emissions|CO2|Energy|Demand|Residential and Commercial','Mt CO2/yr','2025') = {sum(product, valCO2I(product,'31_SER',z,'sim') +  valCO2H(product,z,'sim'))}/1000 ;

*CH4 emission
IAMC(model_IAMC,'BAU',z,'Emissions|CH4|Energy|Demand|Residential and Commercial','Mt CH4/yr','2025') = {sum(product, valCH4I(product,'31_SER',z,'sim') +  valCH4H(product,z,'sim'))}/1000000/GWP('CH4EF') ;

*N2O emission
IAMC(model_IAMC,'BAU',z,'Emissions|N2O|Energy|Demand|Residential and Commercial','kt N2O/yr','2025') = {sum(product, valN2OI(product,'31_SER',z,'sim') +  valN2OH(product,z,'sim'))}/1000000/GWP('N2OEF')*1000 ;

*Final energy
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial','EJ/yr','2025') = { sum((p_ftotal),valEE(p_ftotal,'31_SER',z,'sim')) + sum(p_ftotal, valEH(p_ftotal,z,'sim'))}*CF ;

IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Electricity','EJ/yr','2025')   = {valEE('p63_ELECTR','31_SER',z,'sim') + valEH('p63_ELECTR',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases','EJ/yr','2025')         = {sum(p_gas, valEE(p_gas,'31_SER',z,'sim') + valEH(p_gas,z,'sim'))}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Heat','EJ/yr','2025')          = {valEE('p64_HEAT','31_SER',z,'sim') + valEH('p64_HEAT',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids','EJ/yr','2025')        = {sum(p_coal, valEE(p_coal,'31_SER',z,'sim') + valEH(p_coal,z,'sim'))}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids','EJ/yr','2025')       = {sum(p_liquid, valEE(p_liquid,'31_SER',z,'sim') + valEH(p_liquid,z,'sim'))}*CF ;

*Solids
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|ANTCOAL','EJ/yr','2025') = {valEE('p3_ANTCOAL','31_SER',z,'sim') + valEH('p3_ANTCOAL',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|COKCOAL','EJ/yr','2025') = {valEE('p4_COKCOAL','31_SER',z,'sim') + valEH('p4_COKCOAL',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|BITCOAL','EJ/yr','2025') = {valEE('p5_BITCOAL','31_SER',z,'sim') + valEH('p5_BITCOAL',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|SUBCOAL','EJ/yr','2025') = {valEE('p6_SUBCOAL','31_SER',z,'sim') + valEH('p6_SUBCOAL',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|LIGNITE','EJ/yr','2025') = {valEE('p7_LIGNITE','31_SER',z,'sim') + valEH('p7_LIGNITE',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Solids|BKB','EJ/yr','2025')     = {valEE('p12_BKB','31_SER',z,'sim') + valEH('p12_BKB',z,'sim')}*CF ;

*Gases
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|GASWKSGS','EJ/yr','2025') = {valEE('p13_GASWKSGS','31_SER',z,'sim') + valEH('p13_GASWKSGS',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|NATGAS','EJ/yr','2025')   = {valEE('p20_NATGAS','31_SER',z,'sim') + valEH('p20_NATGAS',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Gases|NGL','EJ/yr','2025')      = {valEE('p23_NGL','31_SER',z,'sim') + valEH('p23_NGL',z,'sim')}*CF ;

*Liquids - energy
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|LPG','EJ/yr','2025')           = {valEE('p29_LPG','31_SER',z,'sim') +  valEH('p29_LPG',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIOGASO','EJ/yr','2025')    = {valEE('p30_NONBIOGASO','31_SER',z,'sim') +  valEH('p30_NONBIOGASO',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|AVGAS','EJ/yr','2025')         = {valEE('p31_AVGAS','31_SER',z,'sim') +  valEH('p31_AVGAS',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|JETGAS','EJ/yr','2025')        = {valEE('p32_JETGAS','31_SER',z,'sim') +  valEH('p32_JETGAS',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIOJETK','EJ/yr','2025')    = {valEE('p33_NONBIOJETK','31_SER',z,'sim')+  valEH('p33_NONBIOJETK',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|OTHKERO','EJ/yr','2025')       = {valEE('p34_OTHKERO','31_SER',z,'sim') +  valEH('p34_OTHKERO',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|NONBIODIES','EJ/yr','2025')    = {valEE('p35_NONBIODIES','31_SER',z,'sim') +  valEH('p35_NONBIODIES',z,'sim')}*CF ;
IAMC(model_IAMC,'BAU',z,'Final Energy|Residential and Commercial|Liquids|RESFUEL','EJ/yr','2025')       = {valEE('p36_RESFUEL','31_SER',z,'sim') +  valEH('p36_RESFUEL',z,'sim')}*CF ;

execute_unload 'Result_IAMC',
 IAMC
 valC
 valCAB
 valCABX
 valCG
 valCI
 valCMIN
 valCTH
 valCTH_REAL
 valDD
 valDEP
 valDI
 valDIT
 valDS
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
 valPC
 valPCI
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
 valPWM
 valPWMG
 valPWX
 valQ
 valR
 valRC
 valRK
 valRTI
 valSG
 valSH
 valsh0
 valsh1
 valSROW
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
 valW
 valWC
 valWTI
 valXS
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
 valEE
 valEH
;
