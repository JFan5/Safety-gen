(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v8)
             (pred_9 ?v3 ?v13)
             (pred_10 ?v7 ?v13)
             (pred_2 ?v10 ?v7 )
	     (pred_5 ?v7)
             (pred_6 ?v6)
             (pred_3 ?v3)
             (pred_7 ?v13)
             (pred_12 ?v7)
             (pred_1 ?v3)
             (pred_4 ?v7)
             (pred_11 ))



(:action op_5
:parameters (?v1 ?v4 ?v5 ?v2)
:precondition (and (pred_6 ?v1) (pred_6 ?v4) (pred_3 ?v5) (pred_7 ?v2)
          (pred_8 ?v1 ?v4) (pred_9 ?v5 ?v2)
                   (pred_10 ?v4 ?v2) (pred_5 ?v1) 
                   (pred_12 ?v4) (pred_1 ?v5))
:effect (and  (pred_4 ?v4) (not (pred_12 ?v4))))


(:action op_1
:parameters (?v1 ?v9)
:precondition (and (pred_6 ?v1) (pred_6 ?v9)
               (pred_5 ?v1) (pred_8 ?v1 ?v9) (pred_4 ?v9))
:effect (and (pred_5 ?v9) (not (pred_5 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_3 ?v5) 
                  (pred_5 ?v1) (pred_2 ?v5 ?v1) (pred_11 ))
:effect (and (pred_1 ?v5)
   (not (pred_2 ?v5 ?v1)) (not (pred_11 ))))


(:action op_3
:parameters (?v1 ?v12 ?v11)
:precondition (and (pred_6 ?v1) (pred_3 ?v12) (pred_3 ?v11)
                  (pred_5 ?v1) (pred_1 ?v11) (pred_2 ?v12 ?v1))
:effect (and (pred_1 ?v12) (pred_2 ?v11 ?v1)
        (not (pred_1 ?v11)) (not (pred_2 ?v12 ?v1))))

(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_3 ?v5) 
                  (pred_5 ?v1) (pred_1 ?v5))
:effect (and (pred_11 ) (pred_2 ?v5 ?v1) (not (pred_1 ?v5)))))


	
