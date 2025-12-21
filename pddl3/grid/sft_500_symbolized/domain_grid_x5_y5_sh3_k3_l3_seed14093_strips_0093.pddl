(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v3)
             (pred_1 ?v7 ?v6)
             (pred_6 ?v9 ?v6)
             (pred_12 ?v11 ?v9 )
	     (pred_11 ?v9)
             (pred_8 ?v12)
             (pred_5 ?v7)
             (pred_7 ?v6)
             (pred_3 ?v9)
             (pred_9 ?v7)
             (pred_4 ?v9)
             (pred_2 ))



(:action op_4
:parameters (?v2 ?v4 ?v5 ?v13)
:precondition (and (pred_8 ?v2) (pred_8 ?v4) (pred_5 ?v5) (pred_7 ?v13)
          (pred_10 ?v2 ?v4) (pred_1 ?v5 ?v13)
                   (pred_6 ?v4 ?v13) (pred_11 ?v2) 
                   (pred_3 ?v4) (pred_9 ?v5))
:effect (and  (pred_4 ?v4) (not (pred_3 ?v4))))


(:action op_2
:parameters (?v2 ?v8)
:precondition (and (pred_8 ?v2) (pred_8 ?v8)
               (pred_11 ?v2) (pred_10 ?v2 ?v8) (pred_4 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v2))))

(:action op_3
:parameters (?v2 ?v5)
:precondition (and (pred_8 ?v2) (pred_5 ?v5) 
                  (pred_11 ?v2) (pred_12 ?v5 ?v2) (pred_2 ))
:effect (and (pred_9 ?v5)
   (not (pred_12 ?v5 ?v2)) (not (pred_2 ))))


(:action op_5
:parameters (?v2 ?v10 ?v1)
:precondition (and (pred_8 ?v2) (pred_5 ?v10) (pred_5 ?v1)
                  (pred_11 ?v2) (pred_9 ?v1) (pred_12 ?v10 ?v2))
:effect (and (pred_9 ?v10) (pred_12 ?v1 ?v2)
        (not (pred_9 ?v1)) (not (pred_12 ?v10 ?v2))))

(:action op_1
:parameters (?v2 ?v5)
:precondition (and (pred_8 ?v2) (pred_5 ?v5) 
                  (pred_11 ?v2) (pred_9 ?v5))
:effect (and (pred_2 ) (pred_12 ?v5 ?v2) (not (pred_9 ?v5)))))


	
