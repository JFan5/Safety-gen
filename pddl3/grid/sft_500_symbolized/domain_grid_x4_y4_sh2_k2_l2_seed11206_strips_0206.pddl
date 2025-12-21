(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v3)
             (pred_1 ?v13 ?v10)
             (pred_8 ?v6 ?v10)
             (pred_3 ?v7 ?v6 )
	     (pred_12 ?v6)
             (pred_7 ?v8)
             (pred_10 ?v13)
             (pred_9 ?v10)
             (pred_6 ?v6)
             (pred_11 ?v13)
             (pred_5 ?v6)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v4 ?v11 ?v2)
:precondition (and (pred_7 ?v1) (pred_7 ?v4) (pred_10 ?v11) (pred_9 ?v2)
          (pred_2 ?v1 ?v4) (pred_1 ?v11 ?v2)
                   (pred_8 ?v4 ?v2) (pred_12 ?v1) 
                   (pred_6 ?v4) (pred_11 ?v11))
:effect (and  (pred_5 ?v4) (not (pred_6 ?v4))))


(:action op_4
:parameters (?v1 ?v12)
:precondition (and (pred_7 ?v1) (pred_7 ?v12)
               (pred_12 ?v1) (pred_2 ?v1 ?v12) (pred_5 ?v12))
:effect (and (pred_12 ?v12) (not (pred_12 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_7 ?v1) (pred_10 ?v11) 
                  (pred_12 ?v1) (pred_3 ?v11 ?v1) (pred_4 ))
:effect (and (pred_11 ?v11)
   (not (pred_3 ?v11 ?v1)) (not (pred_4 ))))


(:action op_1
:parameters (?v1 ?v9 ?v5)
:precondition (and (pred_7 ?v1) (pred_10 ?v9) (pred_10 ?v5)
                  (pred_12 ?v1) (pred_11 ?v5) (pred_3 ?v9 ?v1))
:effect (and (pred_11 ?v9) (pred_3 ?v5 ?v1)
        (not (pred_11 ?v5)) (not (pred_3 ?v9 ?v1))))

(:action op_3
:parameters (?v1 ?v11)
:precondition (and (pred_7 ?v1) (pred_10 ?v11) 
                  (pred_12 ?v1) (pred_11 ?v11))
:effect (and (pred_4 ) (pred_3 ?v11 ?v1) (not (pred_11 ?v11)))))


	
