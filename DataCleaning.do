* Open file:


use "/afs/crc.nd.edu/user/s/sleyguti/data060615_nomiss.dta", clear


* Create new variables:


gen pri_perctminus1secc=pritminus1secc/lnsecctminus1
gen prd_perctminus1secc=prdtminus1secc/lnsecctminus1
gen pan_perctminus1secc=pantminus1secc/lnsecctminus1
gen turnout_tminus1secc=totaltminus1secc/lnsecctminus1

gen pri_perctminus2secc=pritminus2secc/lnsecctminus2
gen prd_perctminus2secc=prdtminus2secc/lnsecctminus2
gen pan_perctminus2secc=pantminus2secc/lnsecctminus2
gen turnout_tminus2secc=totaltminus2secc/lnsecctminus2

gen percsenior=senior/pob

gen homrate=(hom_t/pob)*100000
gen homrate_tminus1=(hom_tminus1/pob)*100000

gen homratechange=homrate-homrate_tminus1


gen pri_perctminus1muni=pritminus1muni/lnmunitminus1
gen prd_perctminus1muni=prdtminus1muni/lnmunitminus1
gen pan_perctminus1muni=pantminus1muni/lnmunitminus1
gen turnout_tminus1muni=totaltminus1muni/lnmunitminus1

gen pri_perctminus2muni=pritminus2muni/lnmunitminus2
gen prd_perctminus2muni=prdtminus2muni/lnmunitminus2
gen pan_perctminus2muni=pantminus2muni/lnmunitminus2
gen turnout_tminus2muni=totaltminus2muni/lnmunitminus2

gen age2=age^2

gen lnpob=ln(pob)

gen presidential=0
recode presidential 0=1 if year==2000
recode presidential 0=1 if year==2006
recode presidential 0=1 if year==2012

gen pristrg=0
recode pristrg 0=1 if pri_perctminus1muni>prd_perctminus1muni & pri_perctminus1muni>pan_perctminus1muni & pri_perctminus2muni>prd_perctminus2muni & pri_perctminus2muni>pan_perctminus2muni

gen prdstrg=0
recode prdstrg 0=1 if prd_perctminus1muni>pri_perctminus1muni & prd_perctminus1muni>pan_perctminus1muni & prd_perctminus2muni>pri_perctminus2muni & prd_perctminus2muni>pan_perctminus2muni

gen panstrg=0
recode panstrg 0=1

**Reducing the size of the file

*a. Drop variables
drop v1 lnsecct lnmunit lnsecctminus1 lnmunitminus1 lnsecctminus2 lnmunitminus2 pritminus1secc pantminus1secc prdtminus1secc totaltminus1secc pritminus1muni pantminus1muni prdtminus1muni totaltminus1muni pritminus2secc pantminus2secc prdtminus2secc totaltminus2secc pritminus2muni pantminus2muni prdtminus2muni totaltminus2muni pvemi pvemw senior cabecera distrito nombre_estado sexo notificacion nombramiento yearalternancia

drop cve_inegi locality hom_tminus2 hom_tminus3 hom_tminus1 locality year2 id_mun nom_ent_inegi nom_mun_inegi cve_mun_inegi clave observaciones_notificacion observacion_nombramiento year1 id_seccion

drop turnout_tminus2muni pan_perctminus2muni prd_perctminus2muni pri_perctminus2muni turnout_tminus1muni pan_perctminus1muni prd_perctminus1muni pri_perctminus1muni turnout_tminus2secc pan_perctminus2secc prd_perctminus2secc pri_perctminus2secc

*b. Drop observations
drop if reject==.
drop if homrate==.
drop if primayor==.
drop if porc_pea2sm==.
drop if pri_perctminus1secc==.
drop if prop_alfa==.
drop if sexratio==.
drop if prop_sewage==.
drop if alternationyears==.

*4. Export the file to .txt

export delimited using "/afs/crc.nd.edu/user/s/sleyguti/Private/cantuley.txt", delimiter(";") replace
