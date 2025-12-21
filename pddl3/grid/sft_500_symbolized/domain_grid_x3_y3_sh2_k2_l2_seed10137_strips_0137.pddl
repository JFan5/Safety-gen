(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v12)
             (pred_4 ?v7 ?v11)
             (pred_8 ?v13 ?v11)
             (pred_1 ?v9 ?v13 )
	     (pred_11 ?v13)
             (pred_3 ?v3)
             (pred_7 ?v7)
             (pred_6 ?v11)
             (pred_2 ?v13)
             (pred_12 ?v7)
             (pred_5 ?v13)
             (pred_9 ))



(:action op_4
:parameters (?v1 ?v5 ?v10 ?v4)
:precondition (and (pred_3 ?v1) (pred_3 ?v5) (pred_7 ?v10) (pred_6 ?v4)
          (pred_10 ?v1 ?v5) (pred_4 ?v10 ?v4)
                   (pred_8 ?v5 ?v4) (pred_11 ?v1) 
                   (pred_2 ?v5) (pred_12 ?v10))
:effect (and  (pred_5 ?v5) (not (pred_2 ?v5))))


(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_3 ?v1) (pred_3 ?v6)
               (pred_11 ?v1) (pred_10 ?v1 ?v6) (pred_5 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v1))))

(:action op_3
:parameters (?v1 ?v10)
:precondition (and (pred_3 ?v1) (pred_7 ?v10) 
                  (pred_11 ?v1) (pred_1 ?v10 ?v1) (pred_9 ))
:effect (and (pred_12 ?v10)
   (not (pred_1 ?v10 ?v1)) (not (pred_9 ))))


(:action op_5
:parameters (?v1 ?v2 ?v8)
:precondition (and (pred_3 ?v1) (pred_7 ?v2) (pred_7 ?v8)
                  (pred_11 ?v1) (pred_12 ?v8) (pred_1 ?v2 ?v1))
:effect (and (pred_12 ?v2) (pred_1 ?v8 ?v1)
        (not (pred_12 ?v8)) (not (pred_1 ?v2 ?v1))))

(:action op_2
:parameters (?v1 ?v10)
:precondition (and (pred_3 ?v1) (pred_7 ?v10) 
                  (pred_11 ?v1) (pred_12 ?v10))
:effect (and (pred_9 ) (pred_1 ?v10 ?v1) (not (pred_12 ?v10)))))


	
