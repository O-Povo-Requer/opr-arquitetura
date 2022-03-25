module opr

abstract sig Partido { }
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

sig Apoio {
	apoiado: one Requerimento,
	apoiadoPor: one Usuario
}

sig Comentario {
	comentado: one Requerimento,
	por: one Usuario
}

sig Compartilhamento {
	compartilhado: one Requerimento,
	para: one Usuario
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

--Cada usuário só pode apoiar um dado requerimento uma única vez
	all disj a1, a2: Apoio | (a1.apoiado = a2.apoiado) implies (a1.apoiadoPor != a2.apoiadoPor)

}


pred show []{}
run show for 10
