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

* This file is included in the program file BAU_SOLVE.gms

*==============================================================================
*   6.2.3 Results
*==============================================================================
*   In this file, values for the BAU scenario are computed and saved
*   for the construction of result tables.

*==============================================================================
*   6.2.3.1 Declaration of parameters to store results
*==============================================================================
PARAMETER

 valA_VA(z,time,scen)        Multifactor productivity
 valC(i,z,time,scen)         Consumption of commodity i by households in region z
 valCAB(z,time,scen)         Current account balance of region z
 valCABX(z,time,scen)        Current account balance or region z in terms of the international currency
 valCG(i,z,time,scen)        Public consumption of commodity i in region z
 valCI(j,z,time,scen)        Total intermediate consumption of industry j in region z
 valCMIN(i,z,time,scen)      Minimum consumption of commodity i by households in region z
 valCTH(z,time,scen)         Consumption budget of households in region z
 valCTH_REAL(z,time,scen)    Real household consumption in region z
 valDD(i,z,time,scen)        Domestic demand for commodity i produced locally in region z
 valDEP(z,time,scen)         Amount of depreciation (capital consumption allowance) in region z
 valDI(i,j,z,time,scen)      Intermediate consumption of commodity i by industry j in region z
 valDIT(i,z,time,scen)       Total intermediate demand of commodity i in region z
 valDS(j,i,z,time,scen)      Supply of inudstry i to the domestic market of region z
 valDS_I(i,z,time,scen)      Supply of commodity j to the domestic market of region z
 vale(z,time,scen)           Exchange rate (price of international currency in terms of region z local currency)
 valEX(i,z,zj,time,scen)     Quantity of product i exported by country z to country zj
 valEXT(i,z,time,scen)       Supply of composite commodity i by region z to the export market
 valG(z,time,scen)           Current government expenditures on goods and services in region z
 ValG_REAL(z,time,scen)      Current real government expenditures on goods and services in region z
 valGDP_BP(z,time,scen)      Region z GDP at basic prices
 valGDP_BP_REAL(z,time,scen) Region z real GDP at basic prices
 valGDP_BP_W(time,scen)      World GDP at basic prices
 valGDP_BP_W_REAL(time,scen) World real GDP at basic prices
 valGDP_FD(z,time,scen)      Region z GDP at purchasers prices from the perspective of final demand
 valGDP_IB(z,time,scen)      Region z GDP at market prices (income-based)
 valGDP_MP(z,time,scen)      Region z GDP at market prices
 valGDP_MP_REAL(z,time,scen) Real GDP at market prices
 valIM(i,zj,z,time,scen)     Quantity of product i imported by country z from country zj
 valIMT(i,z,time,scen)       Quantity demanded of composite imports of commodity i by region z
 valIND(k,j,z,time,scen)     Volume of new type k capital investment to industry j in region z
 valINV(i,z,time,scen)       Final demand of commodity i for investment purposes (GFCF) in region z
 valIR(z,time,scen)          Interest rate
 valIT(z,time,scen)          Total investment expenditures in region z
 valIT_REAL(z,time,scen)     Real gross fixed capital formation
 valKD(k,j,z,time,scen)      Demand for type k capital by industry j in region z
 valKDC(j,z,time,scen)       Demand for composite capital by industry j in region z
 valKS(k,z,time,scen)        Supply of type k capital in region z
 valLD(l,j,z,time,scen)      Demand for type l labor by industry j in region z
 valLDC(j,z,time,scen)       Demand for composite labor by industry j in region z
 valLS(l,z,time,scen)        Supply of type l labor in region z
 valMRGN(i,z,time,scen)      Domestic production of commodity i in region z exported as international margin services
 valP(i,z,time,scen)         Basic price of industry j production in region z
 valPC(i,z,time,scen)        Purchaser price of composite commodity i (including all taxes and margins) in region z
 valPCI(j,z,time,scen)       Intermediate consumption price index of industry j in region z
 valPD(i,z,time,scen)        Price of local product i sold on region z domestic market (including all taxes)
 valPE(i,z,zj,time,scen)     Price received for commodity i exported to region zj by region z (excluding export taxes)
 valPET(i,z,time,scen)       Border price of composite commodity i exported by region z
 valphi(z,time,scen)         Scale variable (allocation of investment to industries)
 valPIXCON(z,time,scen)      Consumer price index in region z
 valPIXGDP(z,time,scen)      GDP deflator in region z
 valPIXGDP_W(time,scen)      World GDP deflator
 valPIXGVT(z,time,scen)      Public expenditures price index in region z
 valPIXINV(z,time,scen)      Investment price index in region z
 valPK(z,time,scen)          Price of new capital in region z
 valPL(i,z,time,scen)        Price of local product i (excluding all taxes on products) in region z
 valPM(i,zj,z,time,scen)     Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 valPMT(i,z,time,scen)       Price of composite commodity i imported by region z (including all taxes duties and margins)
 valPP(j,z,time,scen)        Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 valPVA(j,Z,time,scen)       Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 valPWM(i,zj,z,time,scen)    World price of commodity i imported from country zj by region z (expressed in international currency)
 valPWMG(i,time,scen)        World price of margin i (expressed in international currency)
 valPWX(i,z,zj,time,scen)    World price of commodity i exported to country zj by region z (expressed in international currency)
 valQ(i,z,time,scen)         Quantity demanded of composite commodity i in region z
 valR(k,j,z,time,scen)       Rental rate of type k capital in industry j of region z
 valRC(j,z,time,scen)        Rental rate of industry j composite capital in region z
 valRTI(k,j,z,time,scen)     Rental rate paid by industry j for type k capital in region z including capital taxes
 valSG(z,time,scen)          Government savings in region z
 valSH(z,time,scen)          Household savings in region z
 valsh0(z,time,scen)         Intercept (household savings)
 valsh1(z,time,scen)         Slope (household savings)
 valSROW(z,time,scen)        Rest-of-the-world savings with respect to region z
 valTDH(z,time,scen)         Household income taxes in region z
 valTIC(i,z,time,scen)       Government revenue from indirect taxes on commodity i in region z
 valTICT(z,time,scen)        Total government receipts of indirect taxes on commodities in region z
 valTIK(k,j,z,time,scen)     Government revenue from taxes on type k capital used by industry j in region z
 valTIKT(z,time,scen)        Total government revenue from from taxes on capital in region z
 valTIM(i,zj,z,time,scen)    Government revenue from duties on commodity i imported from region zj by region z
 valTIMT(z,time,scen)        Total government revenue from import duties in region z
 valTIP(j,z,time,scen)       Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 valTIPT(z,time,scen)        Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 valTIW(l,j,z,time,scen)     Government revenue from payroll taxes on type l labor in industry j of region z
 valTIWT(z,time,scen)        Total government revenue from payroll taxes in region z
 valTIX(i,z,zj,time,scen)    Government revenue from export taxes on commodity i exported by region z to region zj
 valTIXT(z,time,scen)        Total government revenue from export taxes in region z
 valTPRCTS(z,time,scen)      Total government revenue from taxes on products and imports in region z
 valTPRODN(z,time,scen)      Total government revenue from other taxes on production in region z
 valttdh0(z,time,scen)       Intercept (household income tax)
 valttdh1(z,time,scen)       Slope (household income tax)
 valttic(i,z,time,scen)      Tax rate on commodity i
 valttik(k,j,z,time,scen)    Tax rate on capital k used in industry j
 valttim(i,zj,z,time,scen)   Rate of taxes and duties on imports of commodity i from country zj
 valttip(j,z,time,scen)      Tax rate on the production of industry j
 valttiw(l,j,z,time,scen)    Tax rate on type l worker compensation in industry j
 valttix(i,z,zj,time,scen)   Export tax rate on exported commodity i
 valU(z,time,scen)           User cost of capital in region z
 valVA(j,z,time,scen)        Value added of industry j in region z
 valW(l,z,time,scen)         Wage rate of type l labor in region z
 valWC(j,z,time,scen)        Wage rate of industry j composite labor in region z
 valWTI(l,j,z,time,scen)     Wage rate paid z by industry j for type l labor in region including payroll taxes
 valXS(j,i,z,time,scen)      Total output of commodity i by industry j in region z
 valXS_I(i,z,time,scen)      Total output of commodity i in region z
 valXST(j,z,time,scen)       Total output of industry j in region z
 valYDH(z,time,scen)         Household disposable income in region z
 valYG(z,time,scen)          Total government income in region z
 valYH(z,time,scen)          Household total income in region z
 valYHK(z,time,scen)         Household capital income in region z
 valYHL(z,time,scen)         Household labor income in region z
 valYROW(z,time,scen)        Rest-of-the-world total income from region z
 
 valEE(product,j,z,time,scen) Industry's energy consumption by regions 
 valNE(product,j,z,time,scen) Non-energy consumption by energy products 
 valEH(product,z,time,scen)   Household energy consumption by energy products
 
 valTFC(product,time,z,scen)  Total final energy consumption by regions
 
 valNEA_TFC(product,time,scen) NEA's total final energy consumption by energy products
 valKOR_TFC(product,time,scen) Korea's total final energy consumption by energy products
 valCHN_TFC(product,time,scen) China's total final energy consumption by energy products
 valJPN_TFC(product,time,scen) Japan's total final energy consumption by energy products

 valCO2I(product,j,z,time,scen)  Industry CO2 emissions by products
 valCO2NE(product,j,z,time,scen) Industry non-energy consumption CO2 emissions by products
 valCO2H(product,z,time,scen)    Household CO2 emission by products  
