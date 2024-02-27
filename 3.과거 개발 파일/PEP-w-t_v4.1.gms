$TITLE     PEP model w-t
$STITLE    World wide model, dynamic version, November 2014

*==============================================================================*
*  In this version of PEP w-t, the reference scenario (BAU) is based on        *
*  projections of:                                                             *
*   - a multifactor  productivity factor (A_VA) that reproduces real GDP       *
*     growth projections;                                                      *
*   - an intercept for the household savings function that is consistent with  *
*     anticipated changes in domestic savings rates.                           *
*                                                                              *
*  These projected values are computed by the program                          *
*                       PEP-w-t_v4.1_CAL_B_line.gms                            *
*  which uses projections taken from:                                          *
*   "The Great Shift: Macroeconomic projections for the world economy at       *
*    the 2050 horizon" CEPII Working Paper 2012-03, by Jean Foure,             *
*    Agnes Benassy-Quere & Lionel Fontagne, February 2012.                     *
*                                                                              *
*==============================================================================*


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
 I1(J)           All commodities except agriculture (agr)
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

$GDXIN DATA_AGG-2007.gdx
$LOAD J, I1, BUS, PUB, F, L, K, Z, ZR, Z1, Zrich, Zother

*==============================================================================
*  Periods
*==============================================================================

* The set TIME is the period of time for which we have projections for GDP,
* population and economically active population.
TIME Time periods
/
2019*2050
/

T(TIME)

T1(time) First period;
T1(time) = yes$[ord(time) eq 1];

ALIAS (j,jj,i,ij)
ALIAS (l,lj)
ALIAS (k,kj)
ALIAS (z,zj,zjj)

* If you don't want the model to run to the horizon defined in the set
* TIME, define parameter EndTime as the final year for model resolution.
*Parameter EndTime /2008/;
*Parameter EndTime /2020/;
Parameter EndTime /2050/;

*==============================================================================
* 2 Declaration of parameters and benchmark variables
*==============================================================================
PARAMETER
*==============================================================================
*  2.1 Parameters
*==============================================================================
 A_K(z)           Scale parameter (investment funtion)
 aij(i,j,z)       Input output coefficient
 B_KD(j,z)        Scale parameter (CES - composite capital)
 B_LD(j,z)        Scale parameter (CES - composite labor)
 B_M1(i,z)        Scale parameter (CES - composite commodity)
 B_M2(i,z)        Scale parameter (CES - composite import)
 B_VA(j,z)        Scale parameter (CES - value added)
 B_X1(i,z)        Scale parameter (CET - total output)
 B_X2(i,z)        Scale parameter (CET - composite export)
 beta_D_X1(j,z)   Share parameter (CET - total output - local sales)
 beta_EX_X1(j,z)  Share parameter (CET - total output - export)
 beta_KD(k,j,z)   Share parameter (CES - composite capital)
 beta_LD(l,j,z)   Share parameter (CES - composite labor)
 beta_M1(i,z)     Share parameter (CES - composite commodity)
 beta_M2(i,zj,z)  Share parameter (CES - composite import)
 beta_VA(j,z)     Share parameter (CES - value added)
 beta_X2(j,z,zj)  Share parameter (CET - composite export)
 delta(z)         Depreciation rate of capital in country z
 eta              Price elasticity of indexed transfers and parameters
 frisch(z)        Frisch parameter (LES function)
 g_GDP(z,time)    GDP past and projected growth rate
 g_LS(z,time)     Active population past and projected growth rate
 g_POP(z,time)    Population past and projected growth rate
 g_SDR(z,time)    Growth rate of domestic savings rate
 gamma_GVT(i,z)   Share of commodity i in total current public expenditures on goods and services
 gamma_INV(i,z)   Share of commodity i in total investment expenditures
 gamma_LES(i,z)   Marginal share of commodity i in household consumption budget
 exogro(z,time)   Exogenous growth factor for exogenously growing variables except labor
 io(j,z)          Coefficient (Leontief - intermediate consumption)
 RES              Rescaling factor
 rho_KD(j,z)      Elasticity parameter (CES - composite capital)
 rho_LD(j,z)      Elasticity parameter (CES - composite labor)
 rho_M1(i,z)      Elasticity parameter (CES - composite commodity)
 rho_M2(i,z)      Elasticity parameter (CES - composite import)
 rho_VA(j,z)      Elasticity parameter (CES - value added)
 rho_X1(j,z)      Elasticity parameter (CET - total output)
 rho_X2(j,z)      Elasticity parameter (CET - composite export)
 sigma_INV(k,j,z) Elasticity (investment demand)
 sigma_KD(j,z)    Elasticity (CES - composite capital)
 sigma_LD(j,z)    Elasticity (CES - composite labor)
 sigma_M1(i,z)    Elasticity (CES - composite commodity)
 sigma_M2(i,z)    Elasticity (CES - composite import)
 sigma_VA(j,z)    Elasticity (CES - value added)
 sigma_X1(j,z)    Elasticity (CET - total output)
 sigma_X2(j,z)    Elasticity (CET - composite export)
 sigma_Y(i,z)     Income elasticity of consumption
 tmrg(i,ij,zj,z)  Rate of margin i applied to commodity ij imported from country zj
 v(j,z)           Coefficient (Leontief - value added)

*==============================================================================
*  2.2 Variables - Benchmark
*==============================================================================
*  Benchmark values of variables are parameters. Their acronyms are the
*  corresponding variable names,followed by the letter "O".

*==============================================================================
*   2.2.1 Volume variables
*==============================================================================
 CABXO(z)         Current account balance of region z in terms of the international currency (pseudo-volume variable)
 CO(i,z)          Consumption of commodity i by households in region z
 CGO(i,z)         Public consumption of commodity i in region z
 CIO(j,z)         Total intermediate consumption of industry j in region z
 CMINO(i,z)       Minimum consumption of commodity i by households in region z
 CTH_REALO(z)     Real household consumption in region z
 DDO(i,z)         Domestic demand for commodity i produced locally in region z
 DIO(i,j,z)       Intermediate consumption of commodity i by industry j in region z
 DITO(i,z)        Total intermediate demand of commodity i in region z
 DSO(i,z)         Supply of commodity i to the domestic market of region z
 EXO(i,z,zj)      Quantity of product i exported by country z to country zj
 EXTO(i,z)        Supply of composite commodity i by region z to the export market
 G_REALO(z)       Current real government expenditures on goods and services in region z
 GDP_BP_REALO(z)  Real GDP at basic prices
 GDP_MP_REALO(z)  Real GDP at market prices
 GDP_BP_W_REALO   Real GDP at basic prices
 IMO(i,zj,z)      Quantity of product i imported by country z from country zj
 IMTO(i,z)        Quantity demanded of composite imports of commodity i by region z
 INDO(k,j,z)      Volume of new type k capital investment to industry j in region z
 INVO(i,z)        Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REALO(z)      Real gross fixed capital formation
 KDO(k,j,z)       Demand for type k capital by industry j in region z
 KDCO(j,z)        Demand for composite capital by industry j in region z
 KSO(k,z)         Supply of type k capital in region z
 KSTO(z)          Total supply of capital in region z
 LDO(l,j,z)       Demand for type l labor by industry j in region z
 LDCO(j,z)        Demand for composite labor by industry j in region z
 LSO(l,z)         Supply of type l labor in region z
 MRGNO(i,z)       Domestic production of commodity i in region z exported as international margin services
 POPO(z)          Population in 2007
 QO(i,z)          Quantity demanded of composite commodity i in region z
 VAO(j,z)         Value added of industry j in region z
 XSO(j,z)         Total output of industry j in region z

