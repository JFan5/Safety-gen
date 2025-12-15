(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v3 ?v11)
             (pred_5 ?v13 ?v9)
             (pred_7 ?v3 ?v9)
             (pred_4 ?v7 ?v3 )
	     (pred_6 ?v3)
             (pred_9 ?v6)
             (pred_3 ?v13)
             (pred_8 ?v9)
             (pred_1 ?v3)
             (pred_10 ?v13)
             (pred_2 ?v3)
             (pred_11 ))



(:action op_2
:parameters (?v4 ?v1 ?v12 ?v2)
:precondition (and (pred_9 ?v4) (pred_9 ?v1) (pred_3 ?v12) (pred_8 ?v2)
          (pred_12 ?v4 ?v1) (pred_5 ?v12 ?v2)
                   (pred_7 ?v1 ?v2) (pred_6 ?v4) 
                   (pred_1 ?v1) (pred_10 ?v12))
:effect (and  (pred_2 ?v1) (not (pred_1 ?v1))))


(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_9 ?v4) (pred_9 ?v5)
               (pred_6 ?v4) (pred_12 ?v4 ?v5) (pred_2 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v4))))

(:action op_4
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_3 ?v12) 
                  (pred_6 ?v4) (pred_4 ?v12 ?v4) (pred_11 ))
:effect (and (pred_10 ?v12)
   (not (pred_4 ?v12 ?v4)) (not (pred_11 ))))


(:action op_5
:parameters (?v4 ?v10 ?v8)
:precondition (and (pred_9 ?v4) (pred_3 ?v10) (pred_3 ?v8)
                  (pred_6 ?v4) (pred_10 ?v8) (pred_4 ?v10 ?v4))
:effect (and (pred_10 ?v10) (pred_4 ?v8 ?v4)
        (not (pred_10 ?v8)) (not (pred_4 ?v10 ?v4))))

(:action op_1
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_3 ?v12) 
                  (pred_6 ?v4) (pred_10 ?v12))
:effect (and (pred_11 ) (pred_4 ?v12 ?v4) (not (pred_10 ?v12)))))


	
