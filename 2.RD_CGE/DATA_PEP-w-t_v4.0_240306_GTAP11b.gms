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
$CALL har2gdx Input_GTAP11DB\basedata2019_240214.har Input_w-t\GTAP11_basedata2019.gdx
$CALL har2gdx Input_GTAP11DB\parameter2019_240214.prm Input_w-t\GTAP11_Parameters2019.gdx
*$EXIT
*==============================================================================
* 1. Define the sets
*==============================================================================
*  1.1 Sets that will be used in the aggregated model
*==============================================================================
SET J All industries
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

I All commodities except agriculture
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
 18_ELEC        Electricity
 19_CONSTRUC    Construction
 20_LTRP        Land transport service(road rail)
 21_WTRP        Water transport service
 22_ATRP        Air transport service
 23_SER         Service
/

I1(I) All commodities except agriculture
/
* 01_AGRICULT    Agricultural forest and fishery goods
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
 18_ELEC        Electricity
 19_CONSTRUC    Construction
 20_LTRP        Land transport service(road rail)
 21_WTRP        Water transport service
 22_ATRP        Air transport service
 23_SER         Service
/


BUS(J) Private industries
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
* 31_SER         Service
/

TRP(J) TRANSPORT
/
 28_LTRP        Land transport service(road rail)
 29_WTRP        Water transport service
 30_ATRP        Air transport service
/

PUB(J) Public industries
/
* 01_AGRICULT    Agricultural forest and fishery goods
* 02_COAL        Coal
* 03_OIL         Crude petroleum
* 04_GAS         Natural gas Gas distribution
* 05_MINING      Mined and quarried goods
* 06_FOODPRO     Food beverages and tobacco products
* 07_TEXTILES    Textile and leather products
* 08_WOODPRO     Wood products
* 09_PAPERPRO    Paper products
* 10_PETROLCOAL  Petroleum and coal products
* 11_CHEMICAL    Chemical products
* 12_NONMET      Non-metallic mineral products
* 13_IRONSTL     Primary iron and steel products
* 14_NONFERR     Non-ferrous metal products
* 15_MACHINE     Fabricated metal products Electronic and electrical equipment Machinery and equipment
* 16_TRANSEQ     Motor vehicles Other transport equipment
* 17_OTHERIND    Other manufactured products Water supply
* 18_TnD         Transmission and Distribution
* 19_eNuclear    Nuclear generation
* 20_eCoal       Coal generation
* 21_eGas        Gas generation
* 22_eOil        Oil generation
* 23_eWind       Wind generation
* 24_eSolar      Solar generation
* 25_eHydro      Hydro generation
* 26_eOther      Other generation
* 27_CONSTRUC    Construction
* 28_LTRP        Land transport service(road rail)
* 29_WTRP        Water transport service
* 30_ATRP        Air transport service
 31_SER         Service
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
 06_PRK Peoples Republic of Korea
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
 06_PRK Peoples Republic of Korea
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

TIME Time periods
/
2018*2100
/

*==============================================================================
*  1.2 Sets used in GTAP8.1
*==============================================================================

 GlobalSet(*)          All of the elements of all sets
 endw(GlobalSet)  All factors of production
 acts(GlobalSet)  All sectors and commodities
 comm(GlobalSet)
 reg(GlobalSet)     All regions
 marg(comm)  Margin commodities

$GDXIN Input_w-t\GTAP11_basedata2019.gdx

$LOAD GlobalSet, reg, endw, acts, comm, marg

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

j2acts(j,acts) Mapping of sectors
/
 01_AGRICULT.     (pdr, wht, gro, v_f, osd, c_b, pfb, ocr, ctl, oap, rmk, wol, frs, fsh)
 02_COAL.         (coa)
 03_OIL.          (oil)
 04_GAS.          (gas, gdt)
 05_MINING.       (oxt)
 06_FOODPRO.      (cmt, omt, vol, mil, pcr, sgr, ofd, b_t)
 07_TEXTILES.     (tex, wap, lea)
 08_WOODPRO.      (lum)
 09_PAPERPRO.     (ppp)
 10_PETROLCOAL.   (p_c)
 11_CHEMICAL.     (chm, bph, rpp)
 12_NONMET.       (nmm)
 13_IRONSTL.      (i_s)
 14_NONFERR.      (nfm)
 15_MACHINE.      (fmp, ele, eeq, ome)
 16_TRANSEQ.      (mvh, otn)
 17_OTHERIND.     (omf)
 18_TnD.          (TnD)
 19_eNuclear.     (eNuclear)
 20_eCoal.        (eCoal)
 21_eGas.         (eGas)
 22_eOil.         (eOil)
 23_eWind.        (eWind)
 24_eSolar.       (eSolar)
 25_eHydro.       (eHydro)
 26_eOther.       (eOther)
 27_CONSTRUC.     (cns)
 28_LTRP.         (otp)
 29_WTRP.         (wtp)
 30_ATRP.         (atp)
 31_SER.          (trd, afs, whs, cmn, ofi, ins, rsa, obs, ros, dwe, osg, edu, hht, wtr)
