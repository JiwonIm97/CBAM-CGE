$TITLE     PEP model w-1
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

$GDXIN DATA_AGG-2019_230906_POWER3_Joint.gdx
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

I2(I)
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

ENE(I) Energy commodity
/
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_GAS         Natural gas
 10_PETROLCOAL   Petroleum and coal products
 18_ELEC         Electricity
/

NENE(I)
/
 01_AGRICULT    Agricultural forest and fishery goods
* 02_COAL        Coal
* 03_OIL         Crude petroleum
* 04_GAS         Natural gas Gas distribution
 05_MINING      Mined and quarried goods
 06_FOODPRO     Food beverages and tobacco products
 07_TEXTILES    Textile and leather products
 08_WOODPRO     Wood products
* 09_PAPERPRO    Paper products
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

J2(J) Except for Power sector industries
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
*  18_TnD         Transmission and Distribution
*  19_eNuclear    Nuclear generation
*  20_eCoal       Coal generation
*  21_eGas        Gas generation
*  22_eOil        Oil generation
*  23_eWind       Wind generation
*  24_eSolar      Solar generation
*  25_eHydro      Hydro generation
*  26_eOther      Other generation
 27_CONSTRUC    Construction
 28_LTRP        Land transport service(road rail)
 29_WTRP        Water transport service
 30_ATRP        Air transport service
 31_SER         Service
/

ALIAS (j,jj)
ALIAS (i,ii,ij)
ALIAS (l,lj)
ALIAS (k,kj)
ALIAS (z,zj,zjj)
ALIAS (power, power2)
AlIAS (ENE,ENE2)
;

*==============================================================================
* 2 Declaration of parameters and benchmark variables
*==============================================================================
PARAMETER
*==============================================================================
*  2.1 Parameters
*==============================================================================
 A_K(z)          Scale parameter (price of new capital)
 aij(i,j,z)      Input output coefficient
 aij2(i,j,z)      Input output coefficient
 
 B_KD(j,z)       Scale parameter (CES - composite capital)
 B_LD(j,z)       Scale parameter (CES - composite labor)
 B_M1(i,z)       Scale parameter (CES - composite commodity)
 B_M2(i,z)       Scale parameter (CES - composite import)
 
 B_VA(j,z)       Scale parameter (CES - value added)
 B_KEL(j,z)      Scale parameter (CES - composite KEL)
 B_KE(j,z)       Scale parameter (CES - composite KE)
 B_ENER(j,z)     Scale parameter (CES - composite ENER)

* B_X0(j,z)       Scale parameter (CET - exports and local sales)
 B_X1(i,z)       Scale parameter (CET - total output)
 B_X2(i,z)       Scale parameter (CET - composite export)
 B_X3(i,z)       Scale parameter (CES - top level)
 B_X4(z)         Scale parameter (CES - Aggregated Electricity)
 
* beta_X0(j,i,z)  Share parameter (CET - exports and local sales)
 beta_D_X1(i,z)  Share parameter (CET - total output - local sales)
 beta_EX_X1(i,z) Share parameter (CET - total output - export)
 beta_X2(i,z,zj) Share parameter (CET - composite export)
 beta_X3(j,i,z)  Share parameter (CES - top level)
 beta_X4(power, z) Share parameter (CES - Aggregated Electricity)
 beta_KD(k,j,z)  Share parameter (CES - composite capital)
 beta_LD(l,j,z)  Share parameter (CES - composite labor)
 beta_M1(i,z)    Share parameter (CES - composite commodity)
 beta_M2(i,zj,z) Share parameter (CES - composite import)
 
 beta_VA(j,z)    Share parameter (CES - value added)
 beta_KEL(j,z)   Share parameter (CES - KEL composite)
 beta_KE(j,z)    Share parameter (CES - KE composite)
 beta_ENER(ene,j,z)  Share parameter (CES - ENER composite)

 delta(z)        Depreciation rate of capital in country z
 eta             Price elasticity of indexed transfers and parameters
 frisch(z)       Frisch parameter (LES function)
 gamma_GVT(i,z)  Share of commodity i in total current public expenditures on goods and services
 gamma_INV(i,z)  Share of commodity i in total investment expenditures
 gamma_LES(i,z)  Marginal share of commodity i in household consumption budget
 io(j,z)         Coefficient (Leontief - intermediate consumption)
 io2(j,z)        Coefficient (Leontief - intermediate energy consumption)
 
 kmob            Flag parameter (1 if capital is mobile)
 RES             Rescaling factor
 rho_KD(j,z)     Elasticity paameter (CES - composite capital)
 rho_LD(j,z)     Elasticity parameter (CES - composite labor)
 rho_M1(i,z)     Elasticity parameter (CES - composite commodity)
 rho_M2(i,z)     Elasticity parameter (CES - composite import)

 rho_VA(j,z)     Elasticity parameter (CES - value added)
 rho_KEL(j,z)    Elasticity parameter (CES - KEL)
 rho_KE(j,z)     Elasticity parameter (CES - KE)
 rho_ENE(j,z)    Elasticity parameter (CES - ENE)
 rho_ENER(j,z)   Elasticity parameter (CES - ENER)

* rho_X0(j,Z)     Elasticity parameter (CET - exports and local sales)
 rho_X1(i,z)     Elasticity parameter (CET - total output)
 rho_X2(i,z)     Elasticity parameter (CET - composite export)
 rho_X3(i,z)     Elasticity parameter (CES - top level)
 rho_X4(z)       Elasticity parameter (CES - Aggregated Electricity)
 sigma_KD(j,z)   Elasticity (CES - composite capital)
 sigma_LD(j,z)   Elasticity (CES - composite labor)
 sigma_M1(i,z)   Elasticity (CES - composite commodity)
 sigma_M2(i,z)   Elasticity (CES - composite import)
 
 sigma_VA(j,z)   Elasticity (CES - value added)
 sigma_KEL(j,z)  Elasticity (CES - KEL)
 sigma_KE(j,z)   Elasticity (CES - KE)
 sigma_ENER(j,z) Elasticity (CES - Energy)

 sigma_X0(j,z)   Elasticity (CET - exports and local sales)
 sigma_X1(i,z)   Elasticity (CET - total output)
 sigma_X2(i,z)   Elasticity (CET - composite export)
 sigma_X3(i,z)   Elasticity (CES - top level)
 sigma_X4(z)     Elasticity (CES - Aggregated Electricity)
 sigma_Y(i,z)    Income elasticity of consumption
 tmrg(i,ij,zj,z) Rate of margin i applied to commodity ij imported from country zj
 v(j,z)          Coefficient (Leontief - value added)
 
 Share_KLE(j,z)  Share parameter (Leontief)
 TnDShare(z)     T&D share of Aggregated electricity
 PowerShare(z)   Power Industries share of Aggregated electricity

* theta(j,i,z)
 theta2(j,i,z)   Export share of composite activity

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
 DEO(i,j,z)      Intermediate consumption of commodity i by industry j in region z
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
 INVO(i,z)       Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REALO(z)     Real gross fixed capital formation
 KDO(k,j,z)      Demand for type k capital by industry j in region z
 KDCO(j,z)       Demand for composite capital by industry j in region z
 
 KELO(j,z)
 KEO(j,z)
 ENEO(j,z)
 ENERO(ene,j,z)

 KSO(k,z)        Supply of type k capital in region z
 KSTO(z)         Total supply of capital in region z
 LDO(l,j,z)      Demand for type l labor by industry j in region z
 LDCO(j,z)       Demand for composite labor by industry j in region z
 LSO(l,z)        Supply of type l labor in region z
 MRGNO(i,z)      Domestic production of commodity i in region z exported as international margin services
 POPO(z)         Population in 2019
 QO(i,z)         Quantity demanded of composite commodity i in region z
 VAO(j,z)        Value added of industry j in region z
 XSO_I(i,z)      Commoidty i total production
 XSO(j,i,z)      Total output of industry j in region z
 XSTO(j,z)       Total output of industry j
 POWERQO(z)      Total power output in region z

*==============================================================================
*   2.2.2 Price variables
*==============================================================================
 eO(z)           Exchange rate (price of international currency in terms of region z local currency)
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
 PWMO(i,zj,z)    World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMGO(i)        World price of margin i (expressed in international currency)
 PWXO(i,z,zj)    World price of commodity i exported to country zj by region z (expressed in international currency)
 RO(k,j,z)       Rental rate of type k capital in industry j of region z
 RCO(j,z)        Rental rate of industry j composite capital in region z
 RKO(k,z)        Rental rate of type k capital in region z
 RTIO(k,j,z)     Rental rate paid by industry j for type k capital in region z including capital taxes
 WO(l,z)         Wage rate of type l labor in region z
 WCO(j,z)        Wage rate of industry j composite labor in region z
 WTIO(l,j,z)     Wage rate paid z by industry j for type l labor in region including payroll taxes

 PKELO(j,z)
 PKEO(j,z)
 PENEO(j,z)

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
 sh0O(z)         Intercept (household savings)
 sh1O(z)         Slope (household savings)
 ttdh0O(z)       Intercept (household income tax)
 ttdh1O(z)       Slope (household income tax)
 tticO(i,z)      Tax rate on commodity i
 ttikO(k,j,z)    Tax rate on capital k used in industry j
 ttimO(i,zj,z)   Rate of taxes and duties on imports of commodity i from country zj
 ttipO(j,z)      Tax rate on the production of industry j
 ttiwO(l,j,z)    Tax rate on type l worker compensation in industry j
 ttixO(i,z,zj)   Export tax rate on exported commodity i
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
*  The PEP w-1 model uses aggregated data from GTAP8.1. The following file
*  includes data for some variables and substitution elasticities.
*$GDXIN DATA_AGG-2019_230410_POWER3_Joint.gdx
$GDXIN DATA_AGG-2019_230906_POWER3_Joint.gdx

$LOAD CO, CGO, DDO, DEPO, DIO, DSO, DSO_I, EXO, IMO, INVO, KSTO, LDO, MRGNO, XSO, XSO_I, XSTO, RKDO,
$LOAD POPO, TDHO, TICO, TIKO, TIMO, TIPO, TIWO, TIXO, tmrg
$LOAD sigma_M1, sigma_M2, sigma_VA

