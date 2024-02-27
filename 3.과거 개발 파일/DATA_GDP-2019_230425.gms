*=== Import from Excel using GDX utilities
Set
Hist / 2010*2021/
DEF / USDEF2010/

*Unit Current USD
Parameter
GDPMER(z,Hist),
GDPPPP(z,Hist),
DEF2010(Hist,DEF),
PPPexr(z)
;

$onEcho > GDP19.txt
par=GDPMER   rng=GDPMER!A1:M18
par=GDPPPP   rng=GDPPPP!A1:M18
par=DEF2010  rng=USDEF2010!A1:M18
$offEcho

$call gdxxrw 230425_WBGDP.xlsx @GDP19.txt trace=0
$gdxIn 230425_WBGDP.gdx
$load GDPMER GDPPPP DEF2010
$gdxIn

*Scaling USD to 10 billon
GDPMER('06_PRK', '2021') = GDPMER('06_PRK', '2020');

*GDPMER(z, Hist) = GDPMER(z, Hist)/10**13 ;
GDPPPP('06_PRK', Hist) = 10000000000000 ;
*GDPPPP(z, Hist) = GDPPPP(z, Hist)/10**13 ;

PPPexr(z)  = GDPPPP(z, '2019') / GDPMER(z, '2019');
PPPexr('06_PRK')  = PPPexr('05_MNG')

execute_unload 'GDP_2019_230425',


GDPMER, GDPPPP, DEF2010 ;