* valCH4I(product,j,z,time,scen) Industry nitrous oxide emissions by regions
* valCH4H(product,z,time,scen)   Household methane emissions by
* valN2OI(product,j,z,time,scen) Industry nitrous oxide emissions by regions
* valN2OH(product,z,time,scen)   Household Nitrous oxide emission by regions
 
 valCO2I2(j,z,time,scen)  Industry non-energy consumption CO2 emissions by regions
 valCO2NE2(j,z,time,scen) Non-energy consumption CO2 emission by industries and regions

 valTCO2I(z,time,scen)  Total industrial CO2 emission by regions
 valTCO2NE(z,time,scen) Total CO2 emission from non-energy consumption by regions
 valTCO2H(z,time,scen) Household CO2 emission by regions
 
 valTCO2(z,time,scen) Total CO2 emission by regions
 
 valPOWER(power,i,z,time,scen) Economic Output by power plants

 valElecGen(j,z,time,scen) Electricity generation by power plants


*==============================================================================
*Display of changes
*==============================================================================

 d_A_VA(z,time,scen)                'Change of Multifactor productivity [%]'
 d_C(i,z,time,scen)                 'Change of Consumption of commodity i by households in region z [%]'
 d_CAB(z,time,scen)                 'Change of Current account balance of region z [%]'
 d_CABX(z,time,scen)                'Change of Current account balance or region z in terms of the international currency [%]'
 d_CG(i,z,time,scen)                'Change of Public consumption of commodity i in region z [%]'
 d_CI(j,z,time,scen)                'Change of Total intermediate consumption of industry j in region z [%]'
 d_CMIN(i,z,time,scen)              'Change of Minimum consumption of commodity i by households in region z [%]'
 d_CTH(z,time,scen)                 'Change of Consumption budget of households in region z [%]'
 d_CTH_REAL(z,time,scen)            'Change of Real household consumption in region z [%]'
 d_DD(i,z,time,scen)                'Change of Domestic demand for commodity i produced locally in region z [%]'
 d_DEP(z,time,scen)                 'Change of Amount of depreciation (capital consumption allowance) in region z [%]'
 d_DI(i,j,z,time,scen)              'Change of Intermediate consumption of commodity i by industry j in region z [%]'
 d_DIT(i,z,time,scen)               'Change of Total intermediate demand of commodity i in region z [%]'
 d_DS(j,i,z,time,scen)              'Change of Supply of inudstry i to the domestic market of region z [%]'
 d_DS_I(i,z,time,scen)              'Change of Supply of commodity j to the domestic market of region z [%]'
 d_e(z,time,scen)                   'Change of Exchange rate (price of international currency in terms of region z local currency) [%]'
 d_EX(i,z,zj,time,scen)             'Change of Quantity of product i exported by country z to country zj [%]'
 d_EXT(i,z,time,scen)               'Change of Supply of composite commodity i by region z to the export market [%]'
 d_G(z,time,scen)                   'Change of Current government expenditures on goods and services in region z [%]'
 d_G_REAL(z,time,scen)              'Change of Current real government expenditures on goods and services in region z [%]'
 d_GDP_BP(z,time,scen)              'Change of Region z GDP at basic prices [%]'
 d_GDP_BP_REAL(z,time,scen)         'Change of Region z real GDP at basic prices [%]'
 d_GDP_BP_W(time,scen)              'Change of World GDP at basic prices [%]'
 d_GDP_BP_W_REAL(time,scen)         'Change of World real GDP at basic prices [%]'
 d_GDP_FD(z,time,scen)              'Change of Region z GDP at purchasers prices from the perspective of final demand [%]'
 d_GDP_IB(z,time,scen)              'Change of Region z GDP at market prices (income-based) [%]'
 d_GDP_MP(z,time,scen)              'Change of Region z GDP at market prices [%]'
 d_GDP_MP_REAL(z,time,scen)         'Change of Real GDP at market prices [%]'
 d_IM(i,zj,z,time,scen)             'Change of Quantity of product i imported by country z from country zj [%]'
 d_IMT(i,z,time,scen)               'Change of Quantity demanded of composite imports of commodity i by region z [%]'
 d_IND(k,j,z,time,scen)             'Change of Volume of new type k capital investment to industry j in region z [%]'
 d_INV(i,z,time,scen)               'Change of Final demand of commodity i for investment purposes (GFCF) in region z [%]'
 d_IR(z,time,scen)                  'Change of Interest rate [%]'
 d_IT(z,time,scen)                  'Change of Total investment expenditures in region z [%]'
 d_IT_REAL(z,time,scen)             'Change of Real gross fixed capital formation [%]'
 d_KD(k,j,z,time,scen)              'Change of Demand for type k capital by industry j in region z [%]'
 d_KDC(j,z,time,scen)               'Change of Demand for composite capital by industry j in region z [%]'
 d_KS(k,z,time,scen)                'Change of Supply of type k capital in region z [%]'
 d_LD(l,j,z,time,scen)              'Change of Demand for type l labor by industry j in region z [%]'
 d_LDC(j,z,time,scen)               'Change of Demand for composite labor by industry j in region z [%]'
 d_LS(l,z,time,scen)                'Change of Supply of type l labor in region z [%]'
 d_MRGN(i,z,time,scen)              'Change of Domestic production of commodity i in region z exported as international margin services [%]'
 d_P(i,z,time,scen)                 'Change of Basic price of industry j production in region z [%]'
 d_PC(i,z,time,scen)                'Change of Purchaser price of composite commodity i (including all taxes and margins) in region z [%]'
 d_PCI(j,z,time,scen)               'Change of Intermediate consumption price index of industry j in region z [%]'
 d_PD(i,z,time,scen)                'Change of Price of local product i sold on region z domestic market (including all taxes) [%]'
 d_PE(i,z,zj,time,scen)             'Change of Price received for commodity i exported to region zj by region z (excluding export taxes) [%]'
 d_PET(i,z,time,scen)               'Change of Border price of composite commodity i exported by region z [%]'
 d_phi(z,time,scen)                 'Change of Scale variable (allocation of investment to industries) [%]'
 d_PIXCON(z,time,scen)              'Change of Consumer price index in region z [%]'
 d_PIXGDP(z,time,scen)              'Change of GDP deflator in region z [%]'
 d_PIXGDP_W(time,scen)              'Change of World GDP deflator [%]'
 d_PIXGVT(z,time,scen)              'Change of Public expenditures price index in region z [%]'
 d_PIXINV(z,time,scen)              'Change of Investment price index in region z [%]'
 d_PK(z,time,scen)                  'Change of Price of new capital in region z [%]'
 d_PL(i,z,time,scen)                'Change of Price of local product i (excluding all taxes on products) in region z [%]'
 d_PM(i,zj,z,time,scen)             'Change of Price of commodity i imported by region z from region zj (including all taxes duties and margins) [%]'
 d_PMT(i,z,time,scen)               'Change of Price of composite commodity i imported by region z (including all taxes duties and margins) [%]'
 d_PP(j,z,time,scen)                'Change of Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production [%]'
 d_PVA(j,Z,time,scen)               'Change of Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor) [%]'
 d_PWM(i,zj,z,time,scen)            'Change of World price of commodity i imported from country zj by region z (expressed in international currency) [%]'
 d_PWMG(i,time,scen)                'Change of World price of margin i (expressed in international currency) [%]'
 d_PWX(i,z,zj,time,scen)            'Change of World price of commodity i exported to country zj by region z (expressed in international currency) [%]'
 d_Q(i,z,time,scen)                 'Change of Quantity demanded of composite commodity i in region z [%]'
 d_R(k,j,z,time,scen)               'Change of Rental rate of type k capital in industry j of region z [%]'
 d_RC(j,z,time,scen)                'Change of Rental rate of industry j composite capital in region z [%]'
 d_RTI(k,j,z,time,scen)             'Change of Rental rate paid by industry j for type k capital in region z including capital taxes [%]'
 d_SG(z,time,scen)                  'Change of Government savings in region z [%]'
 d_SH(z,time,scen)                  'Change of Household savings in region z [%]'
 d_sh0(z,time,scen)                 'Change of Intercept (household savings) [%]'
 d_sh1(z,time,scen)                 'Change of Slope (household savings) [%]'
 d_SROW(z,time,scen)                'Change of Rest-of-the-world savings with respect to region z [%]'
 d_TDH(z,time,scen)                 'Change of Household income taxes in region z [%]'
 d_TIC(i,z,time,scen)               'Change of Government revenue from indirect taxes on commodity i in region z [%]'
 d_TICT(z,time,scen)                'Change of Total government receipts of indirect taxes on commodities in region z [%]'
 d_TIK(k,j,z,time,scen)             'Change of Government revenue from taxes on type k capital used by industry j in region z [%]'
 d_TIKT(z,time,scen)                'Change of Total government revenue from from taxes on capital in region z [%]'
 d_TIM(i,zj,z,time,scen)            'Change of Government revenue from duties on commodity i imported from region zj by region z [%]'
 d_TIMT(z,time,scen)                'Change of Total government revenue from import duties in region z [%]'
 d_TIP(j,z,time,scen)               'Change of Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor) [%]'
 d_TIPT(z,time,scen)                'Change of Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor) [%]'
 d_TIW(l,j,z,time,scen)             'Change of Government revenue from payroll taxes on type l labor in industry j of region z [%]'
 d_TIWT(z,time,scen)                'Change of Total government revenue from payroll taxes in region z [%]'
 d_TIX(i,z,zj,time,scen)            'Change of Government revenue from export taxes on commodity i exported by region z to region zj [%]'
 d_TIXT(z,time,scen)                'Change of Total government revenue from export taxes in region z [%]'
 d_TPRCTS(z,time,scen)              'Change of Total government revenue from taxes on products and imports in region z [%]'
 d_TPRODN(z,time,scen)              'Change of Total government revenue from other taxes on production in region z [%]'
 d_ttdh0(z,time,scen)               'Change of Intercept (household income tax) [%]'
 d_ttdh1(z,time,scen)               'Change of Slope (household income tax) [%]'
 d_ttic(i,z,time,scen)              'Change of Tax rate on commodity i [%]'
 d_ttik(k,j,z,time,scen)            'Change of Tax rate on capital k used in industry j [%]'
 d_ttim(i,zj,z,time,scen)           'Change of Rate of taxes and duties on imports of commodity i from country zj [%]'
 d_ttip(j,z,time,scen)              'Change of Tax rate on the production of industry j [%]'
 d_ttiw(l,j,z,time,scen)            'Change of Tax rate on type l worker compensation in industry j [%]'
 d_ttix(i,z,zj,time,scen)           'Change of Export tax rate on exported commodity i [%]'
 d_U(z,time,scen)                   'Change of User cost of capital in region z [%]'
 d_VA(j,z,time,scen)                'Change of Value added of industry j in region z [%]'
 d_W(l,z,time,scen)                 'Change of Wage rate of type l labor in region z [%]'
 d_WC(j,z,time,scen)                'Change of Wage rate of industry j composite labor in region z [%]'
 d_WTI(l,j,z,time,scen)             'Change of Wage rate paid z by industry j for type l labor in region including payroll taxes [%]'
 d_XS(j,i,z,time,scen)              'Change of Total output of commodity i by industry j in region z [%]'
 d_XS_I(i,z,time,scen)              'Change of Total output of commodity i in region z [%]'
 d_XST(j,z,time,scen)               'Change of Total output of industry j in region z [%]'
 d_YDH(z,time,scen)                 'Change of Household disposable income in region z [%]'
 d_YG(z,time,scen)                  'Change of Total government income in region z [%]'
 d_YH(z,time,scen)                  'Change of Household total income in region z [%]'
 d_YHK(z,time,scen)                 'Change of Household capital income in region z [%]'
 d_YHL(z,time,scen)                 'Change of Household labor income in region z [%]'
 d_YROW(z,time,scen)                'Change of Rest-of-the-world total income from region z [%]'
 
 d_EE(product,j,z,time,scen)        'Change of Industrys energy consumption by regions z [%]' 
 d_NE(product,j,z,time,scen)        'Change of Non-energy consumption by energy products z [%]' 
 d_EH(product,z,time,scen)          'Change of Household energy consumption by energy products z [%]' 
 d_TFC(product,time,z,scen)         'Change of Total final energy consumption by regions z [%]'
 d_NEA_TFC(product,time,scen)       'Change of NEAs total final energy consumption by energy products z [%]'
 d_KOR_TFC(product,time,scen)       'Change of Koreas total final energy consumption by energy products z [%]'
 d_CHN_TFC(product,time,scen)       'Change of Chinas total final energy consumption by energy products z [%]'
 d_JPN_TFC(product,time,scen)       'Change of Japans total final energy consumption by energy products z [%]'

 d_CO2I(product,j,z,time,scen)      'Change of Industry CO2 emissions by products z [%]'
 d_CO2NE(product,j,z,time,scen)     'Change of Industry non-energy consumption CO2 emissions by products z [%]'
 d_CO2H(product,z,time,scen)        'Change of Household CO2 emission by products z [%]'  