*==============================================================================
*   2.2.2 Price variables
*==============================================================================
 eO(z)            Exchange rate (price of international currency in terms of region z local currency)
 IRO(z)           Interest rate
 PO(j,z)          Basic price of industry j production in region z
 PCO(i,z)         Purchaser price of composite commodity i (including all taxes and margins) in region z
 PCIO(j,z)        Intermediate consumption price index of industry j in region z
 PDO(i,z)         Price of local product i sold on region z domestic market (including all taxes)
 PEO(i,z,zj)      Price received for commodity i exported to region zj by region z (excluding export taxes)
 PETO(i,z)        Border price of composite commodity i exported by region z
 PIXCONO(z)       Consumer price index in region z
 PIXGDPO(z)       GDP deflator in region z
 PIXGDP_WO        World GDP deflator
 PIXGVTO(z)       Public expenditures price index in region z
 PIXINVO(z)       Investment price index in region z
 PKO(z)           Price of new capital in region z
 PLO(i,z)         Price of local product i (excluding all taxes on products) in region z
 PMO(i,zj,z)      Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 PMTO(i,z)        Price of composite commodity i imported by region z (including all taxes duties and margins)
 PPO(j,z)         Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 PVAO(j,Z)        Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 PWMO(i,zj,z)     World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMGO(i)         World price of margin i (expressed in international currency)
 PWXO(i,z,zj)     World price of commodity i exported to country zj by region z (expressed in international currency)
 RO(k,j,z)        Rental rate of type k capital in industry j of region z
 RCO(j,z)         Rental rate of industry j composite capital in region z
 RTIO(k,j,z)      Rental rate paid by industry j for type k capital in region z including capital taxes
 UO(z)            User cost of capital in region z
 WO(l,z)          Wage rate of type l labor in region z
 WCO(j,z)         Wage rate of industry j composite labor in region z
 WTIO(l,j,z)      Wage rate paid z by industry j for type l labor in region including payroll taxes

*==============================================================================
*   2.2.3 Nominal (value) variables
*==============================================================================
 CABO(z)          Current account balance of region z
 CTHO(z)          Consumption budget of households in region z
 DEPO(z)          Amount of depreciation (capital consumption allowance) in region z
 GO(z)            Current government expenditures on goods and services in region z
 GDP_BPO(z)       Region z GDP at basic prices
 GDP_BP_WO        World GDP at basic prices
 GDP_FDO(z)       Region z GDP at purchasers prices from the perspective of final demand
 GDP_IBO(z)       Region z GDP at market prices (income-based)
 GDP_MPO(z)       Region z GDP at market prices
 ITO(z)           Total investment expenditures in region z
 RKDO(k,j,z)      Type k capital income in industry j in region z
 SGO(z)           Government savings in region z
 SHO(z)           Household savings in region z
 SROWO(z)         Rest-of-the-world savings with respect to region z
 TDHO(z)          Household income taxes in region z
 TICO(i,z)        Government revenue from indirect taxes on commodity i in region z
 TICTO(z)         Total government receipts of indirect taxes on commodities in region z
 TIKO(k,j,z)      Government revenue from taxes on type k capital used by industry j in region z
 TIKTO(z)         Total government revenue from from taxes on capital in region z
 TIMO(i,zj,z)     Government revenue from duties on commodity i imported from region zj by region z
 TIMTO(z)         Total government revenue from import duties in region z
 TIPO(i,z)        Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 TIPTO(z)         Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 TIWO(l,j,z)      Government revenue from payroll taxes on type l labor in industry j of region z
 TIWTO(z)         Total government revenue from payroll taxes in region z
 TIXO(i,z,zj)     Government revenue from export taxes on commodity i exported by region z to region zj
 TIXTO(z)         Total government revenue from export taxes in region z
 TPRCTSO(z)       Total government revenue from taxes on products and imports in region z
 TPRODNO(z)       Total government revenue from other taxes on production in region z
 YDHO(z)          Household disposable income in region z
 YGO(z)           Total government income in region z
 YHO(z)           Household total income in region z
 YHKO(z)          Household capital income in region z
 YHLO(z)          Household labor income in region z
 YROWO(z)         Rest-of-the-world total income from region z

*==============================================================================
*   2.2.4 Rates and intercepts
*==============================================================================
 phiO(z)          Scale variable (allocation of investment to industries)
 sh0O(z)          Intercept (household savings)
 sh1O(z)          Slope (household savings)
 ttdh0O(z)        Intercept (household income tax)
 ttdh1O(z)        Slope (household income tax)
 tticO(i,z)       Tax rate on commodity i
 ttikO(k,j,z)     Tax rate on capital k used in industry j
 ttimO(i,zj,z)    Rate of taxes and duties on imports of commodity i from country zj
 ttipO(j,z)       Tax rate on the production of industry j
 ttiwO(l,j,z)     Tax rate on type l worker compensation in industry j
 ttixO(i,z,zj)    Export tax rate on exported commodity x
;

*==============================================================================
* 3 Data
*==============================================================================
*  3.1 Data input from GTAP8.1
*==============================================================================
*   3.1.1 Reading data aggregated with DATA_AGG-2007.gms
*==============================================================================
*  The PEP w-t model uses aggregated data from GTAP8.1. The following file
*  includes data for some variables and substitution elasticities.

$LOAD CO, CGO, DDO, DEPO,  DIO, DSO, EXO, IMO, INVO, KSTO, LDO, MRGNO, XSO,
$LOAD g_GDP, g_LS, g_POP, g_SDR, RKDO, TDHO, TICO, TIKO, TIMO, TIPO, TIWO, TIXO,
$LOAD tmrg, sigma_M1, sigma_M2, sigma_VA, exogro, POPO

*==============================================================================
*   3.1.2 Rescaling the variables
*==============================================================================
* GTAP 8.1 data are in millions of (2004 and 2007) US dollars
* (see www.gtap.agecon.purdue.edu/resources/download/5679.pdf)
* With RES = 10000, model results are in tens of billions (10G$)

 RES             = 10000;

* NOTE: In GTAP parlance, "agents' prices" are prices paid by buyers, and
*       "market prices" are prices received by sellers.

* Household consumption = GTAP domestic purchases (VDPA) + import purchases (VIPA)
* by households at agents' prices.
 CO(i,z)         = CO(i,z)/RES;

* Public final consumption = domestic purchases (VDGA) + import purchases (VIGA)
* by government at agents' prices.
 CGO(i,z)        = CGO(i,z)/RES;

* Domestic purchases = domestic absorption:
* (CO + CGO + INVO + DIO) - [ imports (IMO) + transport margins (tmrg)
*                              + indirect taxes (TICO + TIMO) ]
 DDO(i,z)        = DDO(i,z)/RES;

* Capital depreciation (DEP)
 DEPO(z)         = DEPO(z)/RES;

* Intermediate consumption = domestic purchases (VDFA) + import purchases (VIFA)
* by firms belonging to sectors other than CGDS, at agents' prices.
 DIO(i,j,z)      = DIO(i,j,z)/RES;

* Domestic supply = domestic demand (DDO) in GTAP_AGG.gms
 DSO(i,z)        = DSO(i,z)/RES;

* Exports = exports at world prices (VXWD) = imports at world prices
* Note: the GTAP variable VXWD is NOT used in the DATA_AGG.gms program; the
* value recorded in DATA_AGG.gdx is actually identical to IMO
 EXO(i,z,zj)     = EXO(i,z,zj)/RES;

* Imports = imports at world prices (VIWS) - sum of transport margins on imports (VTWR)
 IMO(i,z,zj)     = IMO(i,z,zj)/RES;

* Demand for investment purposes = domestic purchases (VDFA)+ import purchases (VIFA)
* by firms of the CGDS sector at agents' prices.
 INVO(i,z)       = INVO(i,z)/RES;

* Total capital stock at the beginning of the period (VKB)
 KSTO(z)         = KSTO(z)/RES;

* Labor demand = Remuneration of labor at market prices, before taxes
* (components of VFM, "primary factor purchases, by households, at market prices")
 LDO(l,j,z)      = LDO(l,j,z)/RES;

* Supply of transport margins at market prices (VST), adjusted proportionately
* so that MRGNO = sum of tmrg for every margin commodity
 MRGNO(i,z)      = MRGNO(i,z)/RES;

