$TITLE     PEP model w-t
$STITLE    World wide model, static version, October 2013

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

* NOTE: section and subsection titles of the program are preceded and followed
*       by this line:
*==============================================================================
*       to facilitate jumping from one to the next with repeat search.

*==============================================================================
* 1 Set definition
*==============================================================================
* The sets are defined in the DATA_AGG-2007.gms file and are stored in the
* DATA_AGG-2007.GDX output file. Any changes in the aggregation of industries
* and/or region is thus automatically taken into account in the current file.
SET
 J               All industries
 I               All commodities
 I1(I)           All commodities except agriculture (agr)
 BUS(J)          Private industries
 PUB(J)          Public industries
 F               Production factors
 L(F)            Labor categories
 K(F)            Capital categories
 Z               Regions
 ZR(Z)           Reference country (USA)
 Z1(Z)           All regions except reference region
 Zrich(Z)        Rich regions
 Zother(Z)       Non-rich regions

$GDXIN Input_w-t/DATA_AGG-2019_240125_w-t.gdx
$LOAD J, I, I1, BUS, PUB, F, L, K, Z, ZR, Z1, Zrich, Zother

TND(J) TnD
/
 18_TnD         Transmission and Distribution
/

POWER(J) POWER industries
/
 19_eNuclear    Nuclear generation
 20_eCoal       Coal generation
 21_eGas        Gas generation
 22_eOil        Oil generation
 23_eWind       Wind generation
 24_eSolar      Solar generation
 25_eHydro      Hydro generation
 26_eOther      Other generation
/

I2(I) Non-electricity commodities
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
* 18_ELEC        Electricity
 19_CONSTRUC    Construction
 20_LTRP        Land transport service(road rail)
 21_WTRP        Water transport service
 22_ATRP        Air transport service
 23_SER         Service
/

ENE(I) Energy commodities
/
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_GAS         Natural gas
 10_PETROLCOAL   Petroleum and coal products
 18_ELEC         Electricity
/

NENE(I) Non-energy commodities
/
 01_AGRICULT    Agricultural forest and fishery goods
* 02_COAL        Coal
* 03_OIL         Crude petroleum
* 04_GAS         Natural gas Gas distribution
 05_MINING      Mined and quarried goods
 06_FOODPRO     Food beverages and tobacco products
 07_TEXTILES    Textile and leather products
 08_WOODPRO     Wood products
 09_PAPERPRO    Paper products
* 10_PETROLCOAL  Petroleum and coal products
 11_CHEMICAL    Chemical products
 12_NONMET      Non-metallic mineral products
 13_IRONSTL     Primary iron and steel products
 14_NONFERR     Non-ferrous metal products
 15_MACHINE     Fabricated metal products Electronic and electrical equipment Machinery and equipment
 16_TRANSEQ     Motor vehicles Other transport equipment
 17_OTHERIND    Other manufactured products Water supply
* 18_ELEC        Electricity
 19_CONSTRUC    Construction
 20_LTRP        Land transport service(road rail)
 21_WTRP        Water transport service
 22_ATRP        Air transport service
 23_SER         Service
/

J2(J) Industries
/
 01_AGRICULT    Agricultural forest and fishery goods
* 02_COAL        Coal
* 03_OIL         Crude petroleum
* 04_GAS         Natural gas Gas distribution
* 05_MINING      Mined and quarried goods
 06_FOODPRO     Food beverages and tobacco products
 07_TEXTILES    Textile and leather products
 08_WOODPRO     Wood products
 09_PAPERPRO    Paper products
* 10_PETROLCOAL  Petroleum and coal products
 11_CHEMICAL    Chemical products
 12_NONMET      Non-metallic mineral products
 13_IRONSTL     Primary iron and steel products
 14_NONFERR     Non-ferrous metal products
 15_MACHINE     Fabricated metal products Electronic and electrical equipment Machinery and equipment
 16_TRANSEQ     Motor vehicles Other transport equipment
 17_OTHERIND    Other manufactured products Water supply
* 18_TnD         Transmission and Distribution
* 19_eNuclear    Nuclear generation
* 20_eCoal       Coal generation
* 21_eGas        Gas generation
* 22_eOil        Oil generation
* 23_eWind       Wind generation
* 24_eSolar      Solar generation
* 25_eHydro      Hydro generation
* 26_eOther      Other generation
 27_CONSTRUC    Construction
 28_LTRP        Land transport service(road rail)
 29_WTRP        Water transport service
 30_ATRP        Air transport service
 31_SER         Service
/

J3(J) Energy Industries
/
 02_COAL        Coal
 03_OIL         Crude petroleum
 04_GAS         Natural gas Gas distribution
 05_MINING      Mined and quarried goods
 10_PETROLCOAL  Petroleum and coal products
 18_TnD         Transmission and Distribution
 19_eNuclear    Nuclear generation
 20_eCoal       Coal generation
 21_eGas        Gas generation
 22_eOil        Oil generation
 23_eWind       Wind generation
 24_eSolar      Solar generation
 25_eHydro      Hydro generation
 26_eOther      Other generation
* 27_CONSTRUC    Construction
* 28_LTRP        Land transport service(road rail)
* 29_WTRP        Water transport service
* 30_ATRP        Air transport service
* 31_SER         Service
/

Z2(Z)
/
 01_KOR Korea
 02_CHN China
 03_JPN Japan
 04_RUS Russian Federation
 05_MNG Mongolia
 06_PRK Peoples Republic of Korea
* 07_NAM North America
* 08_LAM Latin America and the Caribbean
* 09_WEU Western Europe
* 10_EEU Central and Eastern Europe
* 11_FSU Former Soviet Union
* 12_MEA Middle East and North Africa
* 13_AFR Sub-Saharan Africa
* 14_CPA Centrally Planned Asia and China
* 15_SAS South Asia
* 16_PAS Other Pacific Asia
* 17_PAO Pacific OECD
/

Z3(Z)
/
 01_KOR Korea
 02_CHN China
 03_JPN Japan
 04_RUS Russian Federation
 05_MNG Mongolia
 06_PRK Peoples Republic of Korea
* 07_NAM North America
* 08_LAM Latin America and the Caribbean
* 09_WEU Western Europe
* 10_EEU Central and Eastern Europe
* 11_FSU Former Soviet Union
* 12_MEA Middle East and North Africa
* 13_AFR Sub-Saharan Africa
* 14_CPA Centrally Planned Asia and China
* 15_SAS South Asia
* 16_PAS Other Pacific Asia
* 17_PAO Pacific OECD
/

*==============================================================================
*  Periods
*==============================================================================
* The set TIME is the period of time for which we have projections for GDP,
* population and economically active population .
TIME Time periods
/
*2019*2020
2019*2050

/
T(time)
T1(time)         First period;
T1(time)         = yes$[ord(time) eq 1];

*===============================================================================

ALIAS (j,jj)
ALIAS (i,ii,ij)
ALIAS (l,lj)
ALIAS (k,kj)
ALIAS (z,zj,zjj)
ALIAS (power, power2)
AlIAS (ENE,ENE2)
AlIAS (bus,bus2)
;

*$EXIT

*==============================================================================
* 2 Declaration of parameters and benchmark variables
*==============================================================================
PARAMETER
*==============================================================================
*  2.1 Parameters
*==============================================================================
 A_K(z)               Scale parameter (investment function)
 aij(i,j,z)           Input output coefficient
 aij2(i,j,z)          Input output coefficient (intermediate energy)
 B_KD(j,z)            Scale parameter (CES - composite capital)
 B_LD(j,z)            Scale parameter (CES - composite labor)
 B_M1(i,z)            Scale parameter (CES - composite commodity)
 B_M2(i,z)            Scale parameter (CES - composite import)
 B_VA(j,z)            Scale parameter (CES - value added)
 B_KLE(j,z)           Scale parameter (CES - composite KLE)
 B_ENER(j,z)          Scale parameter (CES - composite ENER)
 B_X1(i,z)            Scale parameter (CET - total output)
 B_X2(i,z)            Scale parameter (CET - composite export)
 B_X3(i,z)            Scale parameter (CES - top level)
 B_X4(z)              Scale parameter (CES - Aggregated Electricity)
 beta_D_X1(i,z)       Share parameter (CET - total output - local sales)
 beta_EX_X1(i,z)      Share parameter (CET - total output - export)
 beta_X2(i,z,zj)      Share parameter (CET - composite export)
 beta_X3(j,i,z)       Share parameter (CES - top level)
 beta_X4(power, z)    Share parameter (CES - Aggregated Electricity)
 beta_KD(k,j,z)       Share parameter (CES - composite capital)
 beta_LD(l,j,z)       Share parameter (CES - composite labor)
 beta_M1(i,z)         Share parameter (CES - composite commodity)
 beta_M2(i,zj,z)      Share parameter (CES - composite import)
 beta_VA(j,z)         Share parameter (CES - value added)
 beta_KLE(j,z)        Share parameter (CES - KLE composite)
 beta_ENER(ene,j,z)   Share parameter (CES - ENER composite)
 delta(z)             Depreciation rate of capital in country z
 eta                  Price elasticity of indexed transfers and parameters
 frisch(z)            Frisch parameter (LES function)
 gamma_GVT(i,z)       Share of commodity i in total current public expenditures on goods and services
 gamma_INV(i,z)       Share of commodity i in total investment expenditures
 gamma_LES(i,z)       Marginal share of commodity i in household consumption budget
 io(j,z)              Coefficient (Leontief - intermediate consumption)
 io2(j,z)             Coefficient (Leontief - intermediate energy consumption)
 v(j,z)               value added Coefficient (Leontief)
 v2(j,z)              KLE Share parameter (Leontief)
 kmob                 Flag parameter (1 if capital is mobile)
 RES                  Rescaling factor
 rho_KD(j,z)          Elasticity paameter (CES - composite capital)
 rho_LD(j,z)          Elasticity parameter (CES - composite labor)
 rho_M1(i,z)          Elasticity parameter (CES - composite commodity)
 rho_M2(i,z)          Elasticity parameter (CES - composite import)
 rho_VA(j,z)          Elasticity parameter (CES - value added)
 rho_KLE(j,z)         Elasticity parameter (CES - KLE)
 rho_ENER(j,z)        Elasticity parameter (CES - ENER)
 rho_X1(i,z)          Elasticity parameter (CET - composite export)
 rho_X2(i,z)          Elasticity parameter (CET - composite export)
 rho_X3(i,z)          Elasticity parameter (CES - top level)
 rho_X4(z)            Elasticity parameter (CES - Aggregated Electricity)
 sigma_INV(k,j,z)     Elasticity (investment demand)
 sigma_KD(j,z)        Elasticity (CES - composite capital)
 sigma_LD(j,z)        Elasticity (CES - composite labor)
 sigma_M1(i,z)        Elasticity (CES - composite commodity)
 sigma_M2(i,z)        Elasticity (CES - composite import)
 sigma_VA(j,z)        Elasticity (CES - value added)
 sigma_KLE(j,z)       Elasticity (CES - kle)
 sigma_ENER(j,z)      Elasticity (CES - within energy)
 sigma_X0(j,z)        Elasticity (CET - exports and local sales)
 sigma_X1(i,z)        Elasticity (CET - total output)
 sigma_X2(i,z)        Elasticity (CET - composite export)
 sigma_X3(i,z)        Elasticity (CES - top level)
 sigma_X4(z)          Elasticity (CES - Aggregated Electricity)
 sigma_Y(i,z)         Income elasticity of consumption
 tmrg(i,ij,zj,z)      Rate of margin i applied to commodity ij imported from country zj
 TnDShare(z)          T&D share of Aggregated electricity
 PowerShare(z)        Power Industries share of Aggregated electricity    
 theta2(j,i,z)        Export share of composite activity

 g_GDP(z,time)        GDP past and projected growth rate
 g_LS(z,time)         Active population past and projected growth rate
 g_POP(z,time)        Population past and projected growth rate
 g_SDR(z,time)        Growth rate of domestic savings rate
 gamma_GVT(i,z)       Share of commodity i in total current public expenditures on goods and services
 gamma_INV(i,z)       Share of commodity i in total investment expenditures
 gamma_LES(i,z)       Marginal share of commodity i in household consumption budget
 exogro(z,time)       Exogenous growth factor for exogenously growing variables except labor
 growthz(z)           Steady state grwoth

*==============================================================================
*  2.2 Variables - Benchmark
*==============================================================================
*  Benchmark values of variables are parameters. Their acronyms are the
*  corresponding variable names,followed by the letter "O".

*==============================================================================
*   2.2.1 Volume variables
*==============================================================================
 CABXO(z)        Current account balance of region z in terms of the international currency (pseudo-volume variable)
 CO(i,z)         Consumption of commodity i by households in region z
 CGO(i,z)        Public consumption of commodity i in region z
 CIO(j,z)        Total intermediate consumption of industry j in region z
 CEO(j,z)        Total energy intermediate consumption of industry j in region z
 CMINO(i,z)      Minimum consumption of commodity i by households in region z
 CTH_REALO(z)    Real household consumption in region z
 DDO(i,z)        Domestic demand for commodity i produced locally in region z
 DIO(i,j,z)      Intermediate consumption of commodity i by industry j in region z
 DEO(ene,j,z)    Intermediate energy consumption of commodity i by industry j in region z
 DITO(i,z)       Total intermediate demand of commodity i in region z
 DSO(j,i,z)      Supply of commodity i by sector j to the domestic market
 DSO_I(i,z)      Supply of commodity i to the domestic market of region z
 DSO_J(j,z)      Supply of activity j to the domestic market of region z
 EXO(i,z,zj)     Quantity of product i exported by country z to country zj
 EXTO(i,z)       Supply of composite commodity i by region z to the export market
 EXTTO(j,i,z)    Supply of activity j to the export market i of region z
 G_REALO(z)      Current real government expenditures on goods and services in region z
 GDP_BP_REALO(z) Real GDP at basic prices
 GDP_MP_REALO(z) Real GDP at market prices
 GDP_BP_W_REALO  Real GDP at basic prices
 IMO(i,zj,z)     Quantity of product i imported by country z from country zj
 IMTO(i,z)       Quantity demanded of composite imports of commodity i by region z
 INDO(k,j,z)     Volume of new type k capital investment to industry j in region z
 INVO(i,z)       Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REALO(z)     Real gross fixed capital formation
 KDO(k,j,z)      Demand for type k capital by industry j in region z
 KDCO(j,z)       Demand for composite capital by industry j in region z
 KSO(k,z)        Supply of type k capital in region z
 KSTO(z)         Total supply of capital in region z
 LDO(l,j,z)      Demand for type l labor by industry j in region z  
 LDCO(j,z)       Demand for composite labor by industry j in region z
 LSO(l,z)        Supply of type l labor in region z
 MRGNO(i,z)      Domestic production of commodity i in region z exported as international margin services
 POPO(z)         Population in 2019
 QO(i,z)         Quantity demanded of composite commodity i in region z
 VAO(j,z)        Value added of industry j in region z
 KLEO(j,z)       KLE of industry j in region z
 XSO_I(i,z)      Commoidty i total production
 XSO(j,i,z)      Total output of industry j in region z
 XSTO(j,z)       Total output of industry j
 POWERQO(z)      Total power output in region z
 
