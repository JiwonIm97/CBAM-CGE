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
* This file allows the mapping between the sets defined in the files PEP-w.GMS
* and the sets used in GTAP8.1.
* It also allows the creation of the different sets used in the model.

* Prior to the steps below, GTAP8.1 data need to be converted into GDX files.
* We first used GTAPAgg and a 1 to 1 mapping to generate HAR files.
* We changed the names of two sectors set in order to avoid confusion with
* regions that share the same acronyms. Therefore, "other mining" is refered to
* using OTM instead of OMN (which refers to Oman in the REG set) and "Insurance"
* is refered to using INS instead of ISR (which refers to Israel in the REG set).

* Running GTAPAgg automatically generates a number of files, of which two are
* used below: BaseData2007.har and Default.prm. The latter was renamed
* Parameters2007.har.
* The har2gdx facility allows converting these two files into GDX format.

*==============================================================================
$CALL har2gdx basedata2019.har basedata2019.gdx
*$CALL har2gdx basedata2019_noshock.har basedata2019_noshock.gdx
$CALL har2gdx parameter2019.prm Parameters2019.gdx
*$EXIT
*==============================================================================
* 1. Define the sets
*==============================================================================
*  1.1 Sets that will be used in the aggregated model
*==============================================================================
SET J All industries
/
 01_AGRICULT     Agricultural forest and fishery goods
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_NGAS         Natural gas
 05_MINING       Mined and quarried goods
 06_FOODPRO      Food beverages and tobacco products
 07_TEXTILES     Textile and leather products
 08_WOODPRO      Wood and paper products
 09_PETROLCOAL   Petroleum and coal products
 10_CHEMICAL     Chemical products
 11_NONMET       Non-metallic mineral products
 12_IRONSTL      Primary iron and steel products
 13_NONFERR      Non-ferrous metal products
 14_MACHINE      Fabricated metal products Electronic and electrical equipment Machinery and equipment
 15_TRANSEQ      Motor vehicles Other transport equipment
 16_OTHERIND     Other manufactured products Water supply
 17_ELEC         Electricity
 19_GAS          Gas
 20_CONSTRUC     Construction
 21_TRANSPORT    Land transport service(road rail) Water transport service Air transport service
 22_SER          Service
 23_PUB          Public Service
/

I1(J) All commodities except agriculture
/
* 01_AGRICULT     Agricultural forest and fishery goods
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_NGAS         Natural gas
 05_MINING       Mined and quarried goods
 06_FOODPRO      Food beverages and tobacco products
 07_TEXTILES     Textile and leather products
 08_WOODPRO      Wood and paper products
 09_PETROLCOAL   Petroleum and coal products
 10_CHEMICAL     Chemical products
 11_NONMET       Non-metallic mineral products
 12_IRONSTL      Primary iron and steel products
 13_NONFERR      Non-ferrous metal products
 14_MACHINE      Fabricated metal products Electronic and electrical equipment Machinery and equipment
 15_TRANSEQ      Motor vehicles Other transport equipment
 16_OTHERIND     Other manufactured products Water supply
 17_ELEC         Electricity
 19_GAS          Gas
 20_CONSTRUC     Construction
 21_TRANSPORT    Land transport service(road rail) Water transport service Air transport service
 22_SER          Service
 23_PUB          Public Service
/

BUS(J) Private industries
/
 01_AGRICULT     Agricultural forest and fishery goods
 02_COAL         Coal
 03_OIL          Crude petroleum
 04_NGAS         Natural gas
 05_MINING       Mined and quarried goods
 06_FOODPRO      Food beverages and tobacco products
 07_TEXTILES     Textile and leather products
 08_WOODPRO      Wood and paper products
 09_PETROLCOAL   Petroleum and coal products
 10_CHEMICAL     Chemical products
 11_NONMET       Non-metallic mineral products
 12_IRONSTL      Primary iron and steel products
 13_NONFERR      Non-ferrous metal products
 14_MACHINE      Fabricated metal products Electronic and electrical equipment Machinery and equipment
 15_TRANSEQ      Motor vehicles Other transport equipment
 16_OTHERIND     Other manufactured products Water supply
 17_ELEC         Electricity
 19_GAS          Gas
 20_CONSTRUC     Construction
 21_TRANSPORT    Land transport service(road rail) Water transport service Air transport service
 22_SER          Service