* Remuneration of capital at market prices, before taxes
* (components of VFM, "primary factor purchases, by households, at market prices")
 RKDO(k,j,z)     = RKDO(k,j,z)/RES;

* Direct taxes = factor payment at market prices (VFM)
*                - primary factor sales at agents' prices (EVOA)
 TDHO(z)         = TDHO(z)/RES;

* Domestic taxes on commodities = demand at agents' prices - demand at market prices:
* Include 6 pairs of GTAP components
*       VDPA - VDPM
*       VIPA - VIPM
*       VDGA - VDGM
*       VIGA - VIGM
*       VDFA - VDFM
*       VIFA - VIFM
 TICO(i,z)       = TICO(i,z)/RES;

* Net taxes on factor of production = factor employment tax revenue (FTRV)
*                                     - factor-based subsidies (FBEP).
 TIKO(k,j,z)     = TIKO(k,j,z)/RES;

* Import duties = "ordinary" import duties (TFRV)
 TIMO(i,z,zj)    = TIMO(i,z,zj)/RES;

* Taxes on production = MINUS "ordinary output subsidies" (OSEP)
 TIPO(j,z)       = TIPO(j,z)/RES;

* Net taxes on factor of production = factor employment tax revenue (FTRV)
*                                     - factor-based subsidies (FBEP).
 TIWO(l,j,z)     = TIWO(l,j,z)/RES;

* Taxes on exports = export tax equivalent of the Multi-Fiber Agreement (MFA)
* quota premium(MFRV) + "ordinary" export taxes (XTRV)
 TIXO(i,z,zj)    = TIXO(i,z,zj)/RES;

* Transport margins at world prices = sum of margins on imports (VTWR)
 tmrg(i,ij,z,zj) = tmrg(i,ij,z,zj)/RES;

* Domestic output = domestic supply (DSO) + supply of transport margins (MRGNO)
*                   + exports (EXO) - taxes on exports (TIXO)
 XSO(j,z)        = XSO(j,z)/RES;

*==============================================================================
*  3.2 Exogenous prices and parameters
*==============================================================================

*  Price elasticity (should be equal to one to verify homogeneity)
 eta             = 1;

*==============================================================================
* CES and CET elasticities
*==============================================================================
* CES elasticities are defined using GTAP8.1 data for imports
* (sigma_M1 and sigma_M2) and value added (sigma_VA)

* Other exogenous parameters can be defined in the Excel file VAL_PAR.XLS
PARAMETER
PARZ;
$CALL GDXXRW.EXE VAL_PAR.xls squeeze = 'no' par=sigma_KD rng=PAR!A5:O9 par=sigma_LD rng=PAR!A12:O16 par=sigma_X1 rng=PAR!A19:O23 par=sigma_X2 rng=PAR!A26:O30 par=sigma_y rng=PAR!A33:O37 par=PARZ rng=PAR!A39:C53 par=sigma_inv rng=PAR!A56:P68 Rdim=2 Cdim=1
$GDXIN VAL_PAR.gdx
$LOAD sigma_KD, sigma_LD, sigma_X1, sigma_X2, sigma_y, sigma_inv, PARZ
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
* frisch(z)      = PARZ(z,'frisch');

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
 ttdh0O(z)       = PARZ(z,'ttdh0O');
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
*  4.2 Calibration of parameters
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

 DSO(i,z)        = DSO(i,z)/PLO(i,z);
 DDO(i,z)        = DSO(i,z);
 QO(i,z)         = IMTO(i,z)+DDO(i,z);

 MRGNO(i,z)$MRGNO(i,z)
                 = MRGNO(i,z)/[eO(z)*PWMGO(i)];

 XSO(i,z)        = EXTO(i,z)+DSO(i,z)+MRGNO(i,z);

 PO(j,z)         = [PETO(j,z)*EXTO(j,z)+PLO(j,z)*DSO(j,z)
                   +eO(z)*PWMGO(j)*MRGNO(j,z)]/XSO(j,z);

 PPO(j,z)        = [SUM[l,TIWO(l,j,z)+WO(l,z)*LDO(l,j,z)]
                    +SUM[k,TIKO(k,j,z)+RKDO(k,j,z)]
                    +SUM[i,DIO(i,j,z)]]/XSO(j,z);

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
 ttipO(j,z)      = [PO(j,z)/PPO(j,z)]-1;

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
 INVO(i,z)       = INVO(i,z)/PCO(i,z);

 CIO(j,z)        = SUM[i,DIO(i,j,z)];
 DITO(i,z)       = SUM[j,DIO(i,j,z)];

 PCIO(j,z)       = SUM[i,PCO(i,z)*DIO(i,j,z)]/CIO(j,z);

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
* These hypotheses lead to the following formula:

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
*  4.7 Calibration of function parameters
*==============================================================================
*   4.7.1 Leontief functions
*==============================================================================
 io(j,z)         = CIO(j,z)/XSO(j,z) ;
 v(j,z)          = VAO(j,z)/XSO(j,z) ;
 aij(i,j,z)      = DIO(i,j,z)/CIO(j,z);

*==============================================================================
*   4.7.2 Calibration of CET parameters
*==============================================================================
*    4.7.2.1 CET between total exports, domestic supply and margins
*==============================================================================
 rho_X1(j,z)     = (1+sigma_X1(j,z))/sigma_X1(j,z);
 beta_EX_X1(j,z)$MRGNO(j,z)
                 = [PETO(j,z)*EXTO(j,z)$EXTO(j,z)**(1-rho_X1(j,z))]/
                   [PETO(j,z)*EXTO(j,z)$EXTO(j,z)**(1-rho_X1(j,z))+
                   PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))+
                   eO(z)*PWMGO(j)*MRGNO(j,z)$MRGNO(j,z)**(1-rho_X1(j,z))];
 beta_EX_X1(j,z)$(MRGNO(j,z) eq 0)
                 = [PETO(j,z)*EXTO(j,z)$EXTO(j,z)**(1-rho_X1(j,z))]/
                   [PETO(j,z)*EXTO(j,z)$EXTO(j,z)**(1-rho_X1(j,z))+
                   PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))];
 beta_D_X1(j,z)$MRGNO(j,z)
                 = [PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))]/
                   [PETO(j,z)*EXTO(j,z)**(1-rho_X1(j,z))+
                   PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))+
                   eO(z)*PWMGO(j)*MRGNO(j,z)**(1-rho_X1(j,z))];
 beta_D_X1(j,z)$(MRGNO(j,z) eq 0)
                 = [PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))]/
                   [PETO(j,z)*EXTO(j,z)**(1-rho_X1(j,z))+
                   PLO(j,z)*DSO(j,z)**(1-rho_X1(j,z))];
 B_X1(j,z)       = XSO(j,z)/[beta_EX_X1(j,z)*EXTO(j,z)**rho_X1(j,z)
                  +beta_D_X1(j,z)*DSO(j,z)**rho_X1(j,z)+(1-beta_EX_X1(j,z)
                  -beta_D_X1(j,z))*MRGNO(j,z)**rho_X1(j,z)]**(1/rho_X1(j,z));

*==============================================================================
*    4.7.2.2 CET between exports to different trading partners
*==============================================================================
 rho_X2(j,z)     = (1+sigma_X2(j,z))/sigma_X2(j,z);
 beta_X2(j,z,zj)$EXO(j,z,zj)
                 = [PEO(j,z,zj)*EXO(j,z,zj)**(1-rho_X2(j,z))]/
                   SUM[zjj$EXO(j,z,zjj),PEO(j,z,zjj)*EXO(j,z,zjj)
                   **(1-rho_X2(j,z))];
 B_X2(j,z)       = EXTO(j,z)/{SUM[zj,beta_X2(j,z,zj)*EXO(j,z,zj)**rho_X2(j,z)]
                   **(1/rho_X2(j,z))};

