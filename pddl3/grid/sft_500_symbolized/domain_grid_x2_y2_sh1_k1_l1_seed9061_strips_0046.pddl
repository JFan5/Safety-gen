(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v4 ?v11)
             (pred_12 ?v12 ?v8)
             (pred_3 ?v4 ?v8)
             (pred_9 ?v7 ?v4 )
	     (pred_8 ?v4)
             (pred_11 ?v13)
             (pred_6 ?v12)
             (pred_4 ?v8)
             (pred_1 ?v4)
             (pred_2 ?v12)
             (pred_10 ?v4)
             (pred_5 ))



(:action op_1
:parameters (?v1 ?v2 ?v3 ?v6)
:precondition (and (pred_11 ?v1) (pred_11 ?v2) (pred_6 ?v3) (pred_4 ?v6)
          (pred_7 ?v1 ?v2) (pred_12 ?v3 ?v6)
                   (pred_3 ?v2 ?v6) (pred_8 ?v1) 
                   (pred_1 ?v2) (pred_2 ?v3))
:effect (and  (pred_10 ?v2) (not (pred_1 ?v2))))


(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_11 ?v1) (pred_11 ?v9)
               (pred_8 ?v1) (pred_7 ?v1 ?v9) (pred_10 ?v9))
:effect (and (pred_8 ?v9) (not (pred_8 ?v1))))

(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_11 ?v1) (pred_6 ?v3) 
                  (pred_8 ?v1) (pred_9 ?v3 ?v1) (pred_5 ))
:effect (and (pred_2 ?v3)
   (not (pred_9 ?v3 ?v1)) (not (pred_5 ))))


(:action op_3
:parameters (?v1 ?v5 ?v10)
:precondition (and (pred_11 ?v1) (pred_6 ?v5) (pred_6 ?v10)
                  (pred_8 ?v1) (pred_2 ?v10) (pred_9 ?v5 ?v1))
:effect (and (pred_2 ?v5) (pred_9 ?v10 ?v1)
        (not (pred_2 ?v10)) (not (pred_9 ?v5 ?v1))))

(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_11 ?v1) (pred_6 ?v3) 
                  (pred_8 ?v1) (pred_2 ?v3))
:effect (and (pred_5 ) (pred_9 ?v3 ?v1) (not (pred_2 ?v3)))))


	
