(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v7)
             (pred_6 ?v8 ?v10)
             (pred_2 ?v5 ?v10)
             (pred_9 ?v4 ?v5 )
	     (pred_12 ?v5)
             (pred_1 ?v11)
             (pred_8 ?v8)
             (pred_10 ?v10)
             (pred_3 ?v5)
             (pred_11 ?v8)
             (pred_5 ?v5)
             (pred_7 ))



(:action op_2
:parameters (?v2 ?v12 ?v13 ?v3)
:precondition (and (pred_1 ?v2) (pred_1 ?v12) (pred_8 ?v13) (pred_10 ?v3)
          (pred_4 ?v2 ?v12) (pred_6 ?v13 ?v3)
                   (pred_2 ?v12 ?v3) (pred_12 ?v2) 
                   (pred_3 ?v12) (pred_11 ?v13))
:effect (and  (pred_5 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v2 ?v6)
:precondition (and (pred_1 ?v2) (pred_1 ?v6)
               (pred_12 ?v2) (pred_4 ?v2 ?v6) (pred_5 ?v6))
:effect (and (pred_12 ?v6) (not (pred_12 ?v2))))

(:action op_1
:parameters (?v2 ?v13)
:precondition (and (pred_1 ?v2) (pred_8 ?v13) 
                  (pred_12 ?v2) (pred_9 ?v13 ?v2) (pred_7 ))
:effect (and (pred_11 ?v13)
   (not (pred_9 ?v13 ?v2)) (not (pred_7 ))))


(:action op_5
:parameters (?v2 ?v9 ?v1)
:precondition (and (pred_1 ?v2) (pred_8 ?v9) (pred_8 ?v1)
                  (pred_12 ?v2) (pred_11 ?v1) (pred_9 ?v9 ?v2))
:effect (and (pred_11 ?v9) (pred_9 ?v1 ?v2)
        (not (pred_11 ?v1)) (not (pred_9 ?v9 ?v2))))

(:action op_3
:parameters (?v2 ?v13)
:precondition (and (pred_1 ?v2) (pred_8 ?v13) 
                  (pred_12 ?v2) (pred_11 ?v13))
:effect (and (pred_7 ) (pred_9 ?v13 ?v2) (not (pred_11 ?v13)))))


	