*==============================================================================
*   4.7.3 Calibration of CES parameters
*==============================================================================
*    4.7.3.1 Composite good
*==============================================================================
 rho_M1(i,z)     = (1-sigma_m1(i,z))/sigma_m1(i,z);
 beta_M1(i,z)    = PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)/
                  {PDO(i,z)*DDO(i,z)**(rho_M1(i,z)+1)
                  +PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)};
 B_M1(i,z)       = QO(i,z)/{beta_M1(i,z)*IMTO(i,z)**(-rho_M1(i,z))
                  +(1-beta_M1(i,z))*DDO(i,z)**(-rho_M1(i,z))}**(-1/rho_M1(i,z));

*==============================================================================
*    4.7.3.2 CES between imports from different trading partners
*==============================================================================
 rho_M2(i,z)     = (1-sigma_M2(i,z))/sigma_M2(i,z);
 beta_M2(i,zj,z)$IMO(i,zj,z)
                 = [PMO(i,zj,z)*IMO(i,zj,z)**(rho_M2(i,z)+1)]/
                   SUM[zjj$IMO(i,zjj,z),PMO(i,zjj,z)*IMO(i,zjj,z)
                    **(rho_M2(i,z)+1)];
 B_M2(i,z)       = IMTO(i,z)/{SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*IMO(i,zj,z)
                   **(-rho_M2(i,z))]**(-1/rho_M2(i,z))};

*==============================================================================
*    4.7.3.3 Composite capital
*==============================================================================
 rho_KD(j,z)     = (1-sigma_KD(j,z))/sigma_KD(j,z);
 beta_KD(k,j,z)$KDO(k,j,z)
                 = [RTIO(k,j,z)*KDO(k,j,z)**(1+rho_KD(j,z))]/
                   SUM[kj$KDO(kj,j,z),RTIO(kj,j,z)*KDO(kj,j,z)**(1+rho_KD(j,z))];
 B_KD(j,z)$KDCO(j,z)
                 = KDCO(j,z)/{SUM[k$KDO(k,j,z),beta_KD(k,j,z)*KDO(k,j,z)
                   **(-rho_KD(j,z))]**(-1/rho_KD(j,z))};

*==============================================================================
*    4.7.3.4 Composite labor
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
*    4.7.3.5 Value added
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
*   4.7.4 Calibration of LES parameters
*==============================================================================
*   As the assigned values of income elasticities may not result in
*   consumption shares that add up to 1, this first step
*   adjusts the elasticities proportionally

 sigma_Y(i,z)    = sigma_Y(i,z)/{SUM[ij,sigma_Y(ij,z)*PCO(ij,z)*CO(ij,z)]
                   /CTHO(z)};
 gamma_LES(i,z)  = PCO(i,z)*CO(i,z)*sigma_Y(i,z)/CTHO(z);
 CMINO(i,z)      = CO(i,z)+gamma_LES(i,z)*CTHO(z)/{PCO(i,z)*frisch(z)};

*==============================================================================
*  4.8 Calibration of gross domestic products
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
*  4.9 Calibration of real (volume) variables computed from price indices
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

Parameter CABXsur(z,time), CABXdef(z,time), bal(time), mu(time), CABix(z,time);
 CABXsur(z,time) = CABXO(z)*exogro(z,time)$[CABXO(z) gt 0];
 CABXdef(z,time) = CABXO(z)*exogro(z,time)$[CABXO(z) lt 0];
 Bal(time)       = sum(zj,CABXsur(zj,time))+sum(zj,CABXdef(zj,time));
 mu(time)        = sum(zj,CABXsur(zj,time))/
                     {sum(zj,CABXsur(zj,time))+sum(zj,abs[CABXdef(zj,time)])};
 CABXsur(z,time) = CABXsur(z,time)*{1-mu(time)*Bal(time)/sum(zj,CABXsur(zj,time))};
 CABXdef(z,time) = CABXdef(z,time)*{1-[1-mu(time)]*Bal(time)/sum(zj,CABXdef(zj,time))};
 CABix(z,time)   = [CABXsur(z,time)+CABXdef(z,time)]/CABXO(z);
*------------------------------------------------------------------------------

 CTH_REALO(z)    = CTHO(z)/PIXCONO(z);
 G_REALO(z)      = GO(z)/PIXGVTO(z);
 GDP_BP_REALO(z) = GDP_BPO(z)/PIXGDPO(z);
 GDP_BP_W_REALO  = GDP_BP_WO/PIXGDP_WO;
 GDP_MP_REALO(z) = GDP_MPO(z)/PIXCONO(z);
 IT_REALO(z)     = ITO(z)/PIXINVO(z);

*==============================================================================
*  4.10 Parameters of the household savings function
*==============================================================================
 sh1O(z)         = [SHO(z)+SGO(z)]/GDP_IBO(z);
 sh0O(z)         = SHO(z)-sh1O(z)*YDHO(z);

*==============================================================================
*  4.11 Re-calibration of indexed transfers and parameters
*==============================================================================
 sh0O(z)         = sh0O(z)/PIXCONO(z)**eta;
 ttdh0O(z)       = ttdh0O(z)/PIXCONO(z)**eta;

*==============================================================================
* 5 Model
*==============================================================================
*  5.1 Variable declarations
*==============================================================================

VARIABLES

*==============================================================================
*   5.1.1 Volume variables
*==============================================================================
 C(i,z,time)          Consumption of commodity i by households in region z
 CABX(z,time)         Current account balance or region z in terms of the international currency
 CG(i,z,time)         Public consumption of commodity i in region z
 CI(j,z,time)         Total intermediate consumption of industry j in region z
 CMIN(i,z,time)       Minimum consumption of commodity i by households in region z
 CTH_REAL(z,time)     Real household consumption in region z
 DD(i,z,time)         Domestic demand for commodity i produced locally in region z
 DI(i,j,z,time)       Intermediate consumption of commodity i by industry j in region z
 DIT(i,z,time)        Total intermediate demand of commodity i in region z
 DS(i,z,time)         Supply of commodity i to the domestic market of region z
 EX(i,z,zj,time)      Quantity of product i exported by country z to country zj
 EXT(i,z,time)        Supply of composite commodity i by region z to the export market
 G_REAL(z,time)       Current real government expenditures on goods and services in region z
 GDP_BP_REAL(z,time)  Real GDP at basic prices
 GDP_BP_W_REAL(time)  Real world GDP at basic prices
 GDP_MP_REAL(z,time)  Real GDP at market prices
 IM(i,zj,z,time)      Quantity of product i imported by country z from country zj
 IMT(i,z,time)        Quantity demanded of composite imports of commodity i by region z
 IND(k,j,z,time)      Volume of new type k capital investment to industry j in region z
 INV(i,z,time)        Final demand of commodity i for investment purposes (GFCF) in region z
 IT_REAL(z,time)      Real gross fixed capital formation
 KD(k,j,z,time)       Demand for type k capital by industry j in region z
 KDC(j,z,time)        Demand for composite capital by industry j in region z
 KS(k,z,time)         Supply of type k capital in region z
 LD(l,j,z,time)       Demand for type l labor by industry j in region z
 LDC(j,z,time)        Demand for composite labor by industry j in region z
 LS(l,z,time)         Supply of type l labor in region z
 MRGN(i,z,time)       Domestic production of commodity i in region z exported as international margin services
 Q(i,z,time)          Quantity demanded of composite commodity i in region z
 VA(j,z,time)         Value added of industry j in region z
 XS(j,z,time)         Total output of industry j in region z