*d_CH4I(product,j,z,time,scen)    'Change of Industry nitrous oxide emissions by regions z [%]'
*d_CH4H(product,z,time,scen)      'Change of Household methane emissions by z [%]'
*d_N2OI(product,j,z,time,scen)    'Change of Industry nitrous oxide emissions by regions z [%]'
*d_N2OH(product,z,time,scen)      'Change of Household Nitrous oxide emission by regions z [%]'
 d_CO2I2(j,z,time,scen)             'Change of Industry non-energy consumption CO2 emissions by regions z [%]'
 d_CO2NE2(j,z,time,scen)            'Change of Non-energy consumption CO2 emission by industries and regions z [%]'
 d_TCO2I(z,time,scen)               'Change of Total industrial CO2 emission by regions z [%]'
 d_TCO2NE(z,time,scen)              'Change of Total CO2 emission from non-energy consumption by regions z [%]'
 d_TCO2H(z,time,scen)               'Change of Household CO2 emission by regions z [%]'
 d_TCO2(z,time,scen)                'Change of Total CO2 emission by regions z [%]'
 d_POWER(power,i,z,time,scen)       'Change of Economic Output by power plants z [%]'
 d_ElecGen(j,z,time,scen)           'Change of Electricity generation by power plants z [%]'

;

