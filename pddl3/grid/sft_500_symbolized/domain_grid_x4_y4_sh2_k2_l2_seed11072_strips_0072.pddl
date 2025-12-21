(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v10)
             (pred_8 ?v13 ?v2)
             (pred_5 ?v6 ?v2)
             (pred_6 ?v8 ?v6 )
	     (pred_7 ?v6)
             (pred_9 ?v7)
             (pred_11 ?v13)
             (pred_2 ?v2)
             (pred_1 ?v6)
             (pred_12 ?v13)
             (pred_4 ?v6)
             (pred_10 ))



(:action op_4
:parameters (?v1 ?v3 ?v12 ?v5)
:precondition (and (pred_9 ?v1) (pred_9 ?v3) (pred_11 ?v12) (pred_2 ?v5)
          (pred_3 ?v1 ?v3) (pred_8 ?v12 ?v5)
                   (pred_5 ?v3 ?v5) (pred_7 ?v1) 
                   (pred_1 ?v3) (pred_12 ?v12))
:effect (and  (pred_4 ?v3) (not (pred_1 ?v3))))


(:action op_3
:parameters (?v1 ?v11)
:precondition (and (pred_9 ?v1) (pred_9 ?v11)
               (pred_7 ?v1) (pred_3 ?v1 ?v11) (pred_4 ?v11))
:effect (and (pred_7 ?v11) (not (pred_7 ?v1))))

(:action op_5
:parameters (?v1 ?v12)
:precondition (and (pred_9 ?v1) (pred_11 ?v12) 
                  (pred_7 ?v1) (pred_6 ?v12 ?v1) (pred_10 ))
:effect (and (pred_12 ?v12)
   (not (pred_6 ?v12 ?v1)) (not (pred_10 ))))


(:action op_1
:parameters (?v1 ?v9 ?v4)
:precondition (and (pred_9 ?v1) (pred_11 ?v9) (pred_11 ?v4)
                  (pred_7 ?v1) (pred_12 ?v4) (pred_6 ?v9 ?v1))
:effect (and (pred_12 ?v9) (pred_6 ?v4 ?v1)
        (not (pred_12 ?v4)) (not (pred_6 ?v9 ?v1))))

(:action op_2
:parameters (?v1 ?v12)
:precondition (and (pred_9 ?v1) (pred_11 ?v12) 
                  (pred_7 ?v1) (pred_12 ?v12))
:effect (and (pred_10 ) (pred_6 ?v12 ?v1) (not (pred_12 ?v12)))))


	
