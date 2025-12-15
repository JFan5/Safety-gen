(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v7)
             (pred_7 ?v5 ?v13)
             (pred_8 ?v2 ?v13)
             (pred_4 ?v11 ?v2 )
	     (pred_11 ?v2)
             (pred_5 ?v6)
             (pred_3 ?v5)
             (pred_9 ?v13)
             (pred_2 ?v2)
             (pred_6 ?v5)
             (pred_1 ?v2)
             (pred_10 ))



(:action op_4
:parameters (?v1 ?v4 ?v3 ?v12)
:precondition (and (pred_5 ?v1) (pred_5 ?v4) (pred_3 ?v3) (pred_9 ?v12)
          (pred_12 ?v1 ?v4) (pred_7 ?v3 ?v12)
                   (pred_8 ?v4 ?v12) (pred_11 ?v1) 
                   (pred_2 ?v4) (pred_6 ?v3))
:effect (and  (pred_1 ?v4) (not (pred_2 ?v4))))


(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_5 ?v1) (pred_5 ?v9)
               (pred_11 ?v1) (pred_12 ?v1 ?v9) (pred_1 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v1))))

(:action op_1
:parameters (?v1 ?v3)
:precondition (and (pred_5 ?v1) (pred_3 ?v3) 
                  (pred_11 ?v1) (pred_4 ?v3 ?v1) (pred_10 ))
:effect (and (pred_6 ?v3)
   (not (pred_4 ?v3 ?v1)) (not (pred_10 ))))


(:action op_3
:parameters (?v1 ?v8 ?v10)
:precondition (and (pred_5 ?v1) (pred_3 ?v8) (pred_3 ?v10)
                  (pred_11 ?v1) (pred_6 ?v10) (pred_4 ?v8 ?v1))
:effect (and (pred_6 ?v8) (pred_4 ?v10 ?v1)
        (not (pred_6 ?v10)) (not (pred_4 ?v8 ?v1))))

(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_5 ?v1) (pred_3 ?v3) 
                  (pred_11 ?v1) (pred_6 ?v3))
:effect (and (pred_10 ) (pred_4 ?v3 ?v1) (not (pred_6 ?v3)))))


	
