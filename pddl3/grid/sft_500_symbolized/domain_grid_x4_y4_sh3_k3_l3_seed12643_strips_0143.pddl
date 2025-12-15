(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v4)
             (pred_7 ?v13 ?v2)
             (pred_1 ?v7 ?v2)
             (pred_9 ?v10 ?v7 )
	     (pred_5 ?v7)
             (pred_2 ?v11)
             (pred_12 ?v13)
             (pred_11 ?v2)
             (pred_8 ?v7)
             (pred_6 ?v13)
             (pred_10 ?v7)
             (pred_3 ))



(:action op_5
:parameters (?v1 ?v3 ?v5 ?v12)
:precondition (and (pred_2 ?v1) (pred_2 ?v3) (pred_12 ?v5) (pred_11 ?v12)
          (pred_4 ?v1 ?v3) (pred_7 ?v5 ?v12)
                   (pred_1 ?v3 ?v12) (pred_5 ?v1) 
                   (pred_8 ?v3) (pred_6 ?v5))
:effect (and  (pred_10 ?v3) (not (pred_8 ?v3))))


(:action op_2
:parameters (?v1 ?v6)
:precondition (and (pred_2 ?v1) (pred_2 ?v6)
               (pred_5 ?v1) (pred_4 ?v1 ?v6) (pred_10 ?v6))
:effect (and (pred_5 ?v6) (not (pred_5 ?v1))))

(:action op_3
:parameters (?v1 ?v5)
:precondition (and (pred_2 ?v1) (pred_12 ?v5) 
                  (pred_5 ?v1) (pred_9 ?v5 ?v1) (pred_3 ))
:effect (and (pred_6 ?v5)
   (not (pred_9 ?v5 ?v1)) (not (pred_3 ))))


(:action op_1
:parameters (?v1 ?v9 ?v8)
:precondition (and (pred_2 ?v1) (pred_12 ?v9) (pred_12 ?v8)
                  (pred_5 ?v1) (pred_6 ?v8) (pred_9 ?v9 ?v1))
:effect (and (pred_6 ?v9) (pred_9 ?v8 ?v1)
        (not (pred_6 ?v8)) (not (pred_9 ?v9 ?v1))))

(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_2 ?v1) (pred_12 ?v5) 
                  (pred_5 ?v1) (pred_6 ?v5))
:effect (and (pred_3 ) (pred_9 ?v5 ?v1) (not (pred_6 ?v5)))))


	