*==============================================================================
*   6.2.3.2 Assignment of solution values to result parameters
*==============================================================================

 valA_VA(z,time,'bau')       = A_VA.l(z,time);
 valC(i,z,time,'bau')        = C.l(i,z,time);
 valCAB(z,time,'bau')        = CAB.l(z,time);
 valCABX(z,time,'bau')       = CABX.l(z,time);
 valCG(i,z,time,'bau')       = CG.l(i,z,time);
 valCI(j,z,time,'bau')       = CI.l(j,z,time);
 valCMIN(i,z,time,'bau')     = CMIN.l(i,z,time);
 valCTH(z,time,'bau')        = CTH.l(z,time);
 valCTH_REAL(z,time,'bau')   = CTH_REAL.l(z,time);
 valDD(i,z,time,'bau')       = DD.l(i,z,time);
* valDEP(z,time,'bau')        = DEP.l(z,time);
 valDI(i,j,z,time,'bau')     = DI.l(i,j,z,time);
 valDIT(i,z,time,'bau')      = DIT.l(i,z,time);
 valDS(j,i,z,time,'bau')     = DS.l(j,i,z,time);
 valDS_I(i,z,time,'bau')     = DS_I.l(i,z,time);
 vale(z,time,'bau')          = e.l(z,time);
 valEX(i,z,zj,time,'bau')    = EX.l(i,z,zj,time);
 valEXT(i,z,time,'bau')      = EXT.l(i,z,time);
