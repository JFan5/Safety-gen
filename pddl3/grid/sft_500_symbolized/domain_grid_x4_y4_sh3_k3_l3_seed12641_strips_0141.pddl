(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v13)
             (pred_5 ?v4 ?v3)
             (pred_7 ?v10 ?v3)
             (pred_4 ?v8 ?v10 )
	     (pred_8 ?v10)
             (pred_11 ?v11)
             (pred_2 ?v4)
             (pred_9 ?v3)
             (pred_10 ?v10)
             (pred_12 ?v4)
             (pred_3 ?v10)
             (pred_1 ))



(:action op_3
:parameters (?v2 ?v1 ?v5 ?v7)
:precondition (and (pred_11 ?v2) (pred_11 ?v1) (pred_2 ?v5) (pred_9 ?v7)
          (pred_6 ?v2 ?v1) (pred_5 ?v5 ?v7)
                   (pred_7 ?v1 ?v7) (pred_8 ?v2) 
                   (pred_10 ?v1) (pred_12 ?v5))
:effect (and  (pred_3 ?v1) (not (pred_10 ?v1))))


(:action op_4
:parameters (?v2 ?v6)
:precondition (and (pred_11 ?v2) (pred_11 ?v6)
               (pred_8 ?v2) (pred_6 ?v2 ?v6) (pred_3 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v2))))

(:action op_5
:parameters (?v2 ?v5)
:precondition (and (pred_11 ?v2) (pred_2 ?v5) 
                  (pred_8 ?v2) (pred_4 ?v5 ?v2) (pred_1 ))
:effect (and (pred_12 ?v5)
   (not (pred_4 ?v5 ?v2)) (not (pred_1 ))))


(:action op_1
:parameters (?v2 ?v9 ?v12)
:precondition (and (pred_11 ?v2) (pred_2 ?v9) (pred_2 ?v12)
                  (pred_8 ?v2) (pred_12 ?v12) (pred_4 ?v9 ?v2))
:effect (and (pred_12 ?v9) (pred_4 ?v12 ?v2)
        (not (pred_12 ?v12)) (not (pred_4 ?v9 ?v2))))

(:action op_2
:parameters (?v2 ?v5)
:precondition (and (pred_11 ?v2) (pred_2 ?v5) 
                  (pred_8 ?v2) (pred_12 ?v5))
:effect (and (pred_1 ) (pred_4 ?v5 ?v2) (not (pred_12 ?v5)))))


	
