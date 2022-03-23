module opr

sig Partido { }
// All parties will be pre-defined in the system, although not all of them are listed below.
one sig PMDB, PT, PSOL, PSL, PCDOB, NOVO, PV extends Partido { }

sig Cidadao { }
sig Legislador { 
  partido: one Partido
}
