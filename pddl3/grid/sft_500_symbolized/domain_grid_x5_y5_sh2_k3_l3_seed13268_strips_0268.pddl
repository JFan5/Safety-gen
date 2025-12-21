(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v12)
             (pred_8 ?v9 ?v10)
             (pred_5 ?v7 ?v10)
             (pred_1 ?v3 ?v7 )
	     (pred_4 ?v7)
             (pred_9 ?v11)
             (pred_7 ?v9)
             (pred_3 ?v10)
             (pred_10 ?v7)
             (pred_12 ?v9)
             (pred_2 ?v7)
             (pred_6 ))



(:action op_2
:parameters (?v5 ?v1 ?v13 ?v6)
:precondition (and (pred_9 ?v5) (pred_9 ?v1) (pred_7 ?v13) (pred_3 ?v6)
          (pred_11 ?v5 ?v1) (pred_8 ?v13 ?v6)
                   (pred_5 ?v1 ?v6) (pred_4 ?v5) 
                   (pred_10 ?v1) (pred_12 ?v13))
:effect (and  (pred_2 ?v1) (not (pred_10 ?v1))))


(:action op_3
:parameters (?v5 ?v2)
:precondition (and (pred_9 ?v5) (pred_9 ?v2)
               (pred_4 ?v5) (pred_11 ?v5 ?v2) (pred_2 ?v2))
:effect (and (pred_4 ?v2) (not (pred_4 ?v5))))

(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_9 ?v5) (pred_7 ?v13) 
                  (pred_4 ?v5) (pred_1 ?v13 ?v5) (pred_6 ))
:effect (and (pred_12 ?v13)
   (not (pred_1 ?v13 ?v5)) (not (pred_6 ))))


(:action op_5
:parameters (?v5 ?v4 ?v8)
:precondition (and (pred_9 ?v5) (pred_7 ?v4) (pred_7 ?v8)
                  (pred_4 ?v5) (pred_12 ?v8) (pred_1 ?v4 ?v5))
:effect (and (pred_12 ?v4) (pred_1 ?v8 ?v5)
        (not (pred_12 ?v8)) (not (pred_1 ?v4 ?v5))))

(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_9 ?v5) (pred_7 ?v13) 
                  (pred_4 ?v5) (pred_12 ?v13))
:effect (and (pred_6 ) (pred_1 ?v13 ?v5) (not (pred_12 ?v13)))))


	