*==============================================================================
*   2.2.2 Price variables
*==============================================================================
 eO(z)           Exchange rate (price of international currency in terms of region z local currency)
 IRO(z)          Interest rate
 PO(i,z)         Basic price of commodity i in region z
 PO2(j,i,z)      Basic price of industry js production of commodity i
 PO3(i,j,z)
 PO4(i,j,z)
 PPOWERO(z)
 PIO(i,z)
 PTO(j,z)        Basic price of industry js output
 PCO(i,z)        Purchaser price of composite commodity i (including all taxes and margins) in region z
 PCIO(j,z)       Intermediate consumption price index of industry j in region z
 PCEO(j,z)       Intermediate energy consumption price index of industry j in region z
 PDO(i,z)        Price of local product i sold on region z domestic market (including all taxes)
 PEO(i,z,zj)     Price received for commodity i exported to region zj by region z (excluding export taxes)
 PETO(i,z)       Border price of composite commodity i exported by region z
 PIXCONO(z)      Consumer price index in region z
 PIXGDPO(z)      GDP deflator in region z
 PIXGDP_WO       World GDP deflator
 PIXGVTO(z)      Public expenditures price index in region z
 PIXINVO(z)      Investment price index in region z
 PKO(z)          Price of new capital in region z
 PLO(i,z)        Price of local product i (excluding all taxes on products) in region z
 PMO(i,zj,z)     Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 PMTO(i,z)       Price of composite commodity i imported by region z (including all taxes duties and margins)
 PPO(j,z)        Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 PVAO(j,Z)       Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 PKLEO(j,z)      Price of industry j KLE in region z
 PWMO(i,zj,z)    World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMGO(i)        World price of margin i (expressed in international currency)
 PWXO(i,z,zj)    World price of commodity i exported to country zj by region z (expressed in international currency)
 RO(k,j,z)       Rental rate of type k capital in industry j of region z
 RCO(j,z)        Rental rate of industry j composite capital in region z
 RKO(k,z)        Rental rate of type k capital in region z
 RTIO(k,j,z)     Rental rate paid by industry j for type k capital in region z including capital taxes
 UO(z)           User cost of capital in region z
 WO(l,z)         Wage rate of type l labor in region z
 WCO(j,z)        Wage rate of industry j composite labor in region z
 WTIO(l,j,z)     Wage rate paid z by industry j for type l labor in region including payroll taxes

*==============================================================================
*   2.2.3 Nominal (value) variables
*==============================================================================
 CABO(z)         Current account balance of region z
 CTHO(z)         Consumption budget of households in region z
 DEPO(z)         Amount of depreciation (capital consumption allowance) in region z
 GO(z)           Current government expenditures on goods and services in region z
 GDP_BPO(z)      Region z GDP at basic prices
 GDP_BP_WO       World GDP at basic prices
 GDP_FDO(z)      Region z GDP at purchasers prices from the perspective of final demand
 GDP_IBO(z)      Region z GDP at market prices (income-based)
 GDP_MPO(z)      Region z GDP at market prices
 ITO(z)          Total investment expenditures in region z
 RKDO(k,j,z)     Type k capital income in industry j in region z
 SGO(z)          Government savings in region z
 SHO(z)          Household savings in region z
 SROWO(z)        Rest-of-the-world savings with respect to region z
 TDHO(z)         Household income taxes in region z
 TICO(i,z)       Government revenue from indirect taxes on commodity i in region z
 TICTO(z)        Total government receipts of indirect taxes on commodities in region z
 TIKO(k,j,z)     Government revenue from taxes on type k capital used by industry j in region z
 TIKTO(z)        Total government revenue from from taxes on capital in region z
 TIMO(i,zj,z)    Government revenue from duties on commodity i imported from region zj by region z
 TIMTO(z)        Total government revenue from import duties in region z
 TIPO(j,z)       Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 TIPTO(z)        Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 TIWO(l,j,z)     Government revenue from payroll taxes on type l labor in industry j of region z
 TIWTO(z)        Total government revenue from payroll taxes in region z
 TIXO(i,z,zj)    Government revenue from export taxes on commodity i exported by region z to region zj
 TIXTO(z)        Total government revenue from export taxes in region z
 TPRCTSO(z)      Total government revenue from taxes on products and imports in region z
 TPRODNO(z)      Total government revenue from other taxes on production in region z
 YDHO(z)         Household disposable income in region z
 YGO(z)          Total government income in region z
 YHO(z)          Household total income in region z
 YHKO(z)         Household capital income in region z
 YHLO(z)         Household labor income in region z
 YROWO(z)        Rest-of-the-world total income from region z

*==============================================================================
*   2.2.4 Rates and intercepts
*==============================================================================
 phiO(z)         Scale variable (allocation of investment to industries)
 sh0O(z)         Intercept (household savings)
 sh1O(z)         Slope (household savings)
 ttdh0O(z)       Intercept (household income tax)
 ttdh1O(z)       Slope (household income tax)
 tticO(i,z)      Tax rate on commodity i
 ttikO(k,j,z)    Tax rate on capital k used in industry j
 ttimO(i,zj,z)   Rate of taxes and duties on imports of commodity i from country zj
 ttipO(j,z)      Tax rate on the production of industry j
 ttiwO(l,j,z)    Tax rate on type l worker compensation in industry j
 ttixO(i,z,zj)   Export tax rate on exported commodity x
;

Scalar
 Tiny small figure / 0.000000000001/ ;

*==============================================================================
* 3 Data
*==============================================================================
*  3.1 Data input from GTAP8.1
*==============================================================================
*   3.1.1 Reading data aggregated with DATA_AGG-2007.gms
*==============================================================================
*  The PEP w-t model uses aggregated data from GTAP8.1. The following file
*  includes data for some variables and substitution elasticities.

$LOAD CO, CGO, DDO, DEPO, DIO, DSO, DSO_I, EXO, IMO, INVO, KSTO, LDO, MRGNO, XSO, XSO_I, XSTO,
$LOAD g_GDP, g_POP, RKDO, TDHO, TICO, TIKO, TIMO, TIPO, TIWO, TIXO, 
$LOAD tmrg, sigma_M1, sigma_M2, sigma_VA, POPO

display sigma_M1, sigma_M2 ;

sigma_M1('04_GAS',Z) = 6;
sigma_M2('03_OIL',Z) = 6;
sigma_M2('04_GAS',Z) = 6;

display sigma_M1, sigma_M2 ;

*==============================================================================
*   3.1.2 Rescaling the variables
*==============================================================================
* GTAP 8.1 data are in millions of (2004 and 2007) US dollars
* (see www.gtap.agecon.purdue.edu/resources/download/5679.pdf)
* With RES = 10000, model results are in tens of billions (10G$)
RES              = 10000;

* NOTE: In GTAP parlance, "agents' prices" are prices paid by buyers, and
*       "market prices" are prices received by sellers.

* Household consumption = GTAP domestic purchases (VDPA) + import purchases (VIPA)
* by households at agents' prices.
CO(i,z)          = CO(i,z)/RES;

* Public final consumption = domestic purchases (VDGA) + import purchases (VIGA)
* by government at agents' prices.
CGO(i,z)         = CGO(i,z)/RES;

* Domestic purchases = domestic absorption:
* (CO + CGO + INVO + DIO) - [ imports (IMO) + transport margins (tmrg)
*                              + indirect taxes (TICO + TIMO) ]
DDO(i,z)         = DDO(i,z)/RES;

* Capital depreciation (DEP)
DEPO(z)          = DEPO(z)/RES;

* Intermediate consumption = domestic purchases (VDFA) + import purchases (VIFA)
* by firms belonging to sectors other than CGDS, at agents' prices.
DIO(i,j,z)       = DIO(i,j,z)/RES;

* Domestic supply = domestic demand (DDO) in GTAP_AGG.gms
DSO(j,i,z)        = DSO(j,i,z)/RES;
DSO_I(i,z)        = DSO_I(i,z)/RES;

* Exports = exports at world prices (VXWD) = imports at world prices
* Note: the GTAP variable VXWD is NOT used in the DATA_AGG.gms program; the
* value recorded in DATA_AGG.gdx is actually identical to IMO
EXO(i,z,zj)      = EXO(i,z,zj)/RES;

* Imports = imports at world prices (VIWS) - sum of transport margins on imports (VTWR)
IMO(i,z,zj)      = IMO(i,z,zj)/RES;

* Demand for investment purposes = domestic purchases (VDFA)+ import purchases (VIFA)
* by firms of the CGDS sector at agents' prices.
INVO(i,z)        = INVO(i,z)/RES;

* Total capital stock at the beginning of the period (VKB)
KSTO(z)          = KSTO(z)/RES;

* Labor demand = Remuneration of labor at market prices, before taxes
* (components of VFM, "primary factor purchases, by households, at market prices")
LDO(l,j,z)       = LDO(l,j,z)/RES;

* Supply of transport margins at market prices (VST), adjusted proportionately
* so that MRGNO = sum of tmrg for every margin commodity
MRGNO(i,z)       = MRGNO(i,z)/RES;

* Remuneration of capital at market prices, before taxes
* (components of VFM, "primary factor purchases, by households, at market prices")
RKDO(k,j,z)      = RKDO(k,j,z)/RES;

* Direct taxes = factor payment at market prices (VFM)
*                - primary factor sales at agents' prices (EVOA)
TDHO(z)          = TDHO(z)/RES;

* Domestic taxes on commodities = demand at agents' prices - demand at market prices:
* Include 6 pairs of GTAP components
*       VDPA - VDPM
*       VIPA - VIPM
*       VDGA - VDGM
*       VIGA - VIGM
*       VDFA - VDFM
*       VIFA - VIFM
TICO(i,z)        = TICO(i,z)/RES;

* Net taxes on factor of production = factor employment tax revenue (FTRV)
*                                     - factor-based subsidies (FBEP).
TIKO(k,j,z)      = TIKO(k,j,z)/RES;

* Import duties = "ordinary" import duties (TFRV)
TIMO(i,z,zj)     = TIMO(i,z,zj)/RES;

* Taxes on production = MINUS "ordinary output subsidies" (OSEP)
TIPO(j,z)        = TIPO(j,z)/RES;

* Net taxes on factor of production = factor employment tax revenue (FTRV)
*                                     - factor-based subsidies (FBEP).
TIWO(l,j,z)      = TIWO(l,j,z)/RES;

* Taxes on exports = export tax equivalent of the Multi-Fiber Agreement (MFA)
* quota premium(MFRV) + "ordinary" export taxes (XTRV)
TIXO(i,z,zj)     = TIXO(i,z,zj)/RES;

* Transport margins at world prices = sum of margins on imports (VTWR)
tmrg(i,ij,z,zj)  = tmrg(i,ij,z,zj)/RES;

* Domestic output = domestic supply (DSO) + supply of transport margins (MRGNO)
*                   + exports (EXO) - taxes on exports (TIXO)

XSO_I(i,z)        = XSO_I(i,z)/RES;
XSO(j,i,z)        = XSO(j,i,z)/RES;
XSTO(j,z)         = XSTO(j,z)/RES;

growthz(z)        = 0.02;

*==============================================================================
*  3.3 Exogenous prices and parameters
*==============================================================================

*  Price elasticity (should be equal to one to verify homogeneity)
eta = 1;

*==============================================================================
* CES and CET elasticities
*==============================================================================
* CES elasticities are defined using GTAP8.1 data for imports
* (sigma_M1 and sigma_M2) and value added (sigma_VA)

* Other exogenous parameters can be defined if the Excel file VAL_PAR.XLS
PARAMETER
PARZ;

$CALL gdxxrw Input_w-t/JointB_VAL_230411_PAR.xls @Input_w-t/JointB_POWER_PAR.txt Rdim=2 Cdim=1 output=Input_w-t/JointB_VAL_230411_PAR.gdx
$GDXIN Input_w-t/JointB_VAL_230411_PAR.gdx
$LOAD sigma_KD, sigma_LD, sigma_KLE, sigma_X1, sigma_X2, sigma_X3, sigma_X0, sigma_y, sigma_inv, PARZ

 sigma_INV(k,j,z) = 2; 
*$exit
*------------------------------------------------------------------------------
* CES - composite capital
* We assume that the elasticity between the different type of capital
* is twice that used for value added.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls and delete following line:
 sigma_KD(j,z)   = 2*sigma_VA(j,z);
* sigma_KD(j,z)   = 0.5;
*------------------------------------------------------------------------------
* CES - composite labor
* We assume that the elasticity between the different type of labor
* is twice that used for value added.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls and delete following line:
 sigma_LD(j,z)   = 2*sigma_VA(j,z);
* sigma_LD(j,z)   = 0.5;

*------------------------------------------------------------------------------
* CES - composite KLE, KE, ENER
* sigma_KLE(j,z)  = 0.5 ;
 sigma_ENER(j,z) = 0.9 ;
*  sigma_ENER(j,z) = 2.0 ;
 
*------------------------------------------------------------------------------
* CET - total output
* We arbitrarily assume that the transformation elasticity between total exports,
* domestic supply and margins is equal to 2 for all sectors and all region.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls.

*------------------------------------------------------------------------------
* CET - exports
* We arbitrarily assume that the transformation elasticity between exports
* to the different partners is equal to 3 for all sectors and all region.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls.

*------------------------------------------------------------------------------
* LES parameters - Frisch
* We assume that the Frisch parameter is -1.1 for rich regions/countries and
* -1.5 for other regions/countries.
 frisch(zrich)   = -1.1;
 frisch(zother)  = -1.5;

* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls, delete the previous 2 lines and uncomment the
* following line:
 frisch(z)      = PARZ(z,'frisch');

*------------------------------------------------------------------------------
* LES parameters - Income elasticity of consumption
* We arbitrarily assume that the income elasticity of the consumption of
* commodity i is the same for all region/country.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls.

*------------------------------------------------------------------------------
*  Slopes of taxation functions
*   One can either choose to assign a value to the intercepts and calibrate
*   the slopes accordingly, or the other way around. This type of modelling
*   can be useful to take into account known marginal savings or taxation rates
*   or to deal with negative average saving rates in cases where savings are
*   negative for some household groups.
*   When no further information is available, one can simply set the intercepts
*   to zero and calibrate an average rate: this is what we do here for ttdh0O.
*   If the user wishes to assume otherwise, he can fill the appropriate area in
*   the Excel file VAL_PAR.xls.
* ttdh0O(z)       = PARZ(z,'ttdh0O');

 ttdh0O(z)       = 0;
*   The slope ttdh1O is calibrated below in the mane GAMS file

*------------------------------------------------------------------------------
*  Elasticity - Investment demand function
* We arbitrarily assume that this elasticity is equal to 2 for all types of
* capital, all sectors and all regions.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls.

