; Zulema Perez
; CSPC 583


; This file only contain the rules
; to load the database, run file database_wowpets.clp first.
; -------------------------------------
; Rules 
; -------------------------------------

;----------------------------------------
; start menu of program
;----------------------------------------

(defrule start-menu
	(not (_start-menu))
	(not(_battle-type ?btype))
	(not(_strong-against ?strong))
	(not(_weak-against ?weak))
	=>
	(printout t " " crlf crlf crlf)
	(printout t "	*****************************************************************************************" crlf)
    (printout t "					WoW Battle Pet Expert System										" crlf)
    (printout t "	*****************************************************************************************" crlf)
	(printout t " 					Battle Pet Search Menu												" crlf)
	(printout t " 																							" crlf)
	(printout t " 					1. Seach by Battle Type												" crlf)
	(printout t " 					2. Seach by Strong Against											" crlf)
	(printout t " 					3. Seach by Weak Against											" crlf)
	(printout t " 	*****************************************************************************************" crlf)
	(printout t " 					Enter Choice: ")
	(bind ?menu(read))
	(while (and (!= ?menu 1) (!= ?menu 2)(!= ?menu 3))do
		(printout t " " crlf crlf crlf)
		(printout t "	*****************************************************************************************" crlf)
		(printout t " 					Battle Pet Search Menu												" crlf)
		(printout t " 																							" crlf)
		(printout t " 					1. Seach by Battle Type												" crlf)
		(printout t " 					2. Seach by Strong Against											" crlf)
		(printout t " 					3. Seach by Weak Against											" crlf)
		(printout t " 	*****************************************************************************************" crlf)
		(printout t " 					Not a valid choice: " crlf)
		(printout t " 					Enter Choice: ")
		(bind ?menu(read))
	)
	(switch ?menu
;-----------------------------------
; CASE 1
;-----------------------------------
		(case 1 then
			;------------------------------------------
			;get user's desired battle type
			;------------------------------------------
			(printout t " " crlf)
			(printout t "	What is the battle type?" crlf) 
			(printout t "	Choose from [beast, mechanical, flying, critter, dragonkin, aquatic, humanoid, magic, elemental, undead] or enter any:" crlf)
			(printout t "	Enter choice: ")
			(bind ?btype (read))
			(if (lexemep ?btype)
				then (bind ?btype (lowcase ?btype))
			)
			(while (and (neq ?btype beast) (neq ?btype mechanical) (neq ?btype flying) (neq ?btype critter) (neq ?btype dragonkin) (neq ?btype aquatic) 
				(neq ?btype humanoid) (neq ?btype magic)(neq ?btype elemental) (neq ?btype undead) (neq ?btype any)) do
				(printout t "	Not a valid choice." crlf)
				(printout t "	Enter choice: ")
				(bind ?btype (read))
				(if (lexemep ?btype)
					then (bind ?btype (lowcase ?btype))
				)
			)
	
	;***************************************************************
			(if (eq ?btype any)
				then(assert(_battle-type ?btype beast)(_battle-type ?btype mechanical)
					(_battle-type ?btype flying)(_battle-type ?btype critter)
					(_battle-type ?btype dragonkin)(_battle-type ?btype aquatic)
					(_battle-type ?btype humanoid)(_battle-type ?btype magic)
					(_battle-type ?btype elemental)(_battle-type ?btype undead))
				else(assert (_battle-type ?btype))
			)
	;***************************************************************** 	
	
		)
;--------------------------------------
; CASE 2
;--------------------------------------
		(case 2 then
	
			;--------------------------------------
			;filter strong against
			;--------------------------------------
	
			(printout t " " crlf)
			(printout t "	Strong against what type of abilities?" crlf) 	(printout t "Choose from [beast, mechanical, flying, critter, dragonkin, aquatic, humanoid, magic, elemental, undead] or enter any: " crlf)
			(printout t "	Enter choice: ")
			(bind ?strong (read))
			(if (lexemep ?strong)
				then (bind ?strong (lowcase ?strong))
			)
	
			(while (and (neq ?strong beast) (neq ?strong mechanical) (neq ?strong flying) (neq ?strong critter) (neq ?strong dragonkin) (neq ?strong aquatic) 
				(neq ?strong humanoid) (neq ?strong magic)(neq ?strong elemental) (neq ?strong undead) (neq ?strong any)) do
				(printout t "	Not a valid choice." crlf)
				(printout t "	Enter choice: ")
				(bind ?strong (read))
				(if (lexemep ?strong)
					then (bind ?strong (lowcase ?strong))
				)
			)
	
	;***************************************************************
			(if (eq ?strong any)
				then(assert(_strong-against ?strong beast)(_strong-against ?strong mechanical)
					(_strong-against ?strong flying)(_strong-against ?strong critter)
					(_strong-against ?strong dragonkin)(_strong-against ?strong aquatic)
					(_strong-against ?strong humanoid)(_strong-against ?strong magic)
					(_strong-against ?strong elemental)(_strong-against ?strong undead))
				else(assert (_strong-against ?strong)))
	;*****************************************************************
	
	
		)
;-------------------------------
; CASE 3
;-------------------------------
		(case 3 then 
		
			;----------------------------
			;get weak against
			;----------------------------
			(printout t " " crlf)
			(printout t "	Weak against what type of abilities?" crlf) 
			(printout t "	Choose from [beast, mechanical, flying, critter, dragonkin, aquatic, humanoid, magic, elemental, undead] or enter any: " crlf)
			(printout t "	Enter choice: ")
			(bind ?weak (read))
			(if (lexemep ?weak)
				then (bind ?weak (lowcase ?weak))
			)
 	
			(while (and (neq ?weak beast) (neq ?weak mechanical) (neq ?weak flying) (neq ?weak critter) (neq ?weak dragonkin) (neq ?weak aquatic) 
				(neq ?weak humanoid) (neq ?weak magic)(neq ?weak elemental) (neq ?weak undead) (neq ?weak any)) do
				(printout t "	Not a valid choice." crlf)
				(printout t "	Enter choice: ")
				(bind ?weak (read))
				(if (lexemep ?weak)
					then (bind ?weak (lowcase ?weak))
				)
			)
	
			;***************************************************************
			(if (eq ?weak any)
				then(assert(_weak-against ?weak beast)(_weak-against ?weak mechanical)
					(_weak-against ?weak flying)(_weak-against ?weak critter)
					(_weak-against ?weak dragonkin)(_weak-against ?weak aquatic)
					(_weak-against ?weak humanoid)(_weak-against ?weak magic)
					(_weak-against ?weak elemental)(_weak-against ?weak undead))
				else(assert (_weak-against ?weak)))
			;*****************************************************************

		)
	)
	
 	
)