*==============================================================================
*   5.1.2 Price variables
*==============================================================================
 e(z,time)            Exchange rate (price of international currency in terms of region z local currency)
 IR(z,time)           Interest rate
 P(j,z,time)          Basic price of industry j production in region z
 PC(i,z,time)         Purchaser price of composite commodity i (including all taxes and margins) in region z
 PCI(j,z,time)        Intermediate consumption price index of industry j in region z
 PD(i,z,time)         Price of local product i sold on region z domestic market (including all taxes)
 PE(i,z,zj,time)      Price received for commodity i exported to region zj by region z (excluding export taxes)
 PET(i,z,time)        Border price of composite commodity i exported by region z
 PIXCON(z,time)       Consumer price index in region z
 PIXGDP(z,time)       GDP deflator in region z
 PIXGDP_W(time)       World GDP deflator
 PIXGVT(z,time)       Public expenditures price index in region z
 PIXINV(z,time)       Investment price index in region z
 PK(z,time)           Price of new capital in region z
 PL(i,z,time)         Price of local product i (excluding all taxes on products) in region z
 PM(i,zj,z,time)      Price of commodity i imported by region z from region zj (including all taxes duties and margins)
 PMT(i,z,time)        Price of composite commodity i imported by region z (including all taxes duties and margins)
 PP(j,z,time)         Unit cost of industry j in region z including taxes directly related to the use of capital and labor but excluding other taxes on production
 PVA(j,z,time)        Price of industry j value added in region z (including taxes on production directly related to the use of capital and labor)
 PWM(i,zj,z,time)     World price of commodity i imported from country zj by region z (expressed in international currency)
 PWMG(i,time)         World price of margin i (expressed in international currency)
 PWX(i,z,zj,time)     World price of commodity i exported to country zj by region z (expressed in international currency)
 R(k,j,z,time)        Rental rate of type k capital in industry j of region z
 RC(j,z,time)         Rental rate of industry j composite capital in region z
 RTI(k,j,z,time)      Rental rate paid by industry j for type k capital in region z including capital taxes
 U(z,time)            User cost of capital in region z
 W(l,z,time)          Wage rate of type l labor in region z
 WC(j,z,time)         Wage rate of industry j composite labor in region z
 WTI(l,j,z,time)      Wage rate paid z by industry j for type l labor in region including payroll taxes

*==============================================================================
*   5.1.3 Nominal (value) variables
*==============================================================================
 CAB(z,time)          Current account balance of region z
 CTH(z,time)          Consumption budget of households in region z
 DEP(z,time)          Amount of depreciation (capital consumption allowance) in region z
 G(z,time)            Current government expenditures on goods and services in region z
 GDP_BP(z,time)       Region z GDP at basic prices
 GDP_BP_W(time)       World GDP at basic prices
 GDP_FD(z,time)       Region z GDP at purchasers prices from the perspective of final demand
 GDP_IB(z,time)       Region z GDP at market prices (income-based)
 GDP_MP(z,time)       Region z GDP at market prices
 IT(z,time)           Total investment expenditures in region z
 SG(z,time)           Government savings in region z
 SH(z,time)           Household savings in region z
 SROW(z,time)         Rest-of-the-world savings with respect to region z
 TDH(z,time)          Household income taxes in region z
 TIC(i,z,time)        Government revenue from indirect taxes on commodity i in region z
 TICT(z,time)         Total government receipts of indirect taxes on commodities in region z
 TIK(k,j,z,time)      Government revenue from taxes on type k capital used by industry j in region z
 TIKT(z,time)         Total government revenue from from taxes on capital in region z
 TIM(i,zj,z,time)     Government revenue from duties on commodity i imported from region zj by region z
 TIMT(z,time)         Total government revenue from import duties in region z
 TIP(i,z,time)        Government revenue from taxes on industry j production in region z (excluding taxes directly related to the use of capital and labor)
 TIPT(z,time)         Total government revenue from production taxes in region z (excluding taxes directly related to the use of capital and labor)
 TIW(l,j,z,time)      Government revenue from payroll taxes on type l labor in industry j of region z
 TIWT(z,time)         Total government revenue from payroll taxes in region z
 TIX(i,z,zj,time)     Government revenue from export taxes on commodity i exported by region z to region zj
 TIXT(z,time)         Total government revenue from export taxes in region z
 TPRCTS(z,time)       Total government revenue from taxes on products and imports in region z
 TPRODN(z,time)       Total government revenue from other taxes on production in region z
 YDH(z,time)          Household disposable income in region z
 YG(z,time)           Total government income in region z
 YH(z,time)           Household total income in region z
 YHK(z,time)          Household capital income in region z
 YHL(z,time)          Household labor income in region z
 YROW(z,time)         Rest-of-the-world total income from region z

*==============================================================================
*   5.1.4 Rates and intercepts
*==============================================================================
 phi(z,time)          Scale variable (allocation of investment to industries)
 sh0(z,time)          Intercept (household savings)
 sh1(z,time)          Slope (household savings)
 ttdh0(z,time)        Intercept (household income tax)
 ttdh1(z,time)        Slope (household income tax)
 ttic(i,z,time)       Tax rate on commodity i
 ttik(k,j,z,time)     Tax rate on capital k used in industry j
 ttim(i,zj,z,time)    Rate of taxes and duties on imports of commodity i from country zj
 ttip(j,z,time)       Tax rate on the production of industry j
 ttiw(l,j,z,time)     Tax rate on type l worker compensation in industry j
 ttix(i,z,zj,time)    Export tax rate on exported commodity x

*==============================================================================
*   5.1.5 Other variables
*==============================================================================
 A_VA(z,time)         Multifactor productivity
 LEON(z,time)         Excess supply on the last market in region z
;

*==============================================================================
*  5.2 Equation declarations
*==============================================================================
EQUATIONS
 EQ1(j,z,time)        Leontief - demand for value added
 EQ2(j,z,time)        Leontief - demand for intermediate consumption
 EQ3(j,z,time)        CES - combination of labor and capital
 EQ4(j,z,time)        CES - demand for composite labor
 EQ5(j,z,time)        CES between labor categories
 EQ6(l,j,z,time)      Demand for labor
 EQ7(j,z,time)        CES between capital categories
 EQ8(k,j,z,time)      Demand for capital
 EQ9(i,j,z,time)      Leontief - demand for commodity i by sector j
 EQ10(z,time)         Household total income
 EQ11(z,time)         Household labor income
 EQ12(z,time)         Household capital income
 EQ13(z,time)         Household disposable income
 EQ14(z,time)         Household consumption budget
 EQ15(z,time)         Household savings
 EQ16(z,time)         Government total income
 EQ17(z,time)         Total government receipts of taxes on production
 EQ18(z,time)         Government receipts of indirect taxes on wages
 EQ19(z,time)         Government receipts of indirect taxes on capital
 EQ20(z,time)         Government receipts of indirect taxes on production
 EQ21(z,time)         Total government receipts of taxes on products and imports
 EQ22(z,time)         Government receipts of indirect taxes on consumption
 EQ23(z,time)         Government receipts of indirect taxes on imports
 EQ24(z,time)         Government receipts of indirect taxes on exports
 EQ25(z,time)         Household h income taxes
 EQ26(l,j,z,time)     Government receipts of indirect taxes on wages
 EQ27(k,j,z,time)     Government receipts of indirect taxes on capital
 EQ28(j,z,time)       Government receipts of indirect taxes on production of industry j
 EQ29(i,z,time)       Government receipts of indirect taxes on commodity i
 EQ30(i,zj,z,time)    Government receipts of indirect taxes on imports of commodity i
 EQ31(i,z,zj,time)    Government receipts of indirect taxes on exports of commodity i
 EQ32(z,time)         Government savings
 EQ33(z,time)         Rest of the world total income
 EQ34(z,time)         Rest of the world savings
 EQ35(z,time)         Equivalence between current account balance and savings
 EQ36(i,z,time)       Household consumption of commodity i
 EQ37(i,z,time)       Final demand of commodity i for investment purposes
 EQ38(i,z,time)       Public final consumption of commodity i
 EQ39(i,z,time)       Total intermediate consumption of commodity i
 EQ40(i,z,time)       CET function between exports local production and margins
 EQ41(i,z,time)       Supply of composite exports
 EQ42(i,z,time)       Supply of margins
 EQ43(i,z,time)       CET function between exports by trading partner
 EQ44(i,z,zj,time)    Supply of exports by trading partner
 EQ45(i,z,time)       CES function between composite imports and local production
 EQ46(i,z,time)       Demand for composite imports
 EQ47(i,z,time)       CES function between imports by origin
 EQ48(i,zj,z,time)    Demand for imports by origin
 EQ49(j,z,time)       Producer price in industry j after production taxes
 EQ50(j,z,time)       Basic price of industry j production
 EQ51(j,z,time)       Price index of industry j intermediate consumption
 EQ52(j,z,time)       Value added price