*==============================================================================
*   3.1.2 Rescaling the variables
*==============================================================================
* GTAP 8.1 data are in millions of (2004 and 2007) US dollars
* (see www.gtap.agecon.purdue.edu/resources/download/5679.pdf)
* With RES = 10000, model results are in tens of billions (10G$)
RES              = 10000;
*RES = 1;
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

$CALL gdxxrw JointB_VAL_230411_PAR.xls @JointB_POWER_PAR.txt trace=0
$GDXIN JointB_VAL_230411_PAR.gdx
$LOAD sigma_KD, sigma_LD, sigma_X1, sigma_X2, sigma_X3, sigma_X0, sigma_y, PARZ

*$exit
*------------------------------------------------------------------------------
* CES - composite capital
* We assume that the elasticity between the different type of capital
* is twice that used for value added.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls and delete following line:
 sigma_KD(j,z)   = 2*sigma_VA(j,z);

*------------------------------------------------------------------------------
* CES - composite labor
* We assume that the elasticity between the different type of labor
* is twice that used for value added.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls and delete following line:
 sigma_LD(j,z)   = 2*sigma_VA(j,z);

*------------------------------------------------------------------------------
* CES - composite KLE, KE, ENER
 sigma_KEL(j,z)  = 0.5 ;
 sigma_KE(j,z)   = 0.5 ;
 sigma_ENER(j,z) = 0.5 ;
 
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
* We arbitrarily assume that the income elasticity between is the same for all
* region/country.
* If the user wishes to assume otherwise, he can fill the appropriate area in
* the Excel file VAL_PAR.xls.

*------------------------------------------------------------------------------
*  Slopes of taxation functions
*   One can either choose to assign a value to the intercept and calibrate
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

* PO2(j,i,z)$XSO(j,i,z) = [PLO(i,z)*DSO(j,i,z)+PETO(i,z)*EXTO(i,z)+MRGNO(i,z)*PWMGO(i)]/XSO(j,i,z);
 PO2(j,i,z)$XSO(j,i,z) = 1;
* PO3(i,j,z)$XSO(j,i,z) = [PLO(i,z)*DSO(j,i,z)+PETO(i,z)*EXTO(i,z)+MRGNO(i,z)*PWMGO(i)]/XSO(j,i,z);
 PO3(i,j,z)$XSO(j,i,z) = 1;

 PIO(i,z)       = SUM[j$XSO(j,i,z),PO2(J,I,z)*XSO(j,i,z)]/XSO_I(i,z);

 PTO(j,z)       = SUM[i$XSO(j,i,z),PO2(j,i,z)*XSO(j,i,z)]/XSTO(j,z);

 PPO(j,z)       = [SUM[l,TIWO(l,j,z)+WO(l,z)*LDO(l,j,z)]
                  +SUM[k,TIKO(k,j,z)+RKDO(k,j,z)]
                  +SUM[i,DIO(i,j,z)]]/XSTO(j,z);

* theta(j,i,z) = XSO(j,i,z)/sum(ii, XSO(j,ii,z));
 theta2(j,i,z) = DSO(j,i,z)/sum(jj, DSO(jj,i,z));

* PIO('15_MACHINE','01_KOR') = 1/1.02620306872353 ;
* PIO('15_MACHINE','02_CHN') = 1/1.02398924958185 ;

*DSO(j,i,z) = DSO(j,i,z)${DSO(j,i,z) and [DSO(j,i,z) eq DSO_I(i,z)]};
*DSO(j,i,z) and [DSO(j,i,z) ne DSO_I(i,z)]
*XSO(j,i,z)  = XSO(j,i,z)${DSO(j,i,z) and [DSO(j,i,z) eq DSO_I(i,z)]};

 EXTTO(j,i,z)$DSO(j,i,z) = theta2(j,i,z)*EXTO(i,z);

*execute_unload 'JointB_XSO', XSO, theta, theta2, DSO, EXTTO ;

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
 DIO(i,j,z)      = DIO(i,j,z)/PCO(i,z);
 DEO(ene,j,z)    = DIO(ene,j,z)/PCO(ene,z);
 INVO(i,z)       = INVO(i,z)/PCO(i,z);

* CIO(j,z)        = SUM[i,DIO(i,j,z)];
 CIO(j,z)        = SUM[i,DIO(i,j,z)];
 CEO(j,z)        = SUM[ene,DEO(ene,j,z)];
 DITO(i,z)       = SUM[j,DIO(i,j,z)];

* PCIO(j,z)       = SUM[i,PCO(i,z)*DIO(i,j,z)]/(CIO(j,z)+CEO(j,z));
 PCIO(j,z)       = SUM[i,PCO(i,z)*DIO(i,j,z)]/CIO(j,z);
 
 WTIO(l,j,z)     = WO(l,z)*(1+ttiwO(l,j,z));

 WCO(j,z)$LDCO(j,z)
                 = SUM[l,WTIO(l,j,z)*LDO(l,j,z)]/LDCO(j,z);

*==============================================================================
*  4.3.3 Calibration of other prices and revised volumes (part 3)
*==============================================================================
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
* These hypotheses lead to the following formula:

* From GTAP, we know KSTO.
 KSTO(z)         = KSTO(z)/PKO(z);

* Assuming a uniform depreciation rate for all types
* of capital and all industries:
 delta(z)        = DEPO(z)/[PKO(z)*KSTO(z)];

* From GTAP, we know KSTO. Assuming a uniform rental rate R for all types
* of capital and all industries:
 RKO(k,z)        = SUM[(kj,jj),RKDO(kj,jj,z)]/KSTO(z);
 RKO(k,z)        =1;

 RO(k,j,z)$RKDO(k,j,z)
                 = RKO(k,z);

* Then from the GTAP value of income paid to capital RKD we calibrate KDO:
 KDO(k,j,z)$RKDO(k,j,z)
                 = RKDO(k,j,z)/RO(k,j,z);

* The supply of capital is equal to demand:
 KSO(k,z)        = SUM[j,KDO(k,j,z)];

 A_K(z)          = 1/PKO(z)*{PROD[i$gamma_INV(i,z),(PCO(i,Z)/gamma_INV(i,z))
                   **gamma_INV(i,z)]};

 KDCO(j,z)       = SUM[k,KDO(k,j,z)];
 RTIO(k,j,z)     = RO(k,j,z)*(1+ttikO(k,j,z));
 RCO(j,z)$KDCO(j,z)
                 = SUM[k,RTIO(k,j,z)*KDO(k,j,z)]/KDCO(j,z);

*==============================================================================
*  4.3.4 Calibration of other prices and revised volumes (part 4)
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
*  4.4 Calibration of function parameters
*==============================================================================
*   4.4.1 Leontief functions
*==============================================================================
 io(j,z)         = CIO(j,z)/XSTO(j,z) ;

 io2(j,z)        = CEO(j,z)/XSTO(j,z) ;

 v(j,z)          = VAO(j,z)/XSTO(j,z) ;

* aij(nene,j,z)   = DIO(nene,j,z)/CIO(j,z);
 aij(i,j,z)      = DIO(i,j,z)/CIO(j,z);
 aij2(ene,j,z)   = DIO(ene,j,z)/CEO(j,z);

display CIO, aij;

execute_unload 'ENERGY',
CIO, CEO ;

*==============================================================================
*   4.4.2 Calibration of CET parameters
*==============================================================================
*    4.4.2.0 CET between total exports and local production
*==============================================================================
* rho_X0(j,z)       = (1+sigma_X0(j,z))/sigma_X0(j,z);

* beta_X0(j,i,z)$XSO(j,i,z)
*                 = PO2(j,i,z)*XSO(j,i,z)**(1-rho_X0(j,z))/
*                   SUM[ij$XSO(j,ij,z),PO2(j,ij,z)*XSO(j,ij,z)**(1-rho_X0(j,z))];

* B_X0(j,z)       = XSTO(j,z)
*                  /SUM[ij$XSO(j,ij,z),beta_X0(j,ij,z)*XSO(j,ij,z)**rho_X0(j,z)
*                  ]**(1/rho_X0(j,z));

*==============================================================================
*    4.4.2.1 CET between total exports, domestic supply and margins
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
*    4.4.2.2 CET between exports to different trading partners
*==============================================================================
 rho_X2(i,z)     = (1+sigma_X2(i,z))/sigma_X2(i,z);
 beta_X2(i,z,zj)$EXO(i,z,zj)
                 = [PEO(i,z,zj)*EXO(i,z,zj)**(1-rho_X2(i,z))]/
                   SUM[zjj$EXO(i,z,zjj),PEO(i,z,zjj)*EXO(i,z,zjj)
                   **(1-rho_X2(i,z))];
 B_X2(i,z)       = EXTO(i,z)/{SUM[zj,beta_X2(i,z,zj)*EXO(i,z,zj)**rho_X2(i,z)]
                   **(1/rho_X2(i,z))};

*==============================================================================
*   4.4.3 Calibration of CES parameters
*==============================================================================
*    4.4.3.0 Composite output
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
*    4.4.3.1 Composite good
*==============================================================================
 rho_M1(i,z)     = (1-sigma_m1(i,z))/sigma_m1(i,z);
 beta_M1(i,z)    = PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)/
                  {PDO(i,z)*DDO(i,z)**(rho_M1(i,z)+1)
                  +PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)};
 B_M1(i,z)       = QO(i,z)/{beta_M1(i,z)*IMTO(i,z)**(-rho_M1(i,z))
                  +(1-beta_M1(i,z))*DDO(i,z)**(-rho_M1(i,z))}**(-1/rho_M1(i,z));

*==============================================================================
*    4.4.3.2 CES between imports from different trading partners
*==============================================================================
 rho_M2(i,z)     = (1-sigma_M2(i,z))/sigma_M2(i,z);
 beta_M2(i,zj,z)$IMO(i,zj,z)
                 = [PMO(i,zj,z)*IMO(i,zj,z)**(rho_M2(i,z)+1)]/
                   SUM[zjj$IMO(i,zjj,z),PMO(i,zjj,z)*IMO(i,zjj,z)
                    **(rho_M2(i,z)+1)];
 B_M2(i,z)       = IMTO(i,z)/{SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*IMO(i,zj,z)
                   **(-rho_M2(i,z))]**(-1/rho_M2(i,z))};