* valG(z,time,'bau')          = G.l(z,time);
* ValG_REAL(z,time,'bau')     = G_REAL.L(z,time);
 valGDP_BP(z,time,'bau')     = GDP_BP.l(z,time);
 valGDP_BP_REAL(z,time,'bau')= GDP_BP_REAL.l(z,time);
 valGDP_BP_W(time,'bau')     = GDP_BP_W.l(time);
 valGDP_BP_W_REAL(time,'bau')= GDP_BP_W_REAL.l(time);
 valGDP_FD(z,time,'bau')     = GDP_FD.l(z,time);
 valGDP_IB(z,time,'bau')     = GDP_IB.l(z,time);
 valGDP_MP(z,time,'bau')     = GDP_MP.l(z,time);
 valGDP_MP_REAL(z,time,'bau')= GDP_MP_REAL.l(z,time);
 valIM(i,zj,z,time,'bau')    = IM.l(i,zj,z,time);
 valIMT(i,z,time,'bau')      = IMT.l(i,z,time);
 valIND(k,j,z,time,'bau')    = IND.l(k,j,z,time);
 valINV(i,z,time,'bau')      = INV.l(i,z,time);
 valIR(z,time,'bau')         = IR.l(z,time);
 valIT(z,time,'bau')         = IT.l(z,time);
 valIT_REAL(z,time,'bau')    = IT_REAL.l(z,time);
 valKD(k,j,z,time,'bau')     = KD.l(k,j,z,time);
 valKDC(j,z,time,'bau')      = KDC.l(j,z,time);
 valKS(k,z,time,'bau')       = KS.l(k,z,time);
 valLD(l,j,z,time,'bau')     = LD.l(l,j,z,time);
 valLDC(j,z,time,'bau')      = LDC.l(j,z,time);
 valLS(l,z,time,'bau')       = LS.l(l,z,time);
 valMRGN(i,z,time,'bau')     = MRGN.l(i,z,time);
 valP(i,z,time,'bau')        = P.l(i,z,time);
 valPC(i,z,time,'bau')       = PC.l(i,z,time);
 valPCI(j,z,time,'bau')      = PCI.l(j,z,time);
 valPD(i,z,time,'bau')       = PD.l(i,z,time);
 valPE(i,z,zj,time,'bau')    = PE.l(i,z,zj,time);
 valPET(i,z,time,'bau')      = PET.l(i,z,time);
 valphi(z,time,'bau')        = phi.l(z,time);
 valPIXCON(z,time,'bau')     = PIXCON.l(z,time);
 valPIXGDP(z,time,'bau')     = PIXGDP.l(z,time);
 valPIXGDP_W(time,'bau')     = PIXGDP_W.l(time);