*------------------------------------------------------------------------------
* Also we need to assign values to some prices
* All of the prices below, EXCEPT eO, may be set at arbitrary values
* without loss of generality.
*
* In the case of eO, although exchange rates may be given arbitrary values
* in the model, they must all be equal for calibration at this stage. The reason
* is that the supply of margin transport services MRGNO must equal global demand.
* Since there is a single world price for international transport margins
* (rather than bilateral world prices for other commodities) the unit of
* measurement of the volume of margin services must be the same for all regions,
* and in turn, that implies that the divisor that converts the nominal value to
* volume be the same for all regions. Since that divisor involves the exchange
* rate, all exchange rates must be equal.

* Normally, prices that may be given arbitrary values are set at 1:
 eO(z)           = 1;
 PEO(i,z,zj)     = 1;
 PLO(i,z)        = 1;
 PWMGO(i)        = 1;
 WO(l,z)         = 1;

*==============================================================================
* 4 Calibration
*==============================================================================
*  4.1 Calculation of income and savings related variables and parameters
*==============================================================================
 YHKO(z)         = SUM[(k,j),RKDO(k,j,z)];
 YHLO(z)         = SUM[(l,j),LDO(l,j,z)];
 YHO(z)          = YHLO(z)+YHKO(z);
 YDHO(z)         = YHO(z)-TDHO(z);
 CTHO(z)         = SUM[i,CO(i,z)];
 SHO(z)          = YDHO(z)-CTHO(z);

 TICTO(z)        = SUM[i,TICO(i,z)];
 TIMTO(z)        = SUM[(i,zj),TIMO(i,zj,z)];
 TIWTO(z)        = SUM[(l,j),TIWO(l,j,z)];
 TIKTO(z)        = SUM[(k,j),TIKO(k,j,z)];
 TIPTO(z)        = SUM[j,TIPO(j,z)];
 TIXTO(z)        = SUM[(i,zj),TIXO(i,z,zj)];
 TPRODNO(z)      = TIKTO(z)+TIWTO(z)+TIPTO(z);
 TPRCTSO(z)      = TICTO(z)+TIMTO(z)+TIXTO(z);
 YGO(z)          = TDHO(z)+TPRCTSO(z)+TPRODNO(z);
 GO(z)           = SUM[i,CGO(i,z)];
 SGO(z)          = YGO(z)-GO(z);

 YROWO(z)        = SUM[(i,zj),IMO(i,zj,z)]+SUM[(i,ij,zj),tmrg(i,ij,zj,z)];
 SROWO(z)        = YROWO(z)-SUM[(i,zj),EXO(i,z,zj)]-SUM[i,MRGNO(i,z)];
 CABO(z)         = -SROWO(z);

 ITO(z)          = SHO(z)+SGO(z)+SROWO(z);

*==============================================================================
*  4.2 Calibration of parameters and other variables
*==============================================================================
*  4.2.1 Calibration of investment and government spending shares
*==============================================================================
 gamma_GVT(i,z)  = CGO(i,z)/SUM[ij,CGO(ij,z)];
 gamma_INV(i,z)  = INVO(i,z)/SUM[ij,INVO(ij,z)] ;

*==============================================================================
*  4.2.2 Calibration of other prices and revised volumes (part 1)
*==============================================================================
 LDO(l,j,z)      = LDO(l,j,z)/WO(l,z);
 LDCO(j,z)       = SUM[l,LDO(l,j,z)];
 LSO(l,z)        = SUM[j,LDO(l,j,z)];
 EXO(i,z,zj)     = [EXO(i,z,zj)-TIXO(i,z,zj)]/PEO(i,z,zj);
 EXTO(i,z)       = SUM[zj,EXO(i,z,zj)];

 PWXO(i,z,zj)$EXO(i,z,zj)
                 = {[PEO(i,z,zj)*EXO(i,z,zj)+TIXO(i,z,zj)]/EXO(i,z,zj)}/eO(z);

 PETO(i,z)       = SUM[zj,PEO(i,z,zj)*EXO(i,z,zj)]/EXTO(i,z);
 PWMO(i,z,zj)    = PWXO(i,z,zj);
 IMO(i,zj,z)     = EXO(i,zj,z);
 IMTO(i,z)       = SUM[zj,IMO(i,zj,z)];

 DSO(j,i,z)       = DSO(j,i,z)/PLO(i,z);
 DSO_I(i,z)       = SUM(j,DSO(j,i,z));
 DSO_J(j,z)       = SUM(i,DSO(j,i,z));
 QO(i,z)         = IMTO(i,z)+DDO(i,z);

 MRGNO(i,z)$MRGNO(i,z)
                 = MRGNO(i,z)/[eO(z)*PWMGO(i)];

 XSO_I(i,z)      = EXTO(i,z)+DDO(i,z)+MRGNO(i,z);

 XSTO(j,z)       = sum(i, XSO(j,i,z));

 PO(i,z)        = [PETO(i,z)*EXTO(i,z)+PLO(i,z)*DSO_I(i,z)
                  +eO(z)*PWMGO(i)*MRGNO(i,z)]/XSO_I(i,z);

 PO2(j,i,z)$XSO(j,i,z) = 1;

 PO3(i,j,z)$XSO(j,i,z) = 1;

 PIO(i,z)       = SUM[j$XSO(j,i,z),PO2(J,I,z)*XSO(j,i,z)]/XSO_I(i,z);

 PTO(j,z)       = SUM[i$XSO(j,i,z),PO2(j,i,z)*XSO(j,i,z)]/XSTO(j,z);

 PPO(j,z)       = [SUM[l,TIWO(l,j,z)+WO(l,z)*LDO(l,j,z)]
                  +SUM[k,TIKO(k,j,z)+RKDO(k,j,z)]
                  +SUM[nene,DIO(nene,j,z)]+SUM[ene,DIO(ene,j,z)]]/XSTO(j,z);

 theta2(j,i,z) = DSO(j,i,z)/sum(jj, DSO(jj,i,z));

 EXTTO(j,i,z)$DSO(j,i,z) = theta2(j,i,z)*EXTO(i,z);

*==============================================================================
*  4.3 Calibration of tax rates, margins, prices and volumes
*==============================================================================
*  4.3.1 Margin rates and tax rates
*==============================================================================
 ttixO(i,z,zj)   = [eO(z)*PWXO(i,z,zj)/PEO(i,z,zj)]-1;
 tticO(i,z)      = TICO(i,z)/{PLO(i,z)*DDO(i,z)
                   +SUM[zj,IMO(i,zj,z)*eO(z)*PWMO(i,zj,z)
                   +TIMO(i,zj,z)+SUM[ij,tmrg(ij,i,zj,z)]]};

 tmrg(i,ij,zj,z)$IMO(ij,zj,z)
                 = tmrg(i,ij,zj,z)/(PWMGO(i)*eO(z)*IMO(ij,zj,z));

 ttimO(i,zj,z)$IMO(i,zj,z)
                 = TIMO(i,zj,z)/{IMO(i,zj,z)*eO(z)*(PWMO(i,zj,z)
                  +SUM[ij,PWMGO(ij)*tmrg(ij,i,zj,z)])};

 ttiwO(l,j,z)$LDO(l,j,z)
                 = TIWO(l,j,z)/[WO(l,z)*LDO(l,j,z)];

 ttikO(k,j,z)$RKDO(k,j,z)
                 = TIKO(k,j,z)/RKDO(k,j,z);

 ttipO(j,z)      = [PTO(j,z)/PPO(j,z)]-1;

 ttdh1O(z)       = [TDHO(z)-ttdh0O(z)]/YHO(z);

*==============================================================================
*  4.3.2 Calibration of other prices and revised volumes (part 2)
*==============================================================================
 PDO(i,z)        = PLO(i,z)*(1+tticO(i,z));
 PMO(i,zj,z)     = eO(z)*(PWMO(i,zj,z)+SUM[ij,PWMGO(ij)*tmrg(ij,i,zj,z)])
                 *(1+ttimO(i,zj,z))*(1+tticO(i,z));
 PMTO(i,z)       = SUM[zj,PMO(i,zj,z)*IMO(i,zj,z)]/IMTO(i,z);
 PCO(i,z)        = [PMTO(i,z)*IMTO(i,z)+PDO(i,z)*DDO(i,z)]/QO(i,z);

 CO(i,z)         = CO(i,z)/PCO(i,z);
 CGO(i,z)        = CGO(i,z)/PCO(i,z);
 DIO(nene,j,z)   = DIO(nene,j,z)/PCO(nene,z);
 DEO(ene,j,z)    = DIO(ene,j,z)/PCO(ene,z);
 INVO(i,z)       = INVO(i,z)/PCO(i,z);

 CIO(j,z)        = SUM[nene,DIO(nene,j,z)];
 CEO(j,z)        = SUM[ene,DEO(ene,j,z)];

 DITO(nene,z)     = SUM[j,DIO(nene,j,z)];
 DITO(ene,z)      = SUM[j,DEO(ene,j,z)];
 
 PO4(ene,j,z)    = PCO(ene,z);

 PCIO(j,z)       = SUM[nene,PCO(nene,z)*DIO(nene,j,z)]/CIO(j,z);
 PCEO(j,z)       = SUM[ene,PCO(ene,z)*DEO(ene,j,z)]/CEO(j,z) ; 

 WTIO(l,j,z)     = WO(l,z)*(1+ttiwO(l,j,z));

 WCO(j,z)$LDCO(j,z)
                 = SUM[l,WTIO(l,j,z)*LDO(l,j,z)]/LDCO(j,z);

*==============================================================================
*  4.4 Calibration of dynamic parameters
*==============================================================================
* Calibration of dynamic parameters following new procedure.
* The price of capital is arbitrary:
 PKO(z) = 1;

* The calibration of depreciation rates is based on two hypotheses:
* 1. The rate of depreciation is the same for all types of capital and all
*    industries in each region (this hypothesis is made to accommodate the fact
*    that, in the GTAP data base, capital consumption allowance is not detailed;
*    as a matter of fact, the GTAP capital consumption allowance is set at
*    4% of the value of the capital stock).
* 2. The rental rate of capital is uniform across industries and types of
*    capital in each region.
* 3. The investment rate (IND/KD) is uniform across industries and types of
*    capital in each region.
* These hypotheses lead to the following formulae:

* From GTAP, we know KSTO.
 KSTO(z)         = KSTO(z)/PKO(z);

* Assuming a uniform depreciation rate for all types
* of capital and all industries:
 delta(z)        = DEPO(z)/[PKO(z)*KSTO(z)];

* From GTAP, we know KSTO. Assuming a uniform rental rate R for all types
* of capital and all industries:
 RO(k,j,z)$RKDO(k,j,z)
                 = SUM[(kj,jj),RKDO(kj,jj,z)]/KSTO(z);
                 
* Then from the GTAP value of income paid to capital RKD we calibrate KDO:
 KDO(k,j,z)$RKDO(k,j,z)
                 = RKDO(k,j,z)/RO(k,j,z);

* The supply of capital is equal to demand:
 KSO(k,z)        = SUM[j,KDO(k,j,z)];

* The rate of return on capital, net of depreciation, is:
 IRO(z)         = {SUM[(k,j)$RKDO(k,j,z),RKDO(k,j,z)]-DEPO(z)}/[PKO(z)*KSTO(z)];

* The user cost of capital follows
 UO(z)           = PKO(z)*(IRO(z)+delta(z));

* Combining
* - the hypothesis of uniform investment rates
* - the hypothesis of uniform rental rates
* - the hypothesis of uniform depreciation rates
* leads to
 phiO(z)         = [ITO(z)/PKO(z)]/KSTO(z);

* Investment by destination follows:
 INDO(k,j,z)$KDO(k,j,z)
                 = phiO(z)*KDO(k,j,z);

 A_K(z)          = 1/PKO(z)*{PROD[i$gamma_INV(i,z),(PCO(i,Z)/gamma_INV(i,z))
                   **gamma_INV(i,z)]};

* INDO(k,j,z)$KDO(k,j,z) = KDO(k,j,z)/sum((kj,jj),KDO(kj,jj,z))*ITO(z);

 KDCO(j,z)       = SUM[k,KDO(k,j,z)];
 RTIO(k,j,z)     = RO(k,j,z)*(1+ttikO(k,j,z));
 RCO(j,z)$KDCO(j,z)
                 = SUM[k,RTIO(k,j,z)*KDO(k,j,z)]/KDCO(j,z);

*==============================================================================
*  4.5 Calibration of other prices and revised volumes (part 3)
*==============================================================================
 VAO(j,z)        = LDCO(j,z)+KDCO(j,z);

 PVAO(j,z)       = [WCO(j,z)*LDCO(j,z)+RCO(j,z)*KDCO(j,z)]/VAO(j,z);

* PIXGDPO is tautologically equal to 1, based on its formula
* PIXGDPO(z)      = {SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
*                   /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
*                   *SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
*                   /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]}**0.5;
 PIXGDPO(z)      = 1;

* PIXGDP_WO is tautologically equal to 1, based on its formula
* PIXGDP_WO       = {SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
*                   /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
*                   *SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
*                   /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]/eO(z)}**0.5;
 PIXGDP_WO       = 1;

* PIXCONO(z) is tautologically equal to 1, based on its formula
* PIXCONO(z)      = SUM[i,PCO(i,z)*CO(i,z)]
*                  /SUM[i,PCO(i,z)*CO(i,z)];
 PIXCONO(z)      = 1;

* PIXINVO(z) is tautologically equal to 1, based on its formula
* PIXINVO(z)      = PROD[i$gamma_INV(i,z),(PCO(i,z)/PCO(i,z))**gamma_INV(i,z)];
 PIXINVO(z)      = 1;

* PIXGVTO(z) is tautologically equal to 1, based on its formula
* PIXGVTO(z)      = PROD[i$gamma_GVT(i,z),(PCO(i,z)/PCO(i,z))**gamma_GVT(i,z)];
 PIXGVTO(z)      = 1;

*==============================================================================
*  4.6 Calibration of function parameters
*==============================================================================
*   4.6.1 Leontief functions
*==============================================================================
 io(j,z)         = CIO(j,z)/XSTO(j,z) ;

 io2(j,z)        = CEO(j,z)/XSTO(j,z) ;

 v(j,z)          = VAO(j,z)/XSTO(j,z) ;

 v2(j,z)         = (CEO(j,z)+VAO(j,z))/XSTO(j,z) ;

 aij(nene,j,z)   = DIO(nene,j,z)/CIO(j,z);
 aij2(ene,j,z)   = DEO(ene,j,z)/CEO(j,z);