*==============================================================================
*    4.4.3.3 Composite capital
*==============================================================================
 rho_KD(j,z)     = (1-sigma_KD(j,z))/sigma_KD(j,z);

 beta_KD(k,j,z)$KDO(k,j,z)
                 = [RTIO(k,j,z)*KDO(k,j,z)**(1+rho_KD(j,z))]/
                   SUM[kj$KDO(kj,j,z),RTIO(kj,j,z)*KDO(kj,j,z)**(1+rho_KD(j,z))];
 B_KD(j,z)$KDCO(j,z)
                 = KDCO(j,z)/{SUM[k$KDO(k,j,z),beta_KD(k,j,z)*KDO(k,j,z)
                   **(-rho_KD(j,z))]**(-1/rho_KD(j,z))};

*==============================================================================
*    4.4.3.4 Composite labor
*==============================================================================
 rho_LD(j,z)     = (1-sigma_LD(j,z))/sigma_LD(j,z);
 beta_LD(l,j,z)$LDO(l,j,z)
                 = [WTIO(l,j,z)*LDO(l,j,z)**(1+rho_LD(j,z))]/
                   SUM[lj$LDO(lj,j,z),WTIO(lj,j,z)*LDO(lj,j,z)
                   **(1+rho_LD(j,z))];
 B_LD(j,z)$LDCO(j,z)
                 = LDCO(j,z)/{SUM[l$LDO(l,j,z),beta_LD(l,j,z)*LDO(l,j,z)
                   **(-rho_LD(j,z))]**(-1/rho_LD(j,z))};
                   
*==============================================================================
*    Composite KLE
*==============================================================================
 ENERO(ene,j,z)  = DIO(ene,j,z);    
 ENEO(j,z)       = SUM(ene, DIO(ene,j,z));
 KEO(j,z)        = KDCO(j,z)+ sum(ene, ENERO(ene,j,z));
 KELO(j,z)       = KEO(j,z) + LDCO(j,z) ; 

 PENEO(j,z) = 1;
 PKEO(j,z)  = 1;
 PKELO(j,z) = 1;
 PO4(i,j,z) = 1;

*===============================================================================
*   Composite E
*===============================================================================
 rho_ENER(j,z)   = (1-sigma_ENER(j,z))/sigma_ENER(j,z);

 beta_ENER(ene,j,z)$(ENERO(ene,j,z))
                 = [PO4(ene,j,z)*ENERO(ene,j,z)**(1+rho_ENER(j,z))]/
                   SUM[ene2,PO4(ene,j,z)*ENERO(ene2,j,z)**(1+rho_ENER(j,z))];

 B_ENER(j,z)$ENEO(j,z)
                 = ENEO(j,z)/{SUM[ene$ENERO(ene,j,z),beta_ENER(ene,j,z)*ENERO(ene,j,z)
                   **(-rho_ENER(j,z))]**(-1/rho_ENER(j,z))};
                 
*===============================================================================
*   Composite K-E
*===============================================================================
 rho_KE(j,z)     = (1-sigma_KE(j,z))/sigma_KE(j,z);

 beta_KE(j,z)$KEO(j,z)
                 = RCO(j,z)*KDCO(j,z)**(rho_KE(j,z)+1)/
                  {RCO(j,z)*KDCO(j,z)**(rho_KE(j,z)+1)+
                   PENEO(j,z)*ENEO(j,z)**(rho_KE(j,z)+1)};

 B_KE(j,z)$KEO(j,z)
                 = KEO(j,z)
                   /{[beta_KE(j,z)*KDCO(j,z)**(-rho_KE(j,z))+
                   (1-beta_KE(j,z))*ENEO(j,z)**(-rho_KE(j,z))
                   ]**(-1/rho_KE(j,z))};

*===============================================================================
*     Composite KE-L
*===============================================================================
 rho_KEL(j,z)     = (1-sigma_KEL(j,z))/sigma_KEL(j,z);

 beta_KEL(j,z)$KELO(j,z)
                 = WCO(j,z)*LDCO(j,z)**(rho_KEL(j,z)+1)/
                  {WCO(j,z)*LDCO(j,z)**(rho_KEL(j,z)+1)+
                   PKEO(j,z)*KEO(j,z)**(rho_KEL(j,z)+1)};

 B_KEL(j,z)$KELO(j,z)
                 = KELO(j,z)
                   /{[beta_KEL(j,z)*LDCO(j,z)**(-rho_KEL(j,z))+
                   (1-beta_KEL(j,z))*KELO(j,z)**(-rho_KEL(j,z))
                   ]**(-1/rho_KEL(j,z))};

*===============================================================================
*    Composite KLE-M
*===============================================================================
 Share_KLE(j,z)  = KELO(j,z)/XSTO(j,z); 

*==============================================================================
*    4.4.3.5 Value added
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

execute_unload 'KLE',
PO4, ENERO,  
rho_ENER, rho_KE,rho_KEL, beta_ENER, beta_KE, beta_KEL, B_ENER, B_KE, B_KEL ;

*==============================================================================
*   4.4.4 Calibration of LES parameters
*==============================================================================
*   As the assigned values of income elasticities may not result in
*   consumption shares that add up to 1, this first step
*   adjusts the elasticities proportionally
 sigma_Y(i,z)    = sigma_Y(i,z)/{SUM[ij,sigma_Y(ij,z)*PCO(ij,z)*CO(ij,z)]
                   /CTHO(z)};
 gamma_LES(i,z)  = PCO(i,z)*CO(i,z)*sigma_Y(i,z)/CTHO(z);
 CMINO(i,z)      = CO(i,z)+gamma_LES(i,z)*CTHO(z)/{PCO(i,z)*frisch(z)};

*==============================================================================
*  4.5 Calibration of gross domestic products
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
*  4.5 Calibration of real (volume) variables computed from price indices
*==============================================================================
 CABXO(z)        = CABO(z)/[PIXGDP_WO*eO(z)];
 CTH_REALO(z)    = CTHO(z)/PIXCONO(z);
 G_REALO(z)      = GO(z)/PIXGVTO(z);
 GDP_BP_REALO(z) = GDP_BPO(z)/PIXGDPO(z);
 GDP_BP_W_REALO  = GDP_BP_WO/PIXGDP_WO;
 GDP_MP_REALO(z) = GDP_MPO(z)/PIXCONO(z);
 IT_REALO(z)     = ITO(z)/PIXINVO(z);

*==============================================================================
*  4.7 Parameters of the household savings function
*==============================================================================
 sh1O(z)         = [SHO(z)+SGO(z)]/GDP_IBO(z);
 sh0O(z)         = SHO(z)-sh1O(z)*YDHO(z);

*==============================================================================
*  4.8 Calibration of indexed transfers and parameters
*==============================================================================
 ttdh0O(z)       = ttdh0O(z)/PIXCONO(z)**eta;
 sh0O(z)         = sh0O(z)/PIXCONO(z)**eta;

*==============================================================================
*  4.9 CO2 emission
*==============================================================================
$INCLUDE DATA_GDP-2019_230425.gms
$INCLUDE DATA_WEB-2019_230417.gms

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
 C(i,z)          Consumption of commodity i by households in region z
 CABX(z)         Current account balance of region z in terms of the international currency
 CG(i,z)         Public consumption of commodity i in region z
 CI(j,z)         Total intermediate consumption of industry j in region z
 CE(j,z)         Total intermediate consumption of industry j in region z
 CMIN(i,z)       Minimum consumption of commodity i by households in region z
 CTH_REAL(z)     Real household consumption in region z
 DD(i,z)         Domestic demand for commodity i produced locally in region z
 DI(i,j,z)       Intermediate consumption of commodity i by industry j in region z
 DE(i,j,z)       Intermediate consumption of commodity i by industry j in region z

 DIT(i,z)        Total intermediate demand of commodity i in region z
 DS(j,i,z)       Supply of commodity i by sector j to the domestic market
 DS_I(i,z)       Supply of commodity i to the domestic market of region z
 EX(i,z,zj)      Quantity of product i exported by country z to country zj
 EXT(i,z)        Supply of composite commodity i by region z to the export market
 EXTT(j,i,z)     Supply of activity j to the export market i of region z
 G_REAL(z)       Current real government expenditures on goods and services in region z
 GDP_BP_REAL(z)  Real GDP at basic prices
 GDP_BP_W_REAL   Real world GDP at basic prices
 GDP_MP_REAL(z)  Real GDP at market prices
 IM(i,zj,z)      Quantity of product i imported by country z from country zj
 IMT(i,z)        Quantity demanded of composite imports of commodity i by region z
 INV(i,z)        Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REAL(z)      Real gross fixed capital formation
 KD(k,j,z)       Demand for type k capital by industry j in region z
 KDC(j,z)        Demand for composite capital by industry j in region z
 KS(k,z)         Supply of type k capital in region z
 LD(l,j,z)       Demand for type l labor by industry j in region z
 LDC(j,z)        Demand for composite labor by industry j in region z
 LS(l,z)         Supply of type l labor in region z
 MRGN(i,z)       Domestic production of commodity i in region z exported as international margin services
 Q(i,z)          Quantity demanded of composite commodity i in region z
 VA(j,z)         Value added of industry j in region z
 XS(j,i,z)       Total output of industry j by commodity in region z
 XS_I(i,z)       Total output of commodity i in region z
 XST(j,z)        Total aggregate output of industry j in region z
 POWERQ(z)       Total power output in region z
 EE(product,j,z) Industry energy consumption in region z ktoe
 NE(product,j,z) Industry non energy consumption in region z ktoe
 EH(product,z)   Household energy consumption in region z ktoe
 CO2I(product,j,z) Industry CO2 emission in region z ktCO2
 CO2H(product,z)   Household CO2 emission in region z ktCO2
 CH4I(product,j,z) Industry CH4 emission in region z tCO2eq
 CH4H(product,z)   Household CH4 emission in region z tCO2eq
 N2OI(product,j,z) Industry N2O emission in region z tCO2eq
 N2OH(product,z)   Household N2O emission in region z tCO2eq