* valPIXGVT(z,time,'bau')     = PIXGVT.l(z,time);
 valPIXINV(z,time,'bau')     = PIXINV.l(z,time);
 valPK(z,time,'bau')         = PK.l(z,time);
 valPL(i,z,time,'bau')       = PL.l(i,z,time);
 valPM(i,zj,z,time,'bau')    = PM.l(i,zj,z,time);
 valPMT(i,z,time,'bau')      = PMT.l(i,z,time);
 valPP(j,z,time,'bau')       = PP.l(j,z,time);
 valPVA(j,Z,time,'bau')      = PVA.l(j,Z,time);
 valPWM(i,zj,z,time,'bau')   = PWM.l(i,zj,z,time);
 valPWMG(i,time,'bau')       = PWMG.l(i,time);
 valPWX(i,z,zj,time,'bau')   = PWX.l(i,z,zj,time);
 valQ(i,z,time,'bau')        = Q.l(i,z,time);
 valR(k,j,z,time,'bau')      = R.l(k,j,z,time);
 valRC(j,z,time,'bau')       = RC.l(j,z,time);
 valRTI(k,j,z,time,'bau')    = RTI.l(k,j,z,time);
 valSG(z,time,'bau')         = SG.l(z,time);
 valSH(z,time,'bau')         = SH.l(z,time);
