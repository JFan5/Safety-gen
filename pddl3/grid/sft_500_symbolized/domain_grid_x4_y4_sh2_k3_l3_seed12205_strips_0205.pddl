(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v6)
             (pred_11 ?v1 ?v11)
             (pred_7 ?v9 ?v11)
             (pred_12 ?v7 ?v9 )
	     (pred_8 ?v9)
             (pred_2 ?v13)
             (pred_1 ?v1)
             (pred_10 ?v11)
             (pred_4 ?v9)
             (pred_9 ?v1)
             (pred_3 ?v9)
             (pred_6 ))



(:action op_5
:parameters (?v12 ?v4 ?v2 ?v10)
:precondition (and (pred_2 ?v12) (pred_2 ?v4) (pred_1 ?v2) (pred_10 ?v10)
          (pred_5 ?v12 ?v4) (pred_11 ?v2 ?v10)
                   (pred_7 ?v4 ?v10) (pred_8 ?v12) 
                   (pred_4 ?v4) (pred_9 ?v2))
:effect (and  (pred_3 ?v4) (not (pred_4 ?v4))))


(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_2 ?v12) (pred_2 ?v5)
               (pred_8 ?v12) (pred_5 ?v12 ?v5) (pred_3 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v12))))

(:action op_3
:parameters (?v12 ?v2)
:precondition (and (pred_2 ?v12) (pred_1 ?v2) 
                  (pred_8 ?v12) (pred_12 ?v2 ?v12) (pred_6 ))
:effect (and (pred_9 ?v2)
   (not (pred_12 ?v2 ?v12)) (not (pred_6 ))))


(:action op_2
:parameters (?v12 ?v8 ?v3)
:precondition (and (pred_2 ?v12) (pred_1 ?v8) (pred_1 ?v3)
                  (pred_8 ?v12) (pred_9 ?v3) (pred_12 ?v8 ?v12))
:effect (and (pred_9 ?v8) (pred_12 ?v3 ?v12)
        (not (pred_9 ?v3)) (not (pred_12 ?v8 ?v12))))

(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_2 ?v12) (pred_1 ?v2) 
                  (pred_8 ?v12) (pred_9 ?v2))
:effect (and (pred_6 ) (pred_12 ?v2 ?v12) (not (pred_9 ?v2)))))


	
