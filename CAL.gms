* ==============================================================================
* CAL.gms
* ==============================================================================

* 4.1 Calculation of income and savings related variables and parameters
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
* 4.2 Calibration of parameters and other variables
*==============================================================================
* 4.2.1 Calibration of investment and government spending shares
*==============================================================================
 gamma_GVT(i,z)  = CGO(i,z)/SUM[ij,CGO(ij,z)];
 gamma_INV(i,z)  = INVO(i,z)/SUM[ij,INVO(ij,z)] ;

*==============================================================================
* 4.2.2 Calibration of other prices and revised volumes (part 1)
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

 DSO(j,i,z)      = DSO(j,i,z)/PLO(i,z);
 DSO_I(i,z)      = SUM(j,DSO(j,i,z));
 DSO_J(j,z)      = SUM(i,DSO(j,i,z));
 QO(i,z)         = IMTO(i,z)+DDO(i,z);

 MRGNO(i,z)$MRGNO(i,z)
                 = MRGNO(i,z)/[eO(z)*PWMGO(i)];

 XSO_I(i,z)      = EXTO(i,z)+DDO(i,z)+MRGNO(i,z);
 XSTO(j,z)       = sum(i, XSO(j,i,z));

 IMO2(zj,z)      = sum(i,IMO(i,zj,z));

 PO(i,z)         = [PETO(i,z)*EXTO(i,z)+PLO(i,z)*DSO_I(i,z)
                  +eO(z)*PWMGO(i)*MRGNO(i,z)]/XSO_I(i,z);

 PO2(j,i,z)$XSO(j,i,z) = 1;
 PO3(i,j,z)$XSO(j,i,z) = 1;

 PIO(i,z)        = SUM[j$XSO(j,i,z),PO2(J,I,z)*XSO(j,i,z)]/XSO_I(i,z);


* Default prices for inactive industries
 PTO(j,z) = 1;
 PPO(j,z) = 1;

 PTO(j,z)$ACTIVE_J(j,z)
    = SUM[i$XSO(j,i,z), PO2(j,i,z)*XSO(j,i,z)]
      / XSTO(j,z);

 PPO(j,z)$ACTIVE_J(j,z)
    = ( SUM[l, TIWO(l,j,z)+WO(l,z)*LDO(l,j,z)]
      + SUM[k, TIKO(k,j,z)+RKDO(k,j,z)]
      + SUM[nene, DIO(nene,j,z)]
      + SUM[ene, DIO(ene,j,z)] ) / XSTO(j,z);


 theta2(j,i,z)   = DSO(j,i,z)/sum(jj, DSO(jj,i,z));

 EXTTO(j,i,z)$DSO(j,i,z) = theta2(j,i,z)*EXTO(i,z);

*==============================================================================
* 4.3 Calibration of tax rates, margins, prices and volumes
*==============================================================================
* 4.3.1 Margin rates and tax rates
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
* 4.9 CO2 emission
*==============================================================================
$INCLUDE Input_WEB\DATA_WEB_2023.gms

Parameter
 CO2IO(product,j,z) ktCO2 emission for industry j sector
 CO2HO(product,z)   ktCO2 direct emission for residendital sector
 TCO2IO(j,z)        ktCO2 total emission for industry sector j in region z
 TCO2IO2(i,zj)      Total CO2 emissions for commodity i in region zj
 XSTO2(i,zj)        Total output for commodity i in region zj
 CP0(z)             CBAM carbon price per ton CO2 ($ per tCO2)
 GWP(type)          Global Warming Potential (100-year AR5)
 ;

 GWP('CO2EF') = 1;
 GWP('CH4EF') = 28;
 GWP('N2OEF') = 265;

