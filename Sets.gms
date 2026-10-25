*==============================================================================
* 1. Set definition
*==============================================================================

SET
 J               All industries
 I               All commodities
 I1(I)           All commodities except agriculture
 BUS(J)          Private industries
 PUB(J)          Public industries
 F               Production factors
 L(F)            Labor categories
 K(F)            Capital categories
 Z               Regions
 ZR(Z)           Reference country
 Z1(Z)           All regions except reference region
 Zrich(Z)        Rich regions
 Zother(Z)       Non-rich regions
 sim             Simulation loop index /1*7/
*/1*12/


$GDXIN Input_w-1\DATA_AGG_GTAP12.gdx
$LOAD J I I1 BUS PUB F L K Z ZR Z1 Zrich Zother
$GDXIN

*==============================================================================
* 2. Electricity industries
*==============================================================================

SET
 TND(J) Transmission and distribution
 / 18_TnD /

 POWER(J) Power generation industries
 / 19_eCoal      Coal generation
   20_eGas       Gas generation
   21_eOil       Oil generation
   22_eNUC       Nuclear generation
   23_eREN       Renewable generation /

 Elec(J) Electricity generation industries
 / 19_eCoal, 20_eGas, 21_eOil, 22_eNUC, 23_eREN /

 eNUC(J) Nuclear generation industry
 / 22_eNUC /

 eREN(J) Renewable generation industry
 / 23_eREN /

 eNFs(J) Non-fossil generation industries
 / 22_eNUC, 23_eREN /
;

SET ACTIVE_J(j,z) "Production activities present in the benchmark";
*==============================================================================
* 3. Commodity subsets
*==============================================================================

SET
 I2(I) Non-electricity commodities
 / 01_AGRICULT   Agricultural forest and fishery goods
   02_COAL       Coal
   03_OIL        Crude petroleum
   04_GAS        Natural gas and gas distribution
   05_MINING     Mined and quarried goods
   06_FOODPRO    Food beverages and tobacco products
   07_TEXTILES   Textile and leather products
   08_WOODPRO    Wood products
   09_PAPERPRO   Paper products
   10_PETROLCOAL Petroleum and coal products
   11_CHEMICAL   Chemical products
   12_NONMET     Non-metallic mineral products
   13_IRONSTL    Primary iron and steel products
   14_NONFERR    Non-ferrous metal products
   15_MACHINE   Fabricated metal products electronics and machinery
   16_TRANSEQ   Motor vehicles and transport equipment
   17_OTHERIND  Other manufactured products and water supply
   19_CONSTRUC  Construction
   20_LTRP      Land transport services
   21_WTRP      Water transport services
   22_ATRP      Air transport services
   23_SER       Services /

 I3(I) Non-CBAM commodities
 / 01_AGRICULT, 02_COAL, 03_OIL, 04_GAS, 05_MINING, 06_FOODPRO,
   07_TEXTILES, 08_WOODPRO, 09_PAPERPRO, 10_PETROLCOAL,
   15_MACHINE, 16_TRANSEQ, 17_OTHERIND, 18_ELEC, 19_CONSTRUC,
   20_LTRP, 21_WTRP, 22_ATRP, 23_SER /

 I4(I) CBAM commodities
 / 11_CHEMICAL, 12_NONMET, 13_IRONSTL, 14_NONFERR /

 ENE(I) Energy commodities
 / 02_COAL, 03_OIL, 04_GAS, 10_PETROLCOAL, 18_ELEC /

 NENE(I) Non-energy commodities
 / 01_AGRICULT, 05_MINING, 06_FOODPRO, 07_TEXTILES, 08_WOODPRO,
   09_PAPERPRO, 11_CHEMICAL, 12_NONMET, 13_IRONSTL, 14_NONFERR,
   15_MACHINE, 16_TRANSEQ, 17_OTHERIND, 19_CONSTRUC, 20_LTRP,
   21_WTRP, 22_ATRP, 23_SER /
;

*==============================================================================
* 4. Industry subsets
*==============================================================================