* EQ53(j,z,time)       Price of composite labor in industry j (redundant)
 EQ54(l,j,z,time)     Wages including taxes
* EQ55(j,z,time)       Price of composite capital in industry j (redundant)
 EQ56(k,j,z,time)     Rental rate including taxes
 EQ57(i,z,time)       Producer price is a weighted sum of PE and PL
* EQ58(i,z,time)       Price of composite export i (redundant)
 EQ59(i,z,zj,time)    Border price of exported commodity i
 EQ60(i,z,time)       Price of local product i (including all taxes and margins)
 EQ61(i,zj,z,time)    Price of imported commodity i (including all taxes and duties)
* EQ62(i,z,time)       Price of composite import i (redundant)
 EQ63(i,z,time)       Consumer price is a weighted sum of PD and PM
 EQ64(z,time)         GDP deflator (Fischer index)
 EQ65(time)           World GDP deflator (Fischer index)
 EQ66(z,time)         Consumer price index (Laspeyres)
 EQ67(z,time)         Investment price index (derived from investment function)
 EQ68(z,time)         Public expenditure price index
 EQ69(i1,z,time)      Domestic absorbtion
 EQ70(l,z,time)       Labor supply equals labor demand
 EQ71(k,z,time)       Capital supply equals capital demand
 EQ72(z,time)         Total investment equals total savings
 EQ73(z,time)         Depreciation
 EQ74(i,z,time)       Supply of domestic production equals demand
 EQ75(i,z,zj,time)    Exports supply equals imports demand
 EQ76(i,z,zj,time)    Exports price equals imports price
 EQ77(i,time)         World demand for margins equals world supply
* EQ78(time)           Sum of foreign savings equals zero (redundant)
 EQ79(z,time)         GDP at basic prices
 EQ80(z,time)         GDP at market prices
 EQ81(z,time)         GDP at market prices (income-based)
 EQ82(z,time)         GDP at market prices (expenditure-based)
 EQ83(time)           World GDP
* EQ84(k,j,z,time)     Capital accumulation (in the loop)
 EQ85(z,time)         Total investment expenditure constraint
 EQ86(z,time)         Aggregate price of capital
 EQ87(k,bus,z,time)   Investment demand by industry
 EQ88a(z,time)        Interest rate (weighted average rate of return on capital)
 EQ88b(z,time)        User cost of capital
 EQ89(z,time)         Current account balance of region z in terms of the reference currency
 EQ90(z,time)         Real consumption budget of type h households
 EQ91(z,time)         Real current government expenditures on goods and services
 EQ92(z,time)         Real GDP at basic prices
 EQ93(time)           Real world GDP at basic prices
 EQ94(z,time)         Real GDP at market prices
 EQ95(z,time)         Real gross fixed capital formation

 WALRAS(z,time)       Walras law verification
;

*==============================================================================
*  5.3 Equations
*==============================================================================
*   5.3.1 Production
*==============================================================================
 EQ1(j,z,t)..    VA(j,z,t) =e= v(j,z)*XS(j,z,t);

 EQ2(j,z,t)..    CI(j,z,t) =e= io(j,z)*XS(j,z,t);

 EQ3(j,z,t)..    VA(j,z,t) =e= A_VA(z,t)*B_VA(j,z)*{
                    [beta_VA(j,z)*LDC(j,z,t)**(-rho_VA(j,z))]$LDCO(j,z)
                   +[(1-beta_VA(j,z))*KDC(j,z,t)**(-rho_VA(j,z))]$KDCO(j,z)
                                                   }**(-1/rho_VA(j,z));

 EQ4(j,z,t)$[LDCO(j,z) and KDCO(j,z)]..
                 LDC(j,z,t) =e= {[beta_VA(j,z)/(1-beta_VA(j,z))]
                              *[RC(j,z,t)/WC(j,z,t)]}**sigma_VA(j,z)*KDC(j,z,t);

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

 EQ9(i,j,z,t)..  DI(i,j,z,t) =e= aij(i,j,z)*CI(j,z,t);

*==============================================================================
*   5.3.2 Income and savings
*==============================================================================
*    5.3.2.1 Households
*==============================================================================
 EQ10(z,t)..     YH(z,t) =e= YHL(z,t)+YHK(z,t);

 EQ11(z,t)..     YHL(z,t) =e= SUM[(l,j)$LDO(l,j,z),W(l,z,t)*LD(l,j,z,t)];

 EQ12(z,t)..     YHK(z,t) =e= SUM[(k,j)$KDO(k,j,z),R(k,j,z,t)*KD(k,j,z,t)];

 EQ13(z,t)..     YDH(z,t) =e= YH(z,t)-TDH(z,t);

 EQ14(z,t)..     CTH(z,t) =e= YDH(z,t)-SH(z,t);

 EQ15(z,t)..     SH(z,t) =e= PIXCON(z,t)**eta*sh0(z,t)+sh1(z,t)*YDH(z,t);

*==============================================================================
*    5.3.2.2 Government
*==============================================================================
 EQ16(z,t)..     YG(z,t) =e= TDH(z,t)+TPRODN(z,t)+TPRCTS(z,t) ;

 EQ17(z,t)..     TPRODN(z,t) =e= TIWT(z,t)+TIKT(z,t)+TIPT(z,t);

 EQ18(z,t)..     TIWT(z,t) =e= SUM[(l,j)$LDO(l,j,z),TIW(l,j,z,t)];

 EQ19(z,t)..     TIKT(z,t) =e= SUM[(k,j)$KDO(k,j,z),TIK(k,j,z,t)];

 EQ20(z,t)..     TIPT(z,t) =e= SUM[j,TIP(j,z,t)];

 EQ21(z,t)..     TPRCTS(z,t) =e= TICT(z,t)+TIMT(z,t)+TIXT(z,t);

 EQ22(z,t)..     TICT(z,t) =e= SUM[i,TIC(i,z,t)];

 EQ23(z,t)..     TIMT(z,t) =e= SUM[(i,zj)$IMO(i,zj,z),TIM(i,zj,z,t)];

 EQ24(z,t)..     TIXT(z,t) =e= SUM[(i,zj)$EXO(i,z,zj),TIX(i,z,zj,t)];

 EQ25(z,t)..     TDH(z,t) =e= PIXCON(z,t)**eta*ttdh0(z,t)+ttdh1(z,t)*YH(z,t);

 EQ26(l,j,z,t)$LDO(l,j,z)..
                 TIW(l,j,z,t) =e= ttiw(l,j,z,t)*W(l,z,t)*LD(l,j,z,t);

 EQ27(k,j,z,t)$KDO(k,j,z)..
                 TIK(k,j,z,t) =e= ttik(k,j,z,t)*R(k,j,z,t)*KD(k,j,z,t);

 EQ28(j,z,t)..   TIP(j,z,t) =e= ttip(j,z,t)*PP(j,z,t)*XS(j,z,t);

 EQ29(i,z,t)..   TIC(i,z,t) =e= ttic(i,z,t)*{
                  [PL(i,z,t)*DD(i,z,t)]$DDO(i,z)
                 +[SUM[zj$IMO(i,zj,z),(1+ttim(i,zj,z,t))*IM(i,zj,z,t)*e(z,t)
                  *(PWM(i,zj,z,t)+SUM(ij,PWMG(ij,t)*tmrg(ij,i,zj,z)))]]};

 EQ30(i,zj,z,t)$IMO(i,zj,z)..
                 TIM(i,zj,z,t) =e= ttim(i,zj,z,t)*IM(i,zj,z,t)*e(z,t)*
                                   (PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)
                                   *tmrg(ij,i,zj,z)]);

 EQ31(i,z,zj,t)$EXO(i,z,zj)..
                 TIX(i,z,zj,t) =e= ttix(i,z,zj,t)*PE(i,z,zj,t)*EX(i,z,zj,t);

 EQ32(z,t)..     SG(z,t) =e= YG(z,t)-G(z,t);

