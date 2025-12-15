(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v4 ?v12)
             (pred_11 ?v10 ?v11)
             (pred_4 ?v4 ?v11)
             (pred_1 ?v9 ?v4 )
	     (pred_6 ?v4)
             (pred_9 ?v2)
             (pred_10 ?v10)
             (pred_3 ?v11)
             (pred_7 ?v4)
             (pred_2 ?v10)
             (pred_5 ?v4)
             (pred_12 ))



(:action op_3
:parameters (?v1 ?v5 ?v13 ?v3)
:precondition (and (pred_9 ?v1) (pred_9 ?v5) (pred_10 ?v13) (pred_3 ?v3)
          (pred_8 ?v1 ?v5) (pred_11 ?v13 ?v3)
                   (pred_4 ?v5 ?v3) (pred_6 ?v1) 
                   (pred_7 ?v5) (pred_2 ?v13))
:effect (and  (pred_5 ?v5) (not (pred_7 ?v5))))


(:action op_1
:parameters (?v1 ?v8)
:precondition (and (pred_9 ?v1) (pred_9 ?v8)
               (pred_6 ?v1) (pred_8 ?v1 ?v8) (pred_5 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v1))))

(:action op_5
:parameters (?v1 ?v13)
:precondition (and (pred_9 ?v1) (pred_10 ?v13) 
                  (pred_6 ?v1) (pred_1 ?v13 ?v1) (pred_12 ))
:effect (and (pred_2 ?v13)
   (not (pred_1 ?v13 ?v1)) (not (pred_12 ))))


(:action op_4
:parameters (?v1 ?v6 ?v7)
:precondition (and (pred_9 ?v1) (pred_10 ?v6) (pred_10 ?v7)
                  (pred_6 ?v1) (pred_2 ?v7) (pred_1 ?v6 ?v1))
:effect (and (pred_2 ?v6) (pred_1 ?v7 ?v1)
        (not (pred_2 ?v7)) (not (pred_1 ?v6 ?v1))))

(:action op_2
:parameters (?v1 ?v13)
:precondition (and (pred_9 ?v1) (pred_10 ?v13) 
                  (pred_6 ?v1) (pred_2 ?v13))
:effect (and (pred_12 ) (pred_1 ?v13 ?v1) (not (pred_2 ?v13)))))


	