*==============================================================================
*   5.1.2 Price variables
*==============================================================================
 e(z)            Exchange rate (price of international currency in terms of region z local currency)
 P(i,z)          Basic price of commodity i in region z
 P2(j,i,z)       Basic price of industry js production of commodity i
 P3(i,j,z)       Basic price of power industry js production of commodity i
 PPOWER(z)       Basic price of composite power commodity in region z
 PI(i,z)         Basic price of composite activity commodity in region z
 PT(j,z)         Basic price of industry js output
 PC(i,z)         Purchaser price of composite commodity i (including all taxes and margins) in region z
 PCI(j,z)        Intermediate consumption price index of industry j in region z
 PCE(j,z)        Intermediate energy consumption price index of industry j in region z
 PD(i,z)         Price of local product i sold on region z domestic market (including all taxes)
 PE(i,z,zj)      Price received for commodity i exported to region zj by region z (excluding export taxes)
 PET(i,z)        Border price of composite commodity i exported by region z
 PIXCON(z)       Consumer price index in region z
 PIXGDP(z)       GDP deflator in region z
 PIXGDP_W        World GDP deflator
 PIXGVT(z)       Public expenditures price index in region z
 PIXINV(z)       Investment price index in region z
 PK(z)           Price of new capital in region z
 PL(i,z)         Price of local product i (excluding all taxes on products) in region z
 PM(i,zj,z)      Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 PMT(i,z)        Price of composite commodity i imported by region z (including all taxes duties and margins)
 PP(j,z)         Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 PVA(j,z)        Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 PWM(i,zj,z)     World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMG(i)         World price of margin i (expressed in international currency)
 PWX(i,z,zj)     World price of commodity i exported to country zj by region z (expressed in international currency)
 R(k,j,z)        Rental rate of type k capital in industry j of region z
 RC(j,z)         Rental rate of industry j composite capital in region z
 RK(k,z)         Rental rate of type k capital in region z
 RTI(k,j,z)      Rental rate paid by industry j for type k capital in region z including capital taxes
 W(l,z)          Wage rate of type l labor in region z
 WC(j,z)         Wage rate of industry j composite labor in region z
 WTI(l,j,z)      Wage rate paid z by industry j for type l labor in region including payroll taxes

*==============================================================================
*   5.1.3 Nominal (value) variables
*==============================================================================
 CAB(z)          Current account balance of region z
 CTH(z)          Consumption budget of households in region z
 DEP(z)          Amount of depreciation (capital consumption allowance) in region z
 G(z)            Current government expenditures on goods and services in region z
 GDP_BP(z)       Region z GDP at basic prices
 GDP_BP_W        World GDP at basic prices
 GDP_FD(z)       Region z GDP at purchasers prices from the perspective of final demand
 GDP_IB(z)       Region z GDP at market prices (income-based)
 GDP_MP(z)       Region z GDP at market prices
 IT(z)           Total investment expenditures in region z
 SG(z)           Government savings in region z
 SH(z)           Household savings in region z
 SROW(z)         Rest-of-the-world savings with respect to region z
 TDH(z)          Household income taxes in region z
 TIC(i,z)        Government revenue from indirect taxes on commodity i in region z
 TICT(z)         Total government receipts of indirect taxes on commodities in region z
 TIK(k,j,z)      Government revenue from taxes on type k capital used by industry j in region z
 TIKT(z)         Total government revenue from from taxes on capital in region z
 TIM(i,zj,z)     Government revenue from duties on commodity i imported from region zj by region z
 TIMT(z)         Total government revenue from import duties in region z
 TIP(j,z)        Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 TIPT(z)         Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 TIW(l,j,z)      Government revenue from payroll taxes on type l labor in industry j of region z
 TIWT(z)         Total government revenue from payroll taxes in region z
 TIX(i,z,zj)     Government revenue from export taxes on commodity i exported by region z to region zj
 TIXT(z)         Total government revenue from export taxes in region z
 TPRCTS(z)       Total government revenue from taxes on products and imports in region z
 TPRODN(z)       Total government revenue from other taxes on production in region z
 YDH(z)          Household disposable income in region z
 YG(z)           Total government income in region z
 YH(z)           Household total income in region z
 YHK(z)          Household capital income in region z
 YHL(z)          Household labor income in region z
 YROW(z)         Rest-of-the-world total income from region z

*==============================================================================
*   5.1.4 Rates and intercepts
*==============================================================================
 sh0(z)          Intercept (household savings)
 sh1(z)          Slope (household savings)
 ttdh0(z)        Intercept (household income tax)
 ttdh1(z)        Slope (household income tax)
 ttic(i,z)       Tax rate on commodity i
 ttik(k,j,z)     Tax rate on capital k used in industry j
 ttim(i,zj,z)    Rate of taxes and duties on imports of commodity i from country zj
 ttip(j,z)       Tax rate on the production of industry j
 ttiw(l,j,z)     Tax rate on type l worker compensation in industry j
 ttix(i,z,zj)    Export tax rate on exported commodity i

*==============================================================================
*   5.1.5 Other variables
*==============================================================================
 LEON(z)         Excess supply on the last market in region z
 OBJ             Objective variable
;

*==============================================================================
*  5.2 Equation declarations
*==============================================================================
EQUATIONS
 EQ1(j,z)         Leontief - demand for value added
 EQ2(j,z)         Leontief - demand for intermediate consumption
 EQ2_1(j,z)       Leontief - demand for intermediate consumption
 EQ3(j,z)         CES - combination of labor and capital
 EQ4(j,z)         CES - demand for composite labor
 EQ5(j,z)         CES between labor categories
 EQ6(l,j,z)       Demand for labor
 EQ7(j,z)         CES between capital categories
 EQ8(k,j,z)       Demand for capital
 EQ9(i,j,z)       Leontief - demand for commodity i by sector j
 EQ9_1(i,j,z)       Leontief - demand for commodity i by sector j
 EQ10(z)          Household total income
 EQ11(z)          Household labor income
 EQ12(z)          Household capital income
 EQ13(z)          Household disposable income
 EQ14(z)          Household consumption budget
 EQ15(z)          Household savings
 EQ16(z)          Government total income
 EQ17(z)          Total government receipts of taxes on production
 EQ18(z)          Government receipts of indirect taxes on wages
 EQ19(z)          Government receipts of indirect taxes on capital
 EQ20(z)          Government receipts of indirect taxes on production
 EQ21(z)          Total government receipts of taxes on products and imports
 EQ22(z)          Government receipts of indirect taxes on consumption
 EQ23(z)          Government receipts of indirect taxes on imports
 EQ24(z)          Government receipts of indirect taxes on exports
 EQ25(z)          Household h income taxes
 EQ26(l,j,z)      Government receipts of indirect taxes on wages
 EQ27(k,j,z)      Government receipts of indirect taxes on capital
 EQ28(j,z)        Government receipts of indirect taxes on production of industry j
 EQ29(i,z)        Government receipts of indirect taxes on commodity i
 EQ30(i,zj,z)     Government receipts of indirect taxes on imports of commodity i
 EQ31(i,z,zj)     Government receipts of indirect taxes on exports of commodity i
 EQ32(z)          Government savings
 EQ33(z)          Rest of the world total income
 EQ34(z)          Rest of the world savings
 EQ35(z)          Equivalence between current account balance and savings
 EQ36(i,z)        Household consumption of commodity i
 EQ37(i,z)        Final demand of commodity i for investment purposes
 EQ38(i,z)        Public final consumption of commodity i
 EQ39(i,z)        Total intermediate consumption of commodity i
* EQ40_1(j,z)     CET between different commodities produced by industry j
* EQ40_2(j,i,z)   Industry j production of commodity i (CET)
 EQ40_3(i,z)      Domestic supply by commdities
 EQ40_4(j,z)      Total supply by commdities
 EQ40_5(i,z)      CET function between exports local production and margins
 EQ41(i,z)        Supply of composite exports
 EQ42(i,z)        Supply of margins
 EQ43(i,z)        CET function between exports by trading partner
 EQ44(i,z,zj)     Supply of exports by trading partner
 EQ45(i,z)        CES function between composite imports and local production
 EQ46(i,z)        Demand for composite imports
 EQ47(i,z)        CES function between imports by origin
 EQ48(i,zj,z)     Demand for imports by origin
 EQ49(j,z)        Producer price in industry j after production taxes
* EQ49_2(j,i,z)   Total producer price is equal to P if there is only one product
* EQ49_3(j,i,z)   Basic price of industry j's production of commodity i
 EQ50(j,z)        Basic price of industry j production
 EQ51(j,z)        Price index of industry j intermediate consumption
 EQ52(j,z)        Value added price
* EQ53(j,z)       Price of composite labor in industry j (redundant)
 EQ54(l,j,z)      Wages including taxes
* EQ55(j,z)       Price of composite capital in industry j (redundant)
 EQ56(k,j,z)      Rental rate including taxes
 EQ57(k,j,z)      Rate of remuneration of capital k (capital mobile)
 EQ58(i,z)        Producer price is a weighted sum of PE and PL
* EQ59(i,z)       Price of composite export i (redundant)
 EQ60(i,z,zj)     Border price of exported commodity i
 EQ61(i,z)        Price of local product i (including all taxes and margins)
 EQ62(i,zj,z)     Price of imported commodity i (including all taxes and duties)
* EQ63(i,z)       Price of composite import i (redundant)
 EQ64(i,z)        Consumer price is a weighted sum of PD and PM
 EQ65(z)          Aggregate price of capital
 EQ66(z)          GDP deflator (Fischer index)
 EQ67             World GDP deflator (Fischer index)
 EQ68(z)          Consumer price index (Laspeyres)
 EQ69(z)          Investment price index (derived from investment function)
 EQ70(z)          Public expenditure price index
 EQ71(i1,z)       Domestic absorbtion
 EQ72(l,z)        Labor supply equals labor demand
 EQ73(k,z)        Capital supply equals capital demand
 EQ74(z)          Total investment equals total savings
 EQ75(z)          Depreciation
 EQ76(i,z)        Supply of domestic production equals demand
 EQ77(i,z,zj)     Exports supply equals imports demand
 EQ78(i,z,zj)     Exports price equals imports price
 EQ79(i)          World demand for margins equals world supply
* EQ80            Sum of foreign savings equals zero (redundant)
 EQ81(z)          GDP at basic prices
 EQ82(z)          GDP at market prices
 EQ83(z)          GDP at market prices (income-based)
 EQ84(z)          GDP at market prices (expenditure-based)
 EQ85             World GDP
 EQ86(z)          Real consumption budget of type h households
 EQ87(z)          Real current government expenditures on goods and services
 EQ88(z)          Real GDP at basic prices
 EQ89             Real world GDP at basic prices
 EQ90(z)          Real GDP at market prices
 EQ91(z)          Real gross fixed capital formation
 EQ92(z)          Current account balance of region z in terms of the reference currency
