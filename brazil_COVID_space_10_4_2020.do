/*
ssc install spmap
ssc instal sppack
ssc instal shap2dta
sscinstal mif2dta
net instal xsmle, all from(http://ww.econometrics.it/stata)
findit sg162
adoupdate, update
 *ftp://geoftp.ibge.gov.br/malhas_digitais/ 
*/

use "/Users/tatianemenezes/Downloads/banco/internacao fev e mar 2019.dta", clear
so uf mes
sa "/Users/tatianemenezes/Downloads/banco/internacao fev e mar 2019.dta", replace


u "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_cov.dta", clear

drop dia mes 

split date , parse("/") gen(ndate)
destring ndate1, gen(dia)
destring ndate2, gen(mes)

so uf mes
merge uf mes using "/Users/tatianemenezes/Downloads/banco/internacao fev e mar 2019.dta"
tab _me
drop if _mer==2
drop if mes==1
drop _mer

egen md= mean(diab), by(state mes)
egen td=mean(diab), by(state)
replace diab=md if diab==.
replace diab=td if diab==.

egen mc= mean(corac), by(state mes)
egen tc=mean(corac), by(state)
replace corac=mc if corac==.
replace corac=tc if corac==.

egen mh= mean(hiper), by(state mes)
egen th=mean(hiper), by(state)
replace hiper=mh if hiper==.
replace hiper=th if hiper==.

egen mhi= mean(hiv), by(state mes)
egen thi=mean(hiv), by(state)
replace hiv=mhi if hiv==.
replace hiv=thi if hiv==.

egen mr= mean(resp), by(state mes)
egen tr=mean(resp), by(state)
replace resp=mr if resp==.
replace resp=tr if resp==.

collapse (mean) expvida renda pop popido insolacao temperatura umidade ///
entrada_inter  resp corac diab hiper hiv (sum) suspects refuses cases deaths, by(uf dia)


*so uf dia mes
*by uf: gen id=_n

ren uf state

reshape wide resp corac diab hiper hiv renda expvida pop popido insolacao temperatura umidade entrada_inter ///
suspects refuses cases deaths, i(state) j(dia)
reshape long

sa "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_covb.dta", replace
u "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_covb.dta", replace

so state dia
by state: replace entrada_inter = entrada_inter[_n+1] if entrada_inter==. & entrada_inter[_n+1]~=.
by state: replace entrada_inter = entrada_inter[_n+28] if entrada_inter==. & entrada_inter[_n+28]~=.
by state: replace entrada_inter = entrada_inter[_n-1] if entrada_inter==. & entrada_inter[_n-1]~=.

by state: replace umidade = umidade[_n+1] if umidade==. & umidade[_n+1]~=.
by state: replace umidade = umidade[_n+28] if umidade==. & umidade[_n+28]~=.
by state: replace umidade = umidade[_n-1] if umidade==. & umidade[_n-1]~=.

by state: replace temperatura = temperatura[_n+1] if temperatura==. & temperatura[_n+1]~=.
by state: replace temperatura = temperatura[_n+28] if temperatura==. & temperatura[_n+28]~=.
by state: replace temperatura = temperatura[_n-1] if temperatura==. & temperatura[_n-1]~=.

by state: replace insolacao = insolacao[_n+1] if insolacao==. & insolacao[_n+1]~=.
by state: replace insolacao = insolacao[_n+28] if insolacao==. & insolacao[_n+28]~=.
by state: replace insolacao = insolacao[_n-1] if insolacao==. & insolacao[_n-1]~=.

by state: replace popido = popido[_n+1] if popido==. & popido[_n+1]~=.
by state: replace popido = popido[_n+28] if popido==. & popido[_n+28]~=.
by state: replace popido = popido[_n-1] if popido==. & popido[_n-1]~=.

by state: replace expvida = expvida[_n+1] if expvida==. & expvida[_n+1]~=.
by state: replace expvida = expvida[_n+28] if expvida==. & expvida[_n+28]~=.
by state: replace expvida = expvida[_n-1] if expvida==. & expvida[_n-1]~=.

by state: replace renda = renda[_n+1] if renda==. & renda[_n+1]~=.
by state: replace renda = renda[_n+28] if renda==. & renda[_n+28]~=.
by state: replace renda = renda[_n-1] if renda==. & renda[_n-1]~=.

by state: replace pop = pop[_n+1] if pop==. & pop[_n+1]~=.
by state: replace pop = pop[_n+28] if pop==. & pop[_n+28]~=.
by state: replace pop = pop[_n-1] if pop==. & pop[_n-1]~=.

by state: replace diab = diab[_n+28] if diab==. & diab[_n+28]~=.
by state: replace diab = diab[_n-1] if diab==. & diab[_n-1]~=.

by state: replace resp = resp[_n+28] if resp==. & resp[_n+28]~=.
by state: replace resp = resp[_n-1] if resp==. & resp[_n-1]~=.

