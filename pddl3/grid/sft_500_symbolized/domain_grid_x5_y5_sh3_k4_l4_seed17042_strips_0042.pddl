(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v11)
             (pred_8 ?v8 ?v9)
             (pred_5 ?v13 ?v9)
             (pred_6 ?v12 ?v13 )
	     (pred_9 ?v13)
             (pred_11 ?v3)
             (pred_7 ?v8)
             (pred_1 ?v9)
             (pred_4 ?v13)
             (pred_12 ?v8)
             (pred_10 ?v13)
             (pred_3 ))



(:action op_2
:parameters (?v5 ?v1 ?v10 ?v7)
:precondition (and (pred_11 ?v5) (pred_11 ?v1) (pred_7 ?v10) (pred_1 ?v7)
          (pred_2 ?v5 ?v1) (pred_8 ?v10 ?v7)
                   (pred_5 ?v1 ?v7) (pred_9 ?v5) 
                   (pred_4 ?v1) (pred_12 ?v10))
:effect (and  (pred_10 ?v1) (not (pred_4 ?v1))))


(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_11 ?v5) (pred_11 ?v6)
               (pred_9 ?v5) (pred_2 ?v5 ?v6) (pred_10 ?v6))
:effect (and (pred_9 ?v6) (not (pred_9 ?v5))))

(:action op_3
:parameters (?v5 ?v10)
:precondition (and (pred_11 ?v5) (pred_7 ?v10) 
                  (pred_9 ?v5) (pred_6 ?v10 ?v5) (pred_3 ))
:effect (and (pred_12 ?v10)
   (not (pred_6 ?v10 ?v5)) (not (pred_3 ))))


(:action op_4
:parameters (?v5 ?v2 ?v4)
:precondition (and (pred_11 ?v5) (pred_7 ?v2) (pred_7 ?v4)
                  (pred_9 ?v5) (pred_12 ?v4) (pred_6 ?v2 ?v5))
:effect (and (pred_12 ?v2) (pred_6 ?v4 ?v5)
        (not (pred_12 ?v4)) (not (pred_6 ?v2 ?v5))))

(:action op_5
:parameters (?v5 ?v10)
:precondition (and (pred_11 ?v5) (pred_7 ?v10) 
                  (pred_9 ?v5) (pred_12 ?v10))
:effect (and (pred_3 ) (pred_6 ?v10 ?v5) (not (pred_12 ?v10)))))


	