* EQ93            fictitious OBJ. fuction
 WALRAS(z)        Walras law verification

* EQB_1(i,z)    Top Nest - CES function Aggregated acitivty
* EQB_2(j,i,z)  Top Nest - CES function Aggregated acitivty
* EQB_3(j,i,z)  Total producer price is equal to P if there is only one product
* EQB_4(j,i,z)  Basic price of industry j's production of commodity i
* EQB_5(j,i,z)  Supply of exports for compsite activity

 EQA_1(z)         Top Nest - Leontief function Aggregated-Electricity
 EQA_2(Z)         Top Nest - Leontief function Aggregated-Electricity
 EQA_3(z)         Second Nest - CES function - Aggregated-Electricity
 EQA_4(power,i,z) Second Nest - CES function - Aggregated-Electricity
 EQB_1(i2,z)      Industry j production of commodity i (CES)
 EQB_3(j,i,z)     Total producer price is equal to P if there is only one product
 EQB_4(j,i,z)     Basic price of industry js production of commodity i
 EQB_5(j,i,z)     Supply of exports for compsite activity

;

*==============================================================================
*  5.3 Equations
*==============================================================================
*   5.3.1 Production
*==============================================================================
 EQ1(j,z)..      VA(j,z) =e= v(j,z)*XST(j,z);

 EQ2(j,z)..      CI(j,z) =e= io(j,z)*XST(j,z);
 
 EQ2_1(j,z)..    CE(j,z) =e= io2(j,z)*XST(j,z);

 EQ3(j,z)..      VA(j,z) =e= B_VA(j,z)*{
                    [beta_VA(j,z)*LDC(j,z)**(-rho_VA(j,z))]$LDCO(j,z)
                   +[(1-beta_VA(j,z))*KDC(j,z)**(-rho_VA(j,z))]$KDCO(j,z)
                                                   }**(-1/rho_VA(j,z));

 EQ4(j,z)$[LDCO(j,z) and KDCO(j,z)]..
                 LDC(j,z) =e= {[beta_VA(j,z)/(1-beta_VA(j,z))]
                              *[RC(j,z)/WC(j,z)]}**sigma_VA(j,z)*KDC(j,z);

 EQ5(j,z)$LDCO(j,z)..
                 LDC(j,z) =e= B_LD(j,z)*SUM[l$LDO(l,j,z),beta_LD(l,j,z)
                                *LD(l,j,z)**(-rho_LD(j,z))]**(-1/rho_LD(j,z));

 EQ6(l,j,z)$LDO(l,j,z)..
                 LD(l,j,z) =e= [beta_LD(l,j,z)*WC(j,z)/WTI(l,j,z)]
                               **sigma_LD(j,z)*B_LD(j,z)**(sigma_LD(j,z)-1)
                               *LDC(j,z);

 EQ7(j,z)$KDCO(j,z)..
                 KDC(j,z) =e= B_KD(j,z)*SUM[k$KDO(k,j,z),beta_KD(k,j,z)
                                *KD(k,j,z)**(-rho_KD(j,z))]**(-1/rho_KD(j,z));

 EQ8(k,j,z)$KDO(k,j,z)..
                 KD(k,j,z) =e= [beta_KD(k,j,z)*RC(j,z)/RTI(k,j,z)]
                                 **sigma_KD(j,z)*B_KD(j,z)**(sigma_KD(j,z)-1)
                                 *KDC(j,z);

 EQ9(i,j,z)..    DI(i,j,z) =e= aij(i,j,z)*CI(j,z) ;

 EQ9_1(ene,j,z)..  DE(ene,j,z) =e= aij2(ene,j,z)*CE(j,z) ;


*==============================================================================
*   5.3.2 Income and savings
*==============================================================================
*    5.3.2.1 Households
*==============================================================================
 EQ10(z)..       YH(z) =e= YHL(z)+YHK(z);

 EQ11(z)..       YHL(z) =e= SUM[(l,j)$LDO(l,j,z),W(l,z)*LD(l,j,z)];

 EQ12(z)..       YHK(z) =e= SUM[(k,j)$KDO(k,j,z),R(k,j,z)*KD(k,j,z)];

 EQ13(z)..       YDH(z) =e= YH(z)-TDH(z);

 EQ14(z)..       CTH(z) =e= YDH(z)-SH(z);

 EQ15(z)..       SH(z) =e= PIXCON(z)**eta*sh0(z)+sh1(z)*YDH(z);

*==============================================================================
*    5.3.2.2 Government
*==============================================================================
 EQ16(z)..       YG(z) =e= TDH(z)+TPRODN(z)+TPRCTS(z) ;

 EQ17(z)..       TPRODN(z) =e= TIWT(z)+TIKT(z)+TIPT(z);

 EQ18(z)..       TIWT(z) =e= SUM[(l,j)$LDO(l,j,z),TIW(l,j,z)];

 EQ19(z)..       TIKT(z) =e= SUM[(k,j)$KDO(k,j,z),TIK(k,j,z)];

 EQ20(z)..       TIPT(z) =e= SUM[j,TIP(j,z)];

 EQ21(z)..       TPRCTS(z) =e= TICT(z)+TIMT(z)+TIXT(z);

 EQ22(z)..       TICT(z) =e= SUM[i,TIC(i,z)];

 EQ23(z)..       TIMT(z) =e= SUM[(i,zj)$IMO(i,zj,z),TIM(i,zj,z)];

 EQ24(z)..       TIXT(z) =e= SUM[(i,zj)$EXO(i,z,zj),TIX(i,z,zj)];

 EQ25(z)..       TDH(z) =e= PIXCON(z)**eta*ttdh0(z)+ttdh1(z)*YH(z);

 EQ26(l,j,z)$LDO(l,j,z)..
                 TIW(l,j,z) =e= ttiw(l,j,z)*W(l,z)*LD(l,j,z);

 EQ27(k,j,z)$KDO(k,j,z)..
                 TIK(k,j,z) =e= ttik(k,j,z)*R(k,j,z)*KD(k,j,z);

 EQ28(j,z)..     TIP(j,z) =e= ttip(j,z)*PP(j,z)*XST(j,z);

 EQ29(i,z)..     TIC(i,z) =e= ttic(i,z)*{[PL(i,z)*DD(i,z)]$DDO(i,z)
                 +[SUM[zj$IMO(i,zj,z),(1+ttim(i,zj,z))*IM(i,zj,z)*e(z)
                  *(PWM(i,zj,z)+SUM(ij,PWMG(ij)*tmrg(ij,i,zj,z)))]]};

 EQ30(i,zj,z)$IMO(i,zj,z)..
                 TIM(i,zj,z) =e= ttim(i,zj,z)*IM(i,zj,z)*e(z)*(PWM(i,zj,z)
                                +SUM[ij,PWMG(ij)*tmrg(ij,i,zj,z)]);

 EQ31(i,z,zj)$EXO(i,z,zj)..
                 TIX(i,z,zj) =e= ttix(i,z,zj)*PE(i,z,zj)*EX(i,z,zj);

 EQ32(z)..       SG(z) =e= YG(z)-G(z);

*==============================================================================
*    5.3.2.4 Rest of the world
*==============================================================================
 EQ33(z)..       YROW(z) =e= e(z)*SUM{(i,zj)$IMO(i,zj,z),IM(i,zj,z)*
                           [PWM(i,zj,z)+SUM(ij,PWMG(ij)*tmrg(ij,i,zj,z))]};

 EQ34(z)..       SROW(z) =e= YROW(z)-e(z)*SUM[(i,zj)$EXO(i,z,zj),
                               EX(i,z,zj)*PWX(i,z,zj)]-e(z)
                               *SUM[i$MRGNO(i,z),MRGN(i,z)*PWMG(i)];

 EQ35(z)..       SROW(z) =e= -CAB(z);

*==============================================================================
*   5.3.3 Demand
*==============================================================================
 EQ36(i,z)..     PC(i,z)*C(i,z) =e= PC(i,z)*CMIN(i,z)+gamma_LES(i,z)
                                 *{CTH(z)-SUM[ij,PC(ij,z)*CMIN(ij,z)]};

 EQ37(i,z)..     PC(i,z)*INV(i,z) =e= gamma_INV(i,z)*IT(z);

 EQ38(i,z)..     PC(i,z)*CG(i,z) =e= gamma_GVT(i,z)*G(z);

 EQ39(i,z)..     DIT(i,z) =e= SUM[j,DI(i,j,z)];

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
 EQA_1(z)..  XS('18_TnD','18_ELEC',z) =e= TnDShare(z)*XS_I('18_ELEC',z);
 EQA_2(z)..  XS_I('18_ELEC',z) =e= XS('18_TnD','18_ELEC',z) + POWERQ(z);


*[Second Nest - CES function]
 EQA_3(z)..    POWERQ(z) =e= B_X4(z)*SUM[POWER, beta_X4(power,z)
                                *XS(POWER,'18_ELEC',z)**(-rho_X4(z))]**(-1/rho_X4(z));

 EQA_4(power,'18_ELEC',z)..  XS(POWER,'18_ELEC',z) =e= POWERQ(z)/B_X4(z)**(1-sigma_X4(z))*
                               [beta_X4(power,z)*PPOWER(z)/P2(POWER,'18_ELEC',z)]
                               **sigma_X4(z);

