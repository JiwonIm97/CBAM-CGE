* ==============================================================================
* Scenario/Apply_Policy.gms
* rcy_* 스위치를 읽어 (i) 배분 정합성을 검증하고 (ii) 활성 도구변수를 자유화.
* 시나리오 파일에서 스위치를 설정한 "직후", solve "이전"에 호출.
* ==============================================================================
* --- (i) 배분 정합성 검증: 징수지역의 배분 비율 합은 0 또는 1 ---
 rcy_chk(z) = SUM(zj, rcy_share(z,zj));
 ABORT$(SMAX(z, ABS(rcy_chk(z))*ABS(rcy_chk(z)-1)) > 1e-8)
     "rcy_share: collecting-region shares must sum to 0 or 1", rcy_chk;

* --- 환류 수단 중복 지정 금지 ---
 ABORT$(SMAX(z, rcy_hh(z)+rcy_gov(z)+rcy_lab(z)+rcy_prd(z)) > 1)
     "only one recycling instrument per region is allowed";

* --- (ii) rcy_prd 활성 영역: ttip / deltattip / ttip_share 자유화 ---
 ttip.LO(j,z)$(eNFs(j) and rcy_prd(z))         = -INF;
 ttip.UP(j,z)$(eNFs(j) and rcy_prd(z))         = +INF;
 deltattip.LO(j,z)$(eNFs(j) and rcy_prd(z))    = -INF;
 deltattip.UP(j,z)$(eNFs(j) and rcy_prd(z))    = +INF;
 ttip_share.LO(j,z)$(eNFs(j) and rcy_prd(z))   = -INF;
 ttip_share.UP(j,z)$(eNFs(j) and rcy_prd(z))   = +INF;

* --- rcy_lab 활성 영역: ttiw / deltattiw / ttiw_share 자유화 ---
 ttiw.LO(l,j,z)$(J11(j) and rcy_lab(z))        = -INF;
 ttiw.UP(l,j,z)$(J11(j) and rcy_lab(z))        = +INF;
 deltattiw.LO(l,j,z)$(J11(j) and rcy_lab(z))   = -INF;
 deltattiw.UP(l,j,z)$(J11(j) and rcy_lab(z))   = +INF;
 ttiw_share.LO(l,j,z)$(J11(j) and rcy_lab(z))  = -INF;
 ttiw_share.UP(l,j,z)$(J11(j) and rcy_lab(z))  = +INF;
