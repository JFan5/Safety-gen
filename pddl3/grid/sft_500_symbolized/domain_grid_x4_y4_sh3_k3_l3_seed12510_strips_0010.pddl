(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v9 ?v10)
             (pred_8 ?v13 ?v4)
             (pred_12 ?v9 ?v4)
             (pred_10 ?v3 ?v9 )
	     (pred_5 ?v9)
             (pred_6 ?v8)
             (pred_11 ?v13)
             (pred_3 ?v4)
             (pred_9 ?v9)
             (pred_4 ?v13)
             (pred_1 ?v9)
             (pred_7 ))



(:action op_4
:parameters (?v2 ?v5 ?v12 ?v1)
:precondition (and (pred_6 ?v2) (pred_6 ?v5) (pred_11 ?v12) (pred_3 ?v1)
          (pred_2 ?v2 ?v5) (pred_8 ?v12 ?v1)
                   (pred_12 ?v5 ?v1) (pred_5 ?v2) 
                   (pred_9 ?v5) (pred_4 ?v12))
:effect (and  (pred_1 ?v5) (not (pred_9 ?v5))))


(:action op_5
:parameters (?v2 ?v6)
:precondition (and (pred_6 ?v2) (pred_6 ?v6)
               (pred_5 ?v2) (pred_2 ?v2 ?v6) (pred_1 ?v6))
:effect (and (pred_5 ?v6) (not (pred_5 ?v2))))

(:action op_2
:parameters (?v2 ?v12)
:precondition (and (pred_6 ?v2) (pred_11 ?v12) 
                  (pred_5 ?v2) (pred_10 ?v12 ?v2) (pred_7 ))
:effect (and (pred_4 ?v12)
   (not (pred_10 ?v12 ?v2)) (not (pred_7 ))))


(:action op_1
:parameters (?v2 ?v11 ?v7)
:precondition (and (pred_6 ?v2) (pred_11 ?v11) (pred_11 ?v7)
                  (pred_5 ?v2) (pred_4 ?v7) (pred_10 ?v11 ?v2))
:effect (and (pred_4 ?v11) (pred_10 ?v7 ?v2)
        (not (pred_4 ?v7)) (not (pred_10 ?v11 ?v2))))

(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_6 ?v2) (pred_11 ?v12) 
                  (pred_5 ?v2) (pred_4 ?v12))
:effect (and (pred_7 ) (pred_10 ?v12 ?v2) (not (pred_4 ?v12)))))


	