/

j2comm(j,comm) Mapping of sectors
/
 01_AGRICULT.     (pdr, wht, gro, v_f, osd, c_b, pfb, ocr, ctl, oap, rmk, wol, frs, fsh)
 02_COAL.         (coa)
 03_OIL.          (oil)
 04_GAS.          (gas, gdt)
 05_MINING.       (oxt)
 06_FOODPRO.      (cmt, omt, vol, mil, pcr, sgr, ofd, b_t)
 07_TEXTILES.     (tex, wap, lea)
 08_WOODPRO.      (lum)
 09_PAPERPRO.     (ppp)
 10_PETROLCOAL.   (p_c)
 11_CHEMICAL.     (chm, bph, rpp)
 12_NONMET.       (nmm)
 13_IRONSTL.      (i_s)
 14_NONFERR.      (nfm)
 15_MACHINE.      (fmp, ele, eeq, ome)
 16_TRANSEQ.      (mvh, otn)
 17_OTHERIND.     (omf)
 18_TnD.          (TnD)
 19_eNuclear.     (eNuclear)
 20_eCoal.        (eCoal)
 21_eGas.         (eGas)
 22_eOil.         (eOil)
 23_eWind.        (eWind)
 24_eSolar.       (eSolar)
 25_eHydro.       (eHydro)
 26_eOther.       (eOther)
 27_CONSTRUC.     (cns)
 28_LTRP.         (otp)
 29_WTRP.         (wtp)
 30_ATRP.         (atp)
 31_SER.          (trd, afs, whs, cmn, ofi, ins, rsa, obs, ros, dwe, osg, edu, hht, wtr)
/

i2comm(i,comm) Mapping of sectors
/
 01_AGRICULT.     (pdr, wht, gro, v_f, osd, c_b, pfb, ocr, ctl, oap, rmk, wol, frs, fsh)
 02_COAL.         (coa)
 03_OIL.          (oil)
 04_GAS.          (gas, gdt)
 05_MINING.       (oxt)
 06_FOODPRO.      (cmt, omt, vol, mil, pcr, sgr, ofd, b_t)
 07_TEXTILES.     (tex, wap, lea)
 08_WOODPRO.      (lum)
 09_PAPERPRO.     (ppp)
 10_PETROLCOAL.   (p_c)
 11_CHEMICAL.     (chm, bph, rpp)
 12_NONMET.       (nmm)
 13_IRONSTL.      (i_s)
 14_NONFERR.      (nfm)
 15_MACHINE.      (fmp, ele, eeq, ome)
 16_TRANSEQ.      (mvh, otn)
 17_OTHERIND.     (omf)
 18_ELEC.         (TnD, eNuclear, eCoal, eGas, eOil, eWind, eSolar, eHydro, eOther)
 19_CONSTRUC.     (cns)
 20_LTRP.         (otp)
 21_WTRP.         (wtp)
 22_ATRP.         (atp)
 23_SER.          (trd, afs, whs, cmn, ofi, ins, rsa, obs, ros, dwe, osg, edu, hht, wtr)
/

COMtoIND(j,i)
/
 01_AGRICULT.     (01_AGRICULT)
 02_COAL.         (02_COAL)
 03_OIL.          (03_OIL)
 04_GAS.          (04_GAS)
 05_MINING.       (05_MINING)
 06_FOODPRO.      (06_FOODPRO)
 07_TEXTILES.     (07_TEXTILES)
 08_WOODPRO.      (08_WOODPRO)
 09_PAPERPRO.     (09_PAPERPRO)
 10_PETROLCOAL.   (10_PETROLCOAL)
 11_CHEMICAL.     (11_CHEMICAL)
 12_NONMET.       (12_NONMET)
 13_IRONSTL.      (13_IRONSTL)
 14_NONFERR.      (14_NONFERR)
 15_MACHINE.      (15_MACHINE)
 16_TRANSEQ.      (16_TRANSEQ)
 17_OTHERIND.     (17_OTHERIND)
 18_TnD.          (18_ELEC)
 19_eNuclear.     (18_ELEC)
 20_eCoal.        (18_ELEC)
 21_eGas.         (18_ELEC)
 22_eOil.         (18_ELEC)
 23_eWind.        (18_ELEC)
 24_eSolar.       (18_ELEC)
 25_eHydro.       (18_ELEC)
 26_eOther.       (18_ELEC)
 27_CONSTRUC.     (19_CONSTRUC)
 28_LTRP.         (20_LTRP)
 29_WTRP.         (21_WTRP)
 30_ATRP.         (22_ATRP)
 31_SER.          (23_SER)
