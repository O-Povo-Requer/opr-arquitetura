module opr

sig Partido { }
// All parties will be pre-defined in the system, although not all of them are listed below.
one sig PMDB, PT, PSOL, PSL, PCDOB, NOVO, PV extends Partido { }

abstract sig Usuario {}
sig Cidadao extends Usuario{ }
sig Legislador extends Usuario{ 
  partido: one Partido
}

abstract sig Status {}
one sig ACEITO, RESOLVIDO, EM_ANALISE extends Status {}

sig Requerimento {
	proponente: one Cidadao,
	legisladorMarcado: lone Legislador,
	status: one Status
}

sig Curtida {
	requerimento: one Requerimento,
	curtidor: one Usuario
}

sig Comentario {
	requerimento: one Requerimento,
	autor: one Usuario
}

sig Compartilhamento {
	requerimento: one Requerimento,
	autor: one Usuario
}

sig Atividade{
	legisladores: some Legislador
}



pred show []{}
run show for 3