;--------------------------
;filter by battle type
;--------------------------
(defrule filter-type
	(_battle-type ?btype)
	?ans <- (battle-pet ( battle-type ?bt))
	=>
	(if (and (not (eq ?btype ?bt)) (not (eq ?btype any)))
		then (retract ?ans)
	)
)

;--------------------------
;get pet quality rule
;--------------------------
(defrule get-pet-quality
 	(not (_pet-quality ?pquality))
	=>
	(printout t " " crlf)
 	(printout t "	What is the pet quality?" crlf)
	(printout t "	Choose from [rare, uncommon, common, poor]:" crlf)
	(printout t "	Enter choice: ")
	(bind ?pquality (read))
	(if (lexemep ?pquality)
		then (bind ?pquality (lowcase ?pquality))
	)
	(while (and (neq ?pquality rare) (neq ?pquality uncommon) (neq ?pquality common) (neq ?pquality poor)) do
		(printout t "	Not a valid choice." crlf)
		(printout t "	Enter choice: ")
		(bind ?pquality (read))
		(if (lexemep ?pquality)
			then (bind ?pquality (lowcase ?pquality))
		)
		
	)
	;********************************************************
	(assert (_pet-quality ?pquality))
	;********************************************************
)

;---------------------------
;filter pet quality
;---------------------------
(defrule filter-quality
	(_pet-quality ?pquality)
	?ans <- (battle-pet ( pet-quality $?pq))
	=>
	(if (not (member$ ?pquality $?pq)) 
		then (retract ?ans)
	)
	
)

;---------------------------
;filter strong against
;---------------------------

(defrule filter-strong-against

	(_strong-against ?strong)
	?ans <- (battle-pet ( strong-against ?s))
	=>
	(if (and (not(eq ?strong ?s)) (not (eq ?strong any)))
		then (retract ?ans)
	)
)


;---------------------------
;filter weak against
;---------------------------
(defrule filter-weak-against

	(_weak-against ?weak)
	?ans <- (battle-pet ( weak-against ?w))
	=>
	(if (and(not(eq ?weak ?w)) (not (eq ?weak any)))
		then (retract ?ans)
	)
)

;--------------------------
;get pet faction rule
;--------------------------
(defrule get-faction
	(not (_faction ?fact) )
	=>
	(printout t " " crlf)
 	(printout t "	What is the faction?" crlf)
	(printout t "	Choose from [neutral, alliance, horde]:" crlf)
	(printout t "	Enter choice: ")
	(bind ?fact (read))
	(if (lexemep ?fact)
		then (bind ?fact (lowcase ?fact))
	)
	
	(while (and (neq ?fact neutral) (neq ?fact alliance) (neq ?fact horde)) do
		(printout t "	Not a valid choice." crlf)
		(printout t "	Enter choice: ")
		(bind ?fact (read))
		(if (lexemep ?fact)
			then (bind ?fact (lowcase ?fact))
		)
	)
	(assert (_faction ?fact))
) 

;-----------------------------------
;filter pet faction
;-----------------------------------
(defrule filter-faction
	(_faction ?fact)
	?ans <- (battle-pet ( faction ?f))
	=>
	(if (not(eq ?fact ?f))
		then (retract ?ans)
	)
)

;-------------------------
;print table header
;-------------------------
(defrule print-header
	(_pet-quality ?pquality)
	(_faction ?fact)
	(not (header-printed))
	=>
	(printout t " " crlf crlf)
	;(printout t "Header 2 printed out" clrf)
	(assert (header-printed))
	(format t "----------------------------------------------------------------------------------------------------------------------------------%n")

	(format t "	%n%-30s%-20s%-30s%-20s%-20s%-10s%n" 	Name Battle-type Quality Strong-Against Weak-Against Fact)
	(format t "----------------------------------------------------------------------------------------------------------------------------------%n")
)

;--------------------------
;output recommended pets
;--------------------------
(defrule recommend-battlepet
	(_pet-quality ?pquality)
	(_faction ?fact)
	(battle-pet 
		(petname ?n)
		(battle-type ?b)
		(pet-quality $?pq)
		(strong-against ?s)
		(weak-against ?w)
		(faction ?f)
	)
	=>
	(bind ?q (implode$ $?pq))
	;(printout t "The pet's name is " ?n crlf)
	(format t "%-30s%-20s%-30s%-20s%-20s%-10s%n" ?n ?b ?q ?s ?w ?f)
)