/

f2endw(f,endw) Mapping of production factors
/
 slab.     (SkLab)
 ulab.     (UnSkLab)
 cap.      (Capital)
 land.     (Land)
 natr.     (NatlRes)
/

ALIAS(reg,regj)
ALIAS(comm,commi)
ALIAS(acts,actsj)
ALIAS(j,jj)
ALIAS(i,ij)
ALIAS(l,lj)
ALIAS(k,kj)
ALIAS(z,zj,zjj)
ALIAS(time,timej)

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

 EVOS(endw,acts,reg)            Endowments at agents prices
 FBEP(endw,acts,reg)            Factor-based subsidies
 FTRV(endw,acts,reg)            Taxes - Factor Employment Tax Revenue
 MFRV(comm,reg,reg)             Protection MFA export subsidy equivalent
 OSEP(comm,reg)                 Ordinary output subsidies
 POP(reg)                       Population
 TFRV(comm,reg,reg)             Protection Ordinary Import Duty
 VDEP(reg)                      Capital Stock Value of Depreciation
 VDFP(comm,acts,reg)            Intermed Firms Dom Purchases at Agent Prices
 VDFB(comm,acts,reg)            Intermed Firms Dom Purchases at Mkt Prices
 VMFP(comm,acts,reg)            Intermed Firms Imp Purchases at Agent Prices
 VMFB(comm,acts,reg)            Intermed Firms Imp Purchases at Mkt Prices
 VDGP(comm,reg)                 Government Dom Purchases at Agents Prices
 VDGB(comm,reg)                 Government Dom Purchases at Market Prices
 VDPP(comm,reg)                 Private Hhold Dom Purchases at Agents Prices
 VDPB(comm,reg)                 Private Hhold Dom Purchases at Market Prices
 EVFB(endw,acts,reg)            Endowments Firms Purchases at Market Prices
 VIFA(comm,acts,reg)            Intermed Firms Imports at Agents Prices
 VIFM(comm,acts,reg)            Intermed Firms Imports at Market Prices
 VMGP(comm,reg)                 Government Imports at Agents Prices
 VMGB(comm,reg)                 Government Imports at Market Prices
 VMSB(comm,reg,reg)             Trade Bilateral Imports at Market Prices
 VMPP(comm,reg)                 Private Households Imports at Agents Prices
 VMPB(comm,reg)                 Private Households Imports at Market Prices
 VCIF(comm,reg,reg)             Trade Bilateral Imports at World Prices
 VKB(reg)                       Capital Stock Value at Beginning-of-Period
 VST(marg,reg)                  Trade Exports Internatl Trans Mkt Prices
 VTMFSD(marg,comm,reg,reg)      Trade Margins Internatl Trans World Prices
 VXSB(comm,reg,reg)             Trade Bilateral Exports at Market Prices
 VFOB(comm,reg,reg)             Trade Bilateral Exports at World Prices
 XTRV(comm,reg,reg)             Protection Ordinary Export Subsidy
 VDIP(comm,reg)                 Investment expenditure on dom. c in r at producer prices
 VMIP(comm,reg)                 Investment expenditure on imp. c in r at producer prices
 VDIB(comm,reg)                 Investment expenditure on dom. c in r at basic prices
 VMIB(comm,reg)                 Investment expenditure on imp. c in r at basic prices
 MAKES(comm,acts,reg)           Make matrix valued at suppliers prices
 MAKEB(comm,acts,reg)           Make matrix valued at basic prices