* exclude electiricity
 EQB_1(i2,z)..    XS_I(i2,z) =e= B_X3(i2,z)*SUM[j$XSO(j,i2,z),beta_X3(j,i2,z)
                                *XS(j,i2,z)**(-rho_X3(i2,z))]**(-1/rho_X3(i2,z));


 EQB_3(j,i,z)${DSO(j,i,z)}..   P2(j,i,z) =e= PT(j,z);

 EQB_4(j,i,z)$DSO(j,i,z)..
                 P2(j,i,z)*XS(j,i,z) =e= [PET(i,z)*EXTT(j,i,z)]$EXTTO(j,i,z)
                                        +[e(z)*MRGN(i,z)*PWMG(i)]$MRGNO(i,z)
                                        +[PL(i,z)*DS(j,i,z)]$DSO(j,i,z);

 EQB_5(j,i,z)$DSO(j,i,z)..  EXTT(j,i,z)  =e= theta2(j,i,z)*EXT(i,z);

 EQ40_3(i,z)..   DS_I(i,z) =e= sum(j,DS(j,i,z)$DSO(j,i,z));

 EQ40_4(j,z)..   XST(j,z)  =e= sum(i,XS(j,i,z)$XSO(j,i,z));

 EQ40_5(i,z)..   XS_I(i,z) =e= B_X1(i,z)*{
                 [beta_EX_X1(i,z)*EXT(i,z)**rho_X1(i,z)]$EXTO(i,z)
                +[beta_D_X1(i,z)*DS_I(i,z)**rho_X1(i,z)]$DSO_I(i,z)
                +[(1-beta_EX_X1(i,z)-beta_D_X1(i,z))*MRGN(i,z)**rho_X1(i,z)]$MRGNO(i,z)
                                          }**(1/rho_X1(i,z));

 EQ41(i,z)$[EXTO(i,z) and DSO_I(i,z)]..
                 EXT(i,z) =e= {[beta_D_X1(i,z)/beta_EX_X1(i,z)]*[PET(i,z)/PL(i,z)]}
                              **sigma_X1(i,z)*DS_I(i,z);

 EQ42(i,z)$[MRGNO(i,z) and DSO_I(i,z)]..
                 MRGN(i,z) =e= {[beta_D_X1(i,z)/(1-beta_EX_X1(i,z)
                                 -beta_D_X1(i,z))]*[e(z)*PWMG(i)/PL(i,z)]}
                                 **sigma_X1(i,z)*DS_I(i,z);

 EQ43(i,z)$EXTO(i,z)..
                 EXT(i,z) =e= B_X2(i,z)*SUM[zj$EXO(i,z,zj),beta_X2(i,z,zj)
                                *EX(i,z,zj)**rho_X2(i,z)]**(1/rho_X2(i,z));

 EQ44(i,z,zj)$EXO(i,z,zj)..
                 EX(i,z,zj) =e= EXT(i,z)/B_X2(i,z)**(1+sigma_X2(i,z))*
                                  [PE(i,z,zj)/(beta_X2(i,z,zj)*PET(i,z))]
                                  **sigma_X2(i,z);

 EQ45(i,z)..     Q(i,z) =e= B_M1(i,z)*{
                    [beta_M1(i,z)*IMT(i,z)**(-rho_M1(i,z))]$IMTO(i,z)
                   +[(1-beta_M1(i,z))*DD(i,z)**(-rho_M1(i,z))]$DDO(i,z)
                                        }**(-1/rho_M1(i,z));

 EQ46(i,z)$[IMTO(i,z) and DDO(i,z)]..
                 IMT(i,z) =e= {[beta_M1(i,z)/(1-beta_M1(i,z))]*[PD(i,z)
                                /PMT(i,z)]}**sigma_m1(i,z)*DD(i,z);

 EQ47(i,z)$IMTO(i,z)..
                 IMT(i,z) =e= B_M2(i,z)*SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*
                                IM(i,zj,z)**(-rho_M2(i,z))]**(-1/rho_M2(i,z));

 EQ48(i,zj,z)$IMO(i,zj,z)..
                 IM(i,zj,z) =e= IMT(i,z)/B_M2(i,z)**(1-sigma_M2(i,z))*
                                  [beta_M2(i,zj,z)*PMT(i,z)/PM(i,zj,z)]
                                  **sigma_M2(i,z);

*==============================================================================
*   5.3.5 Prices
*==============================================================================
 EQ49(j,z)..     PP(j,z)*XST(j,z) =e= PVA(j,z)*VA(j,z)+PCI(j,z)*CI(j,z);

 EQ50(j,z)..     PT(j,z) =e= (1+ttip(j,z))*PP(j,z);

 EQ51(j,z)..     PCI(j,z)*CI(j,z) =e= SUM[i,PC(i,z)*DI(i,j,z)];

 EQ52(j,z)..     PVA(j,z)*VA(j,z) =e= [WC(j,z)*LDC(j,z)]$LDCO(j,z)
                                     +[RC(j,z)*KDC(j,z)]$KDCO(j,z);

* Given equations 5 and 6, equation 53 is redundant
* EQ53(j,z)..     WC(j,z)*LDC(j,z) =e= SUM[l$LDO(l,j,z),WTI(l,j,z)*LD(l,j,z)];

 EQ54(l,j,z)$LDO(l,j,z)..
                 WTI(l,j,z) =e= W(l,z)*(1+ttiw(l,j,z));

* Given equations 7 and 8, equation 55 is redundant
* EQ55(j,z)$(kmob and KDCO(j,z))..
*                 RC(j,z)*KDC(j,z) =e= SUM[k$KDO(k,j,z),RTI(k,j,z)*KD(k,j,z)];

 EQ56(k,j,z)$KDO(k,j,z)..
                 RTI(k,j,z) =e= R(k,j,z)*(1+ttik(k,j,z));

 EQ57(k,j,z)$(kmob and KDO(k,j,z))..
                 R(k,j,z) =e= RK(k,z);

* EQ58(j,z)..     P(j,z)*XST(j,z) =e= [PL(j,z)*DS(j,z)]$DSO(j,z)
*                                   +[PET(j,z)*EXT(j,z)]$EXTO(j,z)
*                                   +[e(z)*PWMG(j)*MRGN(j,z)]$MRGNO(j,z);

 EQ58(i,z)..     P(i,z)*XS_I(i,z) =e= [PL(i,z)*DS_I(i,z)]$DSO_I(i,z)
                                     +[PET(i,z)*EXT(i,z)]$EXTO(i,z)
                                     +[e(z)*PWMG(i)*MRGN(i,z)]$MRGNO(i,z);

