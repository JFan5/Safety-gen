(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v8)
             (pred_7 ?v4 ?v11)
             (pred_10 ?v5 ?v11)
             (pred_8 ?v9 ?v5 )
	     (pred_5 ?v5)
             (pred_4 ?v13)
             (pred_12 ?v4)
             (pred_2 ?v11)
             (pred_3 ?v5)
             (pred_6 ?v4)
             (pred_1 ?v5)
             (pred_9 ))



(:action op_3
:parameters (?v1 ?v2 ?v3 ?v6)
:precondition (and (pred_4 ?v1) (pred_4 ?v2) (pred_12 ?v3) (pred_2 ?v6)
          (pred_11 ?v1 ?v2) (pred_7 ?v3 ?v6)
                   (pred_10 ?v2 ?v6) (pred_5 ?v1) 
                   (pred_3 ?v2) (pred_6 ?v3))
:effect (and  (pred_1 ?v2) (not (pred_3 ?v2))))


(:action op_5
:parameters (?v1 ?v12)
:precondition (and (pred_4 ?v1) (pred_4 ?v12)
               (pred_5 ?v1) (pred_11 ?v1 ?v12) (pred_1 ?v12))
:effect (and (pred_5 ?v12) (not (pred_5 ?v1))))

(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_4 ?v1) (pred_12 ?v3) 
                  (pred_5 ?v1) (pred_8 ?v3 ?v1) (pred_9 ))
:effect (and (pred_6 ?v3)
   (not (pred_8 ?v3 ?v1)) (not (pred_9 ))))


(:action op_1
:parameters (?v1 ?v10 ?v7)
:precondition (and (pred_4 ?v1) (pred_12 ?v10) (pred_12 ?v7)
                  (pred_5 ?v1) (pred_6 ?v7) (pred_8 ?v10 ?v1))
:effect (and (pred_6 ?v10) (pred_8 ?v7 ?v1)
        (not (pred_6 ?v7)) (not (pred_8 ?v10 ?v1))))

(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_4 ?v1) (pred_12 ?v3) 
                  (pred_5 ?v1) (pred_6 ?v3))
:effect (and (pred_9 ) (pred_8 ?v3 ?v1) (not (pred_6 ?v3)))))


	