*==============================================================================
*   4.6.2 Calibration of CET parameters
*==============================================================================
*    4.6.2.1 CET between total exports, domestic supply and margins
*==============================================================================
 rho_X1(i,z)     = (1+sigma_X1(i,z))/sigma_X1(i,z);

 beta_EX_X1(i,z)$MRGNO(i,z)
                 = [PETO(i,z)*EXTO(i,z)$EXTO(i,z)**(1-rho_X1(i,z))]/
                   [PETO(i,z)*EXTO(i,z)$EXTO(i,z)**(1-rho_X1(i,z))+
                   PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))+
                   eO(z)*PWMGO(i)*MRGNO(i,z)$MRGNO(i,z)**(1-rho_X1(i,z))+Tiny];

 beta_EX_X1(i,z)$(MRGNO(i,z) eq 0)
                 = [PETO(i,z)*EXTO(i,z)$EXTO(i,z)**(1-rho_X1(i,z))]/
                   [PETO(i,z)*EXTO(i,z)$EXTO(i,z)**(1-rho_X1(i,z))+
                   PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))+Tiny];

 beta_D_X1(i,z)$MRGNO(i,z)
                 = [PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))]/
                   [PETO(i,z)*EXTO(i,z)**(1-rho_X1(i,z))+
                   PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))+
                   eO(z)*PWMGO(i)*MRGNO(i,z)**(1-rho_X1(i,z))];

 beta_D_X1(i,z)$(MRGNO(i,z) eq 0)
                 = [PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))]/
                   [PETO(i,z)*EXTO(i,z)**(1-rho_X1(i,z))+
                   PLO(i,z)*DSO_I(i,z)**(1-rho_X1(i,z))];

 B_X1(i,z)       = XSO_I(i,z)/[beta_EX_X1(i,z)*EXTO(i,z)**rho_X1(i,z)
                  +beta_D_X1(i,z)*DSO_I(i,z)**rho_X1(i,z)+(1-beta_EX_X1(i,z)
                  -beta_D_X1(i,z))*MRGNO(i,z)**rho_X1(i,z)]**(1/rho_X1(i,z));

*==============================================================================
*    4.6.2.2 CET between exports to different trading partners
*==============================================================================
 rho_X2(i,z)     = (1+sigma_X2(i,z))/sigma_X2(i,z);
 beta_X2(i,z,zj)$EXO(i,z,zj)
                 = [PEO(i,z,zj)*EXO(i,z,zj)**(1-rho_X2(i,z))]/
                   SUM[zjj$EXO(i,z,zjj),PEO(i,z,zjj)*EXO(i,z,zjj)
                   **(1-rho_X2(i,z))];
 B_X2(i,z)       = EXTO(i,z)/{SUM[zj,beta_X2(i,z,zj)*EXO(i,z,zj)**rho_X2(i,z)]
                   **(1/rho_X2(i,z))};

*==============================================================================
*   4.6.3 Calibration of CES parameters
*==============================================================================
*    4.6.3.0 Composite output
*==============================================================================
 rho_X3(i,z)   = (1-sigma_X3(i,z))/sigma_X3(i,z);

 beta_X3(j,i,z)$XSO(j,i,z)
               = [PO2(j,i,z)*XSO(j,i,z)**(1+rho_X3(i,z))]/
                   SUM[jj$XSO(jj,i,z),PO2(jj,i,z)*XSO(jj,i,z)**(1+rho_X3(i,z))];

 B_X3(i,z)     = XSO_I(i,z)
                  /SUM[jj$XSO(jj,i,z),beta_X3(jj,i,z)*XSO(jj,i,z)**(-rho_X3(i,z))
                  ]**(-1/rho_X3(i,z));

 POWERQO(Z) = SUM(POWER, XSO(power,'18_ELEC',z));

 sigma_X4(z) =2;

 rho_X4(z)   = (1-sigma_X4(z))/sigma_X4(z);

 beta_X4(power,z)
               = [PO2(power,'18_ELEC',z)*XSO(power,'18_ELEC',z)**(1+rho_X4(z))]/
                   SUM[power2$XSO(power2,'18_ELEC',z),PO2(power2,'18_ELEC',z)*XSO(power2,'18_ELEC',z)**(1+rho_X4(z))];

 B_X4(z)     = POWERQO(Z)
                  /SUM[power2$XSO(power2,'18_ELEC',z),beta_X4(power2,z)*XSO(power2,'18_ELEC',z)**(-rho_X4(z))
                  ]**(-1/rho_X4(z));

 TnDShare(z) = XSO('18_TnD','18_ELEC',z) / XSO_I('18_ELEC',z);

 PPOWERO(z) = 1;

*==============================================================================
*    4.6.3.1 Composite good
*==============================================================================
 rho_M1(i,z)     = (1-sigma_m1(i,z))/sigma_m1(i,z);
 beta_M1(i,z)    = PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)/
                  {PDO(i,z)*DDO(i,z)**(rho_M1(i,z)+1)
                  +PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)};
 B_M1(i,z)       = QO(i,z)/{beta_M1(i,z)*IMTO(i,z)**(-rho_M1(i,z))
                  +(1-beta_M1(i,z))*DDO(i,z)**(-rho_M1(i,z))}**(-1/rho_M1(i,z));

*==============================================================================
*    4.6.3.2 CES between imports from different trading partners
*==============================================================================
 rho_M2(i,z)     = (1-sigma_M2(i,z))/sigma_M2(i,z);
 beta_M2(i,zj,z)$IMO(i,zj,z)
                 = [PMO(i,zj,z)*IMO(i,zj,z)**(rho_M2(i,z)+1)]/
                   SUM[zjj$IMO(i,zjj,z),PMO(i,zjj,z)*IMO(i,zjj,z)
                    **(rho_M2(i,z)+1)];
 B_M2(i,z)       = IMTO(i,z)/{SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*IMO(i,zj,z)
                   **(-rho_M2(i,z))]**(-1/rho_M2(i,z))};

*==============================================================================
*    4.6.3.3 Composite capital
*==============================================================================
 rho_KD(j,z)     = (1-sigma_KD(j,z))/sigma_KD(j,z);

 beta_KD(k,j,z)$KDO(k,j,z)
                 = [RTIO(k,j,z)*KDO(k,j,z)**(1+rho_KD(j,z))]/
                   SUM[kj$KDO(kj,j,z),RTIO(kj,j,z)*KDO(kj,j,z)**(1+rho_KD(j,z))];
 B_KD(j,z)$KDCO(j,z)
                 = KDCO(j,z)/{SUM[k$KDO(k,j,z),beta_KD(k,j,z)*KDO(k,j,z)
                   **(-rho_KD(j,z))]**(-1/rho_KD(j,z))};

*==============================================================================
*    4.6.3.4 Composite labor
*==============================================================================
 rho_LD(j,z)     = (1-sigma_LD(j,z))/sigma_LD(j,z);
 beta_LD(l,j,z)$LDO(l,j,z)
                 = [WTIO(l,j,z)*LDO(l,j,z)**(1+rho_LD(j,z))]/
                   SUM[lj$LDO(lj,j,z),WTIO(lj,j,z)*LDO(lj,j,z)
                   **(1+rho_LD(j,z))];
 B_LD(j,z)$LDCO(j,z)
                 = LDCO(j,z)/{SUM[l$LDO(l,j,z),beta_LD(l,j,z)*LDO(l,j,z)
                   **(-rho_LD(j,z))]**(-1/rho_LD(j,z))};
 
*===============================================================================
*   Composite E
*===============================================================================
 rho_ENER(j,z)   = (1-sigma_ENER(j,z))/sigma_ENER(j,z);

 beta_ENER(ene,j,z)$DEO(ene,j,z)
                 = [PO4(ene,j,z)*DEO(ene,j,z)**(1+rho_ENER(j,z))]/
                   SUM[ene2$DIO(ene,j,z),DEO(ene2,j,z)**(1+rho_ENER(j,z))];

 B_ENER(j,z)$CEO(j,z)
                 = CEO(j,z)/{SUM[ene$DEO(ene,j,z),beta_ENER(ene,j,z)*DEO(ene,j,z)
                   **(-rho_ENER(j,z))]**(-1/rho_ENER(j,z))};

*==============================================================================
*    4.6.3.5 Value added
*==============================================================================
 rho_VA(j,z)     = (1-sigma_VA(j,z))/sigma_VA(j,z);
 
 beta_VA(j,z)$KDCO(j,z)
                 = WCO(j,z)*LDCO(j,z)**(rho_VA(j,z)+1)/
                  {WCO(j,z)*LDCO(j,z)**(rho_VA(j,z)+1)+
                   RCO(j,z)*KDCO(j,z)**(rho_VA(j,z)+1)};
 B_VA(j,z)$KDCO(j,z)
                 = VAO(j,z)
                   /{[beta_VA(j,z)*LDCO(j,z)**(-rho_VA(j,z))+
                   (1-beta_VA(j,z))*KDCO(j,z)**(-rho_VA(j,z))
                   ]**(-1/rho_VA(j,z))};

*==============================================================================
*    Composite KLE
*==============================================================================
 KLEO(j,z)       = CEO(j,z) + VAO(j,z) ; 

 PKLEO(j,z)      = [PCEO(j,z)*CEO(j,z)+PVAO(j,z)*VAO(j,z)]/KLEO(j,z);

 rho_KLE(j,z)    = (1-sigma_KLE(j,z))/sigma_KLE(j,z);

 beta_KLE(j,z)$KLEO(j,z)
                 = PVAO(j,z)*VAO(j,z)**(rho_KLE(j,z)+1)/
                  {PVAO(j,z)*VAO(j,z)**(rho_KLE(j,z)+1)+
                   PCEO(j,z)*CEO(j,z)**(rho_KLE(j,z)+1)};

 B_KLE(j,z)$KLEO(j,z)
                 = KLEO(j,z)
                   /{[beta_KLE(j,z)*VAO(j,z)**(-rho_KLE(j,z))+
                   (1-beta_KLE(j,z))*CEO(j,z)**(-rho_KLE(j,z))
                   ]**(-1/rho_KLE(j,z))};

*==============================================================================
*   4.6.4 Calibration of LES parameters
*==============================================================================
*   As the assigned values of income elasticities may not result in
*   consumption shares that add up to 1, this first step
*   adjusts the elasticities proportionally
 sigma_Y(i,z)    = sigma_Y(i,z)/{SUM[ij,sigma_Y(ij,z)*PCO(ij,z)*CO(ij,z)]
                   /CTHO(z)};
 gamma_LES(i,z)  = PCO(i,z)*CO(i,z)*sigma_Y(i,z)/CTHO(z);
 CMINO(i,z)      = CO(i,z)+gamma_LES(i,z)*CTHO(z)/{PCO(i,z)*frisch(z)};

*==============================================================================
*  4.7 Calibration of gross domestic products
*==============================================================================
 GDP_BPO(z)      = SUM[j,PVAO(j,z)*VAO(j,z)]+TIPTO(z);
 GDP_MPO(z)      = GDP_BPO(z)+TPRCTSO(z);
 GDP_IBO(z)      = SUM[(l,j),WO(l,z)*LDO(l,j,z)]+SUM[(k,j),RO(k,j,z)*KDO(k,j,z)]
                   +TPRODNO(z)+TPRCTSO(z);
 GDP_FDO(z)      = SUM[i,PCO(i,z)*(CO(i,z)+CGO(i,z)+INVO(i,z))]
                  +eO(z)*SUM[(i,zj),PWXO(i,z,zj)*EXO(i,z,zj)]
                  +eO(z)*SUM[i,PWMGO(i)*MRGNO(i,z)]
                  -eO(z)*SUM[(i,zj),IMO(i,zj,z)*(PWMO(i,zj,z)
                  +SUM{ij,PWMGO(ij)*tmrg(ij,i,zj,z)})];
 GDP_BP_WO       = SUM[z,GDP_BPO(z)/eO(z)];

*==============================================================================
*  4.8 Calibration of real (volume) variables computed from price indices
*==============================================================================
 CABXO(z)        = CABO(z)/[PIXGDP_WO*eO(z)];
 
*------------------------------------------------------------------------------
* Calculation of CAB index
* If every region's CABX grows exogenously according to exogro, then the
* worldwide sum of CABX's will not be zero. If, due to redundancy, the reference
* region's CABX is left implicit, then it will not grow according to that
* region's exogro (it follows that the solution will depend on the choice of
* reference region). CABix is formed from exogro by inflating or deflating the
* updating factors of positive (SURplus) and negative (DEFicit) CABX's in such
* a way that their sum remains zero.

$ontext
Parameter CABXsur(z,time), CABXdef(z,time), bal(time), mu(time), CABix(z,time);
 CABXsur(z,time) = CABXO(z)*exogro(z,time)$[CABXO(z) gt 0];
 CABXdef(z,time) = CABXO(z)*exogro(z,time)$[CABXO(z) lt 0];
 Bal(time)       = sum(zj,CABXsur(zj,time))+sum(zj,CABXdef(zj,time));
 mu(time)        = sum(zj,CABXsur(zj,time))/
                     {sum(zj,CABXsur(zj,time))+sum(zj,abs[CABXdef(zj,time)])};
 CABXsur(z,time) = CABXsur(z,time)*{1-mu(time)*Bal(time)/sum(zj,CABXsur(zj,time))};
 CABXdef(z,time) = CABXdef(z,time)*{1-[1-mu(time)]*Bal(time)/sum(zj,CABXdef(zj,time))};
 CABix(z,time)   = [CABXsur(z,time)+CABXdef(z,time)]/CABXO(z);
$offtext
*------------------------------------------------------------------------------

 CTH_REALO(z)    = CTHO(z)/PIXCONO(z);
 G_REALO(z)      = GO(z)/PIXGVTO(z);
 GDP_BP_REALO(z) = GDP_BPO(z)/PIXGDPO(z);
 GDP_BP_W_REALO  = GDP_BP_WO/PIXGDP_WO;
 GDP_MP_REALO(z) = GDP_MPO(z)/PIXCONO(z);
 IT_REALO(z)     = ITO(z)/PIXINVO(z);

*==============================================================================
*  4.9 Parameters of the household savings function
*==============================================================================
* sh1O(z)         = [SHO(z)+SGO(z)]/GDP_IBO(z);
 sh1O(z)         = SHO(z)/YDHO(z);
 sh0O(z)         = 0 ;
* sh0O(z)         = SHO(z)-sh1O(z)*YDHO(z);

*==============================================================================
*  4.10 Re-calibration of indexed transfers and parameters
*==============================================================================
* sh0O(z)         = sh0O(z)/PIXCONO(z)**eta;
 ttdh0O(z)       = ttdh0O(z)/PIXCONO(z)**eta;

*==============================================================================
*  4.9 CO2 emission
*==============================================================================
$INCLUDE DATA_WEB-2019_240219.gms