* Given equations 43 and 44, equation 59 is redundant
* EQ59(i,z)$EXTO(i,z)..
*                 PET(i,z)*EXT(i,z) =e= SUM[zj$EXO(i,z,zj),
*                                           PE(i,z,zj)*EX(i,z,zj);

 EQ60(i,z,zj)$EXO(i,z,zj)..
                 PE(i,z,zj)*(1+ttix(i,z,zj)) =e= e(z)*PWX(i,z,zj);

 EQ61(i,z)$DDO(i,z)..
                 PD(i,z) =e= (1+ttic(i,z))*PL(i,z);

 EQ62(i,zj,z)$IMO(i,zj,z)..
                 PM(i,zj,z) =e= (1+ttic(i,z))*(1+ttim(i,zj,z))*e(z)*
                                  (PWM(i,zj,z)+SUM[ij,PWMG(ij)
                                  *tmrg(ij,i,zj,z)]);

* Given equations 47 and 48, equation 63 is redundant
* EQ63(i,z)$IMTO(i,z)..
*                 PMT(i,z)*IMT(i,z) =e= SUM[zj$IMO(i,zj,z),
*                                           PM(i,zj,z)*IM(i,zj,z);

 EQ64(i,z)..     PC(i,z)*Q(i,z) =e= [PD(i,z)*DD(i,z)]$DDO(i,z)+
                                    [PMT(i,z)*IMT(i,z)]$IMTO(i,z);

 EQ65(z)..       PK(z) =e= 1/A_K(z)*PROD[i$gamma_INV(i,z),(PC(i,z)
                               /gamma_INV(i,z))**gamma_INV(i,z)];

 EQ66(z)..       PIXGDP(z) =e=
                 {SUM[j,{(PVA(j,z)*VA(j,z)+TIP(j,z))/VA(j,z)}*VAO(j,z)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
                 *SUM[j,{(PVA(j,z)*VA(j,z)+TIP(j,z))/VA(j,z)}*VA(j,z)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z)]}**0.5;

 EQ67..          PIXGDP_W =e=
                 {SUM[(j,z),{(PVA(j,z)*VA(j,z)+TIP(j,z))/VA(j,z)}*VAO(j,z)/e(z)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
                 *SUM[(j,z),{(PVA(j,z)*VA(j,z)+TIP(j,z))/VA(j,z)}*VA(j,z)/e(z)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z)/eO(z)]}**0.5;

 EQ68(z)..       PIXCON(z) =e= SUM[i,PC(i,z)*CO(i,z)]/SUM[i,PCO(i,z)*CO(i,z)];

 EQ69(z)..       PIXINV(z) =e= PROD[i$gamma_INV(i,z),(PC(i,z)/PCO(i,z))
                                 **gamma_INV(i,z)];

 EQ70(z)..       PIXGVT(z) =e= PROD[i$gamma_GVT(i,z),(PC(i,z)/PCO(i,z))
                                 **gamma_GVT(i,z)];

*==============================================================================
*   5.3.6 Equilibrium
*==============================================================================
 EQ71(i1,z)..    Q(i1,z) =e= C(i1,z)+CG(i1,z)+INV(i1,z)+DIT(i1,z);

 EQ72(l,z)..     LS(l,z) =e= SUM[j$LDO(l,j,z),LD(l,j,z)];

 EQ73(k,z)$KSO(k,z)..
                 KS(k,z) =e= SUM[j$KDO(k,j,z),KD(k,j,z)];

 EQ74(z)..       IT(z) =e= SH(z)+SG(z)-CAB(z);

 EQ75(z)..       DEP(z) =e= PK(z)*delta(z)*SUM[k$KSO(k,z),KS(k,z)];

 EQ76(i,z)$DDO(i,z)..
                 SUM[j$DSO(j,i,z),DS(j,i,z)] =e= DD(i,z);

 EQ77(i,z,zj)$EXO(i,z,zj)..
                 EX(i,z,zj) =e= IM(i,z,zj);

 EQ78(i,z,zj)$EXO(i,z,zj)..
                 PWX(i,z,zj) =e= PWM(i,z,zj);

 EQ79(i)..       SUM[z$MRGNO(i,z),MRGN(i,z)] =e= SUM[(z,zj,ij)$IMO(ij,zj,z),
                                                 tmrg(i,ij,zj,z)*IM(ij,zj,z)];

* Given equations 33, 34 and 77, equation 80 is redundant
* EQ80..          SUM[z,SROW(z)/e(z)] =e= 0;

*==============================================================================
*   5.3.7 Gross domestic product
*==============================================================================
 EQ81(z)..       GDP_BP(z) =e= SUM[j,PVA(j,z)*VA(j,z)]+TIPT(z);

 EQ82(z)..       GDP_MP(z) =e= GDP_BP(z)+TPRCTS(z);

 EQ83(z)..       GDP_IB(z) =e= SUM[(l,j)$LDO(l,j,z),W(l,z)*LD(l,j,z)]
                              +SUM[(k,j)$KDO(k,j,z),R(k,j,z)*KD(k,j,z)]
                              +TPRCTS(z)+TPRODN(z);

 EQ84(z)..       GDP_FD(z) =e=
                 SUM[i,PC(i,z)*(C(i,z)+CG(i,z)+INV(i,z))]
                +SUM[(i,zj)$EXO(i,z,zj),e(z)*PWX(i,z,zj)*EX(i,z,zj)]
                +SUM[i$MRGNO(i,z),e(z)*PWMG(i)*MRGN(i,z)]
                -SUM[(i,zj)$IMO(i,zj,z),e(z)*IM(i,zj,z)
                    *(PWM(i,zj,z)+SUM[ij,PWMG(ij)*tmrg(ij,i,zj,z)])];

 EQ85..          GDP_BP_W =e= SUM[z,GDP_BP(z)/e(z)];

*==============================================================================
*  5.3.8 Real (volume) variables computed from price indices
*==============================================================================
 EQ86(z)..       CTH_REAL(z) =e= CTH(z)/PIXCON(z);

 EQ87(z)..       G_REAL(z) =e= G(z)/PIXGVT(z);

 EQ88(z)..       GDP_BP_REAL(z) =e= GDP_BP(z)/PIXGDP(z);

 EQ89..          GDP_BP_W_REAL =e= GDP_BP_W/PIXGDP_W;

 EQ90(z)..       GDP_MP_REAL(z) =e= GDP_MP(z)/PIXCON(z);

 EQ91(z)..       IT_REAL(z) =e= IT(z)/PIXINV(z);

 EQ92(z)..       CABX(z) =e= CAB(z)/[PIXGDP_W*e(z)];

*==============================================================================
*   5.3.9 Other
*==============================================================================
 WALRAS(z)..     LEON(z) =e= Q('01_AGRICULT',z)-C('01_AGRICULT',z)-CG('01_AGRICULT',z)-INV('01_AGRICULT',z)
                            -DIT('01_AGRICULT',z);

* EQ93..          OBJ   =e= sum(z, prod(i,PC(i,z)**0.5));
*==============================================================================
* 6 Numerical resolution
*==============================================================================
*  6.1 Variable initialisation
*==============================================================================
*   6.1.1 Volume variables
*==============================================================================
 CABX.L(z)        = CABXO(z);
 C.L(i,z)         = CO(i,z);
 CG.L(i,z)        = CGO(i,z);
 CI.L(j,z)        = CIO(j,z);
 CE.L(j,z)        = CEO(j,z);
 CMIN.L(i,z)      = CMINO(i,z);
 CTH_REAL.L(z)    = CTH_REALO(z);
 DI.L(i,j,z)      = DIO(i,j,z);
 DE.L(i,j,z)      = DEO(i,j,z);
 DIT.L(i,z)       = DITO(i,z);
 DD.L(i,z)        = DDO(i,z);
 DS.L(j,i,z)      = DSO(j,i,z);
 DS_I.L(i,z)      = DSO_I(i,z);
 DS.L(j,i,z)      = DSO(j,i,z);
 EX.L(i,z,zj)     = EXO(i,z,zj);
 EXT.L(i,z)       = EXTO(i,z);
 EXTT.L(j,i,z)    = EXTTO(j,i,z);
 G_REAL.L(z)      = G_REALO(z);
 GDP_BP_REAL.l(z) = GDP_BP_REALO(z);
 GDP_MP_REAL.l(z) = GDP_MP_REALO(z);
 GDP_BP_W_REAL.l  = GDP_BP_W_REALO;
 IM.L(i,zj,z)     = IMO(i,zj,z);
 IMT.L(i,z)       = IMTO(i,z);
 INV.L(i,z)       = INVO(i,z);
 IT_REAL.l(z)     = IT_REALO(z);
 KD.L(k,j,z)      = KDO(k,j,z);
 KDC.L(j,z)       = KDCO(j,z);
 KS.L(k,z)        = KSO(k,z);
 LD.L(l,j,z)      = LDO(l,j,z);
 LDC.L(j,z)       = LDCO(j,z);
 LS.L(l,z)        = LSO(l,z);
 MRGN.L(i,z)      = MRGNO(i,z);
 Q.L(i,z)         = QO(i,z);
 VA.L(j,z)        = VAO(j,z);
 XS.L(j,i,z)      = XSO(j,i,z);
 XS_I.L(i,z)      = XSO_I(i,z);
 XST.L(j,z)       = XSTO(j,z);
 POWERQ.L(z)      = POWERQO(z);
 EE.L(product,j,z) = EEO(product,j,z);
 NE.L(product,j,z) = NEO(product,j,z);
 EH.L(product,z)   = EHO(product,z);
 CO2I.L(product,j,z) = CO2IO(product,j,z);
 CO2H.L(product,z)   = CO2HO(product,z);
 CH4I.L(product,j,z) = CH4IO(product,j,z);
 CH4H.L(product,z)   = CH4HO(product,z);
 N2OI.L(product,j,z) = N2OIO(product,j,z);
 N2OH.L(product,z)   = N2OHO(product,z);

*Include lower boundaries to prevent numerical problems in optimization
*  CABX.LO(z)        = 0.0001*CABXO(z);
*  C.LO(i,z)         = 0.0001*CO(i,z);
*  CG.LO(i,z)        = 0.0001*CGO(i,z);
*  CI.LO(j,z)        = 0.0001*CIO(j,z);
*  CMIN.LO(i,z)      = 0.0001*CMINO(i,z);
*  CTH_REAL.LO(z)    = 0.0001*CTH_REALO(z);
*  DI.LO(i,j,z)      = 0.0001*DIO(i,j,z);
*  DIT.LO(i,z)       = 0.0001*DITO(i,z);
*  DD.LO(i,z)        = 0.0001*DDO(i,z);
*  DS.LO(j,i,z)      = 0.0001*DSO(j,i,z);
*  DS_I.LO(i,z)      = 0.0001*DSO_I(i,z);
*  DS.LO(j,i,z)      = 0.0001*DSO(j,i,z);
*  EX.LO(i,z,zj)     = 0.0001*EXO(i,z,zj);
*  EXT.LO(i,z)       = 0.0001*EXTO(i,z);
*  EXTT.LO(j,i,z)    = 0.0001*EXTTO(j,i,z);
*  G_REAL.LO(z)      = 0.0001*G_REALO(z);
*  GDP_BP_REAL.lO(z) = 0.0001*GDP_BP_REALO(z);
*  GDP_MP_REAL.lO(z) = 0.0001*GDP_MP_REALO(z);
*  GDP_BP_W_REAL.lO  = 0.0001*GDP_BP_W_REALO;
*  IM.LO(i,zj,z)     = 0.0001*IMO(i,zj,z);
*  IMT.LO(i,z)       = 0.0001*IMTO(i,z);
*  INV.LO(i,z)       = 0.0001*INVO(i,z);
*  IT_REAL.lO(z)     = 0.0001*IT_REALO(z);
*  KD.LO(k,j,z)      = 0.0001*KDO(k,j,z);
*  KDC.LO(j,z)       = 0.0001*KDCO(j,z);
*  KS.LO(k,z)        = 0.0001*KSO(k,z);
*  LD.LO(l,j,z)      = 0.0001*LDO(l,j,z);
*  LDC.LO(j,z)       = 0.0001*LDCO(j,z);
*  LS.LO(l,z)        = 0.0001*LSO(l,z);
*  MRGN.LO(i,z)      = 0.0001*MRGNO(i,z);
*  Q.LO(i,z)         = 0.0001*QO(i,z);
*  VA.LO(j,z)        = 0.0001*VAO(j,z);
*  XS.LO(j,i,z)      = 0.0001*XSO(j,i,z);
*  XS_I.LO(i,z)      = 0.0001*XSO_I(i,z);
*  XST.LO(j,z)       = 0.0001*XSTO(j,z);

*==============================================================================
*   6.1.2 Price variables
*==============================================================================
 e.L(z)           = eO(z);
 P.L(i,z)         = PO(i,z);
 P2.L(j,i,z)      = PO2(j,i,z);
* P3.L(i,j,z)      = PO3(i,j,z);
 PPOWER.L(z)      = PPOWERO(z);
 PI.l(i,z)        = PO(i,z);
 PT.L(j,z)        = PTO(j,z);
 PP.L(j,z)        = PPO(j,z);
 PC.L(i,z)        = PCO(i,z);
 PCI.L(j,z)       = PCIO(j,z);
 PD.L(i,z)        = PDO(i,z);
 PE.L(i,z,zj)     = PEO(i,z,zj);
 PET.L(i,z)       = PETO(i,z);
 PIXCON.L(z)      = PIXCONO(z);
 PIXGDP.L(z)      = PIXGDPO(z);
 PIXGDP_W.L       = PIXGDP_WO;
 PIXGVT.L(z)      = PIXGVTO(z);
 PIXINV.L(z)      = PIXINVO(z);
 PK.L(z)          = PKO(z);
 PL.L(i,z)        = PLO(i,z);
 PM.L(i,zj,z)     = PMO(i,zj,z);
 PMT.L(i,z)       = PMTO(i,z);
 PP.L(j,z)        = PPO(j,z);
 PVA.L(j,Z)       = PVAO(j,Z);
 PWM.L(i,zj,z)    = PWMO(i,zj,z);
 PWMG.L(i)        = PWMGO(i);
 PWX.L(i,z,zj)    = PWXO(i,z,zj);
 R.L(k,j,z)       = RO(k,j,z);
 RC.L(j,z)        = RCO(j,z);
 RK.L(k,z)        = RKO(k,z);
 RTI.L(k,j,z)     = RTIO(k,j,z);
 W.L(l,z)         = WO(l,z);
 WC.L(j,z)        = WCO(j,z);
 WTI.L(l,j,z)     = WTIO(l,j,z);

*Include lower boundaries to prevent numerical problems in optimization
*  e.LO(z)           = 0.0001*eO(z);
*  P.LO(i,z)         = 0.0001*PO(i,z);
*  P2.LO(j,i,z)      = 0.0001*PO2(j,i,z);
* * P3.L(i,j,z)      = PO3(i,j,z);
*  PPOWER.LO(z)      = 0.0001*PPOWERO(z);
*  PI.LO(i,z)        = 0.0001*PO(i,z);
*  PT.LO(j,z)        = 0.0001*PTO(j,z);
*  PP.LO(j,z)        = 0.0001*PPO(j,z);
*  PC.LO(i,z)        = 0.0001*PCO(i,z);
*  PCI.LO(j,z)       = 0.0001*PCIO(j,z);
*  PD.LO(i,z)        = 0.0001*PDO(i,z);
*  PE.LO(i,z,zj)     = 0.0001*PEO(i,z,zj);
*  PET.LO(i,z)       = 0.0001*PETO(i,z);
*  PIXCON.LO(z)      = 0.0001*PIXCONO(z);
*  PIXGDP.LO(z)      = 0.0001*PIXGDPO(z);
*  PIXGDP_W.LO       = 0.0001*PIXGDP_WO;
*  PIXGVT.LO(z)      = 0.0001*PIXGVTO(z);
*  PIXINV.LO(z)      = 0.0001*PIXINVO(z);
*  PK.LO(z)          = 0.0001*PKO(z);
*  PL.LO(i,z)        = 0.0001*PLO(i,z);
*  PM.LO(i,zj,z)     = 0.0001*PMO(i,zj,z);
*  PMT.LO(i,z)       = 0.0001*PMTO(i,z);
*  PP.LO(j,z)        = 0.0001*PPO(j,z);
*  PVA.LO(j,Z)       = 0.0001*PVAO(j,Z);
*  PWM.LO(i,zj,z)    = 0.0001*PWMO(i,zj,z);
*  PWMG.LO(i)        = 0.0001*PWMGO(i);
*  PWX.LO(i,z,zj)    = 0.0001*PWXO(i,z,zj);
*  R.LO(k,j,z)       = 0.0001*RO(k,j,z);
*  RC.LO(j,z)        = 0.0001*RCO(j,z);
*  RK.LO(k,z)        = 0.0001*RKO(k,z);
*  RTI.LO(k,j,z)     = 0.0001*RTIO(k,j,z);
*  W.LO(l,z)         = 0.0001*WO(l,z);
*  WC.LO(j,z)        = 0.0001*WCO(j,z);
*  WTI.LO(l,j,z)     = 0.0001*WTIO(l,j,z);

*==============================================================================
*   6.1.3 Nominal (value) variables
*==============================================================================
 CAB.L(z)         = CABO(z);
 CTH.L(z)         = CTHO(z);
 DEP.L(z)         = DEPO(z);
 G.L(z)           = GO(z);
 GDP_BP.L(z)      = GDP_BPO(z);
 GDP_BP_W.L       = SUM[z,GDP_BPO(z)];
 GDP_FD.L(z)      = GDP_FDO(z);
 GDP_IB.L(z)      = GDP_IBO(z);
 GDP_MP.L(z)      = GDP_MPO(z);
 IT.L(z)          = ITO(z);
 SG.L(z)          = SGO(z);
 SH.L(z)          = SHO(z);
 SROW.L(z)        = SROWO(z);
 TDH.L(z)         = TDHO(z);
 TIC.L(i,z)       = TICO(i,z);
 TICT.L(z)        = TICTO(z);
 TIK.L(k,j,z)     = TIKO(k,j,z);
 TIKT.L(z)        = TIKTO(z);
 TIM.L(i,zj,z)    = TIMO(i,zj,z);
 TIMT.L(z)        = TIMTO(z);
 TIP.L(j,z)       = TIPO(j,z);
 TIPT.L(z)        = TIPTO(z);
 TIW.L(l,j,z)     = TIWO(l,j,z);
 TIWT.L(z)        = TIWTO(z);
 TIX.L(i,z,zj)    = TIXO(i,z,zj);
 TIXT.L(z)        = TIXTO(z);
 TPRODN.l(z)      = TPRODNO(z);
 TPRCTS.l(z)      = TPRCTSO(z);
 YDH.L(z)         = YDHO(z);
 YG.L(z)          = YGO(z);
 YH.L(z)          = YHO(z);
 YHK.L(z)         = YHKO(z);
 YHL.L(z)         = YHLO(z);
 YROW.L(z)        = YROWO(z);

*  CAB.LO(z)         = 0.0001*CABO(z);
*  CTH.LO(z)         = 0.0001*CTHO(z);
*  DEP.LO(z)         = 0.0001*DEPO(z);
*  G.LO(z)           = 0.0001*GO(z);
*  GDP_BP.LO(z)      = 0.0001*GDP_BPO(z);
*  GDP_BP_W.LO       = 0.0001*SUM[z,GDP_BPO(z)];
*  GDP_FD.LO(z)      = 0.0001*GDP_FDO(z);
*  GDP_IB.LO(z)      = 0.0001*GDP_IBO(z);
*  GDP_MP.LO(z)      = 0.0001*GDP_MPO(z);
*  IT.LO(z)          = 0.0001*ITO(z);
*  SG.LO(z)          = 0.0001*SGO(z);
*  SH.LO(z)          = 0.0001*SHO(z);
*  SROW.LO(z)        = 0.0001*SROWO(z);
*  TDH.LO(z)         = 0.0001*TDHO(z);
*  TIC.LO(i,z)       = 0.0001*TICO(i,z);
*  TICT.LO(z)        = 0.0001*TICTO(z);
*  TIK.LO(k,j,z)     = 0.0001*TIKO(k,j,z);
*  TIKT.LO(z)        = 0.0001*TIKTO(z);
*  TIM.LO(i,zj,z)    = 0.0001*TIMO(i,zj,z);
*  TIMT.LO(z)        = 0.0001*TIMTO(z);
*  TIP.LO(j,z)       = 0.0001*TIPO(j,z);
*  TIPT.LO(z)        = 0.0001*TIPTO(z);
*  TIW.LO(l,j,z)     = 0.0001*TIWO(l,j,z);
*  TIWT.LO(z)        = 0.0001*TIWTO(z);
*  TIX.LO(i,z,zj)    = 0.0001*TIXO(i,z,zj);
*  TIXT.LO(z)        = 0.0001*TIXTO(z);
*  TPRODN.LO(z)      = 0.0001*TPRODNO(z);
*  TPRCTS.LO(z)      = 0.0001*TPRCTSO(z);
*  YDH.LO(z)         = 0.0001*YDHO(z);
*  YG.LO(z)          = 0.0001*YGO(z);
*  YH.LO(z)          = 0.0001*YHO(z);
*  YHK.LO(z)         = 0.0001*YHKO(z);
*  YHL.LO(z)         = 0.0001*YHLO(z);
*  YROW.LO(z)        = 0.0001*YROWO(z);

*==============================================================================
*  6.2 Choice of mobile or sector-specific capital
*==============================================================================
*  If kmob=1, capital is mobile, if kmob=0, it is sector-specific
 kmob             = 0;
 KD.fx(k,j,z)$(kmob eq 0)
                  = KDO(k,j,z);
 KS.fx(k,z)$kmob  = KSO(k,z);

*==============================================================================
*  6.3 Closures
*==============================================================================
*  6.3.1 Choice between closures FE and FP
*==============================================================================
*$ontext
* CLOSURE FE : fixed exchange rates; numeraire is PIXGDP of reference region
 PIXGDP.FX(zr)   = PIXGDPO(zr);
 e.FX(z)         = eO(z);
*$offtext

$ontext
* CLOSURE FP : fixed PIXGDPs; numeraire is exchange rate of reference region
* The exchange rates are endogenous, except for the reference region.
 e.FX(zr)        = eO(zr);
 PIXGDP.FX(z)    = PIXGDPO(z);
$offtext

*==============================================================================
*  6.3.2 Other closure rules
*==============================================================================
 CMIN.FX(i,z)     = CMINO(i,z);
 CABX.FX(z1)      = CABXO(z1);
 LS.FX(l,z)       = LSO(l,z);
 G_REAL.FX(z)     = G_REALO(z);
 sh0.FX(z)        = sh0O(z);
 sh1.FX(z)        = sh1O(z);
 ttdh0.FX(z)      = ttdh0O(z);
 ttdh1.FX(z)      = ttdh1O(z);
 ttic.FX(i,z)     = tticO(i,z);
 ttik.FX(k,j,z)   = ttikO(k,j,z);
 ttim.FX(i,zj,z)  = ttimO(i,zj,z);
 ttip.FX(j,z)     = ttipO(j,z);
 ttiw.FX(l,j,z)   = ttiwO(l,j,z);
 ttix.FX(i,z,zj)  = ttixO(i,z,zj);

* CE.FX(j,z)       = CEO(j,z);

*==============================================================================
*  6.4 Simulation
*==============================================================================
*ttim.FX(i,zj,z) = 0;
ttim.FX(i,zj,z) = ttimO(i,zj,z)*0.8;
* ttic.FX('18_ELEC',z) = tticO('18_ELEC',z)*5;
* ttic.FX('18_ELEC','15_SAS') = tticO('18_ELEC','15_SAS')*(-1*5);
*ttic.FX('15_MACHINE','01_KOR') = tticO('15_MACHINE','01_KOR')*1.5;

*option ITERLIM=8000000;
*option ITERLIM=100;

*This option specifies the maximum number of allowable solver iterations, before the solver terminates the run.
*option cns = path;
option cns = conopt4;

*option cns = 0.0000000001;
option reslim = 1000;

MODEL PEPW1 World wide static model /all/ ;
*option limrow=0, limcol=0, solprint = off;
*Option iterlim      = 0 ;
PEPW1.holdfixed=1;
SOLVE PEPW1 USING CNS;
*SOLVE PEPW1 USING MCP;
*SOLVE PEPW1 USING nlp min OBJ;
;

*$exit
*==============================================================================
*  6.4 Output
*==============================================================================
*$INCLUDE RESULTS_Joint_PEP w-1.gms
*$INCLUDE RESULTS_IAMC w-1.gms