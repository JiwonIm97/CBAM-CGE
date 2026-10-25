* ==============================================================================
* Scenario/Reset_Policy.gms
* 시나리오 간 오염 방지: 모든 정책 스위치와 도구변수를 벤치마크 상태로 되돌림.
* 매 시나리오 solve 파일 앞에서 호출.
* ==============================================================================
* --- 환류 스위치 ---
 rcy_share(z,zj) = 0;
 rcy_hh(z)  = 0;   rcy_gov(z) = 0;
 rcy_lab(z) = 0;   rcy_prd(z) = 0;
 rcy_chk(z)     = 0;
 rcy_use_chk(z) = 0;
* --- 탄소가격 ---
 CTAX.FX(z) = CTAX0(z);
 CP.FX(z)   = 0;

* --- 환류 도구변수: 전 영역 고정(=비활성) ---
 deltattip.FX(j,z)     = 0;
 deltattiw.FX(l,j,z)   = 0;
 ttip_share.FX(j,z)    = ttip_shareO(j,z);
 ttiw_share.FX(l,j,z)  = ttiw_shareO(l,j,z);

 EX.scale(i,z,zj)$(EXO(i,z,zj)>0)
    = EXO(i,z,zj);

 IM.scale(i,zj,z)$(IMO(i,zj,z)>0)
    = IMO(i,zj,z);

* Export allocation equation
 EQ44.scale(i,z,zj)$(EXO(i,z,zj)>0)
    = EXO(i,z,zj);

* Import allocation equation
 EQ48.scale(i,zj,z)$(IMO(i,zj,z)>0)
    = IMO(i,zj,z);

* Bilateral export-import consistency
 EQ77.scale(i,z,zj)$(EXO(i,z,zj)>0)
    = EXO(i,z,zj);
