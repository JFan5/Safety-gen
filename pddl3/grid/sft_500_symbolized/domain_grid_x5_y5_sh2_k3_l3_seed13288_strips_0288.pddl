(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v3)
             (pred_8 ?v1 ?v11)
             (pred_4 ?v5 ?v11)
             (pred_6 ?v7 ?v5 )
	     (pred_7 ?v5)
             (pred_12 ?v10)
             (pred_11 ?v1)
             (pred_3 ?v11)
             (pred_5 ?v5)
             (pred_10 ?v1)
             (pred_1 ?v5)
             (pred_2 ))



(:action op_4
:parameters (?v2 ?v9 ?v12 ?v4)
:precondition (and (pred_12 ?v2) (pred_12 ?v9) (pred_11 ?v12) (pred_3 ?v4)
          (pred_9 ?v2 ?v9) (pred_8 ?v12 ?v4)
                   (pred_4 ?v9 ?v4) (pred_7 ?v2) 
                   (pred_5 ?v9) (pred_10 ?v12))
:effect (and  (pred_1 ?v9) (not (pred_5 ?v9))))


(:action op_1
:parameters (?v2 ?v6)
:precondition (and (pred_12 ?v2) (pred_12 ?v6)
               (pred_7 ?v2) (pred_9 ?v2 ?v6) (pred_1 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v2))))

(:action op_5
:parameters (?v2 ?v12)
:precondition (and (pred_12 ?v2) (pred_11 ?v12) 
                  (pred_7 ?v2) (pred_6 ?v12 ?v2) (pred_2 ))
:effect (and (pred_10 ?v12)
   (not (pred_6 ?v12 ?v2)) (not (pred_2 ))))


(:action op_2
:parameters (?v2 ?v13 ?v8)
:precondition (and (pred_12 ?v2) (pred_11 ?v13) (pred_11 ?v8)
                  (pred_7 ?v2) (pred_10 ?v8) (pred_6 ?v13 ?v2))
:effect (and (pred_10 ?v13) (pred_6 ?v8 ?v2)
        (not (pred_10 ?v8)) (not (pred_6 ?v13 ?v2))))

(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_12 ?v2) (pred_11 ?v12) 
                  (pred_7 ?v2) (pred_10 ?v12))
:effect (and (pred_2 ) (pred_6 ?v12 ?v2) (not (pred_10 ?v12)))))


	
