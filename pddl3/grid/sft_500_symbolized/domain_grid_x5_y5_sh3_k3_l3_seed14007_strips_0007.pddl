(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v6)
             (pred_5 ?v4 ?v7)
             (pred_2 ?v13 ?v7)
             (pred_11 ?v9 ?v13 )
	     (pred_4 ?v13)
             (pred_10 ?v11)
             (pred_8 ?v4)
             (pred_12 ?v7)
             (pred_3 ?v13)
             (pred_9 ?v4)
             (pred_7 ?v13)
             (pred_6 ))



(:action op_2
:parameters (?v1 ?v10 ?v5 ?v2)
:precondition (and (pred_10 ?v1) (pred_10 ?v10) (pred_8 ?v5) (pred_12 ?v2)
          (pred_1 ?v1 ?v10) (pred_5 ?v5 ?v2)
                   (pred_2 ?v10 ?v2) (pred_4 ?v1) 
                   (pred_3 ?v10) (pred_9 ?v5))
:effect (and  (pred_7 ?v10) (not (pred_3 ?v10))))


(:action op_3
:parameters (?v1 ?v12)
:precondition (and (pred_10 ?v1) (pred_10 ?v12)
               (pred_4 ?v1) (pred_1 ?v1 ?v12) (pred_7 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v1))))

(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_8 ?v5) 
                  (pred_4 ?v1) (pred_11 ?v5 ?v1) (pred_6 ))
:effect (and (pred_9 ?v5)
   (not (pred_11 ?v5 ?v1)) (not (pred_6 ))))


(:action op_5
:parameters (?v1 ?v3 ?v8)
:precondition (and (pred_10 ?v1) (pred_8 ?v3) (pred_8 ?v8)
                  (pred_4 ?v1) (pred_9 ?v8) (pred_11 ?v3 ?v1))
:effect (and (pred_9 ?v3) (pred_11 ?v8 ?v1)
        (not (pred_9 ?v8)) (not (pred_11 ?v3 ?v1))))

(:action op_1
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_8 ?v5) 
                  (pred_4 ?v1) (pred_9 ?v5))
:effect (and (pred_6 ) (pred_11 ?v5 ?v1) (not (pred_9 ?v5)))))


	
