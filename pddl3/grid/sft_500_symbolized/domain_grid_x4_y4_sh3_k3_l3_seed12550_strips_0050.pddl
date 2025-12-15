(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v5 ?v1)
             (pred_10 ?v9 ?v13)
             (pred_9 ?v5 ?v13)
             (pred_8 ?v8 ?v5 )
	     (pred_7 ?v5)
             (pred_12 ?v10)
             (pred_5 ?v9)
             (pred_1 ?v13)
             (pred_11 ?v5)
             (pred_4 ?v9)
             (pred_3 ?v5)
             (pred_6 ))



(:action op_2
:parameters (?v7 ?v11 ?v2 ?v4)
:precondition (and (pred_12 ?v7) (pred_12 ?v11) (pred_5 ?v2) (pred_1 ?v4)
          (pred_2 ?v7 ?v11) (pred_10 ?v2 ?v4)
                   (pred_9 ?v11 ?v4) (pred_7 ?v7) 
                   (pred_11 ?v11) (pred_4 ?v2))
:effect (and  (pred_3 ?v11) (not (pred_11 ?v11))))


(:action op_1
:parameters (?v7 ?v6)
:precondition (and (pred_12 ?v7) (pred_12 ?v6)
               (pred_7 ?v7) (pred_2 ?v7 ?v6) (pred_3 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v7))))

(:action op_4
:parameters (?v7 ?v2)
:precondition (and (pred_12 ?v7) (pred_5 ?v2) 
                  (pred_7 ?v7) (pred_8 ?v2 ?v7) (pred_6 ))
:effect (and (pred_4 ?v2)
   (not (pred_8 ?v2 ?v7)) (not (pred_6 ))))


(:action op_5
:parameters (?v7 ?v3 ?v12)
:precondition (and (pred_12 ?v7) (pred_5 ?v3) (pred_5 ?v12)
                  (pred_7 ?v7) (pred_4 ?v12) (pred_8 ?v3 ?v7))
:effect (and (pred_4 ?v3) (pred_8 ?v12 ?v7)
        (not (pred_4 ?v12)) (not (pred_8 ?v3 ?v7))))

(:action op_3
:parameters (?v7 ?v2)
:precondition (and (pred_12 ?v7) (pred_5 ?v2) 
                  (pred_7 ?v7) (pred_4 ?v2))
:effect (and (pred_6 ) (pred_8 ?v2 ?v7) (not (pred_4 ?v2)))))


	
