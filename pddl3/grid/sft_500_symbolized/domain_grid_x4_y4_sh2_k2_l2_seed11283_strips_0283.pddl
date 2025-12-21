(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v3)
             (pred_5 ?v11 ?v9)
             (pred_1 ?v13 ?v9)
             (pred_8 ?v7 ?v13 )
	     (pred_2 ?v13)
             (pred_10 ?v10)
             (pred_11 ?v11)
             (pred_4 ?v9)
             (pred_7 ?v13)
             (pred_12 ?v11)
             (pred_9 ?v13)
             (pred_3 ))



(:action op_1
:parameters (?v4 ?v1 ?v5 ?v6)
:precondition (and (pred_10 ?v4) (pred_10 ?v1) (pred_11 ?v5) (pred_4 ?v6)
          (pred_6 ?v4 ?v1) (pred_5 ?v5 ?v6)
                   (pred_1 ?v1 ?v6) (pred_2 ?v4) 
                   (pred_7 ?v1) (pred_12 ?v5))
:effect (and  (pred_9 ?v1) (not (pred_7 ?v1))))


(:action op_5
:parameters (?v4 ?v2)
:precondition (and (pred_10 ?v4) (pred_10 ?v2)
               (pred_2 ?v4) (pred_6 ?v4 ?v2) (pred_9 ?v2))
:effect (and (pred_2 ?v2) (not (pred_2 ?v4))))

(:action op_4
:parameters (?v4 ?v5)
:precondition (and (pred_10 ?v4) (pred_11 ?v5) 
                  (pred_2 ?v4) (pred_8 ?v5 ?v4) (pred_3 ))
:effect (and (pred_12 ?v5)
   (not (pred_8 ?v5 ?v4)) (not (pred_3 ))))


(:action op_3
:parameters (?v4 ?v8 ?v12)
:precondition (and (pred_10 ?v4) (pred_11 ?v8) (pred_11 ?v12)
                  (pred_2 ?v4) (pred_12 ?v12) (pred_8 ?v8 ?v4))
:effect (and (pred_12 ?v8) (pred_8 ?v12 ?v4)
        (not (pred_12 ?v12)) (not (pred_8 ?v8 ?v4))))

(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_10 ?v4) (pred_11 ?v5) 
                  (pred_2 ?v4) (pred_12 ?v5))
:effect (and (pred_3 ) (pred_8 ?v5 ?v4) (not (pred_12 ?v5)))))


	