/

PUB(J) Public industries
/
    23_PUB          Public Service
/

F Production factors
/
 slab            Skilled labour
 ulab            Unskilled Labour
 cap             Capital
 land            Land
 natr            Natural resources
/

L(F) Labor categories
/
 slab            Skilled labour
 ulab            Unskilled Labour
/

K(F) Capital categories
/
 cap             Capital
 land            Land
 natr            Natural resources
/

Z Regions
/
 01_KOR Korea
 02_CHN China
 03_JPN Japan
 04_RUS Russian Federation
 05_MNG Mongolia
 06_PRK People’s Republic of Korea
 07_NAM North America
 08_LAM Latin America and the Caribbean
 09_WEU Western Europe
 10_EEU Central and Eastern Europe
 11_FSU Former Soviet Union
 12_MEA Middle East and North Africa
 13_AFR Sub-Saharan Africa
 14_CPA Centrally Planned Asia and China
 15_SAS South Asia
 16_PAS Other Pacific Asia
 17_PAO Pacific OECD

/

Z1(Z) All regions except reference region
/
 01_KOR Korea
 02_CHN China
 03_JPN Japan
 04_RUS Russian Federation
 05_MNG Mongolia
 06_PRK People’s Republic of Korea
* 07_NAM North America
 08_LAM Latin America and the Caribbean
 09_WEU Western Europe
 10_EEU Central and Eastern Europe
 11_FSU Former Soviet Union
 12_MEA Middle East and North Africa
 13_AFR Sub-Saharan Africa
 14_CPA Centrally Planned Asia and China
 15_SAS South Asia
 16_PAS Other Pacific Asia
 17_PAO Pacific OECD
/

ZR(Z) Reference country
/
07_NAM North America
/

Zrich(Z) Rich regions

Zother(Z) Non-rich regions

*==============================================================================
*  1.2 Sets used in GTAP8.1
*==============================================================================

 GlobalSet(*)          All of the elements of all sets
 endw_comm(GlobalSet)  All factors of production
 prod_comm(GlobalSet)  All sectors and commodities
 reg(GlobalSet)        All regions
 marg_comm(prod_comm)  Margin commodities
 trad_comm(prod_comm)  All sectors and commodities except for investment

$GDXIN basedata2019.gdx
*$GDXIN basedata2019_noshock.gdx
$LOAD GlobalSet, reg, endw_comm, prod_comm, trad_comm, marg_comm

*==============================================================================
*  1.3 Mapping between sets used in PEP-w and GTAP8.1
*==============================================================================

z1c(reg)  Elements in GTAP that refer to one single country
* All GTAP regions except those beginning with an "x"
/
r_01KOR, r_02CHN, r_03JPN, r_04RUS, r_05MNG, r_06PRK, r_07NAM, r_08LAM,
r_09WEU, r_10EEU, r_11FSU, r_12MEA, r_13AFR, r_14CPA, r_15SAS, r_16PAS, r_17PAO
/

z2reg(z,reg) Mapping of regions
/

01_KOR. (r_01KOR)
02_CHN. (r_02CHN)
03_JPN. (r_03JPN)
04_RUS. (r_04RUS)
05_MNG. (r_05MNG)
06_PRK. (r_06PRK)
07_NAM. (r_07NAM)
08_LAM. (r_08LAM)
09_WEU. (r_09WEU)
10_EEU. (r_10EEU)
11_FSU. (r_11FSU)
12_MEA. (r_12MEA)
13_AFR. (r_13AFR)
14_CPA. (r_14CPA)
15_SAS. (r_15SAS)
16_PAS. (r_16PAS)
17_PAO. (r_17PAO)

/