*==============================================================================
*    5.3.2.3 Rest of the world
*==============================================================================
 EQ33(z,t)..     YROW(z,t) =e= e(z,t)*SUM{(i,zj)$IMO(i,zj,z),IM(i,zj,z,t)*
                           [PWM(i,zj,z,t)+SUM(ij,PWMG(ij,t)*tmrg(ij,i,zj,z))]};

 EQ34(z,t)..     SROW(z,t) =e= YROW(z,t)-e(z,t)*SUM[(j,zj)$EXO(j,z,zj),
                               EX(j,z,zj,t)*PWX(j,z,zj,t)]-e(z,t)
                               *SUM[j$MRGNO(j,z),MRGN(j,z,t)*PWMG(j,t)];

 EQ35(z,t)..     SROW(z,t) =e= -CAB(z,t);

*==============================================================================
*   5.3.3 Demand
*==============================================================================
 EQ36(i,z,t)..   PC(i,z,t)*C(i,z,t) =e= PC(i,z,t)*CMIN(i,z,t)+gamma_LES(i,z)
                                 *{CTH(z,t)-SUM[ij,PC(ij,z,t)*CMIN(ij,z,t)]};

 EQ37(i,z,t)..   PC(i,z,t)*INV(i,z,t) =e= gamma_INV(i,z)*IT(z,t);

 EQ38(i,z,t)..   PC(i,z,t)*CG(i,z,t) =e= gamma_GVT(i,z)*G(z,t);

 EQ39(i,z,t)..   DIT(i,z,t) =e= SUM[j,DI(i,j,z,t)];


*==============================================================================
*   5.3.4 International trade
*==============================================================================
 EQ40(i,z,t)..   XS(i,z,t) =e= B_X1(i,z)*{
        [beta_EX_X1(i,z)*EXT(i,z,t)**rho_X1(i,z)]$EXTO(i,z)
       +[beta_D_X1(i,z)*DS(i,z,t)**rho_X1(i,z)]$DSO(i,z)
       +[(1-beta_EX_X1(i,z)-beta_D_X1(i,z))*MRGN(i,z,t)**rho_X1(i,z)]$MRGNO(i,z)
                                          }**(1/rho_X1(i,z));

 EQ41(i,z,t)$[EXTO(i,z) and DSO(i,z)]..
                 EXT(i,z,t) =e= {[beta_D_X1(i,z)/beta_EX_X1(i,z)]*[PET(i,z,t)
                                /PL(i,z,t)]}**sigma_X1(i,z)*DS(i,z,t);

 EQ42(i,z,t)$[MRGNO(i,z) and DSO(i,z)]..
                 MRGN(i,z,t) =e= {[beta_D_X1(i,z)/(1-beta_EX_X1(i,z)
                                 -beta_D_X1(i,z))]*[e(z,t)*PWMG(i,t)/PL(i,z,t)]}
                                 **sigma_X1(i,z)*DS(i,z,t);

 EQ43(i,z,t)$EXTO(i,z)..
                 EXT(i,z,t) =e= B_X2(i,z)*SUM[zj$EXO(i,z,zj),beta_X2(i,z,zj)
                                *EX(i,z,zj,t)**rho_X2(i,z)]**(1/rho_X2(i,z));

 EQ44(i,z,zj,t)$EXO(i,z,zj)..
                 EX(i,z,zj,t) =e= EXT(i,z,t)/B_X2(i,z)**(1+sigma_X2(i,z))*
                                  [PE(i,z,zj,t)/(beta_X2(i,z,zj)*PET(i,z,t))]
                                  **sigma_X2(i,z);

 EQ45(i,z,t)..   Q(i,z,t) =e= B_M1(i,z)*{
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
 EQ49(j,z,t)..   PP(j,z,t)*XS(j,z,t) =e= PVA(j,z,t)*VA(j,z,t)+PCI(j,z,t)
                                         *CI(j,z,t);

 EQ50(j,z,t)..   P(j,z,t) =e= (1+ttip(j,z,t))*PP(j,z,t);

 EQ51(j,z,t)..   PCI(j,z,t)*CI(j,z,t) =e= SUM[i,PC(i,z,t)*DI(i,j,z,t)];

 EQ52(j,z,t)..   PVA(j,z,t)*VA(j,z,t) =e= [WC(j,z,t)*LDC(j,z,t)]$LDCO(j,z)
                                         +[RC(j,z,t)*KDC(j,z,t)]$KDCO(j,z);

* Given equations 5 and 6, equation 53 is redundant
* EQ53(j,z,t)..   WC(j,z,t)*LDC(j,z,t) =e= SUM[l$LDO(l,j,z),WTI(l,j,z,t)*LD(l,j,z,t)];

 EQ54(l,j,z,t)$LDO(l,j,z)..
                 WTI(l,j,z,t) =e= W(l,z,t)*(1+ttiw(l,j,z,t));

* Given equations 7 and 8, equation 55 is redundant
* EQ55(j,z,t)..   RC(j,z,t)*KDC(j,z,t) =e= SUM[k$KDO(k,j,z),RTI(k,j,z,t)*KD(k,j,z,t)];

 EQ56(k,j,z,t)$KDO(k,j,z)..
                 RTI(k,j,z,t) =e= R(k,j,z,t)*(1+ttik(k,j,z,t));

 EQ57(j,z,t)..   P(j,z,t)*XS(j,z,t) =e= [PL(j,z,t)*DS(j,z,t)]$DSO(j,z)
                                       +[PET(j,z,t)*EXT(j,z,t)]$EXTO(j,z)
                                       +[e(z,t)*PWMG(j,t)*MRGN(j,z,t)]$MRGNO(j,z);

* Given equations 43 and 44, equation 58 is redundant
* EQ58(i,z,t)$EXTO(i,z)..
*                 PET(i,z,t)*EXT(i,z,t) =e= SUM[zj$EXO(i,z,zj),
*                                           PE(i,z,zj,t)*EX(i,z,zj,t)];

 EQ59(i,z,zj,t)$EXO(i,z,zj)..
                 PE(i,z,zj,t)*(1+ttix(i,z,zj,t)) =e= e(z,t)*PWX(i,z,zj,t);

 EQ60(i,z,t)$DDO(i,z)..
                 PD(i,z,t) =e= (1+ttic(i,z,t))*PL(i,z,t);

 EQ61(i,zj,z,t)$IMO(i,zj,z)..
                 PM(i,zj,z,t) =e= (1+ttic(i,z,t))*(1+ttim(i,zj,z,t))*e(z,t)*
                                  (PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)
                                  *tmrg(ij,i,zj,z)]);