*Direct emissions
 CO2IO(p_coal,j,z)$Coal_DIO(p_coal,j,z) = Coal_DIO(p_coal,j,z)*41.868*GHGsEF(p_coal,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2IO(p_gas,j,z)$Gas_DIO(p_gas,j,z)  = Gas_DIO(p_gas,j,z)*41.868*GHGsEF(p_gas,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2IO(p_oilproduct,j,z)$Oilp_DIO(p_oilproduct,j,z)  = Oilp_DIO(p_oilproduct,j,z)*41.868*GHGsEF(p_oilproduct,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2IO(p_oil,j,z)
    = Oil_DIO(p_oil,j,z)
      *41.868*GHGsEF(p_oil,'CO2EF')
      *(44/12)*0.001*GWP('CO2EF');

CO2HO(p_oil,z)
    = Oil_CO(p_oil,z)
      *41.868*GHGsEF(p_oil,'CO2EF')
      *(44/12)*0.001*GWP('CO2EF');
 CO2HO(p_coal,z)$Coal_CO(p_coal,z) = Coal_CO(p_coal,z)*41.868*GHGsEF(p_coal,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2HO(p_gas,z)$Gas_CO(p_gas,z) = Gas_CO(p_gas,z)*41.868*GHGsEF(p_gas,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;
 CO2HO(p_oilproduct,z)$Oilp_CO(p_oilproduct,z) = Oilp_CO(p_oilproduct,z)*41.868*GHGsEF(p_oilproduct,'CO2EF')*1*(44/12)*0.001*GWP('CO2EF') ;

*Indirect emissions

* ======================================================================
* Separate electricity and heat emissions.
* Fixed benchmark factors; domestic average allocation approximation.
* CHP allocation: energy-output shares, NOT regulatory certification.
* ======================================================================

SETS
    cb_eh_flow(flow)
    / f11_MAINELEC, f12_AUTOELEC,
      f13_MAINCHP,  f14_AUTOCHP,
      f15_MAINHEAT, f16_AUTOHEAT /

    cb_chp_flow(flow)
    / f13_MAINCHP, f14_AUTOCHP /

    cb_auto_flow(flow)
    / f12_AUTOELEC, f14_AUTOCHP, f16_AUTOHEAT /

    cb_fossil(product)
;

cb_fossil(product)
    = p_coal(product)
      OR p_gas(product)
      OR p_oil(product)
      OR p_oilproduct(product);

PARAMETERS
    cb_web(flow,product,z)       "Original WEB data"
    cb_ef(product)              "ktCO2 per ktoe"
    cb_flow_co2(flow,z)         "Fuel-combustion CO2 by source, ktCO2"
    cb_out_e(flow,z)            "Electricity output in balance rows, ktoe"
    cb_out_h(flow,z)            "Heat output in balance rows, ktoe"
    cb_e_share(flow,z)          "Electricity allocation share"

    cb_pool_e(z)               "Electricity production CO2, ktCO2"
    cb_pool_h(z)               "Heat production CO2, ktCO2"
    cb_pool_auto_e(z)          "Autoproducer part of electricity pool"
    cb_pool_auto_h(z)          "Autoproducer part of heat pool"

    cb_use_e(z)                "Mapped electricity consumption, ktoe"
    cb_use_h(z)                "Mapped heat consumption, ktoe"

    cb_alloc_e(j,z)            "Electricity emissions allocated to industry"
    cb_alloc_h(j,z)            "Heat emissions allocated to industry"
    cb_alloc_e_hh(z)           "Electricity emissions allocated to households"
    cb_alloc_h_hh(z)           "Heat emissions allocated to households"

    CO2_DIRECT_IO(j,z)         "Direct fuel-combustion CO2, ktCO2"
    CO2_IND_IO(j,z)            "Allocated electricity plus heat CO2"
    CO2_IND_HO(z)              "Allocated household electricity plus heat CO2"
    EH_EMIS_POOL(z)            "Electricity and heat production CO2"
    EH_USE_TOTAL(z)            "Mapped electricity and heat consumption"

    cb_int_comb(i,z)           "Fuel-combustion intensity, tCO2/USD"
    cb_int_e(i,z)              "Allocated electricity intensity, tCO2/USD"
    cb_int_h(i,z)              "Allocated heat intensity, tCO2/USD"
    cb_include_e(i)            "Include electricity emissions in CBAM"
    CO2CBAMFACTOR(i,z)         "Fixed CBAM assessment intensity, tCO2/USD"

    chk_cb_source(z)           "New source total minus existing supply CO2"
;

cb_web(flow,product,z) = WEB(flow,product,z);
* Use the SAME fossil-product coverage as existing direct emissions.
cb_ef(product) = 0;
cb_ef(product)$cb_fossil(product)
    = 41.868 * GHGsEF(product,'CO2EF')
      * (44/12) * 0.001 * GWP('CO2EF');

cb_flow_co2(cb_eh_flow,z)
    = SUM(product$cb_fossil(product),
          MAX(0,-cb_web(cb_eh_flow,product,z))
          * cb_ef(product));

* These are electricity/heat outputs in the energy-balance rows.
* Do NOT substitute f99_ELOUTPUT, which is reported in GWh.
cb_out_e(cb_eh_flow,z)
    = MAX(0,cb_web(cb_eh_flow,'p63_ELECTR',z));

cb_out_h(cb_eh_flow,z)
    = MAX(0,cb_web(cb_eh_flow,'p64_HEAT',z));

cb_e_share(flow,z) = 0;
cb_e_share('f11_MAINELEC',z) = 1;
cb_e_share('f12_AUTOELEC',z) = 1;

ABORT$(SUM((cb_chp_flow,z)$(
       cb_flow_co2(cb_chp_flow,z)>0
       AND cb_out_e(cb_chp_flow,z)
         + cb_out_h(cb_chp_flow,z)<=0),1)>0)
    "CHP fuel emissions exist but electricity/heat outputs are missing",
    cb_flow_co2, cb_out_e, cb_out_h;

cb_e_share(cb_chp_flow,z)$(
    cb_out_e(cb_chp_flow,z)+cb_out_h(cb_chp_flow,z)>0)
    = cb_out_e(cb_chp_flow,z)
      /(cb_out_e(cb_chp_flow,z)+cb_out_h(cb_chp_flow,z));

* Heat-only flows retain electricity share zero.
cb_pool_e(z)
    = SUM(cb_eh_flow,
          cb_flow_co2(cb_eh_flow,z)*cb_e_share(cb_eh_flow,z));

cb_pool_h(z)
    = SUM(cb_eh_flow,
          cb_flow_co2(cb_eh_flow,z)*(1-cb_e_share(cb_eh_flow,z)));

* Source provenance only: do not add these pools a second time.
cb_pool_auto_e(z)
    = SUM(cb_auto_flow,
          cb_flow_co2(cb_auto_flow,z)*cb_e_share(cb_auto_flow,z));

cb_pool_auto_h(z)
    = SUM(cb_auto_flow,
          cb_flow_co2(cb_auto_flow,z)*(1-cb_e_share(cb_auto_flow,z)));

CO2_DIRECT_IO(j,z)
    = SUM(product$cb_fossil(product),CO2IO(product,j,z));

EH_EMIS_POOL(z) = SUM(elec,CO2_DIRECT_IO(elec,z));

chk_cb_source(z)
    = cb_pool_e(z)+cb_pool_h(z)-EH_EMIS_POOL(z);

ABORT$(SMAX(z,
    ABS(chk_cb_source(z))/MAX(1,ABS(EH_EMIS_POOL(z))))>1e-8)
    "Source split does not reproduce the existing supply emissions",
    chk_cb_source, EH_EMIS_POOL;

* Allocate electricity and heat separately to mapped domestic users.
* Electricity and heat consumption: use the declared parameter domain.
cb_use_e(z)
    = SUM((p_elecheat,j)$p_elec(p_elecheat),
          Elec_DIO(p_elecheat,j,z))
    + SUM(p_elecheat$p_elec(p_elecheat),
          Elec_CO(p_elecheat,z));

cb_use_h(z)
    = SUM((p_elecheat,j)$p_heat(p_elecheat),
          Elec_DIO(p_elecheat,j,z))
    + SUM(p_elecheat$p_heat(p_elecheat),
          Elec_CO(p_elecheat,z));

ABORT$(SUM(z$(
       (cb_pool_e(z)>0 AND cb_use_e(z)<=0)
    OR (cb_pool_h(z)>0 AND cb_use_h(z)<=0)),1)>0)
    "Positive electricity/heat emissions without mapped consumption",
    cb_pool_e, cb_pool_h, cb_use_e, cb_use_h;

cb_alloc_e(j,z) = 0;
cb_alloc_h(j,z) = 0;
cb_alloc_e_hh(z) = 0;
cb_alloc_h_hh(z) = 0;

cb_alloc_e(j,z)$(cb_use_e(z)>0)
    = cb_pool_e(z)
    * SUM(p_elecheat$p_elec(p_elecheat),
          Elec_DIO(p_elecheat,j,z))
    / cb_use_e(z);

cb_alloc_h(j,z)$(cb_use_h(z)>0)
    = cb_pool_h(z)
    * SUM(p_elecheat$p_heat(p_elecheat),
          Elec_DIO(p_elecheat,j,z))
    / cb_use_h(z);

cb_alloc_e_hh(z)$(cb_use_e(z)>0)
    = cb_pool_e(z)
    * SUM(p_elecheat$p_elec(p_elecheat),
          Elec_CO(p_elecheat,z))
    / cb_use_e(z);

cb_alloc_h_hh(z)$(cb_use_h(z)>0)
    = cb_pool_h(z)
    * SUM(p_elecheat$p_heat(p_elecheat),
          Elec_CO(p_elecheat,z))
    / cb_use_h(z);

EH_USE_TOTAL(z) = cb_use_e(z)+cb_use_h(z);
CO2_IND_IO(j,z) = cb_alloc_e(j,z)+cb_alloc_h(j,z);
CO2_IND_HO(z) = cb_alloc_e_hh(z)+cb_alloc_h_hh(z);

* Store electricity and heat in their respective product entries.
CO2IO(p_elec,j,z) = cb_alloc_e(j,z);
CO2IO(p_heat,j,z) = cb_alloc_h(j,z);

TCO2IO(j,z) = CO2_DIRECT_IO(j,z)+CO2_IND_IO(j,z);

XSTO2(i,z) = SUM(j$INDtoCOM(j,i),XSTO(j,z));
TCO2IO2(i,z) = SUM(j$INDtoCOM(j,i),TCO2IO(j,z));

cb_int_comb(i,z) = 0;
cb_int_e(i,z) = 0;
cb_int_h(i,z) = 0;

cb_int_comb(i,z)$(XSTO2(i,z)>0)
    = SUM(j$INDtoCOM(j,i),CO2_DIRECT_IO(j,z))
      /XSTO2(i,z)*1e-7;

cb_int_e(i,z)$(XSTO2(i,z)>0)
    = SUM(j$INDtoCOM(j,i),cb_alloc_e(j,z))
      /XSTO2(i,z)*1e-7;

cb_int_h(i,z)$(XSTO2(i,z)>0)
    = SUM(j$INDtoCOM(j,i),cb_alloc_h(j,z))
      /XSTO2(i,z)*1e-7;

* Aggregate-sector policy approximation:
* chemicals proxy fertilisers; non-metallic minerals proxy cement.
* This is not a CN-product-level coverage map.
cb_include_e(i) = 0;
cb_include_e('11_CHEMICAL') = 1;
cb_include_e('12_NONMET') = 1;
*화학, 비철금속에만 전력사용량 포함

CO2CBAMFACTOR(i,z) = 0;
CO2CBAMFACTOR(i,z)$I4(i)
    = cb_int_comb(i,z)+cb_int_h(i,z)
      + cb_include_e(i)*cb_int_e(i,z);

CP0(z) = 0;

*==============================================================================
* 4.3.2 Calibration of other prices and revised volumes (part 2)
 PDO(i,z) = PLO(i,z)*(1+tticO(i,z));
* Benchmark import price: ordinary taxes/margins plus CBAM charge
PMO(i,zj,z)
    = eO(z)*(1+tticO(i,z))*(1+ttimO(i,zj,z))
      *(PWMO(i,zj,z)
        +SUM(ij,PWMGO(ij)*tmrg(ij,i,zj,z)))
    + (CP0(zj)*CO2CBAMFACTOR(i,zj)*eO(z)*PWMO(i,zj,z))
      $(z3(z) AND I4(i) AND NOT SAMEAS(zj,z));
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


 PCIO(j,z) = 1;
 PCEO(j,z) = 1;

 PCIO(j,z)$(ACTIVE_J(j,z) AND CIO(j,z) > 0)
    = SUM[nene, PCO(nene,z)*DIO(nene,j,z)]
      / CIO(j,z);

 PCEO(j,z)$(ACTIVE_J(j,z) AND CEO(j,z) > 0)
    = SUM[ene, PCO(ene,z)*DEO(ene,j,z)]
      / CEO(j,z);

 WTIO(l,j,z)     = WO(l,z)*(1+ttiwO(l,j,z));

 WCO(j,z)$LDCO(j,z)
                 = SUM[l,WTIO(l,j,z)*LDO(l,j,z)]/LDCO(j,z);

*==============================================================================
* 4.3.3 Calibration of other prices and revised volumes (part 3)
*==============================================================================
* The price of capital is arbitrary:
 PKO(z) = 1;

* From GTAP, we know KSTO.
 KSTO(z)         = KSTO(z)/PKO(z);

* Assuming a uniform depreciation rate for all types of capital and all industries:
 delta(z)        = DEPO(z)/[PKO(z)*KSTO(z)];

* Assuming a uniform rental rate R for all types of capital and all industries:
 RKO(k,z)        = 1;

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
* 4.3.4 Calibration of other prices and revised volumes (part 4)
*==============================================================================
 VAO(j,z)        = LDCO(j,z)+KDCO(j,z);
 PVAO(j,z) = 1;
 PVAO(j,z)$(ACTIVE_J(j,z) AND VAO(j,z) > 0)
    = ( WCO(j,z)*LDCO(j,z) + RCO(j,z)*KDCO(j,z)) / VAO(j,z);


 PIXGDPO(z)      = 1;
 PIXGDP_WO       = 1;
 PIXCONO(z)      = 1;
 PIXINVO(z)      = 1;
 PIXGVTO(z)      = 1;

*==============================================================================
* 4.4 Calibration of function parameters
*==============================================================================
* 4.4.1 Leontief functions
*==============================================================================

 io(j,z)  = 0;
 io2(j,z) = 0;
 v(j,z)   = 0;
 v2(j,z)  = 0;

 aij(nene,j,z) = 0;
 aij2(ene,j,z) = 0;

 io(j,z)$ACTIVE_J(j,z)
    = CIO(j,z)/XSTO(j,z);

 io2(j,z)$ACTIVE_J(j,z)
    = CEO(j,z)/XSTO(j,z);

 v(j,z)$ACTIVE_J(j,z)
    = VAO(j,z)/XSTO(j,z);

 v2(j,z)$ACTIVE_J(j,z)
    = (CEO(j,z)+VAO(j,z))/XSTO(j,z);

 aij(nene,j,z)$(ACTIVE_J(j,z) AND CIO(j,z) > 0)
    = DIO(nene,j,z)/CIO(j,z);

 aij2(ene,j,z)$(ACTIVE_J(j,z) AND CEO(j,z) > 0)
    = DEO(ene,j,z)/CEO(j,z);


*==============================================================================
* 4.4.2 Calibration of CET parameters
*==============================================================================
* 4.4.2.1 CET between total exports, domestic supply and margins
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
* 4.4.2.2 CET between exports to different trading partners
*==============================================================================
 rho_X2(i,z)     = (1+sigma_X2(i,z))/sigma_X2(i,z);

 beta_X2(i,z,zj)$EXO(i,z,zj)
                 = [PEO(i,z,zj)*EXO(i,z,zj)**(1-rho_X2(i,z))]/
                   SUM[zjj$EXO(i,z,zjj),PEO(i,z,zjj)*EXO(i,z,zjj)
                   **(1-rho_X2(i,z))];
 B_X2(i,z)       = EXTO(i,z)/{SUM[zj,beta_X2(i,z,zj)*EXO(i,z,zj)**rho_X2(i,z)]
                   **(1/rho_X2(i,z))};

*==============================================================================
* 4.4.3 Calibration of CES parameters
*==============================================================================
* 4.4.3.0 Composite output
*==============================================================================
 rho_X3(i,z)   = (1-sigma_X3(i,z))/sigma_X3(i,z);

 beta_X3(j,i,z)$XSO(j,i,z)
               = [PO2(j,i,z)*XSO(j,i,z)**(1+rho_X3(i,z))]/
                   SUM[jj$XSO(jj,i,z),PO2(jj,i,z)*XSO(jj,i,z)**(1+rho_X3(i,z))];

 B_X3(i,z)     = XSO_I(i,z)
                  /SUM[jj$XSO(jj,i,z),beta_X3(jj,i,z)*XSO(jj,i,z)**(-rho_X3(i,z))
                  ]**(-1/rho_X3(i,z));


 sigma_X4(z) = 2;


POWERQO(z)
    = SUM[power$ACTIVE_POWER(power,z),
          XSO(power,'18_ELEC',z)];

* sigma_X4 is specified in PAR.gms.
rho_X4(z) = (1-sigma_X4(z))/sigma_X4(z);

beta_X4(power,z) = 0;

beta_X4(power,z)$ACTIVE_POWER(power,z)
    = (PO2(power,'18_ELEC',z)
        *XSO(power,'18_ELEC',z)**(1+rho_X4(z)))
      / SUM[power2$ACTIVE_POWER(power2,z),
            PO2(power2,'18_ELEC',z)
            *XSO(power2,'18_ELEC',z)**(1+rho_X4(z))];

B_X4(z) = 1;

B_X4(z)$(POWERQO(z) > 0)
    = POWERQO(z)
      / (SUM[power2$ACTIVE_POWER(power2,z),
              beta_X4(power2,z)
              *XSO(power2,'18_ELEC',z)**(-rho_X4(z))] )**(-1/rho_X4(z));

TnDShare(z)
    = XSO('18_TnD','18_ELEC',z)/XSO_I('18_ELEC',z);

PPOWERO(z) = 1;

*==============================================================================
* 4.4.3.1 Composite good
*==============================================================================
 rho_M1(i,z)     = (1-sigma_m1(i,z))/sigma_m1(i,z);
 beta_M1(i,z)    = PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)/
                  {PDO(i,z)*DDO(i,z)**(rho_M1(i,z)+1)
                  +PMTO(i,z)*IMTO(i,z)**(rho_M1(i,z)+1)};
 B_M1(i,z)       = QO(i,z)/{beta_M1(i,z)*IMTO(i,z)**(-rho_M1(i,z))
                  +(1-beta_M1(i,z))*DDO(i,z)**(-rho_M1(i,z))}**(-1/rho_M1(i,z));

*==============================================================================
* 4.4.3.2 CES between imports from different trading partners
*==============================================================================
 rho_M2(i,z)     = (1-sigma_M2(i,z))/sigma_M2(i,z);
 beta_M2(i,zj,z)$IMO(i,zj,z)
                 = [PMO(i,zj,z)*IMO(i,zj,z)**(rho_M2(i,z)+1)]/
                   SUM[zjj$IMO(i,zjj,z),PMO(i,zjj,z)*IMO(i,zjj,z)
                    **(rho_M2(i,z)+1)];
 B_M2(i,z)       = IMTO(i,z)/{SUM[zj$IMO(i,zj,z),beta_M2(i,zj,z)*IMO(i,zj,z)
                   **(-rho_M2(i,z))]**(-1/rho_M2(i,z))};

*==============================================================================
* 4.4.3.3 Composite capital
*==============================================================================

 rho_KD(j,z)$ACTIVE_J(j,z) = (1-sigma_KD(j,z))/sigma_KD(j,z);

 beta_KD(k,j,z)$KDO(k,j,z)
                 = [RTIO(k,j,z)*KDO(k,j,z)**(1+rho_KD(j,z))]/
                   SUM[kj$KDO(kj,j,z),RTIO(kj,j,z)*KDO(kj,j,z)**(1+rho_KD(j,z))];

 B_KD(j,z)$KDCO(j,z)
                 = KDCO(j,z)/{SUM[k$KDO(k,j,z),beta_KD(k,j,z)*KDO(k,j,z)
                   **(-rho_KD(j,z))]**(-1/rho_KD(j,z))};

*==============================================================================
* 4.4.3.4 Composite labor
*==============================================================================

 rho_LD(j,z)$ACTIVE_J(j,z)   = (1-sigma_LD(j,z))/sigma_LD(j,z);

 beta_LD(l,j,z)$LDO(l,j,z)  = [WTIO(l,j,z)*LDO(l,j,z)**(1+rho_LD(j,z))]/
                  SUM[lj$LDO(lj,j,z),WTIO(lj,j,z)*LDO(lj,j,z)
                   **(1+rho_LD(j,z))];
 B_LD(j,z)$LDCO(j,z)
                 = LDCO(j,z)/{SUM[l$LDO(l,j,z),beta_LD(l,j,z)*LDO(l,j,z)
                   **(-rho_LD(j,z))]**(-1/rho_LD(j,z))};

*===============================================================================
* Composite E
*===============================================================================

 rho_ENER(j,z)$ACTIVE_J(j,z) = (1-sigma_ENER(j,z))/sigma_ENER(j,z);

 beta_ENER(ene,j,z)$DEO(ene,j,z)
                 = [PO4(ene,j,z)*DEO(ene,j,z)**(1+rho_ENER(j,z))]/
                   SUM[ene2$DIO(ene,j,z),DEO(ene2,j,z)**(1+rho_ENER(j,z))];

 B_ENER(j,z)$CEO(j,z)    = CEO(j,z)/{SUM[ene$DEO(ene,j,z),beta_ENER(ene,j,z)*DEO(ene,j,z)
                   **(-rho_ENER(j,z))]**(-1/rho_ENER(j,z))};

*==============================================================================
* 4.4.3.5 Value added
*==============================================================================
 sigma_VA('10_PETROLCOAL',z) = 1.260;
 rho_VA(j,z)$ACTIVE_J(j,z) = (1-sigma_VA(j,z))/sigma_VA(j,z);

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
* Composite KLE
*==============================================================================
 KLEO(j,z)       = CEO(j,z) + VAO(j,z) ;
 PKLEO(j,z) = 1;
 PKLEO(j,z)$(ACTIVE_J(j,z) AND KLEO(j,z) > 0)
    = (PCEO(j,z)*CEO(j,z)+ PVAO(j,z)*VAO(j,z)) / KLEO(j,z);
 rho_KLE(j,z)$ACTIVE_J(j,z) = (1-sigma_KLE(j,z))/sigma_KLE(j,z);
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
* 4.4.4 Calibration of LES parameters
*==============================================================================
 sigma_Y(i,z)    = sigma_Y(i,z)/{SUM[ij,sigma_Y(ij,z)*PCO(ij,z)*CO(ij,z)]
                   /CTHO(z)};
 gamma_LES(i,z)  = PCO(i,z)*CO(i,z)*sigma_Y(i,z)/CTHO(z);

 CMINO(i,z)      = CO(i,z)+gamma_LES(i,z)*CTHO(z)/{PCO(i,z)*frisch(z)};

*==============================================================================
* 4.5 Calibration of gross domestic products
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
* 4.6 Calibration of real (volume) variables computed from price indices
*==============================================================================
 CABXO(z)        = CABO(z)/[PIXGDP_WO*eO(z)];
 CTH_REALO(z)    = CTHO(z)/PIXCONO(z);
 G_REALO(z)      = GO(z)/PIXGVTO(z);
 GDP_BP_REALO(z) = GDP_BPO(z)/PIXGDPO(z);
 GDP_BP_W_REALO  = GDP_BP_WO/PIXGDP_WO;
 GDP_MP_REALO(z) = GDP_MPO(z)/PIXCONO(z);
 IT_REALO(z)     = ITO(z)/PIXINVO(z);

*==============================================================================
* 4.7 Parameters of the household savings function
*==============================================================================
 sh1O(z)         = [SHO(z)+SGO(z)]/GDP_IBO(z);
 sh0O(z)         = SHO(z)-sh1O(z)*YDHO(z);

*==============================================================================
* 4.8 Calibration of indexed transfers and parameters
*==============================================================================
 ttdh0O(z)       = ttdh0O(z)/PIXCONO(z)**eta;
 sh0O(z)         = sh0O(z)/PIXCONO(z)**eta;

*==============================================================================
* 4.10 Energy
*==============================================================================
Parameter
 EEI(product,j,z)  Energy intensity by industry sector ktoe per 10 billion $
 NEI(product,j,z)  Non-Energy intensity by production sectos ktoe per 10 billion $
 EHI(product,z)    Energy intensity by household ktoe per 10 billion $
 EEO(product,j,z)  Initial Industry energy consumption in region z ktoe
 NEO(product,j,z)  Initial Industry non energy consumption in region z ktoe
 EHO(product,z)    Initial Household energy consumption in region z ktoe
;

 EEI(p_coal,j,z)$(DEO('02_COAL',j,z) gt 0)               = Coal_DIO(p_coal,j,z)/DEO('02_COAL',j,z);
 EEI(p_oil,j,z)$(DEO('03_OIL',j,z) gt 0)                 = Oil_DIO(p_oil,j,z)/DEO('03_OIL',j,z);
 EEI(p_gas,j,z)$(DEO('04_GAS',j,z) gt 0)                 = Gas_DIO(p_gas,j,z)/DEO('04_GAS',j,z);
 EEI(p_oilproduct,j,z)$(DEO('10_PETROLCOAL',j,z) gt 0)   = Oilp_DIO(p_oilproduct,j,z)/DEO('10_PETROLCOAL',j,z);
 EEI(p_elecheat,j,z)$(DEO('18_ELEC',j,z) gt 0)           = Elec_DIO(p_elecheat,j,z)/DEO('18_ELEC',j,z);

 NEI(p_coal,j,z)$(DEO('02_COAL',j,z) gt 0)               = NCoal_DIO(p_coal,j,z)/DEO('02_COAL',j,z);
 NEI(p_oil,j,z)$(DEO('03_OIL',j,z) gt 0)                 = NOil_DIO(p_oil,j,z)/DEO('03_OIL',j,z);
 NEI(p_gas,j,z)$(DEO('04_GAS',j,z) gt 0)                 = NGas_DIO(p_gas,j,z)/DEO('04_GAS',j,z);
 NEI(p_oilproduct,j,z)$(DEO('10_PETROLCOAL',j,z) gt 0)   = NOilp_DIO(p_oilproduct,j,z)/DEO('10_PETROLCOAL',j,z);

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

*==============================================================================
* 4.11 CO2FACTOR and CTAX
*==============================================================================
Parameters
 CO2FACTOR(ene,j,z)     CO2 emissions factor (tCO2 per 100$)
 CTAX0(z)               initial Carbon tax 100$ per ton CO2
 TCTAX0(z)              initial Government Revenue from Carbon tax
;

 CO2FACTOR(ene,j,z) = 0 ;
 CO2FACTOR('02_COAL',j,z)$DEO('02_COAL',j,z) = [sum(p_coal,CO2IO(p_coal,j,z))/DEO('02_COAL',j,z)]*(1000/(10**8));
 CO2FACTOR('04_GAS',j,z)$DEO('04_GAS',j,z) = [sum(p_gas,CO2IO(p_gas,j,z))/DEO('04_GAS',j,z)]*(1000/(10**8));
 CO2FACTOR('10_PETROLCOAL',j,z)$DEO('10_PETROLCOAL',j,z) = [sum(p_oilproduct,CO2IO(p_oilproduct,j,z))/DEO('10_PETROLCOAL',j,z)]*(1000/(10**8));

 CO2FACTOR('10_PETROLCOAL','10_PETROLCOAL',z) = 0;

 CTAX0(z) = 0;
 TCTAX0(z) = 0;

* Benchmark CBAM revenue: same coverage and charge as EQ16_4
TCBAMO(z)
    = SUM((i,zj)$(z3(z) AND I4(i)
                  AND NOT SAMEAS(zj,z)
                  AND IMO(i,zj,z)>0),
          CP0(zj)*CO2CBAMFACTOR(i,zj)*eO(z)
          *IMO(i,zj,z)*PWMO(i,zj,z));


 ttip_shareO(j,z)$(eNFs(j) and sum(jj$eNFs(jj), XSTO(jj,z)*PPO(jj,z)))
                  = XSTO(j,z)*PPO(j,z)/sum(jj$eNFs(jj), XSTO(jj,z)*PPO(jj,z));
 ttiw_shareO(l,j,z)$(J11(j) and SUM[(lj,jj)$J11(jj), WO(lj,z)*LDO(lj,jj,z)])
                  = WO(l,z)*LDO(l,j,z)/SUM[(lj,jj)$J11(jj), WO(lj,z)*LDO(lj,jj,z)];