* valsh0(z,time,'bau')        = sh0.l(z,time);
* valsh1(z,time,'bau')        = sh1.l(z,time);
 valSROW(z,time,'bau')       = SROW.l(z,time);
 valTDH(z,time,'bau')        = TDH.l(z,time);
 valTIC(i,z,time,'bau')      = TIC.l(i,z,time);
 valTICT(z,time,'bau')       = TICT.l(z,time);
 valTIK(k,j,z,time,'bau')    = TIK.l(k,j,z,time);
 valTIKT(z,time,'bau')       = TIKT.l(z,time);
 valTIM(i,zj,z,time,'bau')   = TIM.l(i,zj,z,time);
 valTIMT(z,time,'bau')       = TIMT.l(z,time);
 valTIP(j,z,time,'bau')      = TIP.l(j,z,time);
 valTIPT(z,time,'bau')       = TIPT.l(z,time);
 valTIW(l,j,z,time,'bau')    = TIW.l(l,j,z,time);
 valTIWT(z,time,'bau')       = TIWT.l(z,time);
 valTIX(i,z,zj,time,'bau')   = TIX.l(i,z,zj,time);
 valTIXT(z,time,'bau')       = TIXT.l(z,time);
 valTPRCTS(z,time,'bau')     = TPRCTS.l(z,time);
 valTPRODN(z,time,'bau')     = TPRODN.l(z,time);
 valttdh0(z,time,'bau')      = ttdh0.l(z,time);
 valttdh1(z,time,'bau')      = ttdh1.l(z,time);
 valttic(i,z,time,'bau')     = ttic.l(i,z,time);
 valttik(k,j,z,time,'bau')   = ttik.l(k,j,z,time);
 valttim(i,zj,z,time,'bau')  = ttim.l(i,zj,z,time);
 valttip(j,z,time,'bau')     = ttip.l(j,z,time);
 valttiw(l,j,z,time,'bau')   = ttiw.l(l,j,z,time);
 valttix(i,z,zj,time,'bau')  = ttix.l(i,z,zj,time);
 valU(z,time,'bau')          = U.l(z,time);
 valVA(j,z,time,'bau')       = VA.l(j,z,time);
 valW(l,z,time,'bau')        = W.l(l,z,time);
 valWC(j,z,time,'bau')       = WC.l(j,z,time);
 valWTI(l,j,z,time,'bau')    = WTI.l(l,j,z,time);
 valXS(j,i,z,time,'bau')     = XS.l(j,i,z,time);
 valXS_I(i,z,time,'bau')     = XS_I.l(i,z,time);
 valXST(j,z,time,'bau')      = XST.l(j,z,time);
 valYDH(z,time,'bau')        = YDH.l(z,time);
 valYG(z,time,'bau')         = YG.l(z,time);
 valYH(z,time,'bau')         = YH.l(z,time);
 valYHK(z,time,'bau')        = YHK.l(z,time);
 valYHL(z,time,'bau')        = YHL.l(z,time);
 valYROW(z,time,'bau')       = YROW.l(z,time);
 
 valEE(p_coal,j,z,time,'bau') =  EEI(p_coal,j,z)*(AEEI(z,time))*DI.L('02_COAL',j,z,time);
 valEE(p_oil,j,z,time,'bau')  =  EEI(p_oil,j,z)*(AEEI(z,time))*DI.L('03_OIL',j,z,time);
 valEE(p_gas,j,z,time,'bau')  =  EEI(p_gas,j,z)*(AEEI(z,time))*DI.L('04_GAS',j,z,time);
 valEE(p_oilproduct,j,z,time,'bau')  =  EEI(p_oilproduct,j,z)*(AEEI(z,time))*DI.L('10_PETROLCOAL',j,z,time);
 valEE(p_elecheat,j,z,time,'bau')  =  EEI(p_elecheat,j,z)*(AEEI(z,time))*DI.L('18_ELEC',j,z,time);

 valNE(p_coal,j,z,time,'bau') =  NEI(p_coal,j,z)*(AEEI(z,time))*DI.L('02_COAL',j,z,time);
 valNE(p_oil,j,z,time,'bau')  =  NEI(p_oil,j,z)*(AEEI(z,time))*DI.L('03_OIL',j,z,time);
 valNE(p_gas,j,z,time,'bau')  =  NEI(p_gas,j,z)*(AEEI(z,time))*DI.L('04_GAS',j,z,time);
 valNE(p_oilproduct,j,z,time,'bau')  =  NEI(p_oilproduct,j,z)*(AEEI(z,time))*DI.L('10_PETROLCOAL',j,z,time);
 valNE(p_elecheat,j,z,time,'bau')  =  NEI(p_elecheat,j,z)*(AEEI(z,time))*DI.L('18_ELEC',j,z,time);

 valEH(p_coal,z,time,'bau') =  EHI(p_coal,z)*(AEEI(z,time))*C.L('02_COAL',z,time);
 valEH(p_oil,z,time,'bau')  =  EHI(p_oil,z)*(AEEI(z,time))*C.L('03_OIL',z,time);
 valEH(p_gas,z,time,'bau')  =  EHI(p_gas,z)*(AEEI(z,time))*C.L('04_GAS',z,time); 
 valEH(p_oilproduct,z,time,'bau')  =  EHI(p_oilproduct,z)*(AEEI(z,time))*C.L('10_PETROLCOAL',z,time);
 valEH(p_elecheat,z,time,'bau')  =  EHI(p_elecheat,z)*(AEEI(z,time))*C.L('18_ELEC',z,time);

 valCO2I(product,j,z,time,'bau')  = valEE(product,j,z,time,'bau')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 valCO2NE(product,j,z,time,'bau') = valNE(product,j,z,time,'bau')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF')*(1-GHGsEF(product,'Stored_rate')) ;

 valCO2I2(j,z,time,'bau')  = sum(product,valCO2I(product,j,z,time,'bau'));
 valCO2NE2(j,z,time,'bau') = sum(product,valCO2NE(product,j,z,time,'bau'));

 valTCO2I(z,time,'bau') = sum((product,j),valCO2I(product,j,z,time,'bau'));
 valTCO2NE(z,time,'bau') = sum((product,j),valCO2NE(product,j,z,time,'bau'));

 valCO2H(product,z,time,'bau') = valEH(product,z,time,'bau')*41.868*GHGsEF(product,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 valTCO2H(z,time,'bau') = sum((product),valCO2H(product,z,time,'bau'));

 valTCO2(z,time,'bau') =  valTCO2H(z,time,'bau') + valTCO2I(z,time,'bau') +valTCO2NE(z,time,'bau') ;

 valTFC(product,time,z,'bau') = valEH(product,z,time,'bau') + Sum(j5,valEE(product,j5,z,time,'bau'))+Sum(j,valNE(product,j,z,time,'bau'));
 valNEA_TFC(product,time,'bau') = sum(NEA,valEH(product,NEA,time,'bau')) + Sum((j5,NEA),valEE(product,j5,NEA,time,'bau'))+Sum((j,NEA),valNE(product,j,NEA,time,'bau'));

 valKOR_TFC(product,time,'bau') = valEH(product,'01_KOR',time,'bau') + Sum(j5,valEE(product,j5,'01_KOR',time,'bau'))+Sum(j,valNE(product,j,'01_KOR',time,'bau'));
 valCHN_TFC(product,time,'bau') = valEH(product,'02_CHN',time,'bau') + Sum(j5,valEE(product,j5,'02_CHN',time,'bau'))+Sum(j,valNE(product,j,'02_CHN',time,'bau'));
 valJPN_TFC(product,time,'bau') = valEH(product,'03_JPN',time,'bau') + Sum(j5,valEE(product,j5,'03_JPN',time,'bau'))+Sum(j,valNE(product,j,'03_JPN',time,'bau'));

 valPOWER(power,i,z,time,scen)  = XS.l(power,i,z,time);

 valElecGen('19_eNuclear',z,time,'bau') = DS.l('19_eNuclear','18_ELEC',z,time)*EGINucGWh('19_eNuclear',z); 
 valElecGen('20_eCoal',z,time,'bau')    = DS.l('20_eCoal','18_ELEC',z,time)*EGICoalGWh('20_eCoal',z); 
 valElecGen('21_eGas',z,time,'bau')     = DS.l('21_eGas','18_ELEC',z,time)*EGIGasGWh('21_eGas',z); 
 valElecGen('22_eOil',z,time,'bau')     = DS.l('22_eOil','18_ELEC',z,time)*EGIOilGWh('22_eOil',z); 
 valElecGen('23_eWind',z,time,'bau')    = DS.l('23_eWind','18_ELEC',z,time)*EGIWindGWh('23_eWind',z); 
 valElecGen('24_eSolar',z,time,'bau')   = DS.l('24_eSolar','18_ELEC',z,time)*EGISolarGWh('24_eSolar',z); 
 valElecGen('25_eHydro',z,time,'bau')   = DS.l('25_eHydro','18_ELEC',z,time)*EGIHydroGWh('25_eHydro',z); 
 valElecGen('26_eOther',z,time,'bau')   = DS.l('26_eOther','18_ELEC',z,time)*EGIOtherGWh('26_eOther',z); 

*==============================================================================
*  7 (volume) CO2 emission variables
*==============================================================================
* EQ113(product,j,z,t)$CH4IO(product,j,z)..  CH4I(product,j,z,t) =E= EE(product,j,z,t)*41.868*GHGsEF(product,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
* EQ114(product,z,t)$CH4HO(product,z)..  CH4H(product,z,t) =E= EH(product,z,t)*41.868*GHGsEF(product,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
* EQ115(product,j,z,t)$N2OIO(product,j,z)..  N2OI(product,j,z,t) =E= EE(product,j,z,t)*41.868*GHGsEF(product,'N2OEF')*1000*0.000001*GWP('N2OEF') ;
* EQ116(product,z,t)$N2OHO(product,z)..  N2OH(product,z,t) =E= EH(product,z,t)*41.868*GHGsEF(product,'N2OEF')*1000*0.000001*GWP('N2OEF') ;

* valCO2I(product,j,z,time,'bau') = CO2I.L(product,j,z,time);
* valCO2H(product,z,time,'bau')   = CO2H.L(product,z,time);   
* valCH4I(product,j,z,time,'bau') = CH4I.L(product,j,z,time);
* valCH4H(product,z,time,'bau')   = CH4H.L(product,z,time);
* valN2OI(product,j,z,time,'bau') = N2OI.L(product,j,z,time);
* valN2OH(product,z,time,'bau')   = N2OH.L(product,z,time);  

 execute_unload 'Baseline_Results_240125',
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
 ; 