* Given equations 47 and 48, equation 62 is redundant
* EQ62(i,z,t)$IMTO(i,z)..
*                 PMT(i,z,t)*IMT(i,z,t) =e= SUM[zj$IMO(i,zj,z),
*                                           PM(i,zj,z,t)*IM(i,zj,z,t)];

 EQ63(i,z,t)..   PC(i,z,t)*Q(i,z,t) =e= [PD(i,z,t)*DD(i,z,t)]$DDO(i,z)+
                                        [PMT(i,z,t)*IMT(i,z,t)]$IMTO(i,z);

 EQ64(z,t)..     PIXGDP(z,t) =e=
                 {SUM[j,{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VAO(j,z)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)]
                 *SUM[j,{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VA(j,z,t)]
                 /SUM[j,{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z,t)]}**0.5;

 EQ65(t)..       PIXGDP_W(t) =e=
                 {SUM[(j,z),{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VAO(j,z)/e(z,t)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VAO(j,z)/eO(z)]
                 *SUM[(j,z),{(PVA(j,z,t)*VA(j,z,t)+TIP(j,z,t))/VA(j,z,t)}*VA(j,z,t)/e(z,t)]
                 /SUM[(j,z),{(PVAO(j,z)*VAO(j,z)+TIPO(j,z))/VAO(j,z)}*VA(j,z,t)/eO(z)]}**0.5;

 EQ66(z,t)..     PIXCON(z,t) =e= SUM[i,PC(i,z,t)*CO(i,z)]
                                 /SUM[i,PCO(i,z)*CO(i,z)];

 EQ67(z,t)..     PIXINV(z,t) =e= PROD[i$gamma_INV(i,z),(PC(i,z,t)/PCO(i,z))
                                 **gamma_INV(i,z)];

 EQ68(z,t)..     PIXGVT(z,t) =e= PROD[i$gamma_GVT(i,z),(PC(i,z,t)/PCO(i,z))
                                 **gamma_GVT(i,z)];

*==============================================================================
*   5.3.6 Equilibrium
*==============================================================================
 EQ69(i1,z,t)..  Q(i1,z,t) =e= C(i1,z,t)+CG(i1,z,t)+INV(i1,z,t)+DIT(i1,z,t);

 EQ70(l,z,t)..   LS(l,z,t) =e= SUM[j$LDO(l,j,z),LD(l,j,z,t)];

 EQ71(k,z,t)$KSO(k,z)..
                 KS(k,z,t) =e= SUM[j$KDO(k,j,z),KD(k,j,z,t)];

 EQ72(z,t)..     IT(z,t) =e= SH(z,t)+SG(z,t)-CAB(z,t);

 EQ73(z,t)..     DEP(z,t) =e= PK(z,t)*delta(z)*SUM[k$KSO(k,z),KS(k,z,t)];

 EQ74(i,z,t)$DDO(i,z)..
                 DS(i,z,t) =e= DD(i,z,t);

 EQ75(i,z,zj,t)$EXO(i,z,zj)..
                 EX(i,z,zj,t) =e= IM(i,z,zj,t);

 EQ76(i,z,zj,t)$EXO(i,z,zj)..
                 PWX(i,z,zj,t) =e= PWM(i,z,zj,t);

 EQ77(i,t)..     SUM[z$MRGNO(i,z),MRGN(i,z,t)] =e= SUM[(z,zj,ij)$IMO(ij,zj,z),
                                                 tmrg(i,ij,zj,z)*IM(ij,zj,z,t)];

* Given equations 33, 34 and 75, equation 78 is redundant
* EQ78(t)..          SUM[z,SROW(z,t)/e(z,t)] =e= 0;

*==============================================================================
*   5.3.7 Gross domestic product
*==============================================================================
 EQ79(z,t)..     GDP_BP(z,t) =e= SUM[j,PVA(j,z,t)*VA(j,z,t)]+TIPT(z,t);

 EQ80(z,t)..     GDP_MP(z,t) =e= GDP_BP(z,t)+TPRCTS(z,t);

 EQ81(z,t)..     GDP_IB(z,t) =e= SUM[(l,j)$LDO(l,j,z),W(l,z,t)*LD(l,j,z,t)]
                                +SUM[(k,j)$KDO(k,j,z),R(k,j,z,t)*KD(k,j,z,t)]
                                +TPRCTS(z,t)+TPRODN(z,t);

 EQ82(z,t)..     GDP_FD(z,t) =e=
                 SUM[i,PC(i,z,t)*(C(i,z,t)+CG(i,z,t)+INV(i,z,t))]
                +SUM[(i,zj)$EXO(i,z,zj),e(z,t)*PWX(i,z,zj,t)*EX(i,z,zj,t)]
                +SUM[i$MRGNO(i,z),e(z,t)*PWMG(i,t)*MRGN(i,z,t)]
                -SUM[(i,zj)$IMO(i,zj,z),e(z,t)*IM(i,zj,z,t)
                    *(PWM(i,zj,z,t)+SUM[ij,PWMG(ij,t)*tmrg(ij,i,zj,z)])];

 EQ83(t)..       GDP_BP_W(t) =e= SUM[z,GDP_BP(z,t)/e(z,t)];

*==============================================================================
*   5.3.8 Dynamic equations
*==============================================================================
* EQ84(k,j,z,t).. KD(k,j,z,t) =e= KD(k,j,z,t-1)*(1-delta(z))+IND(k,j,z,t-1);

 EQ85(z,t)..     IT(z,t) =e= PK(z,t)*SUM[(k,j)$KDO(k,j,z),IND(k,j,z,t)];

 EQ86(z,t)..     PK(z,t) =e= 1/A_K(z)*PROD[i$gamma_INV(i,z),(PC(i,z,t)
                               /gamma_INV(i,z))**gamma_INV(i,z)];

 EQ87(k,bus,z,t)$KDO(k,bus,z)..
                 IND(k,bus,z,t) =e= phi(z,t)*[R(k,bus,z,t)/U(z,t)]
                                  **sigma_INV(k,bus,z)*KD(k,bus,z,t);

 EQ88a(z,t)..    IR(z,t) =e= {SUM[(k,j)$KDO(k,j,z),
                              R(k,j,z,t)*KD(k,j,z,t)]-DEP(z,t)}/
                             {PK(z,t)*SUM[(k,j)$KDO(k,j,z),KD(k,j,z,t)]};

 EQ88b(z,t)..    U(z,t) =e= PK(z,t)*(delta(z)+IR(z,t));

*==============================================================================
*  5.3.9 real (volume) variables computed from price indices
*==============================================================================
 EQ89(z,t)..      CABX(z,t) =e= CAB(z,t)/[PIXGDP_W(t)*e(z,t)];

 EQ90(z,t)..      CTH_REAL(z,t) =e= CTH(z,t)/PIXCON(z,t);

 EQ91(z,t)..      G_REAL(z,t) =e= G(z,t)/PIXGVT(z,t);

 EQ92(z,t)..      GDP_BP_REAL(z,t) =e= GDP_BP(z,t)/PIXGDP(z,t);

 EQ93(t)..        GDP_BP_W_REAL(t) =e= GDP_BP_W(t)/PIXGDP_W(t);

 EQ94(z,t)..      GDP_MP_REAL(z,t) =e= GDP_MP(z,t)/PIXCON(z,t);

 EQ95(z,t)..      IT_REAL(z,t) =e= IT(z,t)/PIXINV(z,t);

*==============================================================================
*   5.3.10 Other
*==============================================================================
 WALRAS(z,t)..   LEON(z,t) =e= Q('agr',z,t)-C('agr',z,t)-CG('agr',z,t)
                               -INV('agr',z,t)-DIT('agr',z,t);

*==============================================================================
* 6 Numerical resolution
*==============================================================================
option NLP = conopt3;
option limrow=0, limcol=0, solprint = off;
MODEL PEPWT World wide dynamic model /all/ ;
PEPWT.holdfixed=1;

*==============================================================================
*  6.1 Scenarios
*==============================================================================
* Define the set of scenarios
* For each scenario, there are two files to $INCLUDE:
* SOLVE, and RESULTS.
SET
SCEN  List of scenarios
/
 BAU             Business as usual values
 SIM             Simulation
/
;
*==============================================================================
*  6.2 BAU scenario
*==============================================================================
$INCLUDE BAU_SOLVE.gms

* The user may run the BAU scenario with the command line parameter s=bau
* to save the solution and exit at this point.
* The SIM scenario may be solved later using the command line parameter r=bau
* to restart from the BAU solution.
*$exit

*==============================================================================
*  6.3 Simulation scenarios
*==============================================================================
$INCLUDE SIM_SOLVE.gms