by state: replace corac = corac[_n+28] if corac==. & corac[_n+28]~=.
by state: replace corac = corac[_n-1] if corac==. & corac[_n-1]~=.

by state: replace hiper = hiper[_n+28] if hiper==. & hiper[_n+28]~=.
by state: replace hiper = hiper[_n-1] if hiper==. & hiper[_n-1]~=.

by state: replace hiv = hiv[_n+28] if hiv==. & hiv[_n+28]~=.
by state: replace hiv = hiv[_n-1] if hiv==. & hiv[_n-1]~=.

replace deaths= 0 if deaths==.
replace cases= 0 if cases==.
replace suspects= 0 if suspects==.
replace refuses= 0 if refuses==.

*collapse (mean) expvida renda pop popido insolacao temperatura umidade ///
*entrada_inter  resp corac diab hiper hiv (sum) suspects refuses cases deaths, by(state dia)

reshape wide


so state
sa "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_cov_.dta", replace

shp2dta using "/Users/tatianemenezes/Desktop/COVID-19/shape state/BRUFE250GC_SIR.shp", ///
database(dbstate) coordinates(statexy) genid(idstate) gencentroids(statecent)  replace

use  dbstate.dta, clear
ren CD_GEOCUF state
so state
destring state, replace

merge 1:1 state using "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_cov_.dta"
tab _mer
drop _mer
save "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_cov_2.dta", replace

*CRIANDO A MATRIZ DE PESOS

*criando matriz de contiguidade (QUEEN) 

spmat drop wcont
spmat contiguity wcont using statexy.dta, id(idstate) 
spmat summarize wcont, links
spmat save wcont using wcont.spmat, replace
spmat use wcont using wcont.spmat, replace

*Criando a Matriz contígua, normalizada por row
spmat drop wnorm1
spmat contiguity wnorm1 using statexy.dta, id(idstate) normalize(row)
spmat summarize wnorm1, links
spmat save wnorm1 using wnorm1.spmat, replace
spmat use wnorm1 using wnorm1.spmat, replace

reshape long

gen lnpop=ln(pop)
gen lnlifeexp=ln(expvida)
gen lnforing=ln(entrada_inter+1)
gen p_foring=entrada_inter/pop
gen lnincome=ln(renda)
gen p_old=popido/pop
gen lnold= ln(popido)
gen lntemp =ln(temperatura+1)
gen lnhuminit=ln(umidade+1)
gen lnsun= ln(insolacao+1)

gen txcases=(cases/pop)*100000
gen txsuspect=(suspects/pop)*100000
gen txdeaths=(deaths/pop)*100000
gen txref=(refuses/pop)*100000

xtset state dia

*SAR MODEL

xsmle txcases lntemp lnsun lnhum  lnforing resp diab cora , ///
wmat(wnorm1) fe type(ind) nsim(500) nolog

xsmle txcases lntemp lnsun lnhum  lnforing resp diab cora, ///
wmat(wnorm1) model(sdm) fe type(ind) nsim(500) nolog

xsmle txd lntemp lnsun lnhum  lnforing resp diab cora , ///
wmat(wnorm1) fe type(ind) nsim(500) nolog

xsmle txd lntemp lnsun lnhum  lnforing resp diab cora, ///
wmat(wnorm1) model(sdm) fe type(ind) nsim(500) nolog

xsmle txs lntemp lnsun lnhum  lnforing resp diab cora , ///
wmat(wnorm1) fe type(ind) nsim(500) nolog

xsmle txr lntemp lnsun lnhum  lnforing resp diab cora, ///
wmat(wnorm1) model(sdm) fe type(ind) nsim(500) nolog

xsmle txr lntemp lnsun lnhum  lnforing resp diab cora, ///
wmat(wnorm1) model(sdm) fe type(ind) nsim(500) nolog


xtset  state mes
 


 xsmle cases lnpop lnw lnsun, wmat(Wst) model(sar)







 spgrid using "statecoord", /// 
shape(hexagonal) xdim(100) /// 
verbose replace compress /// 
cells("BR-GridCells(HexValid).dta") ///
points("BR-GridPoints(HexValid).dta")


u "/Users/tatianemenezes/Desktop/COVID-19/br_COVID_cov_shape.dta", clear

spkde cases suspect  using "BR-GridPoints(HexValid).dta", ///
xcoord(x_a) ycoord(y_a) ///
kernel(normal) bandwidth(ndp) ndp(3) ///
verbose saving("BR-Kde2.dta", replace)

use "BR-Kde2.dta", clear


*-----Mapas-----*

spmap cases_lambda using ///
"BR-GridCells(HexValid).dta", ///
id(spgrid_id) clnum(10) fcolor(Rainbow) ///
ocolor(none ..) legend(off) polygon(data("statecoord")) 

spmap suspect_lambda using ///
"BR-GridCells(HexValid).dta", ///
id(spgrid_id) clnum(10) fcolor(Rainbow) ///
ocolor(none ..) legend(off) polygon(data("statecoord")) 


 