*==============================================================================
*  2.2 Variables in the aggregated model
*==============================================================================
 CO(i,z)         Household consumption of commodity I
 CGO(i,z)        Public final consumption of commodity i
 INVO(i,z)       Final demand of commodity i for investment purposes
 DDO(i,z)        Demand for domestic production of commodity i
 DEPO(z)         Depreciation
 DIO(i,j,z)      Intermediate consumption of commodity i by industry j
 DSO(j,i,z)      Supply of commodity i by sector j to the domestic market
 EXO(i,z,zj)     Exports supply of commodity i from country z to country zj
 EXTO(i,z)       Total Export
 IMO(i,zj,z)     Imports of commodity m by country z from country zj
 RKDO(k,j,z)     Type k capital income in industry j
 RKDO_J(k,z)     Type k capital income
 KSTO(z)         Total capital stock in region z
 LDO(l,j,z)      Industry j demand for labour l
 LDO_J(l,z)      Demand for labour l
 MRGNO(i,z)      Demand for commodity i as a margin
 POPO(z)         Population
 TDHO(z)         Household income taxes
 DTAX(f,z)       Direct taxes
 TICO(i,z)       Government receipts of indirect taxes on commodity i
 TIKO(k,j,z)     Government receipts of indirect taxes on capital k of industry j
 TIKO_J(k,z)     Government receipts of indirect taxes on capital k
 TIMO(i,zj,z)    Government receipts of indirect taxes on imports of commodity i
 TIPO(j,z)       Government receipts of indirect taxes on production of industry j
 TIWO(l,j,z)     Government receipts of indirect taxes on wages and salaries of industry j
 TIWO_J(l,z)     Government receipts of indirect taxes on wages and salaries
 TIXO(i,z,zj)    Government receipts of indirect taxes on exports of commodity i
 tmrg(i,ij,zj,z) Rate of commodity i margin applied to import m from country zj
 XSO_I(i,z)      total production by commodity
 XSO(j,i,z)      Industry j production of commodity i
 XSTO(j,z)       Total aggregate output of industry j
 tssm(i,j,z)     Intermediate tax by source import
 tssd(i,j,z)     Intermediate tax by source domestic
 MAKE(j,i,z)     Make matrix valued at basic prices
 DSO_I(i,z)      Supplys of domestic production of commodity i
 XSO_I(i,z)      Total aggregate output of commoity i

 DIO2(i,z)
 TIMO2(i,z)
 IMO2(i,z)
 tmrg2(i,z)
 tmrg3(ij,zj)
 tmrg4(zj)
 DIO3(j,z)
 LDO2(j,z)
 TIWO2(j,z)
 TIKO2(j,z)
 RKDO2(k,j,z)
 RKDO2(k,j,z)
 DDO_Matrix(i,ij,z)
 XSO_Matrix(i,ij,z)
;

*==============================================================================
*  2.3 Loading parameters from GTAP database
*==============================================================================
$LOAD EVOS, FBEP, FTRV, MFRV, OSEP, POP, TFRV, VDEP, VDFP, VDFB, VDGP, VDGB, VMFP, VMFB, MAKES, MAKEB
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

 CO(i,z)         = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
                       VDPP(comm,reg)+VMPP(comm,reg)};

*==============================================================================
* 2.4.2 Public final consumption
*==============================================================================
* Public final consumption is given by the sum of domestic purchases at
* agents prices (VDGP) and public final imports at agents prices (VMGP).

 CGO(i,z)        = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
                       VDGP(comm,reg)+VMGP(comm,reg)};

*==============================================================================
* 2.4.3 Demand for investment purposes
*=============================================================================
*  In the GTAP data, the accumulation account is presented in the
*  production sector CGDS (Capital goods). Demand for investment purposes
*  is thus given by the sum of domestic purchases at agents prices (VDFP)
*  and public final imports at agents prices (VIFA) for this sector.

 INVO(i,z)       = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
*                      VDFP(comm,'CGDS',reg)+VIFA(comm,'CGDS',reg)};
                      VDIP(comm,reg)+VMIP(comm,reg)};