j2trad_comm(j,prod_comm) Mapping of sectors
/
 01_AGRICULT.     (pdr, wht, gro, v_f, osd, c_b, pfb, ocr, ctl, oap, rmk, wol, frs, fsh)
 02_COAL.         (coa)
 03_OIL.          (oil)
 04_NGAS.         (gas)
 05_MINING.       (oxt)
 06_FOODPRO.      (cmt, omt, vol, mil, pcr, sgr, ofd, b_t)
 07_TEXTILES.     (tex, wap, lea)
 08_WOODPRO.      (lum, ppp)
 09_PETROLCOAL.   (p_c)
 10_CHEMICAL.     (chm, bph, rpp)
 11_NONMET.       (nmm)
 12_IRONSTL.      (i_s)
 13_NONFERR.      (nfm)
 14_MACHINE.      (fmp, ele, eeq, ome)
 15_TRANSEQ.      (mvh, otn)
 16_OTHERIND.     (omf, wtr)
 17_ELEC.         (ely)
 19_GAS.          (gdt)
 20_CONSTRUC.     (cns)
 21_TRANSPORT.    (otp, wtp, atp)
 22_SER.          (trd, afs, whs, cmn, ofi, ins, rsa, obs, ros,dwe)
 23_PUB.          (osg, edu, hht)

/

f2endw_comm(f,endw_comm) Mapping of production factors
/
 slab.     (SkLab)
 ulab.     (UnSkLab)
 cap.      (Capital)
 land.     (Land)
 natr.     (NatRes)
/

ALIAS(reg,regj)
ALIAS(trad_comm,trad_commj)
ALIAS(j,jj,i,ij)
ALIAS(l,lj)
ALIAS(k,kj)
ALIAS(z,zj,zjj)
;

*==============================================================================
* 2. Calibration of variables
*==============================================================================

Parameter
*==============================================================================
*  2.1 Variables in GTAP8.1
*==============================================================================
* These are the variables from GTAP8.1 used in the calibration process.
* Population data is in million while all other data are expressed in millions
* of USD

 EVOS(endw_comm,prod_comm,reg)              Endowments at agents prices
 FBEP(endw_comm,prod_comm,reg)    Factor-based subsidies
 FTRV(endw_comm,prod_comm,reg)    Taxes - Factor Employment Tax Revenue
 MFRV(trad_comm,reg,reg)          Protection MFA export subsidy equivalent
 OSEP(trad_comm,reg)              Ordinary output subsidies
 POP(reg)                         Population
 TFRV(trad_comm,reg,reg)          Protection Ordinary Import Duty
 VDEP(reg)                        Capital Stock Value of Depreciation
 VDFP(trad_comm,prod_comm,reg)    Intermed Firms Dom Purchases at Agent Prices
 VDFB(trad_comm,prod_comm,reg)    Intermed Firms Dom Purchases at Mkt Prices
 VMFP(trad_comm,prod_comm,reg)    Intermed Firms Imp Purchases at Agent Prices
 VMFB(trad_comm,prod_comm,reg)    Intermed Firms Imp Purchases at Mkt Prices
 VDGP(trad_comm,reg)              Government Dom Purchases at Agents Prices
 VDGB(trad_comm,reg)              Government Dom Purchases at Market Prices
 VDPP(trad_comm,reg)              Private Hhold Dom Purchases at Agents Prices
 VDPB(trad_comm,reg)              Private Hhold Dom Purchases at Market Prices
 EVFB(endw_comm,prod_comm,reg)     Endowments Firms Purchases at Market Prices
 VIFA(trad_comm,prod_comm,reg)    Intermed Firms Imports at Agents Prices
 VIFM(trad_comm,prod_comm,reg)    Intermed Firms Imports at Market Prices
 VMGP(trad_comm,reg)              Government Imports at Agents Prices
 VMGB(trad_comm,reg)              Government Imports at Market Prices
 VMSB(trad_comm,reg,reg)          Trade Bilateral Imports at Market Prices
 VMPP(trad_comm,reg)              Private Households Imports at Agents Prices
 VMPB(trad_comm,reg)              Private Households Imports at Market Prices
 VCIF(trad_comm,reg,reg)          Trade Bilateral Imports at World Prices
 VKB(reg)                         Capital Stock Value at Beginning-of-Period
 VST(marg_comm,reg)               Trade Exports Internatl Trans Mkt Prices
 VTMFSD(marg_comm,trad_comm,reg,reg) Trade Margins Internatl Trans World Prices
 VXSB(trad_comm,reg,reg)          Trade Bilateral Exports at Market Prices
 VFOB(trad_comm,reg,reg)          Trade Bilateral Exports at World Prices
 XTRV(trad_comm,reg,reg)          Protection Ordinary Export Subsidy
 VDIP(trad_comm,reg)              Investment expenditure on dom. c in r at producer prices
 VMIP(trad_comm,reg)              Investment expenditure on imp. c in r at producer prices
 VDIB(trad_comm,reg)              Investment expenditure on dom. c in r at basic prices
 VMIB(trad_comm,reg)              Investment expenditure on imp. c in r at basic prices

