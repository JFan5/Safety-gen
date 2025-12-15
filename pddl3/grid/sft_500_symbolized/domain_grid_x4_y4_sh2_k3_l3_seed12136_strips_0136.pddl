(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v8)
             (pred_3 ?v7 ?v1)
             (pred_8 ?v11 ?v1)
             (pred_4 ?v3 ?v11 )
	     (pred_10 ?v11)
             (pred_1 ?v9)
             (pred_9 ?v7)
             (pred_11 ?v1)
             (pred_6 ?v11)
             (pred_12 ?v7)
             (pred_5 ?v11)
             (pred_2 ))



(:action op_5
:parameters (?v2 ?v4 ?v12 ?v6)
:precondition (and (pred_1 ?v2) (pred_1 ?v4) (pred_9 ?v12) (pred_11 ?v6)
          (pred_7 ?v2 ?v4) (pred_3 ?v12 ?v6)
                   (pred_8 ?v4 ?v6) (pred_10 ?v2) 
                   (pred_6 ?v4) (pred_12 ?v12))
:effect (and  (pred_5 ?v4) (not (pred_6 ?v4))))


(:action op_1
:parameters (?v2 ?v10)
:precondition (and (pred_1 ?v2) (pred_1 ?v10)
               (pred_10 ?v2) (pred_7 ?v2 ?v10) (pred_5 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v2))))

(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_9 ?v12) 
                  (pred_10 ?v2) (pred_4 ?v12 ?v2) (pred_2 ))
:effect (and (pred_12 ?v12)
   (not (pred_4 ?v12 ?v2)) (not (pred_2 ))))


(:action op_2
:parameters (?v2 ?v13 ?v5)
:precondition (and (pred_1 ?v2) (pred_9 ?v13) (pred_9 ?v5)
                  (pred_10 ?v2) (pred_12 ?v5) (pred_4 ?v13 ?v2))
:effect (and (pred_12 ?v13) (pred_4 ?v5 ?v2)
        (not (pred_12 ?v5)) (not (pred_4 ?v13 ?v2))))

(:action op_4
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_9 ?v12) 
                  (pred_10 ?v2) (pred_12 ?v12))
:effect (and (pred_2 ) (pred_4 ?v12 ?v2) (not (pred_12 ?v12)))))


	