*==============================================================================
* 2.4.4 Intermediate demand
*==============================================================================
* Intermediate consumption is given by the sum of domestic purchases at
* agents prices (VDFP) and public final imports at agents prices (VIFA).

 DIO(i,j,z)      = SUM[(comm,acts,reg)$[i2comm(i,comm)
                      $j2acts(j,acts)$z2reg(z,reg)],
                      VDFP(comm,acts,reg)
                     +VMFP(comm,acts,reg)];

 DIO(i,'09_PAPERPRO','05_MNG')$(DIO(i,'09_PAPERPRO','05_MNG') lt 0.0000068505) = 0.000001 ;


 tssm(i,j,z)    = SUM[(comm,acts,reg)$[i2comm(i,comm)
                      $j2acts(j,acts)$z2reg(z,reg)],
                      VMFP(comm,acts,reg)-VMFB(comm,acts,reg)];

 tssd(i,j,z)    = SUM[(comm,acts,reg)$[i2comm(i,comm)
                      $j2acts(j,acts)$z2reg(z,reg)],
                      VDFP(comm,acts,reg)-VDFB(comm,acts,reg)];

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
 VCIF(comm,z1c,z1c)        = 0;
 VTMFSD(marg,comm,z1c,z1c) = 0;

 IMO(i,zj,z)     = SUM{(comm,regj,reg)$[i2comm(i,comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       VCIF(comm,regj,reg)-
                       SUM[marg,VTMFSD(marg,comm,regj,reg)]};
*lt Strictly less than
 IMO(i,zj, z)$(IMO(i, zj, z) lt  0.0001) = 0.00001 ;
 IMO(i,zj,z)$sameas(zj,z) = 0 ;
*==============================================================================
* 2.4.6 Exports
*==============================================================================
*  To limit the sources of potential desequilibrium, exports are simply set
*  equal to imports.

 EXO(i,zj,z)     = IMO(i,zj,z);
 EXTO(i,z)       = sum(zj, EXO(i,z,zj));
* EXO(i,zj,z)     = SUM{(comm,regj,reg)$[j2comm(i,comm)
*                       $z2reg(zj,regj)$z2reg(z,reg)],
*                       VXSB(comm,regj,reg)};

*==============================================================================
* 2.4.7 Margins
*==============================================================================
*  Transport margins are given by the variable VTMFSD
* tmrg(TRP,ij,zj,z)$IMO(ij,zj,z)
*                 = SUM{(comm,regj,reg)$[j2comm(ij,comm)
*                       $z2reg(zj,regj)$z2reg(z,reg)],
*                       SUM[marg,VTMFSD(marg,comm,regj,reg)]};

  tmrg('20_LTRP',ij,zj,z)$IMO(ij,zj,z)
                 = SUM{(comm,regj,reg)$[i2comm(ij,comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       VTMFSD('otp',comm,regj,reg)};

  tmrg('21_WTRP',ij,zj,z)$IMO(ij,zj,z)
                 = SUM{(comm,regj,reg)$[i2comm(ij,comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       VTMFSD('wtp',comm,regj,reg)};

 tmrg('22_ATRP',ij,zj,z)$IMO(ij,zj,z)
                 = SUM{(comm,regj,reg)$[i2comm(ij,comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       VTMFSD('atp',comm,regj,reg)};

 tmrg3(ij,zj) = tmrg('20_LTRP',ij,zj,'01_KOR') ;

 tmrg4(zj) = sum(ij,tmrg('20_LTRP',ij,zj,'01_KOR')) ;

* Supply of transport margin are given by the variable VST
 MRGNO(i,z)      = SUM{(marg,reg)$[i2comm(i,marg)$z2reg(z,reg)],
                       VST(marg,reg)};

*==============================================================================
* 2.4.8 Import duties
*==============================================================================
*  Import duties are given by the variable TFRV

 TIMO(i,zj,z)$IMO(i,zj,z)
                 = SUM{(comm,regj,reg)$[i2comm(i,comm)
                       $z2reg(zj,regj)$z2reg(z,reg)],
                       TFRV(comm,regj,reg)};

*==============================================================================
* 2.4.9 Taxes on exports
*==============================================================================
*  Taxes on exports are given by the sum of MRRV and XTRV

* TIXO(i,z,zj)$IMO(i,z,zj)
 TIXO(i,z,zj)$IMO(i,z,zj)
                 = SUM{(comm,reg,regj)$[i2comm(i,comm)
                       $z2reg(z,reg)$z2reg(zj,regj)],
                       MFRV(comm,reg,regj)+XTRV(comm,reg,regj)};

*==============================================================================
* 2.4.10 Taxes on factors of production
*==============================================================================
* Net taxes on factor of production are calculated as taxes (FTRV)
* less subsidies (FBEP).

 TIWO(l,j,z)      = SUM{(endw,acts,reg)$[f2endw(l,endw)
                       $j2acts(j,acts)$z2reg(z,reg)],
                       FTRV(endw,acts,reg)+
                       FBEP(endw,acts,reg)};

 TIWO_J(l,z) = SUM(j, TIWO(l,j,z));

 TIKO(k,j,z)     = SUM{(endw,acts,reg)$[f2endw(k,endw)
                       $j2acts(j,acts)$z2reg(z,reg)],
                       FTRV(endw,acts,reg)+
                       FBEP(endw,acts,reg)};

 TIKO_J(k,z) = SUM(j, TIKO(k,j,z));
*==============================================================================
* 2.4.11 Taxes on production
*==============================================================================
* Taxes on production are set equal to the negative value of production
* subsidies (OSEP).

 TIPO(j,z)       = SUM{(comm,reg)$[j2comm(j,comm)$z2reg(z,reg)],
                       OSEP(comm,reg)};

*==============================================================================
* 2.4.12 Domestic taxes on commodities
*==============================================================================
* Domestic taxes on commodities are evaluated as the difference between
* demand at agent prices and demand at market prices.

 TICO(i,z)       = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
                      VDPP(comm,reg)-VDPB(comm,reg)
                     +VMPP(comm,reg)-VMPB(comm,reg)
                     +VDGP(comm,reg)-VDGB(comm,reg)
                     +VMGP(comm,reg)-VMGB(comm,reg)
                     +SUM[acts,VDFP(comm,acts,reg)
*                          +VIFA(comm,acts,reg)]
                          +VMFP(comm,acts,reg)]

                     -SUM[acts,VDFB(comm,acts,reg)
*                          +VIFM(comm,acts,reg)]};
                           +VMFB(comm,acts,reg)]};

*==============================================================================
* 2.4.13 Direct taxes
*==============================================================================
* Direct taxes is given by the difference between factor payment at
* market prices (EVFB) and endowment at agent prices (EVOS)

 TDHO(z)            = SUM{reg$z2reg(z,reg),
                       SUM[endw,SUM(acts,EVFB(endw,acts,reg))
                       -SUM(acts,EVOS(endw, acts, reg))]};

 DTAX(f,z)          = SUM{(endw,reg)$[f2endw(f,endw)$z2reg(z,reg)],
                       SUM[acts,EVFB(endw,acts,reg)] -
                       SUM[acts,EVOS(endw,acts, reg)]} ;

*==============================================================================
* 2.4.14 Factors of production
*==============================================================================
* Remuneration of the production factors is evaluated at market prices,
* that is before taxes (EVFB).

 LDO(l,j,z)      = SUM{(endw,acts,reg)$[f2endw(l,endw)
                       $j2acts(j,acts)$z2reg(z,reg)],
                       EVFB(endw,acts,reg)};

 LDO_J(l,z)       = SUM(j,LDO(l,j,z)) - DTAX(l,z);

 RKDO(k,j,z)      = SUM{(endw,acts,reg)$[f2endw(k,endw)
                       $j2acts(j,acts)$z2reg(z,reg)],
                       EVFB(endw,acts,reg)};

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
* 2.4.18 MAKE Matrix
*==============================================================================

 MAKE(j,i,z) = SUM[(acts,comm,reg)$[i2comm(i,comm)
                      $j2acts(j,acts)$z2reg(z,reg)],
                      MAKEB(comm,acts,reg)];

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

* DSO(i,z)        = DDO(i,z);
* XSO(j,z)        = DSO(j,z)+MRGNO(j,z)+SUM[zj,EXO(j,z,zj)-TIXO(j,z,zj)];

*Table XSO_Matrix(i,j,z) ;
* XSO_Matrix(i,j,z) =   XSO(j,z)$sameas(i,j);

 DSO_I(i,z)        = DDO(i,z) ;
 XSO_I(i,z)        = DDO(i,z)+MRGNO(i,z)+SUM[zj,EXO(i,z,zj)-TIXO(i,z,zj)];
 XSO(j,i,z)        = XSO_I(i,z)*[MAKE(j,i,z)/sum(jj,MAKE(jj,i,z))];
 XSTO(j,z)         = SUM(i, XSO(j,i,z));

 EXTO(i,z)         = SUM[zj,EXO(i,z,zj)];
 DSO(j,i,z)        = DDO(i,z)*[MAKE(j,i,z)/sum(jj,MAKE(jj,i,z))];

*  The operating surplus is the variable that was used to equilibrate the
*  regional data. As all other variables (income, savings and so on) will
*  be calculated based on the variables described in these steps, there
*  should not be any other descrepency.

* Balancing in 2019 Database
TIPO('09_PAPERPRO','05_MNG') = 0.0001  ;
TIXO('10_PETROLCOAL','05_MNG','06_PRK') = 0 ;
RKDO('cap',j,z)  = XSTO(j,z)-SUM[i,DIO(i,j,z)]-SUM[l,LDO(l,j,z)+TIWO(l,j,z)]
                  -TIPO(j,z)-SUM[k,TIKO(k,j,z)]-RKDO('land',j,z) -RKDO('natr',j,z);

RKDO_J(k,z) = sum(j,RKDO(k,j,z)) - DTAX(k,z);

DIO3(j,z) = SUM[i,DIO(i,j,z)];
LDO2(j,z) = SUM[l,LDO(l,j,z)];
TIWO2(j,z) = SUM[l,TIWO(l,j,z)];
TIKO2(j,z) = SUM[k,TIKO(k,j,z)];
RKDO2('land',j,z) =RKDO('land',j,z);
RKDO2('natr',j,z) =RKDO('natr',j,z);

*Recalibrating
*KSTO(z)  = sum((k,j),RKDO(k,j,z));

Display RKDO ;
*$EXIT
*==============================================================================
* 3. CES elasticities
*==============================================================================
* 3.1 Definition of GTAP parameters
*==============================================================================
PARAMETER
 ESUBD(comm, reg)  Elasticity of substitution between domestic product and imports
 ESUBM(comm, reg)  Elasticity of substitution between imports from different regions
 ESUBVA(acts, reg) Elasticity of substitution between primary factors in the production of value added

*==============================================================================
* 3.2 Definition in PEP w
*==============================================================================
 sigma_M1(i,z)   Elasticity (CES - composite commodity)
 sigma_M2(i,z)   Elasticity (CES - composite import)
 sigma_VA(j,z)   Elasticity (CES - value added)

*==============================================================================
* 3.3 Temporary variables
*==============================================================================
 IM_GTAP(comm,z) Total imports using the GTAP commodity sets
 Q_GTAP(comm,z)  Composite commodity using the GTAP commodity sets
 SH_IM(comm,i,z) Share of each import TRAD_COM in aggregation i for region z
 SH_Q(comm,i,z)  Share of each composite commodity TRAD_COM in aggregation i for region z
 SH_VA(acts,j,z) Share of each sector TRAD_COM in aggregation j for region z
 VA_GTAP(acts,z) Value added using the GTAP sectors
;

*==============================================================================
* 3.4 Load the GTAP file which includes the parameters
*==============================================================================
$GDXIN Input_w-t\GTAP11_Parameters2019.gdx
$LOAD ESUBD, ESUBM, ESUBVA

Display ESUBD, ESUBM, ESUBVA ;
*==============================================================================
*  3.5 sigma_M1
*==============================================================================
* Elasticities of substitution between domestic product and imports are
* aggregated acording to the share of each commodity (QO) TRAD_COMM in total I

 Q_GTAP(comm,z)
                 = SUM{reg$z2reg(z,reg),
                   VDPP(comm,reg)+VMPP(comm,reg)+
                   VDGP(comm,reg)+VMGP(comm,reg)+
                   VDIP(comm,reg)+VMIP(comm,reg)+
                   SUM[acts,VDFP(comm,acts,reg)+
                       VMFP(comm,acts,reg)]};


 SH_Q(comm,i,z)$i2comm(i,comm)
                 = Q_GTAP(comm,z)/
                   SUM{commi$i2comm(i,commi),
                       Q_GTAP(commi,z)};

 sigma_M1(i,z)   = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
                   ESUBD(comm,reg)*SH_Q(comm,i,z)};

*==============================================================================
*  3.6 sigma_M2
*==============================================================================
* Elasticities of substitution between imports from different partners are
* aggregated acording to the share of total import (IMTO) TRAD_COMM in total I

 IM_GTAP(comm,z)
                 = SUM[regj,SUM{reg$z2reg(z,reg),VCIF(comm,regj,reg)}];

 SH_IM(comm,i,z)$i2comm(i,comm)
                 = IM_GTAP(comm,z)/
                   SUM{commi$i2comm(i,commi),
                       IM_GTAP(commi,z)};

 sigma_M2(i,z)   = SUM{(comm,reg)$[i2comm(i,comm)$z2reg(z,reg)],
                   ESUBM(comm,reg)*SH_IM(comm,i,z)};

*==============================================================================
*  3.7 sigma_VA
*==============================================================================
* Elasticities of substitution between factors of production are aggregated
* acording to the share of each sector (VA) TRAD_COMM in total I

 VA_GTAP(acts,z)
                 = SUM{endw,
                       SUM[reg$z2reg(z,reg),EVFB(endw,acts,reg)]};

 SH_VA(acts,j,z)$j2acts(j,acts)
                 = VA_GTAP(acts,z)/
                   SUM{actsj$j2acts(j,actsj),
                       VA_GTAP(actsj,z)};

 sigma_VA(j,z)   = SUM{(acts,reg)$[j2acts(j,acts)$z2reg(z,reg)],
                   ESUBVA(acts,reg)*SH_VA(acts,j,z)};

*$exit
*==============================================================================
* Importing WEB(World Energy Balance)
*==============================================================================
*$INCLUDE DATA_WEB-2019_230417.gms


*==============================================================================
* SAM Balancing
*==============================================================================
*$INCLUDE DATA_SamBal-2019_230217.gms


*==============================================================================
* Projections used in PEP w-t model
*==============================================================================
* The following file includes data from:
* Source: "The Great Shift: Macroeconomic projections for the world economy at
* the 2050 horizon" CEPII Working Paper 2012-03
* by Jean Foure, Agnes Benassy-Quere & Lionel Fontagne
* February 2012.

** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
**NOTE THAT THE FOLLOWING GTAP8.1 REGIONS ARE ABSENT FROM THE PROJECTIONS**
**   aze, ben, bfa, cyp, ecu, gin, hrv, nam, rwa, slv, svn, tgo, twn,    **
**   xea, xer, xna, xtw, zwe                                             **
** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **

*$include Projection_231002.gms
* Data on total and active population are expressed in thousands
* Data on GDP is expressed in millions of USD

PARAMETER
 ACT_POP(z,time)         Active population from 1980 to 2050 based on the PEP w aggregation
 ACT_POP_GTAP8(reg,time) Active population from 1980 to 2050 based on the GTAP8 aggregation
 CAB_Foure(z,time)       Implicit CAB in Foure et al projections
 exogro(z,time)          Exogenous growth factor for exogenously growing variables
 exogro_LS(z,time)       Exogenous growth factor for exogenously growing labor supply
 g_GDP(z,time)           GDP growth
 g_KS(z,time)            Capital stock growth rate
 g_LS(z,time)            Active population growth rate
 g_POP(z,time)           Population growth rate
 g_SDR(z,time)           Domestic savings rate growth rate
 GDP(z,time)             GDP projection based on the PEP w aggregation
 GDP_GTAP8(reg,time)     GDP from 1980 to 2050 based on the GTAP8 aggregation
 gdp_per_cap(z)          GDP per capita
 I_rate(z,time)          Investment rate - domestic savings over GDP
 Invest(z,time)          Investments from 1980 to 2050 based on PEP w aggregation
 Invest_GTAP8(reg,time)  Investments from 1980 to 2050 based on GTAP8 aggregation
 K_Stock_GTAP8(reg,time) Capital stock from 1980 to 2050 based on the GTAP8 aggregation
 K_Stock(z,time)         Capital stock from 1980 to 2050 based on the PEP w aggregation
 TFP(z,time)             Total factor productivity index 1980-2050 for PEP w aggregation
 TFP_GTAP8(reg,time)     Total factor productivity 1980-2050 for GTAP8 aggregation
 S_rate(z,time)          Savings rate - domestic savings over GDP
 Savings(z,time)         Domestic savings from 1980 to 2050 based on PEP w aggregation
 Savings_GTAP8(reg,time) Domestic savings from 1980 to 2050 based on GTAP8 aggregation
 sdr_fac(z,time)         Exogenous change factor for domestic savings rate
 TOT_POP(z,time)         Total population from 1980 to 2050 based on the PEP w aggregation
 TOT_POP_GTAP8(reg,time) Total population from 1980 to 2050 based on the GTAP8 aggregation
 AEEI(z,time)            Autonomous energy efficiency improvement
 CTAX_145(z,time)
 CTAX_285(z,time)
 CTAX_425(z,time)
 CTAX_565(z,time)
;

$call gdxxrw Input_w-t\240125_Projection.xlsx @Input_w-t\Projection.txt trace=0 output=Input_w-t\240125_Projection 
$gdxIn Input_w-t\240125_Projection.gdx
$load GDP, TOT_POP, AEEI, CTAX_145, CTAX_285, CTAX_425, CTAX_565

*==============================================================================
* 4.1 Real GDP projections
*==============================================================================
* GDP_GTAP8(reg,time)     = Projection('GDP_K',reg,time);
* GDP(z,time)             = SUM{reg$z2reg(z,reg),GDP_GTAP8(reg,time)};

loop{time$[time.val lt 2100],
 g_GDP(z,time+1)           = [GDP(z,time+1)/GDP(z,time)]-1;
};
 g_GDP(z,time)$[time.val ge 2100]
                         = g_GDP(z,time+2);

display g_GDP ;

*==============================================================================
* 4.2 Total population projections
*==============================================================================
* TOT_POP_GTAP8(reg,time) = Projection ('Pop',reg,time);
* TOT_POP(z,time)         = SUM{reg$z2reg(z,reg),TOT_POP_GTAP8(reg,time)};

*TOT_POP(z,time) = ACT_POP(z,time);

loop{time$[time.val lt 2100],
 g_POP(z,time+1)           = [TOT_POP(z,time+1)/TOT_POP(z,time)]-1;
};
 g_POP(z,time)$[time.val ge 2100]
                         = g_POP(z,time+1);

display g_POP ;

*==============================================================================
* 5. Endogenous definition of set for rich regions/countries
*==============================================================================
* In the World Bank's 2007 World Development Indicators, "High-income" countries
* are defined as those with a per capita Gross National Income of 10726USD
* or above. Since there is no income from abroad in PEP-w-t, GDP is equal to
* GNI, and we define high-income economies according to GDP per capita.

* gdp_per_cap(z)  = [GDP(z,'2019')*10000000000]/[ACT_POP(z,'2019')*1000000];
* Zrich(Z)        = yes$[gdp_per_cap(z) ge 10726];
* Zother(Z)       = yes$[not Zrich(Z)];

 Zrich('01_KOR')        = yes;
 Zrich('03_JPN')        = yes;
 Zrich('07_NAM')        = yes;
 Zrich('09_WEU')        = yes; 
 Zrich('10_EEU')        = yes; 
 Zrich('17_PAO')        = yes; 
 Zother(Z)              = yes$[not Zrich(Z)];

execute_unload 'Input_w-t\DATA_AGG-2019_240306_w-t-GTAP11.gdx',

*Sets used in PEP w-1 and PEP w-t
 J, I, I1, BUS, PUB, F, L, K, Z, ZR, Z1, Zrich, Zother

*Benchmark variables and parameters used in PEP w-1 and PEP w-t
 CO, CGO, DDO, DEPO, DIO, DSO,DSO_I, EXO, IMO, INVO, KSTO, LDO, MRGNO, POPO, RKDO,
 TDHO, DTAX, TICO, TIKO, TIMO, TIPO, TIWO, TIXO, tssm, tssd, tmrg, XSO, XSO_I, XSTO, EXTO,
 sigma_M1, sigma_M2, sigma_VA,Q_GTAP, SH_Q, ESUBD, DDO_Matrix

*Parameters used in PEP w-t only
 g_GDP, g_POP, AEEI, CTAX_145, CTAX_285, CTAX_425, CTAX_565 ;