*==============================================================================
*  2.2 Variables in the aggregated model
*==============================================================================
 CO(i,z)         Household consumption of commodity I
 CGO(i,z)        Public final consumption of commodity i
 DDO(i,z)        Demand for domestic production of commodity i
 DEPO(z)         Depreciation
 DIO(i,j,z)      Intermediate consumption of commodity i by industry j
 DSO(i,z)        Supplys of domestic production of commodity i
 EXO(i,z,zj)     Exports supply of commodity i from country z to country zj
 IMO(i,zj,z)     Imports of commodity m by country z from country zj
 INVO(i,z)       Final demand of commodity i for investment purposes
 RKDO(k,j,z)     Type k capital income in industry j
 KSTO(z)         Total capital stock in region z
 LDO(l,j,z)      Industry j demand for labour l
 MRGNO(i,z)      Demand for commodity i as a margin
 POPO(z)         Population
 TDHO(z)         Household income taxes
 TICO(i,z)       Government receipts of indirect taxes on commodity i
 TIKO(k,j,z)     Government receipts of indirect taxes on capital k of industry j
 TIMO(i,zj,z)    Government receipts of indirect taxes on imports of commodity i
 TIPO(i,z)       Government receipts of indirect taxes on production of industry j
 TIWO(l,j,z)     Government receipts of indirect taxes on wages and salaries of industry j
 TIXO(i,z,zj)    Government receipts of indirect taxes on exports of commodity i
 tmrg(i,ij,zj,z) Rate of commodity i margin applied to import m from country zj 
 XSO(j,z)        industry j total production

 DIO2(i,z)
 TIMO2(i,z)
 IMO2(i,z)
 tmrg2(i,z)       

 DIO3(j,z)
 LDO2(j,z) 
 TIWO2(j,z) 
 TIKO2(j,z) 
 RKDO2(k,j,z) 
 RKDO2(k,j,z) 

;

*==============================================================================
*  2.3 Loading parameters from GTAP database
*==============================================================================
$LOAD EVOS, FBEP, FTRV, MFRV, OSEP, POP, TFRV, VDEP, VDFP, VDFB, VDGP, VDGB, VMFP, VMFB
$LOAD VDPP, VDPB, EVFB, VDIP, VDIB, VMIP, VMIB, VMGP, VMGB, VMPP, VMPB, VMSB, VCIF, VKB, VST
$LOAD VTMFSD, VXSB, VFOB, XTRV

*==============================================================================
* 2.4 Mapping between variables in the model and GTAP
*==============================================================================
* NOTE: In GTAP parlance, "agents' prices" are prices paid by buyers, and
*       "market prices" are prices received by sellers.
* A - Agent Price
* P - Producer Price
* B - Basic Price

*==============================================================================
* 2.4.1 Households consumption
*==============================================================================
* Households consumption is given by the sum of domestic purchases at
* agents prices (VDPP) and private household imports at agents prices (VMPP).

 CO(i,z)         = SUM{(trad_comm,reg)$[j2trad_comm(i,trad_comm)$z2reg(z,reg)],
                       VDPP(trad_comm,reg)+VMPP(trad_comm,reg)};

