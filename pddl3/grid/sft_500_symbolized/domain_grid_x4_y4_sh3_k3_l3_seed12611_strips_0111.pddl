(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v11)
             (pred_1 ?v5 ?v4)
             (pred_2 ?v10 ?v4)
             (pred_11 ?v7 ?v10 )
	     (pred_9 ?v10)
             (pred_10 ?v8)
             (pred_6 ?v5)
             (pred_3 ?v4)
             (pred_8 ?v10)
             (pred_12 ?v5)
             (pred_5 ?v10)
             (pred_7 ))



(:action op_3
:parameters (?v2 ?v12 ?v13 ?v9)
:precondition (and (pred_10 ?v2) (pred_10 ?v12) (pred_6 ?v13) (pred_3 ?v9)
          (pred_4 ?v2 ?v12) (pred_1 ?v13 ?v9)
                   (pred_2 ?v12 ?v9) (pred_9 ?v2) 
                   (pred_8 ?v12) (pred_12 ?v13))
:effect (and  (pred_5 ?v12) (not (pred_8 ?v12))))


(:action op_5
:parameters (?v2 ?v1)
:precondition (and (pred_10 ?v2) (pred_10 ?v1)
               (pred_9 ?v2) (pred_4 ?v2 ?v1) (pred_5 ?v1))
:effect (and (pred_9 ?v1) (not (pred_9 ?v2))))

(:action op_2
:parameters (?v2 ?v13)
:precondition (and (pred_10 ?v2) (pred_6 ?v13) 
                  (pred_9 ?v2) (pred_11 ?v13 ?v2) (pred_7 ))
:effect (and (pred_12 ?v13)
   (not (pred_11 ?v13 ?v2)) (not (pred_7 ))))


(:action op_4
:parameters (?v2 ?v3 ?v6)
:precondition (and (pred_10 ?v2) (pred_6 ?v3) (pred_6 ?v6)
                  (pred_9 ?v2) (pred_12 ?v6) (pred_11 ?v3 ?v2))
:effect (and (pred_12 ?v3) (pred_11 ?v6 ?v2)
        (not (pred_12 ?v6)) (not (pred_11 ?v3 ?v2))))

(:action op_1
:parameters (?v2 ?v13)
:precondition (and (pred_10 ?v2) (pred_6 ?v13) 
                  (pred_9 ?v2) (pred_12 ?v13))
:effect (and (pred_7 ) (pred_11 ?v13 ?v2) (not (pred_12 ?v13)))))


	