SET
 J2(J) General industries
 / 07_TEXTILES, 08_WOODPRO, 09_PAPERPRO, 11_CHEMICAL, 14_NONFERR,
   15_MACHINE, 16_TRANSEQ, 24_CONSTRUC, 26_WTRP, 27_ATRP, 28_SER /

 J3(J) Energy and energy-intensive industries
 / 01_AGRICULT, 02_COAL, 03_OIL, 04_GAS, 05_MINING, 06_FOODPRO,
   10_PETROLCOAL, 12_NONMET, 13_IRONSTL, 17_OTHERIND, 18_TnD,
   19_eCoal, 20_eGas, 21_eOil, 22_eNUC, 23_eREN, 25_LTRP /

 J4(J) Energy transformation industries
 / 10_PETROLCOAL, 19_eCoal, 20_eGas, 21_eOil, 22_eNUC, 23_eREN /

 J5(J) Industries excluding energy transformation and transmission
 / 01_AGRICULT, 02_COAL, 03_OIL, 04_GAS, 05_MINING, 06_FOODPRO,
   07_TEXTILES, 08_WOODPRO, 09_PAPERPRO, 11_CHEMICAL, 12_NONMET,
   13_IRONSTL, 14_NONFERR, 15_MACHINE, 16_TRANSEQ, 17_OTHERIND,
   24_CONSTRUC, 25_LTRP, 26_WTRP, 27_ATRP, 28_SER /

 J6(J) Agriculture
 / 01_AGRICULT /

* Original J7 coverage retained: fossil extraction and fossil generation.
 J7(J) Fossil energy industries
 / 02_COAL, 03_OIL, 04_GAS, 19_eCoal, 20_eGas, 21_eOil /

 J8(J) Mining manufacturing and construction
 / 05_MINING, 06_FOODPRO, 07_TEXTILES, 08_WOODPRO, 09_PAPERPRO,
   10_PETROLCOAL, 11_CHEMICAL, 12_NONMET, 13_IRONSTL, 14_NONFERR,
   15_MACHINE, 16_TRANSEQ, 17_OTHERIND, 24_CONSTRUC /

 J9(J) Transportation industries
 / 25_LTRP, 26_WTRP, 27_ATRP /

 J10(J) Service industries for building-sector reporting
 / 28_SER /

 J11(J) CBAM target industries
 / 11_CHEMICAL, 12_NONMET, 13_IRONSTL, 14_NONFERR /
;

*==============================================================================
* 5. Regional subsets
*==============================================================================

SET
 Z2(Z) Asian regions
 / 01_KOR, 02_CHN, 03_JPN, 04_IND, 05_RUS /

 Z3(Z) CBAM importing regions
 / 07_EU /

 Z4(Z) CBAM exporting regions excluding recycling recipients
 / 01_KOR, 02_CHN, 03_JPN, 05_RUS, 06_US, 08_OHI, 09_OUMIC /

 Z5(Z) Recipients of CBAM revenue recycling
 / 04_IND, 10_OLMIC, 11_OLI /
;

*==============================================================================
* 6. Industry-to-commodity mapping
*==============================================================================

SET
 INDtoCOM(J,I) Industry to commodity mapping
 / 01_AGRICULT.01_AGRICULT
   02_COAL.02_COAL
   03_OIL.03_OIL
   04_GAS.04_GAS
   05_MINING.05_MINING
   06_FOODPRO.06_FOODPRO
   07_TEXTILES.07_TEXTILES
   08_WOODPRO.08_WOODPRO
   09_PAPERPRO.09_PAPERPRO
   10_PETROLCOAL.10_PETROLCOAL
   11_CHEMICAL.11_CHEMICAL
   12_NONMET.12_NONMET
   13_IRONSTL.13_IRONSTL
   14_NONFERR.14_NONFERR
   15_MACHINE.15_MACHINE
   16_TRANSEQ.16_TRANSEQ
   17_OTHERIND.17_OTHERIND

   18_TnD.18_ELEC
   19_eCoal.18_ELEC
   20_eGas.18_ELEC
   21_eOil.18_ELEC
   22_eNUC.18_ELEC
   23_eREN.18_ELEC

   24_CONSTRUC.19_CONSTRUC
   25_LTRP.20_LTRP
   26_WTRP.21_WTRP
   27_ATRP.22_ATRP
   28_SER.23_SER /
;

*==============================================================================
* 7. Aliases
*==============================================================================

ALIAS
 (J,JJ),
 (I,II,IJ),
 (L,LJ),
 (K,KJ),
 (Z,ZJ,ZJJ),
 (POWER,POWER2),
 (ENE,ENE2),
 (Elec,Elecc)
;

*==============================================================================
* 8. Benchmark activity domains
*==============================================================================

SETS
 ACTIVE_J(J,Z)      "Industries with positive benchmark output"
 INACTIVE_J(J,Z)    "Industries absent from benchmark production"
 ACTIVE_POWER(J,Z) "Power generation activities with positive benchmark output"
;