*==============================================================================
* 2.4.2 Public final consumption
*==============================================================================
* Public final consumption is given by the sum of domestic purchases at
* agents prices (VDGP) and public final imports at agents prices (VMGP).

 CGO(i,z)        = SUM{(trad_comm,reg)$[j2trad_comm(i,trad_comm)$z2reg(z,reg)],
                       VDGP(trad_comm,reg)+VMGP(trad_comm,reg)};

*==============================================================================
* 2.4.3 Demand for investment purposes
*=============================================================================
*  In the GTAP data, the accumulation account is presented in the
*  production sector CGDS (Capital goods). Demand for investment purposes
*  is thus given by the sum of domestic purchases at agents prices (VDFP)
*  and public final imports at agents prices (VIFA) for this sector.

 INVO(i,z)       = SUM{(trad_comm,reg)$[j2trad_comm(i,trad_comm)$z2reg(z,reg)],
*                      VDFP(trad_comm,'CGDS',reg)+VIFA(trad_comm,'CGDS',reg)};
                      VDIP(trad_comm,reg)+VMIP(trad_comm,reg)};

*==============================================================================
* 2.4.4 Intermediate demand
*==============================================================================
* Intermediate consumption is given by the sum of domestic purchases at
* agents prices (VDFP) and public final imports at agents prices (VIFA).

 DIO(i,j,z)      = SUM[(trad_comm,trad_commj,reg)$[j2trad_comm(i,trad_comm)
                      $j2trad_comm(j,trad_commj)$z2reg(z,reg)],
                      VDFP(trad_comm,trad_commj,reg)
                     +VMFP(trad_comm,trad_commj,reg)];

*==============================================================================
* 2.4.5 Imports
*==============================================================================
* Imports are defined in GTAP at world prices (VCIF) and at market prices
* (VMSB). Data on bilateral flows also include margins on imports (VTMFSD) and
* import duties (TFRV). On the export side, the database includes exports at
* market prices (VXSB), at world prices (VFOB) and subsidies on exports (MFRV
* and XTRV).
* The relationships between those variables is the following:
*       VMSB = VCIF + TFRV
*       VCIF = VFOB + VTMFSD
*       VXSB = VFOB - MFRV - XTRV
*
* Imports are evaluated at world prices (VCIF) less transport margins (VTMFSD).

