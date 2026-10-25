* ==============================================================================
* Scenario/Apply_Policy.gms
*
* Call AFTER assigning rcy_share and instrument-use shares,
* and BEFORE SOLVE.
*
* Instrument-use shares may take any value in [0,1].
* Reset instrument bounds before releasing the active domains.
* ==============================================================================

*------------------------------------------------------------------------------
* 1. Check transfers between regions
*------------------------------------------------------------------------------

abort$(smin((z,zj), rcy_share(z,zj)) < 0
    or smax((z,zj), rcy_share(z,zj)) > 1)
    "rcy_share must lie in [0,1]", rcy_share;

rcy_chk(z) = sum(zj, rcy_share(z,zj));

* Each collecting-region row must sum to zero or one.
abort$(smax(z, min(abs(rcy_chk(z)),
                  abs(rcy_chk(z)-1))) > rcy_tol)
    "Each transfer row must sum to zero or one", rcy_chk;

* Only CBAM collecting regions may allocate CBAM revenue.
abort$(sum(z$(not z3(z)), rcy_chk(z)) > rcy_tol)
    "A non-collecting region has allocated CBAM revenue", rcy_chk;

*------------------------------------------------------------------------------
* 2. Check revenue-use shares
*------------------------------------------------------------------------------

abort$(smin(z, rcy_hh(z))  < 0
    or smin(z, rcy_gov(z)) < 0
    or smin(z, rcy_lab(z)) < 0
    or smin(z, rcy_prd(z)) < 0
    or smax(z, rcy_hh(z))  > 1
    or smax(z, rcy_gov(z)) > 1
    or smax(z, rcy_lab(z)) > 1
    or smax(z, rcy_prd(z)) > 1)
    "Revenue-use shares must lie in [0,1]",
    rcy_hh, rcy_gov, rcy_lab, rcy_prd;

rcy_use_chk(z)
    = rcy_hh(z)+rcy_gov(z)+rcy_lab(z)+rcy_prd(z);

abort$(smax(z, rcy_use_chk(z)) > 1+rcy_tol)
    "Revenue-use shares exceed one", rcy_use_chk;

* Every designated recipient must allocate its entire received revenue.
* Check the allocation parameters, not the previous solution's TCBAM.L.
abort$(sum(z$(sum(zj, rcy_share(zj,z)) > 0
           and abs(rcy_use_chk(z)-1) > rcy_tol), 1) > 0)
    "Revenue-use shares must sum to one in receiving regions",
    rcy_use_chk;

*------------------------------------------------------------------------------
* 3. Check positive benchmark bases for active instruments
*------------------------------------------------------------------------------

abort$(sum(z$(rcy_prd(z) > 0
           and sum(j$(eREN(j) and ACTIVE_J(j,z)),
                   XSTO(j,z)*PPO(j,z)) <= 0), 1) > 0)
    "REN recycling requires a positive eligible benchmark output base";

abort$(sum(z$(rcy_lab(z) > 0
           and sum((l,j)$(J11(j) and ACTIVE_J(j,z)
                                and LDO(l,j,z)>0),
                   WO(l,z)*LDO(l,j,z)) <= 0), 1) > 0)
    "LAB recycling requires a positive eligible benchmark wage bill";

*------------------------------------------------------------------------------
* 4. Reset all recycling instruments
*
* These tax rates are controlled by the recycling policy in this design.
* This prevents previously released variables from remaining free when
* switching instruments or reaching a=0 or a=1.
*------------------------------------------------------------------------------

ttip.FX(j,z)         = ttipO(j,z);
ttiw.FX(l,j,z)       = ttiwO(l,j,z);

deltattip.FX(j,z)    = 0;
deltattiw.FX(l,j,z)  = 0;

ttip_share.FX(j,z)   = 0;
ttiw_share.FX(l,j,z) = 0;

*------------------------------------------------------------------------------
* 5. Release REN instruments: same domain as EQ96--EQ98
*------------------------------------------------------------------------------

ttip.LO(j,z)$(eREN(j) and ACTIVE_J(j,z)
                      and rcy_prd(z)>0) = -INF;
ttip.UP(j,z)$(eREN(j) and ACTIVE_J(j,z)
                      and rcy_prd(z)>0) = +INF;

deltattip.LO(j,z)$(eREN(j) and ACTIVE_J(j,z)
                           and rcy_prd(z)>0) = -INF;
deltattip.UP(j,z)$(eREN(j) and ACTIVE_J(j,z)
                           and rcy_prd(z)>0) = 0;

ttip_share.LO(j,z)$(eREN(j) and ACTIVE_J(j,z)
                           and rcy_prd(z)>0) = 0;
ttip_share.UP(j,z)$(eREN(j) and ACTIVE_J(j,z)
                           and rcy_prd(z)>0) = 1;

* Initial within-REN allocation shares.
ttip_share.L(j,z)$(eREN(j) and ACTIVE_J(j,z)
                          and rcy_prd(z)>0)
    = XSTO(j,z)*PPO(j,z)
      /sum(jj$(eREN(jj) and ACTIVE_J(jj,z)),
           XSTO(jj,z)*PPO(jj,z));

*------------------------------------------------------------------------------
* 6. Release LAB instruments: same domain as EQ99--EQ101
*------------------------------------------------------------------------------

ttiw.LO(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                      and LDO(l,j,z)>0 and rcy_lab(z)>0) = -INF;
ttiw.UP(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                      and LDO(l,j,z)>0 and rcy_lab(z)>0) = +INF;

deltattiw.LO(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                           and LDO(l,j,z)>0 and rcy_lab(z)>0) = -INF;
deltattiw.UP(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                           and LDO(l,j,z)>0 and rcy_lab(z)>0) = 0;

ttiw_share.LO(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                            and LDO(l,j,z)>0 and rcy_lab(z)>0) = 0;
ttiw_share.UP(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                            and LDO(l,j,z)>0 and rcy_lab(z)>0) = 1;

* Initial within-LAB allocation shares.
ttiw_share.L(l,j,z)$(J11(j) and ACTIVE_J(j,z)
                           and LDO(l,j,z)>0 and rcy_lab(z)>0)
    = WO(l,z)*LDO(l,j,z)
      /sum((lj,jj)$(J11(jj) and ACTIVE_J(jj,z)
                            and LDO(lj,jj,z)>0),
           WO(lj,z)*LDO(lj,jj,z));
