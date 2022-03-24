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
one sig ACEITO, RESOLVIDO, EM_ANALISE, ARQUIVADO extends Status {}

sig Requerimento {
	proponente: one Cidadao,
	legisladoresMarcados: set Legislador,
	status: one Status
}

sig Curtida {
	requerimentoCurtido: one Requerimento,
	curtidor: one Usuario
}

sig Comentario {
	requerimentoComentado: one Requerimento,
	autor: one Usuario
}

sig Compartilhamento {
	requerimentoCompartilhado: one Requerimento,
	compartilhador: one Usuario
}

sig Atividade{
	legisladores: some Legislador
}


fact RegrasOPR {
-- Para melhorar visualização, consideremos o sistema já com pessoas cadastradas
	some Cidadao
	some Legislador

-- Cada cidadão só pode ter dois requerimentos por vez
	all c: Cidadao | #c.~proponente <= 2

}


pred show []{}
run show for 3