** Elimination of trade within a country:
** Trade within any entity that is a GTAP single-country region (or equivalent)
** is removed.
 VCIF(trad_comm,z1c,z1c)           = 0;
 VTMFSD(marg_comm,trad_comm,z1c,z1c) = 0;

 IMO(i,zj,z)     = SUM{(trad_comm,regj,reg)$[j2trad_comm(i,trad_comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       VCIF(trad_comm,regj,reg)-
                       SUM[marg_comm,VTMFSD(marg_comm,trad_comm,regj,reg)]};

*==============================================================================
* 2.4.6 Exports
*==============================================================================
*  To limit the sources of potential desequilibrium, exports are simply set
*  equal to imports.

 EXO(i,zj,z)     = IMO(i,zj,z);

*==============================================================================
* 2.4.7 Margins
*==============================================================================
*  Transport margins are given by the variable VTMFSD
 tmrg('21_TRANSPORT',ij,zj,z)$IMO(ij,zj,z)
                 = SUM{(trad_comm,regj,reg)$[j2trad_comm(ij,trad_comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       SUM[marg_comm,VTMFSD(marg_comm,trad_comm,regj,reg)]};

* Supply of transport margin are given by the variable VST
 MRGNO(i,z)      = SUM{(marg_comm,reg)$[j2trad_comm(i,marg_comm)$z2reg(z,reg)],
                       VST(marg_comm,reg)};

*==============================================================================
* 2.4.8 Import duties
*==============================================================================
*  Import duties are given by the variable TFRV

 TIMO(i,zj,z)$IMO(i,zj,z)
                 = SUM{(trad_comm,regj,reg)$[j2trad_comm(i,trad_comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       TFRV(trad_comm,regj,reg)};

*==============================================================================
* 2.4.9 Taxes on exports
*==============================================================================
*  Taxes on exports are given by the sum of MRRV and XTRV

 TIXO(i,z,zj)$IMO(i,z,zj)
                 = SUM{(trad_comm,reg,regj)$[j2trad_comm(i,trad_comm)
                       $z2reg(z,reg)$z2reg(zj,regj)],
                       MFRV(trad_comm,reg,regj)+XTRV(trad_comm,reg,regj)};

*==============================================================================
* 2.4.10 Taxes on factors of production
*==============================================================================
* Net taxes on factor of production are calculated as taxes (FTRV)
* less subsidies (FBEP).

 TIWO(l,j,z)      = SUM{(endw_comm,trad_comm,reg)$[f2endw_comm(l,endw_comm)
                       $j2trad_comm(j,trad_comm)$z2reg(z,reg)],
                       FTRV(endw_comm,trad_comm,reg)+
                       FBEP(endw_comm,trad_comm,reg)};

 TIKO(k,j,z)     = SUM{(endw_comm,trad_comm,reg)$[f2endw_comm(k,endw_comm)
                       $j2trad_comm(j,trad_comm)$z2reg(z,reg)],
                       FTRV(endw_comm,trad_comm,reg)+
                       FBEP(endw_comm,trad_comm,reg)};

*==============================================================================
* 2.4.11 Taxes on production
*==============================================================================
* Taxes on production are set equal to the negative value of production
* subsidies (OSEP).

 TIPO(j,z)       = SUM{(trad_comm,reg)$[j2trad_comm(j,trad_comm)$z2reg(z,reg)],
                       OSEP(trad_comm,reg)};

*==============================================================================
* 2.4.12 Domestic taxes on commodities
*==============================================================================
* Domestic taxes on commodities are evaluated as the difference between
* demand at agent prices and demand at market prices.

 TICO(i,z)       = SUM{(trad_comm,reg)$[j2trad_comm(i,trad_comm)$z2reg(z,reg)],
                      VDPP(trad_comm,reg)-VDPB(trad_comm,reg)
                     +VMPP(trad_comm,reg)-VMPB(trad_comm,reg)
                     +VDGP(trad_comm,reg)-VDGB(trad_comm,reg)
                     +VMGP(trad_comm,reg)-VMGB(trad_comm,reg)
                     +SUM[prod_comm,VDFP(trad_comm,prod_comm,reg)
*                          +VIFA(trad_comm,prod_comm,reg)]
                          +VMFP(trad_comm,prod_comm,reg)]                         

                     -SUM[prod_comm,VDFB(trad_comm,prod_comm,reg)
*                          +VIFM(trad_comm,prod_comm,reg)]};
                           +VMFB(trad_comm,prod_comm,reg)]};

*==============================================================================
* 2.4.13 Direct taxes
*==============================================================================
* Direct taxes is given by the difference between factor payment at
* market prices (EVFB) and endowment at agent prices (EVOS)

 TDHO(z)         = SUM{reg$z2reg(z,reg),
                       SUM[endw_comm,SUM(prod_comm,EVFB(endw_comm,prod_comm,reg))
                       -SUM(prod_comm,EVOS(endw_comm, prod_comm, reg))]};

*==============================================================================
* 2.4.14 Factors of production
*==============================================================================
* Remuneration of the production factors is evaluated at market prices,
* that is before taxes (EVFB).

 LDO(l,j,z)      = SUM{(endw_comm,trad_comm,reg)$[f2endw_comm(l,endw_comm)
                       $j2trad_comm(j,trad_comm)$z2reg(z,reg)],
                       EVFB(endw_comm,trad_comm,reg)};

 RKDO(k,j,z)      = SUM{(endw_comm,trad_comm,reg)$[f2endw_comm(k,endw_comm)
                       $j2trad_comm(j,trad_comm)$z2reg(z,reg)],
                       EVFB(endw_comm,trad_comm,reg)};

* Total capital stock at the beginning of the period
 KSTO(z)         = SUM{reg$z2reg(z,reg),VKB(reg)};

*==============================================================================
* 2.4.15 Depreciation
*==============================================================================
* Depreciation is given by the variable VDEP

 DEPO(z)         = SUM{reg$z2reg(z,reg),VDEP(reg)};

*==============================================================================
* 2.4.16 Population
*==============================================================================
*  Population by region
 POPO(z)         = SUM{reg$z2reg(z,reg),POP(reg)};

*==============================================================================
* 2.4.17 Domestic demand
*==============================================================================
* Once again, to avoid descrepencies, domestic purchases are calculated
* by substracting imports, transport margins and indirect taxes from total
* domestic absorption.

 DDO(i,z)        = CO(i,z)+CGO(i,z)+INVO(i,z)+SUM[j,DIO(i,j,z)]-TICO(i,z)
                   -SUM[zj,TIMO(i,zj,z)]-SUM[zj,IMO(i,zj,z)]
                   -SUM[(ij,zj),tmrg(ij,i,zj,z)];

 DIO2(i,z)  = SUM[j,DIO(i,j,z)];
 TIMO2(i,z) = SUM[zj,TIMO(i,zj,z)];
 IMO2(i,z)  = SUM[zj,IMO(i,zj,z)];
 tmrg2(i,z) = SUM[(ij,zj),tmrg(ij,i,zj,z)] ;

*==============================================================================
* 2.5 Equilibrate data
*==============================================================================
*  2.5.1 Equilibrium on the world margin market
*==============================================================================
*  The first step would be to equilibrate international markets. As there is a
*  small difference between supply of margins and demand, we chose to adjust
*  the supply side by increasing or reducing each region's production
*  proportionately.

 MRGNO(i,z)$MRGNO(i,z)
                 = MRGNO(i,z)*SUM[(ij,zj,zjj),tmrg(i,ij,zj,zjj)]
                  /SUM[zjj,MRGNO(i,zjj)];

**==============================================================================
* 2.5.2 Equilibrium in each region
*==============================================================================
*  As exports have already been set equal to imports, the remaining differences
*  would appear in the national data. Total production is first set equal to
*  the sum of production for the domestic market (DSO), adjusted production
*  of margins (MRGNO) and exports.

 DSO(i,z)        = DDO(i,z);
 XSO(j,z)        = DSO(j,z)+MRGNO(j,z)+SUM[zj,EXO(j,z,zj)-TIXO(j,z,zj)];

*  The operating surplus is the variable that was used to equilibrate the
*  regional data. As all other variables (income, savings and so on) will
*  be calculated based on the variables described in these steps, there
*  should not be any other descrepency.

RKDO('cap',j,z)  = XSO(j,z)-SUM[i,DIO(i,j,z)]-SUM[l,LDO(l,j,z)+TIWO(l,j,z)]
                  -TIPO(j,z)-SUM[k,TIKO(k,j,z)]-RKDO('land',j,z) -RKDO('natr',j,z);

DIO3(j,z) = SUM[i,DIO(i,j,z)];
LDO2(j,z) = SUM[l,LDO(l,j,z)];
TIWO2(j,z) =SUM[l,TIWO(l,j,z)];
TIKO2(j,z) =SUM[k,TIKO(k,j,z)];
RKDO2('land',j,z) =RKDO('land',j,z);
RKDO2('natr',j,z) =RKDO('natr',j,z);

*==============================================================================
* 3. CES elasticities
*==============================================================================
* 3.1 Definition of GTAP parameters
*==============================================================================
PARAMETER
 ESUBD(trad_comm, reg)  Elasticity of substitution between domestic product and imports
 ESUBM(trad_comm, reg)  Elasticity of substitution between imports from different regions
 ESUBVA(prod_comm, reg) Elasticity of substitution between primary factors in the production of value added

*==============================================================================
* 3.2 Definition in PEP w
*==============================================================================
 sigma_M1(i,z)   Elasticity (CES - composite commodity)
 sigma_M2(i,z)   Elasticity (CES - composite import)
 sigma_VA(j,z)   Elasticity (CES - value added)

*==============================================================================
* 3.3 Temporary variables
*==============================================================================
 IM_GTAP(trad_comm,z) Total imports using the GTAP commodity sets
 Q_GTAP(trad_comm,z)  Composite commodity using the GTAP commodity sets
 SH_IM(trad_comm,i,z) Share of each import TRAD_COM in aggregation i for region z
 SH_Q(trad_comm,i,z)  Share of each composite commodity TRAD_COM in aggregation i for region z
 SH_VA(trad_comm,j,z) Share of each sector TRAD_COM in aggregation j for region z
 VA_GTAP(trad_comm,z) Value added using the GTAP sectors
;

*==============================================================================
* 3.4 Load the GTAP file which includes the parameters
*==============================================================================
$GDXIN Parameters2019.gdx
$LOAD ESUBD, ESUBM, ESUBVA

*==============================================================================
*  3.5 sigma_M1
*==============================================================================
* Elasticities of substitution between domestic product and imports are
* aggregated acording to the share of each commodity (QO) TRAD_COMM in total I

 Q_GTAP(trad_comm,z)
                 = SUM{reg$z2reg(z,reg),
                   VDPP(trad_comm,reg)+VMPP(trad_comm,reg)+
                   VDGP(trad_comm,reg)+VMGP(trad_comm,reg)+
                   VDIP(trad_comm,reg)+VMIP(trad_comm,reg)+
                   SUM[trad_commj,VDFP(trad_comm,trad_commj,reg)+
                       VMFP(trad_comm,trad_commj,reg)]};


 SH_Q(trad_comm,i,z)$j2trad_comm(i,trad_comm)
                 = Q_GTAP(trad_comm,z)/
                   SUM{trad_commj$j2trad_comm(i,trad_commj),
                       Q_GTAP(trad_commj,z)};

 sigma_M1(i,z)   = SUM{trad_comm$j2trad_comm(i,trad_comm),
                   ESUBD(trad_comm,'r_01KOR')*SH_Q(trad_comm,i,z)};

*==============================================================================
*  3.6 sigma_M2
*==============================================================================
* Elasticities of substitution between imports from different partners are
* aggregated acording to the share of total import (IMTO) TRAD_COMM in total I

 IM_GTAP(trad_comm,z)
                 = SUM[regj,SUM{reg$z2reg(z,reg),VCIF(trad_comm,regj,reg)}];

 SH_IM(trad_comm,i,z)$j2trad_comm(i,trad_comm)
                 = IM_GTAP(trad_comm,z)/
                   SUM{trad_commj$j2trad_comm(i,trad_commj),
                       IM_GTAP(trad_commj,z)};

 sigma_M2(i,z)   = SUM{trad_comm$j2trad_comm(i,trad_comm),
                   ESUBM(trad_comm,'r_01KOR')*SH_IM(trad_comm,i,z)};

*==============================================================================
*  3.7 sigma_VA
*==============================================================================
* Elasticities of substitution between factors of production are aggregated
* acording to the share of each sector (VA) TRAD_COMM in total I

 VA_GTAP(trad_comm,z)
                 = SUM{endw_comm,
                       SUM[reg$z2reg(z,reg),EVFB(endw_comm,trad_comm,reg)]};

 SH_VA(trad_comm,j,z)$j2trad_comm(j,trad_comm)
                 = VA_GTAP(trad_comm,z)/
                   SUM{trad_commj$j2trad_comm(j,trad_commj),
                       VA_GTAP(trad_commj,z)};

 sigma_VA(j,z)   = SUM{trad_comm$j2trad_comm(j,trad_comm),
                   ESUBVA(trad_comm,'r_01KOR')*SH_VA(trad_comm,j,z)};

execute_unload 'DATA_AGG-2019',
*Sets used in PEP w-1 and PEP w-t
 J, I1, BUS, PUB, F, L, K, Z, ZR, Z1, Zrich, Zother

*Benchmark variables and parameters used in PEP w-1 and PEP w-t
 CO, CGO, DDO, DEPO, DIO, DSO, EXO, IMO, INVO, KSTO, LDO, MRGNO, POPO, RKDO,
 TDHO, TICO, TIKO, TIMO, TIPO, TIWO, TIXO, tmrg, XSO, sigma_M1, sigma_M2,
 sigma_VA,Q_GTAP, SH_Q, ESUBD,  DIO2, TIMO2, IMO2, tmrg2,
 DIO3, LDO2, TIWO2, TIKO2, RKDO2, RKDO2 

;