Parameter
 CO2IO(product,j,z) ktCO2 industry j sector
 CO2HO(product,z)   ktCO2 residendital sector
 CH4IO(product,j,z) tCO2eq industry j sector
 CH4HO(product,z)   tCO2eq residendital sector
 N2OIO(product,j,z) tCO2eq industry j sector
 N2OHO(product,z)   tCO2eq residendital sector
 GWP(type)          GWP 100 AR5
 ;

 GWP('CO2EF') = 1;
 GWP('CH4EF') = 28;
 GWP('N2OEF') = 265;

 CO2IO(p_coal,j,z) = Coal_DIO(p_coal,j,z)*41.868*GHGsEF(p_coal,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2IO(p_gas,j,z)  = Gas_DIO(p_gas,j,z)*41.868*GHGsEF(p_gas,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2IO(p_oilproduct,j,z)  = Oilp_DIO(p_oilproduct,j,z)*41.868*GHGsEF(p_oilproduct,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;

 CO2HO(p_coal,z) = Coal_CO(p_coal,z)*41.868*GHGsEF(p_coal,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2HO(p_gas,z) = Gas_CO(p_gas,z)*41.868*GHGsEF(p_gas,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2HO(p_oilproduct,z) = Oilp_CO(p_oilproduct,z)*41.868*GHGsEF(p_oilproduct,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;

 CH4IO(p_coal,j,z) = Coal_DIO(p_coal,j,z)*41.868*GHGsEF(p_coal,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
 CH4IO(p_gas,j,z)  = Gas_DIO(p_gas,j,z)*41.868*GHGsEF(p_gas,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
 CH4IO(p_oilproduct,j,z)  = Oilp_DIO(p_oilproduct,j,z)*41.868*GHGsEF(p_oilproduct,'CH4EF')*1000*0.000001*GWP('CH4EF') ;

 CH4HO(p_coal,z) = Coal_CO(p_coal,z)*41.868*GHGsEF(p_coal,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
 CH4HO(p_gas,z) = Gas_CO(p_gas,z)*41.868*GHGsEF(p_gas,'CH4EF')*1000*0.000001*GWP('CH4EF') ;
 CH4HO(p_oilproduct,z) = Oilp_CO(p_oilproduct,z)*41.868*GHGsEF(p_oilproduct,'CH4EF')*1000*0.000001*GWP('CH4EF') ;

 N2OIO(p_coal,j,z) = Coal_DIO(p_coal,j,z)*41.868*GHGsEF(p_coal,'N2OEF')*1000*0.000001*GWP('N2OEF') ;
 N2OIO(p_gas,j,z)  = Gas_DIO(p_gas,j,z)*41.868*GHGsEF(p_gas,'N2OEF')*1000*0.000001*GWP('N2OEF') ;
 N2OIO(p_oilproduct,j,z)  = Oilp_DIO(p_oilproduct,j,z)*41.868*GHGsEF(p_oilproduct,'N2OEF')*1000*0.000001*GWP('N2OEF') ;

 N2OHO(p_coal,z) = Coal_CO(p_coal,z)*41.868*GHGsEF(p_coal,'N2OEF')*1000*0.000001*GWP('N2OEF') ;
 N2OHO(p_gas,z) = Gas_CO(p_gas,z)*41.868*GHGsEF(p_gas,'N2OEF')*1000*0.000001*GWP('N2OEF') ;
 N2OHO(p_oilproduct,z) = Oilp_CO(p_oilproduct,z)*41.868*GHGsEF(p_oilproduct,'N2OEF')*1000*0.000001*GWP('N2OEF') ;

*==============================================================================
*  4.10 Energy
*==============================================================================
Parameter
 EEI(product,j,z)  Energy intensity by industry sector ktoe per 10 billion $
 NEI(product,j,z)  Non-Energy intensity by production sectos ktoe per 10 billion $
 EHI(product,z)    Energy intensity by household ktoe per 10 billion $

 EEO(product,j,z)  Initial Industry energy consumption in region z ktoe
 NEO(product,j,z)  Initial Industry non energy consumption in region z ktoe
 EHO(product,z)    Initial Household energy consumption in region z ktoe
;

 EEI(p_coal,j,z)$(DIO('02_COAL',j,z) gt 0)               = Coal_DIO(p_coal,j,z)/DIO('02_COAL',j,z);
 EEI(p_oil,j,z)$(DIO('03_OIL',j,z) gt 0)                 = Oil_DIO(p_oil,j,z)/DIO('03_OIL',j,z);
 EEI(p_gas,j,z)$(DIO('04_GAS',j,z) gt 0)                 = Gas_DIO(p_gas,j,z)/DIO('04_GAS',j,z);
 EEI(p_oilproduct,j,z)$(DIO('10_PETROLCOAL',j,z) gt 0)   = Oilp_DIO(p_oilproduct,j,z)/DIO('10_PETROLCOAL',j,z);
 EEI(p_elecheat,j,z)$(DIO('18_ELEC',j,z) gt 0)           = Elec_DIO(p_elecheat,j,z)/DIO('18_ELEC',j,z);

 NEI(p_coal,j,z)$(DIO('02_COAL',j,z) gt 0)              = NCoal_DIO(p_coal,j,z)/DIO('02_COAL',j,z);
 NEI(p_oil,j,z)$(DIO('03_OIL',j,z) gt 0)                = NOil_DIO(p_oil,j,z)/DIO('03_OIL',j,z);
 NEI(p_gas,j,z)$(DIO('04_GAS',j,z) gt 0)                = NGas_DIO(p_gas,j,z)/DIO('04_GAS',j,z);
 NEI(p_oilproduct,j,z)$(DIO('10_PETROLCOAL',j,z) gt 0)  = NOilp_DIO(p_oilproduct,j,z)/DIO('10_PETROLCOAL',j,z);

 EHI(p_coal,z)$(CO('02_COAL',z) gt 0)                    = Coal_CO(p_coal,z)/CO('02_COAL',z);
 EHI(p_oil,z)$(CO('03_OIL',z) gt 0)                      = Oil_CO(p_oil,z)/CO('03_OIL',z);
 EHI(p_gas,z)$(CO('04_GAS',z) gt 0)                      = Gas_CO(p_gas,z)/CO('04_GAS',z);
 EHI(p_oilproduct,z)$(CO('10_PETROLCOAL',z) gt 0)        = Oilp_CO(p_oilproduct,z)/CO('10_PETROLCOAL',z);
 EHI(p_elecheat,z)$(CO('18_ELEC',z) gt 0)                = Elec_CO(p_elecheat,z)/CO('18_ELEC',z);

 EEO(p_coal,j,z)       = Coal_DIO(p_coal,j,z) ;
 EEO(p_gas,j,z)        = Gas_DIO(p_gas,j,z) ;
 EEO(p_oil,j,z)        = Oil_DIO(p_oil,j,z) ;
 EEO(p_oilproduct,j,z) = Oilp_DIO(p_oilproduct,j,z) ;
 EEO(p_elecheat,j,z)   = Elec_DIO(p_elecheat,j,z) ;

 NEO(p_coal,j,z)       = NCoal_DIO(p_coal,j,z) ;
 NEO(p_gas,j,z)        = NGas_DIO(p_gas,j,z) ;
 NEO(p_oilproduct,j,z) = NOilp_DIO(p_oilproduct,j,z) ;

 EHO(p_coal,z)         = Coal_CO(p_coal,z) ;
 EHO(p_gas,z)          = Gas_CO(p_gas,z) ;
 EHO(p_oil,z)          = Oil_CO(p_oil,z) ;
 EHO(p_oilproduct,z)   = Oilp_CO(p_oilproduct,z) ;
 EHO(p_elecheat,z)     = Elec_CO(p_elecheat,z) ;

*display EEI, EHI, EEO, NEO, EHO, GDPPPP, GHGsEF, CO2HO ;
*execute_unload 'GHGs emission',
*CO2HO, CO2IO, CH4IO, CH4HO, N2OIO, N2OHO

*==============================================================================
* 5 Model
*==============================================================================
*  5.1 Variable declarations
*==============================================================================
VARIABLES

*==============================================================================
*   5.1.1 Volume variables
*==============================================================================
 C(i,z,time)             Consumption of commodity i by households in region z
 CABX(z,time)            Current account balance of region z in terms of the international currency
 CG(i,z,time)            Public consumption of commodity i in region z
 CI(j,z,time)            Total intermediate consumption of industry j in region z
 CE(j,z,time)            Total intermediate consumption of industry j in region z
 CMIN(i,z,time)          Minimum consumption of commodity i by households in region z
 CTH_REAL(z,time)        Real household consumption in region z
 DD(i,z,time)            Domestic demand for commodity i produced locally in region z
 DI(i,j,z,time)          Intermediate consumption of commodity i by industry j in region z
 DE(i,j,z,time)          Intermediate energy consumption of commodity i by industry j in region z
 DIT(i,z,time)           Total intermediate demand of commodity i in region z
 DS(j,i,z,time)          Supply of commodity i by sector j to the domestic market
 DS_I(i,z,time)          Supply of commodity i to the domestic market of region z
 EX(i,z,zj,time)         Quantity of product i exported by country z to country zj
 EXT(i,z,time)           Supply of composite commodity i by region z to the export market
 EXTT(j,i,z,time)        Supply of activity j to the export market i of region z
 G_REAL(z,time)          Current real government expenditures on goods and services in region z
 GDP_BP_REAL(z,time)     Real GDP at basic prices
 GDP_BP_W_REAL(time)     Real world GDP at basic prices
 GDP_MP_REAL(z,time)     Real GDP at market prices
 IM(i,zj,z,time)         Quantity of product i imported by country z from country zj
 IMT(i,z,time)           Quantity demanded of composite imports of commodity i by region z
 IND(k,j,z,time)         Volume of new type k capital investment to industry j in region z
 INV(i,z,time)           Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REAL(z,time)         Real gross fixed capital formation
 KD(k,j,z,time)          Demand for type k capital by industry j in region z
 KDC(j,z,time)           Demand for composite capital by industry j in region z
 KS(k,z,time)            Supply of type k capital in region z
 LD(l,j,z,time)          Demand for type l labor by industry j in region z
 LDC(j,z,time)           Demand for composite labor by industry j in region z
 LS(l,z,time)            Supply of type l labor in region z
 MRGN(i,z,time)          Domestic production of commodity i in region z exported as international margin services
 Q(i,z,time)             Quantity demanded of composite commodity i in region z
 VA(j,z,time)            Value added of industry j in region z
 KLE(j,z,time)           KLE of industry j in region z
 XS(j,i,z,time)          Total output of industry j by commodity in region z
 XS_I(i,z,time)          Total output of commodity i in region z
 XST(j,z,time)           Total aggregate output of industry j in region z
 POWERQ(z,time)          Total power output in region z
 OBJ
*==============================================================================
*   5.1.2 Price variables
*==============================================================================
 e(z,time)               Exchange rate (price of international currency in terms of region z local currency)
 IR(z,time)              Interest rate 
 P(i,z,time)             Basic price of commodity i in region z
 P2(j,i,z,time)          Basic price of industry js production of commodity i
 P3(i,j,z,time)          Basic price of power industry js production of commodity i
 P4(ene,j,z,time)        Basic energy commodity price of industry js production of commodity i
 PPOWER(z,time)          Basic price of composite power commodity in region z
 PI(i,z,time)            Basic price of composite activity commodity in region z
 PT(j,z,time)            Basic price of industry js output
 PC(i,z,time)            Purchaser price of composite commodity i (including all taxes and margins) in region z
 PCI(j,z,time)           Intermediate consumption price index of industry j in region z
 PCE(j,z,time)           Intermediate energy consumption price index of industry j in region z
 PD(i,z,time)            Price of local product i sold on region z domestic market (including all taxes)
 PE(i,z,zj,time)         Price received for commodity i exported to region zj by region z (excluding export taxes)
 PET(i,z,time)           Border price of composite commodity i exported by region z
 PIXCON(z,time)          Consumer price index in region z
 PIXGDP(z,time)          GDP deflator in region z
 PIXGDP_W(time)          World GDP deflator
 PIXGVT(z,time)          Public expenditures price index in region z
 PIXINV(z,time)          Investment price index in region z
 PK(z,time)              Price of new capital in region z
 PL(i,z,time)            Price of local product i (excluding all taxes on products) in region z
 PM(i,zj,z,time)         Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 PMT(i,z,time)           Price of composite commodity i imported by region z (including all taxes duties and margins)
 PP(j,z,time)            Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 PVA(j,z,time)           Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 PKLE(j,z,time)          Price of industry j KLE in region z 
 PWM(i,zj,z,time)        World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMG(i,time)            World price of margin i (expressed in international currency)
 PWX(i,z,zj,time)        World price of commodity i exported to country zj by region z (expressed in international currency)
 R(k,j,z,time)           Rental rate of type k capital in industry j of region z
 RC(j,z,time)            Rental rate of industry j composite capital in region z
 RTI(k,j,z,time)         Rental rate paid by industry j for type k capital in region z including capital taxes
 U(z,time)               User cost of capital in region z
 W(l,z,time)             Wage rate of type l labor in region z
 WC(j,z,time)            Wage rate of industry j composite labor in region z
 WTI(l,j,z,time)         Wage rate paid z by industry j for type l labor in region including payroll taxes

*==============================================================================
*   5.1.3 Nominal (value) variables
*==============================================================================
 CAB(z,time)             Current account balance of region z
 CTH(z,time)             Consumption budget of households in region z
 DEP(z,time)             Amount of depreciation (capital consumption allowance) in region z
 G(z,time)               Current government expenditures on goods and services in region z
 GDP_BP(z,time)          Region z GDP at basic prices
 GDP_BP_W(time)          World GDP at basic prices
 GDP_FD(z,time)          Region z GDP at purchasers prices from the perspective of final demand
 GDP_IB(z,time)          Region z GDP at market prices (income-based)
 GDP_MP(z,time)          Region z GDP at market prices
 IT(z,time)              Total investment expenditures in region z
 SG(z,time)              Government savings in region z
 SH(z,time)              Household savings in region z
 SROW(z,time)            Rest-of-the-world savings with respect to region z
 TDH(z,time)             Household income taxes in region z
 TIC(i,z,time)           Government revenue from indirect taxes on commodity i in region z
 TICT(z,time)            Total government receipts of indirect taxes on commodities in region z
 TIK(k,j,z,time)         Government revenue from taxes on type k capital used by industry j in region z
 TIKT(z,time)            Total government revenue from from taxes on capital in region z
 TIM(i,zj,z,time)        Government revenue from duties on commodity i imported from region zj by region z
 TIMT(z,time)            Total government revenue from import duties in region z
 TIP(j,z,time)           Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 TIPT(z,time)            Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 TIW(l,j,z,time)         Government revenue from payroll taxes on type l labor in industry j of region z
 TIWT(z,time)            Total government revenue from payroll taxes in region z
 TIX(i,z,zj,time)        Government revenue from export taxes on commodity i exported by region z to region zj
 TIXT(z,time)            Total government revenue from export taxes in region z
 TPRCTS(z,time)          Total government revenue from taxes on products and imports in region z
 TPRODN(z,time)          Total government revenue from other taxes on production in region z
 YDH(z,time)             Household disposable income in region z
 YG(z,time)              Total government income in region z
 YH(z,time)              Household total income in region z
 YHK(z,time)             Household capital income in region z
 YHL(z,time)             Household labor income in region z
 YROW(z,time)            Rest-of-the-world total income from region z

*==============================================================================
*   5.1.4 Rates and intercepts
*==============================================================================
 phi(z,time)             Scale variable (allocation of investment to industries)
 sh0(z,time)             Intercept (household savings)
 sh1(z,time)             Slope (household savings)
 ttdh0(z,time)           Intercept (household income tax)
 ttdh1(z,time)           Slope (household income tax)
 ttic(i,z,time)          Tax rate on commodity i
 ttik(k,j,z,time)        Tax rate on capital k used in industry j
 ttim(i,zj,z,time)       Rate of taxes and duties on imports of commodity i from country zj
 ttip(j,z,time)          Tax rate on the production of industry j
 ttiw(l,j,z,time)        Tax rate on type l worker compensation in industry j
 ttix(i,z,zj,time)       Export tax rate on exported commodity i

*==============================================================================
*   5.1.5 Other variables
*==============================================================================
 A_VA(z,time)            Multifactor productivity
 LEON(z,time)            Excess supply on the last market in region z
;

*==============================================================================
*  5.2 Equation declarations
*==============================================================================
EQUATIONS
 EQ1(j,z,time)           Leontief - demand for value added
 EQ1_1(j,z,time)         Leontief - demand for KLE(Industries) 
 EQ2(j,z,time)           Leontief - demand for intermediate consumption
 EQ2_1(j,z,time)         Leontief - demand for intermediate energy consumption(Energy Industries)
 EQ3(j,z,time)           CES - combination of labor and capital
 EQ3_1(j,z,time)         CES - combination of composite energy and value added
 EQ4(j,z,time)           CES - demand for composite labor
 EQ4_1(j,z,time)         Demand for value added relative to composite energy
 EQ5(j,z,time)           CES between labor categories
 EQ6(l,j,z,time)         Demand for labor
 EQ7(j,z,time)           CES between capital categories
 EQ8(k,j,z,time)         Demand for capital
 EQ9(i,j,z,time)         Leontief - demand for commodity i by sector j
 EQ9_1(i,j,z,time)       Leontief - demand for commodity i by sector j
 EQ9_2(i,j,z,time)       CES between energy commodities categories
 EQ10(z,time)            Household total income
 EQ11(z,time)            Household labor income
 EQ12(z,time)            Household capital income
 EQ13(z,time)            Household disposable income
 EQ14(z,time)            Household consumption budget
* CALEQ1(z,time)          Aggregate domestic savings
 EQ15(z,time)            Household savings
 EQ16(z,time)            Government total income
 EQ17(z,time)            Total government receipts of taxes on production
 EQ18(z,time)            Government receipts of indirect taxes on wages
 EQ19(z,time)            Government receipts of indirect taxes on capital
 EQ20(z,time)            Government receipts of indirect taxes on production
 EQ21(z,time)            Total government receipts of taxes on products and imports
 EQ22(z,time)            Government receipts of indirect taxes on consumption
 EQ23(z,time)            Government receipts of indirect taxes on imports
 EQ24(z,time)            Government receipts of indirect taxes on exports
 EQ25(z,time)            Household h income taxes
 EQ26(l,j,z,time)        Government receipts of indirect taxes on wages
 EQ27(k,j,z,time)        Government receipts of indirect taxes on capital
 EQ28(j,z,time)          Government receipts of indirect taxes on production of industry j
 EQ29(i,z,time)          Government receipts of indirect taxes on commodity i
 EQ30(i,zj,z,time)       Government receipts of indirect taxes on imports of commodity i
 EQ31(i,z,zj,time)       Government receipts of indirect taxes on exports of commodity i
 EQ32(z,time)            Government savings
 EQ33(z,time)            Rest of the world total income
 EQ34(z,time)            Rest of the world savings
 EQ35(z,time)            Equivalence between current account balance and savings
 EQ36(i,z,time)          Household consumption of commodity i
 EQ37(i,z,time)          Final demand of commodity i for investment purposes
 EQ38(i,z,time)          Public final consumption of commodity i
 CALEQ2(z,time)          Current government expenditures on goods and services
 EQ39(i,z,time)          Total intermediate consumption of commodity i
 EQ39_1(i,z,time)        Total intermediate consumption of commodity i
* EQ40_1(j,z)             CET between different commodities produced by industry j
* EQ40_2(j,i,z)           Industry j production of commodity i (CET)
 EQ40_3(i,z,time)        Domestic supply by commdities
 EQ40_4(j,z,time)        Total supply by commdities
 EQ40_5(i,z,time)        CET function between exports local production and margins
 EQ41(i,z,time)          Supply of composite exports
 EQ42(i,z,time)          Supply of margins
 EQ43(i,z,time)          CET function between exports by trading partner
 EQ44(i,z,zj,time)       Supply of exports by trading partner
 EQ45(i,z,time)          CES function between composite imports and local production
 EQ46(i,z,time)          Demand for composite imports
 EQ47(i,z,time)          CES function between imports by origin
 EQ48(i,zj,z,time)       Demand for imports by origin
 EQ49(j,z,time)          Producer price in energy industries j after production taxes
 EQ49_1(j,z,time)        Producer price in industry j after production taxes
* EQ49_2(j,i,z)     Total producer price is equal to P if there is only one product
* EQ49_3(j,i,z)     Basic price of industry j's production of commodity i
 EQ50(j,z,time)          Basic price of industry j production
 EQ51(j,z,time)          Price index of industry j intermediate consumption
 EQ51_1(j,z,time)        Price index of industry j intermediate energy consumption
 EQ52(j,z,time)          Value added price
 EQ52_1(j,z,time)        KLE price
* EQ53(j,z)         Price of composite labor in industry j (redundant)
 EQ54(l,j,z,time)        Wages including taxes
 EQ54_1(ene,j,z,time)    energy commodity prices
* EQ55(j,z)         Price of composite capital in industry j (redundant)
 EQ56(k,j,z,time)        Rental rate including taxes
* EQ57(k,j,z,time)        Rate of remuneration of capital k (capital mobile)
 EQ58(i,z,time)          Producer price is a weighted sum of PE and PL
* EQ59(i,z)         Price of composite export i (redundant)
 EQ60(i,z,zj,time)       Border price of exported commodity i
 EQ61(i,z,time)          Price of local product i (including all taxes and margins)
 EQ62(i,zj,z,time)       Price of imported commodity i (including all taxes and duties)
* EQ63(i,z)         Price of composite import i (redundant)
 EQ64(i,z,time)          Consumer price is a weighted sum of PD and PM
* EQ65(z,time)            Aggregate price of capital
 EQ66(z,time)            GDP deflator (Fischer index)
 EQ67(time)              World GDP deflator (Fischer index)
 EQ68(z,time)            Consumer price index (Laspeyres)
 EQ69(z,time)            Investment price index (derived from investment function)
 EQ70(z,time)            Public expenditure price index
 EQ71(i1,z,time)         Domestic absorbtion
 EQ72(l,z,time)          Labor supply equals labor demand
 EQ73(k,z,time)          Capital supply equals capital demand
 EQ74(z,time)            Total investment equals total savings
 EQ75(z,time)            Depreciation
 EQ76(i,z,time)          Supply of domestic production equals demand
 EQ77(i,z,zj,time)       Exports supply equals imports demand
 EQ78(i,z,zj,time)       Exports price equals imports price
 EQ79(i,time)            World demand for margins equals world supply
* EQ80              Sum of foreign savings equals zero (redundant)
 EQ81(z,time)            GDP at basic prices
 EQ82(z,time)            GDP at market prices
 EQ83(z,time)            GDP at market prices (income-based)
 EQ84(z,time)            GDP at market prices (expenditure-based)
 EQ85(time)              World GDP
 EQ86(z,time)            Real consumption budget of type h households
 EQ87(z,time)            Real current government expenditures on goods and services
 EQ88(z,time)            Real GDP at basic prices
 EQ89(time)              Real world GDP at basic prices
 EQ90(z,time)            Real GDP at market prices
 EQ91(z,time)            Real gross fixed capital formation
 EQ92(z,time)            Current account balance of region z in terms of the reference currency
 EQ93                    fictitious OBJ. fuction
 WALRAS(z,time)          Walras law verification
* EQB_1(i,z)        Top Nest - CES function Aggregated acitivty
* EQB_2(j,i,z)      Top Nest - CES function Aggregated acitivty
* EQB_3(j,i,z)      Total producer price is equal to P if there is only one product
* EQB_4(j,i,z)      Basic price of industry j's production of commodity i
* EQB_5(j,i,z)      Supply of exports for compsite activity
 EQA_1(z,time)           Top Nest - Leontief function Aggregated-Electricity
 EQA_2(Z,time)           Top Nest - Leontief function Aggregated-Electricity
 EQA_3(z,time)           Second Nest - CES function - Aggregated-Electricity
 EQA_4(power,i,z,time)   Second Nest - CES function - Aggregated-Electricity
 EQB_1(i2,z,time)        Industry j production of commodity i (CES)
 EQB_3(j,i,z,time)       Total producer price is equal to P if there is only one product
 EQB_4(j,i,z,time)       Basic price of industry js production of commodity i
 EQB_5(j,i,z,time)       Supply of exports for compsite activity

 EQ94(z,time)            Total investment expenditure constraint
 EQ95(z,time)            Aggregate price of capital
 EQ96(k,bus,z,time)      Investment demand by industry
 CALEQ3(k,pub,z,time)    Public investment demand
* EQ97a(z,time)           Interest rate (weighted average rate of return on capital)
 EQ97b(z,time)           User cost of capital
* EQ98(k,j,z,time)
;

*==============================================================================
*  5.3 Equations
*==============================================================================
*   5.3.1 Production
*==============================================================================
 EQ1(j3,z,t)..     VA(j3,z,t) =e= v(j3,z)*XST(j3,z,t);

 EQ1_1(j2,z,t)..   KLE(j2,z,t) =e= v2(j2,z)*XST(j2,z,t);

 EQ2(j,z,t)..      CI(j,z,t) =e= io(j,z)*XST(j,z,t);
 
 EQ2_1(j3,z,t)..   CE(j3,z,t) =e= io2(j3,z)*XST(j3,z,t);

 EQ3(j,z,t)..      VA(j,z,t) =e= A_VA(z,t)*B_VA(j,z)*{
                    [beta_VA(j,z)*LDC(j,z,t)**(-rho_VA(j,z))]$LDCO(j,z)
                   +[(1-beta_VA(j,z))*KDC(j,z,t)**(-rho_VA(j,z))]$KDCO(j,z)
                                                   }**(-1/rho_VA(j,z));

 EQ3_1(j2,z,t)..   KLE(j2,z,t) =e= B_KLE(j2,z)*{
                    [beta_KLE(j2,z)*VA(j2,z,t)**(-rho_KLE(j2,z))]$VAO(j2,z)
                   +[(1-beta_KLE(j2,z))*CE(j2,z,t)**(-rho_KLE(j2,z))]$CEO(j2,z)
                                                   }**(-1/rho_KLE(j2,z));

 EQ4(j,z,t)$[LDCO(j,z) and KDCO(j,z)]..
                 LDC(j,z,t) =e= {[beta_VA(j,z)/(1-beta_VA(j,z))]
                              *[RC(j,z,t)/WC(j,z,t)]}**sigma_VA(j,z)*KDC(j,z,t);

 EQ4_1(j2,z,t)$[VAO(j2,z) and CEO(j2,z)]..
                 VA(j2,z,t) =e= {[beta_KLE(j2,z)/(1-beta_KLE(j2,z))]
                              *[PCE(j2,z,t)/PVA(j2,z,t)]}**sigma_KLE(j2,z)*CE(j2,z,t);

 EQ5(j,z,t)$LDCO(j,z)..
                 LDC(j,z,t) =e= B_LD(j,z)*SUM[l$LDO(l,j,z),beta_LD(l,j,z)
                                *LD(l,j,z,t)**(-rho_LD(j,z))]**(-1/rho_LD(j,z));

 EQ6(l,j,z,t)$LDO(l,j,z)..
                 LD(l,j,z,t) =e= [beta_LD(l,j,z)*WC(j,z,t)/WTI(l,j,z,t)]
                               **sigma_LD(j,z)*B_LD(j,z)**(sigma_LD(j,z)-1)
                               *LDC(j,z,t);

 EQ7(j,z,t)$KDCO(j,z)..
                 KDC(j,z,t) =e= B_KD(j,z)*SUM[k$KDO(k,j,z),beta_KD(k,j,z)
                                *KD(k,j,z,t)**(-rho_KD(j,z))]**(-1/rho_KD(j,z));

 EQ8(k,j,z,t)$KDO(k,j,z)..
                 KD(k,j,z,t) =e= [beta_KD(k,j,z)*RC(j,z,t)/RTI(k,j,z,t)]
                                 **sigma_KD(j,z)*B_KD(j,z)**(sigma_KD(j,z)-1)
                                 *KDC(j,z,t);

 EQ9(nene,j,z,t)..   DI(nene,j,z,t) =e= aij(nene,j,z)*CI(j,z,t) ;

 EQ9_1(ene,j3,z,t)..  DE(ene,j3,z,t)   =e= aij2(ene,j3,z)*CE(j3,z,t) ;

 EQ9_2(ene,j2,z,t)..  DE(ene,j2,z,t) =e= [beta_ENER(ene,j2,z)*PCE(j2,z,t)/P4(ene,j2,z,t)]
                                   **sigma_ENER(j2,z)*B_ENER(j2,z)**(sigma_ENER(j2,z)-1)
                                   *CE(j2,z,t);

*==============================================================================
*   5.3.2 Income and savings
*==============================================================================
*    5.3.2.1 Households
*==============================================================================
 EQ10(z,t)..       YH(z,t) =e= YHL(z,t)+YHK(z,t);

 EQ11(z,t)..       YHL(z,t) =e= SUM[(l,j)$LDO(l,j,z),W(l,z,t)*LD(l,j,z,t)];

 EQ12(z,t)..       YHK(z,t) =e= SUM[(k,j)$KDO(k,j,z),R(k,j,z,t)*KD(k,j,z,t)];

 EQ13(z,t)..       YDH(z,t) =e= YH(z,t)-TDH(z,t);

 EQ14(z,t)..       CTH(z,t) =e= YDH(z,t)-SH(z,t);

* CALEQ1(z,t)..     SH(z,t)+SG(z,t) =e= sh1(z,t)*GDP_IB(z,t);
* CALEQ1(z,t)..     SH(z,t)+SG(z,t) =e= sh1(z,t)*GDP_IB(z,t);

 EQ15(z,t)..       SH(z,t) =e= sh1(z,t)*YDH(z,t);
* EQ15(z,t)..       SH(z,t) =e= PIXCON(z,t)**eta*sh0(z,t)+sh1(z,t)*YDH(z,t);

*==============================================================================
*    5.3.2.2 Government
*==============================================================================
 EQ16(z,t)..       YG(z,t) =e= TDH(z,t)+TPRODN(z,t)+TPRCTS(z,t) ;

 EQ17(z,t)..       TPRODN(z,t) =e= TIWT(z,t)+TIKT(z,t)+TIPT(z,t);

 EQ18(z,t)..       TIWT(z,t) =e= SUM[(l,j)$LDO(l,j,z),TIW(l,j,z,t)];

 EQ19(z,t)..       TIKT(z,t) =e= SUM[(k,j)$KDO(k,j,z),TIK(k,j,z,t)];

 EQ20(z,t)..       TIPT(z,t) =e= SUM[j,TIP(j,z,t)];

 EQ21(z,t)..       TPRCTS(z,t) =e= TICT(z,t)+TIMT(z,t)+TIXT(z,t);

 EQ22(z,t)..       TICT(z,t) =e= SUM[i,TIC(i,z,t)];

 EQ23(z,t)..       TIMT(z,t) =e= SUM[(i,zj)$IMO(i,zj,z),TIM(i,zj,z,t)];

 EQ24(z,t)..       TIXT(z,t) =e= SUM[(i,zj)$EXO(i,z,zj),TIX(i,z,zj,t)];

 EQ25(z,t)..       TDH(z,t) =e= PIXCON(z,t)**eta*ttdh0(z,t)+ttdh1(z,t)*YH(z,t);

 EQ26(l,j,z,t)$LDO(l,j,z)..
                 TIW(l,j,z,t) =e= ttiw(l,j,z,t)*W(l,z,t)*LD(l,j,z,t);

 EQ27(k,j,z,t)$KDO(k,j,z)..
                 TIK(k,j,z,t) =e= ttik(k,j,z,t)*R(k,j,z,t)*KD(k,j,z,t);

 EQ28(j,z,t)..     TIP(j,z,t) =e= ttip(j,z,t)*PP(j,z,t)*XST(j,z,t);

 EQ29(i,z,t)..     TIC(i,z,t) =e= ttic(i,z,t)*{[PL(i,z,t)*DD(i,z,t)]$DDO(i,z)
                 +[SUM[zj$IMO(i,zj,z),(1+ttim(i,zj,z,t))*IM(i,zj,z,t)*e(z,t)
                  *(PWM(i,zj,z,t)+SUM(ij,PWMG(ij,t)*tmrg(ij,i,zj,z)))]]};

 EQ30(i,zj,z,t)$IMO(i,zj,z)..
                 TIM(i,zj,z,t) =e= ttim(i,zj,z,t)*IM(i,zj,z,t)*e(z,t)*
                                   (PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)
                                   *tmrg(ij,i,zj,z)]);

 EQ31(i,z,zj,t)$EXO(i,z,zj)..
                 TIX(i,z,zj,t) =e= ttix(i,z,zj,t)*PE(i,z,zj,t)*EX(i,z,zj,t);

 EQ32(z,t)..       SG(z,t) =e= YG(z,t)-G(z,t);
* EQ32(z,t)..       SG(z,t) =e= YG(z,t)- sum(i,PC(i,z,t)*CG(i,z,t));

*==============================================================================
*    5.3.2.4 Rest of the world
*==============================================================================
 EQ33(z,t)..       YROW(z,t) =e= e(z,t)*SUM{(i,zj)$IMO(i,zj,z),IM(i,zj,z,t)*
                           [PWM(i,zj,z,t)+SUM(ij,PWMG(ij,t)*tmrg(ij,i,zj,z))]};

 EQ34(z,t)..       SROW(z,t) =e= YROW(z,t)-e(z,t)*SUM[(i,zj)$EXO(i,z,zj),
                               EX(i,z,zj,t)*PWX(i,z,zj,t)]-e(z,t)
                               *SUM[i$MRGNO(i,z),MRGN(i,z,t)*PWMG(i,t)];

 EQ35(z,t)..       SROW(z,t) =e= -CAB(z,t);

*==============================================================================
*   5.3.3 Demand
*==============================================================================
 EQ36(i,z,t)..     PC(i,z,t)*C(i,z,t) =e= PC(i,z,t)*CMIN(i,z,t)+gamma_LES(i,z)
                                 *{CTH(z,t)-SUM[ij,PC(ij,z,t)*CMIN(ij,z,t)]};

 EQ37(i,z,t)..     PC(i,z,t)*INV(i,z,t) =e= gamma_INV(i,z)*IT(z,t);

 EQ38(i,z,t)..     PC(i,z,t)*CG(i,z,t) =e= gamma_GVT(i,z)*G(z,t);

 CALEQ2(z,t)..     G(z,t) =e= GO(z)*GDP_BP(z,t)/GDP_BPO(z);

 EQ39(nene,z,t)..   DIT(nene,z,t) =e= SUM[j,DI(nene,j,z,t)];
 
 EQ39_1(ene,z,t)..  DIT(ene,z,t) =e= SUM[j,DE(ene,j,z,t)];

*==============================================================================
*   5.3.4 International trade
*==============================================================================
$ONTEXT
 EQB_1(i,z)..    XS_I(i,z) =e= B_X3(i,z)*SUM[j$XSO(j,i,z),beta_X3(j,i,z)
                                *XS(j,i,z)**(-rho_X3(i,z))]**(-1/rho_X3(i,z));

 EQB_2(j,i,z)${DSO(j,i,z) and [DSO(j,i,z) ne DSO_I(i,z)]}..
                 XS(j,i,z) =e= XS_I(i,z)/B_X3(i,z)**(1-sigma_X3(i,z))*
                               [beta_X3(j,i,z)*PI(i,z)/P2(j,i,z)]
                               **sigma_X3(i,z);

 EQB_3(j,i,z)${DSO(j,i,z)}..   P2(j,i,z) =e= PT(j,z);

 EQB_4(j,i,z)$DSO(j,i,z)..
                 P2(j,i,z)*XS(j,i,z) =e= [PET(i,z)*EXTT(j,i,z)]$EXTTO(j,i,z)
                                        +[e(z)*MRGN(i,z)*PWMG(i)]$MRGNO(i,z)
                                        +[PL(i,z)*DS(j,i,z)]$DSO(j,i,z);

 EQB_5(j,i,z)$DSO(j,i,z)..  EXTT(j,i,z)  =e= theta2(j,i,z)*EXT(i,z);
$OFFTEXT

*[Top Nest - Leontief function]
 EQA_1(z,t)..  XS('18_TnD','18_ELEC',z,t) =e= TnDShare(z)*XS_I('18_ELEC',z,t);
 EQA_2(z,t)..  XS_I('18_ELEC',z,t) =e= XS('18_TnD','18_ELEC',z,t) + POWERQ(z,t);


*[Second Nest - CES function]
 EQA_3(z,t)..    POWERQ(z,t) =e= B_X4(z)*SUM[POWER, beta_X4(power,z)
                                *XS(POWER,'18_ELEC',z,t)**(-rho_X4(z))]**(-1/rho_X4(z));

 EQA_4(power,'18_ELEC',z,t)..  XS(POWER,'18_ELEC',z,t) =e= POWERQ(z,t)/B_X4(z)**(1-sigma_X4(z))*
                               [beta_X4(power,z)*PPOWER(z,t)/P2(POWER,'18_ELEC',z,t)]
                               **sigma_X4(z);

* exclude electiricity
 EQB_1(i2,z,t)..    XS_I(i2,z,t) =e= B_X3(i2,z)*SUM[j$XSO(j,i2,z),beta_X3(j,i2,z)
                                *XS(j,i2,z,t)**(-rho_X3(i2,z))]**(-1/rho_X3(i2,z));


 EQB_3(j,i,z,t)${DSO(j,i,z)}..   P2(j,i,z,t) =e= PT(j,z,t);

 EQB_4(j,i,z,t)$DSO(j,i,z)..
                 P2(j,i,z,t)*XS(j,i,z,t) =e= [PET(i,z,t)*EXTT(j,i,z,t)]$EXTTO(j,i,z)
                                        +[e(z,t)*MRGN(i,z,t)*PWMG(i,t)]$MRGNO(i,z)
                                        +[PL(i,z,t)*DS(j,i,z,t)]$DSO(j,i,z);

 EQB_5(j,i,z,t)$DSO(j,i,z)..  EXTT(j,i,z,t)  =e= theta2(j,i,z)*EXT(i,z,t);

 EQ40_3(i,z,t)..   DS_I(i,z,t) =e= sum(j,DS(j,i,z,t)$DSO(j,i,z));

 EQ40_4(j,z,t)..   XST(j,z,t)  =e= sum(i,XS(j,i,z,t)$XSO(j,i,z));

 EQ40_5(i,z,t)..   XS_I(i,z,t) =e= B_X1(i,z)*{
                 [beta_EX_X1(i,z)*EXT(i,z,t)**rho_X1(i,z)]$EXTO(i,z)
                +[beta_D_X1(i,z)*DS_I(i,z,t)**rho_X1(i,z)]$DSO_I(i,z)
                +[(1-beta_EX_X1(i,z)-beta_D_X1(i,z))*MRGN(i,z,t)**rho_X1(i,z)]$MRGNO(i,z)
                                          }**(1/rho_X1(i,z));

 EQ41(i,z,t)$[EXTO(i,z) and DSO_I(i,z)]..
                 EXT(i,z,t) =e= {[beta_D_X1(i,z)/beta_EX_X1(i,z)]*[PET(i,z,t)/PL(i,z,t)]}
                              **sigma_X1(i,z)*DS_I(i,z,t);

 EQ42(i,z,t)$[MRGNO(i,z) and DSO_I(i,z)]..
                 MRGN(i,z,t) =e= {[beta_D_X1(i,z)/(1-beta_EX_X1(i,z)
                                 -beta_D_X1(i,z))]*[e(z,t)*PWMG(i,t)/PL(i,z,t)]}
                                 **sigma_X1(i,z)*DS_I(i,z,t);

 EQ43(i,z,t)$EXTO(i,z)..
                 EXT(i,z,t) =e= B_X2(i,z)*SUM[zj$EXO(i,z,zj),beta_X2(i,z,zj)
                                *EX(i,z,zj,t)**rho_X2(i,z)]**(1/rho_X2(i,z));

 EQ44(i,z,zj,t)$EXO(i,z,zj)..
                 EX(i,z,zj,t) =e= EXT(i,z,t)/B_X2(i,z)**(1+sigma_X2(i,z))*
                                  [PE(i,z,zj,t)/(beta_X2(i,z,zj)*PET(i,z,t))]
                                  **sigma_X2(i,z);

 EQ45(i,z,t)..     Q(i,z,t) =e= B_M1(i,z)*{
                    [beta_M1(i,z)*IMT(i,z,t)**(-rho_M1(i,z))]$IMTO(i,z)
                   +[(1-beta_M1(i,z))*DD(i,z,t)**(-rho_M1(i,z))]$DDO(i,z)
                                        }**(-1/rho_M1(i,z));

 EQ46(i,z,t)$[IMTO(i,z) and DDO(i,z)]..
                 IMT(i,z,t) =e= {[beta_M1(i,z)/(1-beta_M1(i,z))]*[PD(i,z,t)
                                /PMT(i,z,t)]}**sigma_m1(i,z)*DD(i,z,t);

 EQ47(i,z,t)$IMTO(i,z)..
                 IMT(i,z,t) =e= B_M2(i,z)*SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*
                                IM(i,zj,z,t)**(-rho_M2(i,z))]**(-1/rho_M2(i,z));

 EQ48(i,zj,z,t)$IMO(i,zj,z)..
                 IM(i,zj,z,t) =e= IMT(i,z,t)/B_M2(i,z)**(1-sigma_M2(i,z))*
                                  [beta_M2(i,zj,z)*PMT(i,z,t)/PM(i,zj,z,t)]
                                  **sigma_M2(i,z);

*==============================================================================
*   5.3.5 Prices
*==============================================================================
 EQ49(j2,z,t)..     PP(j2,z,t)*XST(j2,z,t) =e= PKLE(j2,z,t)*KLE(j2,z,t)+PCI(j2,z,t)*CI(j2,z,t);

 EQ49_1(j3,z,t)..   PP(j3,z,t)*XST(j3,z,t) =e= PVA(j3,z,t)*VA(j3,z,t)+PCI(j3,z,t)*CI(j3,z,t)+PCE(j3,z,t)*CE(j3,z,t);

 EQ50(j,z,t)..     PT(j,z,t) =e= (1+ttip(j,z,t))*PP(j,z,t);

 EQ51(j,z,t)..     PCI(j,z,t)*CI(j,z,t) =e= SUM[nene,PC(nene,z,t)*DI(nene,j,z,t)];

 EQ51_1(j,z,t)..   PCE(j,z,t)*CE(j,z,t) =e= SUM[ene,PC(ene,z,t)*DE(ene,j,z,t)];

* EQ51_1(j,z)..   PCE(j,z)*CE(j,z) =e= SUM[ene,P4(ene,j,z)*DE(ene,j,z)];

 EQ52(j,z,t)..     PVA(j,z,t)*VA(j,z,t) =e= [WC(j,z,t)*LDC(j,z,t)]$LDCO(j,z)
                                     +[RC(j,z,t)*KDC(j,z,t)]$KDCO(j,z);

 EQ52_1(j2,z,t)..   PKLE(j2,z,t)*KLE(j2,z,t) =e= [PVA(j2,z,t)*VA(j2,z,t)]$VAO(j2,z)
                                       +[PCE(j2,z,t)*CE(j2,z,t)]$CEO(j2,z);

* Given equations 5 and 6, equation 53 is redundant
* EQ53(j,z)..     WC(j,z)*LDC(j,z) =e= SUM[l$LDO(l,j,z),WTI(l,j,z)*LD(l,j,z)];

 EQ54(l,j,z,t)$LDO(l,j,z)..
                 WTI(l,j,z,t) =e= W(l,z,t)*(1+ttiw(l,j,z,t));

 EQ54_1(ene,j2,z,t)$DEO(ene,j2,z)..
                 P4(ene,j2,z,t) =e= PC(ene,z,t);

* Given equations 7 and 8, equation 55 is redundant
* EQ55(j,z)$(kmob and KDCO(j,z))..
*                 RC(j,z)*KDC(j,z) =e= SUM[k$KDO(k,j,z),RTI(k,j,z)*KD(k,j,z)];

 EQ56(k,j,z,t)$KDO(k,j,z)..
                 RTI(k,j,z,t) =e= R(k,j,z,t)*(1+ttik(k,j,z,t));

* EQ57(k,j,z,t)$(kmob and KDO(k,j,z))..
*                 R(k,j,z,t) =e= RK(k,z,t);

* EQ58(j,z)..     P(j,z)*XST(j,z) =e= [PL(j,z)*DS(j,z)]$DSO(j,z)
*                                   +[PET(j,z)*EXT(j,z)]$EXTO(j,z)
*                                   +[e(z)*PWMG(j)*MRGN(j,z)]$MRGNO(j,z);

 EQ58(i,z,t)..     P(i,z,t)*XS_I(i,z,t) =e= [PL(i,z,t)*DS_I(i,z,t)]$DSO_I(i,z)
                                     +[PET(i,z,t)*EXT(i,z,t)]$EXTO(i,z)
                                     +[e(z,t)*PWMG(i,t)*MRGN(i,z,t)]$MRGNO(i,z);

* Given equations 43 and 44, equation 59 is redundant
* EQ59(i,z)$EXTO(i,z)..
*                 PET(i,z)*EXT(i,z) =e= SUM[zj$EXO(i,z,zj),
*                                           PE(i,z,zj)*EX(i,z,zj);

 EQ60(i,z,zj,t)$EXO(i,z,zj)..
                 PE(i,z,zj,t)*(1+ttix(i,z,zj,t)) =e= e(z,t)*PWX(i,z,zj,t);

 EQ61(i,z,t)$DDO(i,z)..
                 PD(i,z,t) =e= (1+ttic(i,z,t))*PL(i,z,t);

 EQ62(i,zj,z,t)$IMO(i,zj,z)..
                 PM(i,zj,z,t) =e= (1+ttic(i,z,t))*(1+ttim(i,zj,z,t))*e(z,t)*
                                  (PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)
                                  *tmrg(ij,i,zj,z)]);

* Given equations 47 and 48, equation 63 is redundant
* EQ63(i,z)$IMTO(i,z)..
*                 PMT(i,z)*IMT(i,z) =e= SUM[zj$IMO(i,zj,z),
*                                           PM(i,zj,z)*IM(i,zj,z);

 EQ64(i,z,t)..     PC(i,z,t)*Q(i,z,t) =e= [PD(i,z,t)*DD(i,z,t)]$DDO(i,z)+
                                    [PMT(i,z,t)*IMT(i,z,t)]$IMTO(i,z);

* EQ65(z,t)..       PK(z,t) =e= 1/A_K(z)*PROD[i$gamma_INV(i,z),(PC(i,z,t)
*                               /gamma_INV(i,z))**gamma_INV(i,z)];

 EQ66(z,t)..       PIXGDP(z,t) =e=
                 {SUM[j,{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VAO(j,z)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
                 *SUM[j,{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VA(j,z,t)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z,t)]}**0.5;

 EQ67(t)..         PIXGDP_W(t) =e=
                 {SUM[(j,z),{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VAO(j,z)/e(z,t)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
                 *SUM[(j,z),{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VA(j,z,t)/e(z,t)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z,t)/eO(z)]}**0.5;

 EQ68(z,t)..       PIXCON(z,t) =e= SUM[i,PC(i,z,t)*CO(i,z)]/SUM[i,PCO(i,z)*CO(i,z)];

 EQ69(z,t)..       PIXINV(z,t) =e= PROD[i$gamma_INV(i,z),(PC(i,z,t)/PCO(i,z))
                                 **gamma_INV(i,z)];

 EQ70(z,t)..       PIXGVT(z,t) =e= PROD[i$gamma_GVT(i,z),(PC(i,z,t)/PCO(i,z))
                                 **gamma_GVT(i,z)];

*==============================================================================
*   5.3.6 Equilibrium
*==============================================================================
 EQ71(i1,z,t)..    Q(i1,z,t) =e= C(i1,z,t)+CG(i1,z,t)+INV(i1,z,t)+DIT(i1,z,t);

 EQ72(l,z,t)..     LS(l,z,t) =e= SUM[j$LDO(l,j,z),LD(l,j,z,t)];

 EQ73(k,z,t)$KSO(k,z)..
                   KS(k,z,t) =e= SUM[j$KDO(k,j,z),KD(k,j,z,t)];

 EQ74(z,t)..       IT(z,t) =e= SH(z,t)+SG(z,t)-CAB(z,t);

 EQ75(z,t)..       DEP(z,t) =e= PK(z,t)*delta(z)*SUM[k$KSO(k,z),KS(k,z,t)];

 EQ76(i,z,t)$DDO(i,z)..
                   SUM[j$DSO(j,i,z),DS(j,i,z,t)] =e= DD(i,z,t);

 EQ77(i,z,zj,t)$EXO(i,z,zj)..
                   EX(i,z,zj,t) =e= IM(i,z,zj,t);

 EQ78(i,z,zj,t)$EXO(i,z,zj)..
                   PWX(i,z,zj,t) =e= PWM(i,z,zj,t);

 EQ79(i,t)..       SUM[z$MRGNO(i,z),MRGN(i,z,t)] =e= SUM[(z,zj,ij)$IMO(ij,zj,z),
                                                 tmrg(i,ij,zj,z)*IM(ij,zj,z,t)];

* Given equations 33, 34 and 77, equation 80 is redundant
* EQ80..          SUM[z,SROW(z)/e(z)] =e= 0;

*==============================================================================
*   5.3.7 Gross domestic product
*==============================================================================
 EQ81(z,t)..       GDP_BP(z,t) =e= SUM[j,PVA(j,z,t)*VA(j,z,t)]+TIPT(z,t);

 EQ82(z,t)..       GDP_MP(z,t) =e= GDP_BP(z,t)+TPRCTS(z,t);

 EQ83(z,t)..       GDP_IB(z,t) =e= SUM[(l,j)$LDO(l,j,z),W(l,z,t)*LD(l,j,z,t)]
                              +SUM[(k,j)$KDO(k,j,z),R(k,j,z,t)*KD(k,j,z,t)]
                              +TPRCTS(z,t)+TPRODN(z,t);

 EQ84(z,t)..       GDP_FD(z,t) =e=
                 SUM[i,PC(i,z,t)*(C(i,z,t)+CG(i,z,t)+INV(i,z,t))]
                +SUM[(i,zj)$EXO(i,z,zj),e(z,t)*PWX(i,z,zj,t)*EX(i,z,zj,t)]
                +SUM[i$MRGNO(i,z),e(z,t)*PWMG(i,t)*MRGN(i,z,t)]
                -SUM[(i,zj)$IMO(i,zj,z),e(z,t)*IM(i,zj,z,t)
                    *(PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)*tmrg(ij,i,zj,z)])];

 EQ85(t)..          GDP_BP_W(t) =e= SUM[z,GDP_BP(z,t)/e(z,t)];

*==============================================================================
*  5.3.8 Real (volume) variables computed from price indices
*==============================================================================
 EQ86(z,t)..       CTH_REAL(z,t) =e= CTH(z,t)/PIXCON(z,t);

 EQ87(z,t)..       G_REAL(z,t) =e= G(z,t)/PIXGVT(z,t);

 EQ88(z,t)..       GDP_BP_REAL(z,t) =e= GDP_BP(z,t)/PIXGDP(z,t);

 EQ89(t)..         GDP_BP_W_REAL(t) =e= GDP_BP_W(t)/PIXGDP_W(t);

 EQ90(z,t)..       GDP_MP_REAL(z,t) =e= GDP_MP(z,t)/PIXCON(z,t);

 EQ91(z,t)..       IT_REAL(z,t) =e= IT(z,t)/PIXINV(z,t);

 EQ92(z,t)..       CABX(z,t) =e= CAB(z,t)/[PIXGDP_W(t)*e(z,t)];

 EQ93..            OBJ =e= 1;

*==============================================================================
*   5.3.8 Dynamic equations
*==============================================================================
* EQ84(k,j,z,t).. KD(k,j,z,t) =e= KD(k,j,z,t-1)*(1-delta(z))+IND(k,j,z,t-1);

 EQ94(z,t)..     IT(z,t) =e= PK(z,t)*SUM[(k,j)$KDO(k,j,z),IND(k,j,z,t)];

 EQ95(z,t)..     PK(z,t) =e= 1/A_K(z)*PROD[i$gamma_INV(i,z),(PC(i,z,t)
                               /gamma_INV(i,z))**gamma_INV(i,z)];

 EQ96(k,bus,z,t)$KDO(k,bus,z)..
                 IND(k,bus,z,t) =e= phi(z,t)*[R(k,bus,z,t)/U(z,t)]
                                  **sigma_INV(k,bus,z)*KD(k,bus,z,t);

 CALEQ3(k,pub,z,t)$KDO(k,pub,z)..
                 IND(k,pub,z,t)*PK(z,t) =e= INDO(k,pub,z)*PKO(z)*GDP_BP(z,t)
                                            /GDP_BPO(z);

* EQ97a(z,t)..    IR(z,t) =e= {SUM[(k,j)$KDO(k,j,z),
*                              R(k,j,z,t)*KD(k,j,z,t)]-DEP(z,t)}/
*                             {PK(z,t)*SUM[(k,j)$KDO(k,j,z),KD(k,j,z,t)]};

 EQ97b(z,t)..    U(z,t) =e= PK(z,t)*(delta(z)+IR(z,t));

* EQ98(k,j,z,t)$KDO(k,j,z).. PK(z,t)*IND(k,j,z,t) =e= [R(k,j,z,t)**1*KD(k,j,z,t)/sum((kj,jj)$KDO(kj,jj,z),R(k,j,z,t)**1*KD(kj,jj,z,t))]*IT(z,t);    
 


*==============================================================================
*   5.3.10 Other
*==============================================================================
 WALRAS(z,t)..   LEON(z,t) =e= Q('01_AGRICULT',z,t)-C('01_AGRICULT',z,t)-CG('01_AGRICULT',z,t)-INV('01_AGRICULT',z,t)
                            -DIT('01_AGRICULT',z,t);

*==============================================================================
* 6 Numerical resolution to compute A_VA, sh0, G, G_REAL and IND
*==============================================================================
*option cns = Snopt;
*option cns = Ipopt;
*option NLP = Ipopt;

*option cns = path;
*option cns = conopt4;
*option NLP = conopt4;
*option NLP = minos;
*option NLP = pathnlp ;

*option iterlim = 100;
*option iterlim = 0;

* Eliminating display of solution makes it easier to check whether model solves
* and to identify year when it crashes.
*option limrow=0, limcol=0, solprint = off;
*option limrow=0, limcol=0, iterlim= 100 ;
*option reslim = 1000;

MODEL PEPWT World wide dynamic model /all/ ;
PEPWT.holdfixed=1;

*==============================================================================
*  6.1 Resolution
*==============================================================================

LOOP[time,
T(time) = YES;

*==============================================================================
*   6.1.1 Initialisation
*==============================================================================
*$INCLUDE INIT_231010.gms
*$INCLUDE INIT_240125.gms
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
*   6.1.2 Fixing GDP_BP_REAL and sh1, and initializing A_VA and sh0
*==============================================================================
* To compute the baseline, real GDP is set to grow at the projected growth rate
* and multifactor productivity is endogenous.
 GDP_BP_REAL.fx(z,t1)  = GDP_BP_REALO(z);
 GDP_BP_REAL.fx(z,time)$[ord(time) gt 1]
*                       = GDP_BP_REAL.l(z,time-1)*[1+growthz(z)];
                       = GDP_BP_REAL.l(z,time-1)*[1+g_GDP(z,time)];

 A_VA.L(z,t1)          = 1;
 A_VA.L(z,time)$[ord(time) gt 1]
                       = A_VA.L(z,time-1);

* SH.fx(z,t1)        = SHO(z);
* SH.fx(z,time)$[ord(time) gt 1]
*                     = SH.l(z,time-1)*[1+growthz(z)];
*                     = SH.l(z,time-1)*[1+g_GDP(z,time)];  

* CG.fx(i,z,t1)        = CGO(i,z);
* CG.fx(i,z,time)$[ord(time) gt 1]
*                      = CG.l(i,z,time-1)*[1+growthz(z)];
*                      = CG.l(i,z,time-1)*[1+g_GDP(z,time)]; 

* Domestic savings rates are made to follow the evolution anticipated by FBQF
* and the intercept for the household savings function is endogenously
* determined from the added constraint labeled CALEQ1:
 sh1.fx(z,t1)        = sh1O(z);
 sh1.fx(z,time)$[ord(time) gt 1]
*                     = sh1.l(z,time-1)*[1+g_SDR(z,time-1)];
                     = sh1.l(z,time-1);

 sh0.l(z,t1)         = sh0O(z);
 sh0.l(z,time)$[ord(time) gt 1]
*                     = sh0.l(z,time-1)*exogro(z,time)/exogro(z,time-1);
                     = sh0.l(z,time-1);

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
*   6.1.4 Other exogenous variables
*==============================================================================
* CABX.FX(z1,time)    = CABXO(z1)*cabix(z1,time);
 
 CABX.FX(z1,time)     = CABXO(z1);
 CABX.FX(z1,time)$[ord(time) gt 1]
*                      = CABX.l(z1,time-1)*[1+growthz(z1)];
                      = CABX.l(z1,time-1)*[1+g_GDP(z1,time)];
 
 CMIN.FX(i,z,t1)      = CMINO(i,z);
 CMIN.FX(i,z,time)$[ord(time) gt 1]
*                      = CMIN.l(i,z,time-1)*[1+growthz(z)];
                      = CMIN.l(i,z,time-1)*[1+g_POP(z,time)];

 KD.fx(k,j,z,t1)$KDO(k,j,z)
                     = KDO(k,j,z);
 KD.fx(k,j,z,time)${[ord(time) gt 1] and KDO(k,j,z)}
                     = KD.l(k,j,z,time-1)*[1-delta(z)]+IND.l(k,j,z,time-1);

 LS.FX(l,z,t1)       = LSO(l,z);
 LS.FX(l,z,time)$[ord(time) gt 1]
*                    = LS.l(l,z,time-1)*[1+growthz(z)];
                     = LS.l(l,z,time-1)*[1+g_POP(z,time)];

 phi.fx(z,time)       = phio(z);
 ttdh0.fx(z,time)     = ttdh0O(z);
 ttdh1.fx(z,time)     = ttdh1O(z);
 ttic.fx(i,z,time)    = tticO(i,z);
 ttik.fx(k,j,z,time)  = ttikO(k,j,z);
 ttim.fx(i,zj,z,time) = ttimO(i,zj,z);
 ttip.fx(j,z,time)    = ttipO(j,z);
 ttiw.fx(l,j,z,time)  = ttiwO(l,j,z);
 ttix.fx(i,z,zj,time) = ttixO(i,z,zj);

*==============================================================================
*   6.1.5 Resolution
*==============================================================================

SOLVE PEPWT USING CNS;
*SOLVE PEPWT using NLP maximizing OBJ;
*SOLVE PEPWT USING MCP;

* The single element in subset T(time) is removed, and the subset is now empty.
T(time)          = NO;
* End of LOOP over time periods
];

*$exit

*==============================================================================
* 7. Output
*==============================================================================
* Preparation of a GDX file that includes the baseline values for A_VA, sh0, G,
* G_REAL and IND. This file will then be used in the main program.

PARAMETER
 A_VA_RES(z,time) Value of A_VA to reproduce real GDP projections
 GX(z,time)       Current government expenditures on goods and services in region z
 G_REALX(z,time)  Current real government expenditures on goods and services in region z
 INDX(k,j,z,time) Volume of new type k capital investment to industry j in region z
 sh0X(z,time)     Intercept (household savings)
 sh1X(z,time)     Household savings rate
;

 A_VA_RES(z,time)        = A_VA.l(z,time);
 GX(z,time)              = G.l(z,time);
 G_REALX(z,time)         = G_REAL.l(z,time);
 INDX(k,pub,z,time)      = IND.l(k,pub,z,time);
 sh1X(z,time)            = sh1.l(z,time);
 sh0X(z,time)            = sh0.l(z,time);

execute_unload 'Input_w-t/B_line_240219.gdx',
 A_VA_RES, GX, G_REALX, INDX, delta, XST, VA, LS, KS, LD, KD, IND, EX, g_GDP, g_POP, GDP_BP, RC, IT, SH, SG, CABX, R, PK, sigma_LD, sigma_INV,
 sh1X, sh0X ;
 
*execute_unload 'CalB_Check'  ;
