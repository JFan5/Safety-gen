(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v11)
             (pred_5 ?v6 ?v10)
             (pred_2 ?v5 ?v10)
             (pred_11 ?v9 ?v5 )
	     (pred_10 ?v5)
             (pred_7 ?v3)
             (pred_9 ?v6)
             (pred_8 ?v10)
             (pred_3 ?v5)
             (pred_12 ?v6)
             (pred_4 ?v5)
             (pred_6 ))



(:action op_3
:parameters (?v1 ?v4 ?v7 ?v12)
:precondition (and (pred_7 ?v1) (pred_7 ?v4) (pred_9 ?v7) (pred_8 ?v12)
          (pred_1 ?v1 ?v4) (pred_5 ?v7 ?v12)
                   (pred_2 ?v4 ?v12) (pred_10 ?v1) 
                   (pred_3 ?v4) (pred_12 ?v7))
:effect (and  (pred_4 ?v4) (not (pred_3 ?v4))))


(:action op_1
:parameters (?v1 ?v13)
:precondition (and (pred_7 ?v1) (pred_7 ?v13)
               (pred_10 ?v1) (pred_1 ?v1 ?v13) (pred_4 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v1))))

(:action op_4
:parameters (?v1 ?v7)
:precondition (and (pred_7 ?v1) (pred_9 ?v7) 
                  (pred_10 ?v1) (pred_11 ?v7 ?v1) (pred_6 ))
:effect (and (pred_12 ?v7)
   (not (pred_11 ?v7 ?v1)) (not (pred_6 ))))


(:action op_2
:parameters (?v1 ?v8 ?v2)
:precondition (and (pred_7 ?v1) (pred_9 ?v8) (pred_9 ?v2)
                  (pred_10 ?v1) (pred_12 ?v2) (pred_11 ?v8 ?v1))
:effect (and (pred_12 ?v8) (pred_11 ?v2 ?v1)
        (not (pred_12 ?v2)) (not (pred_11 ?v8 ?v1))))

(:action op_5
:parameters (?v1 ?v7)
:precondition (and (pred_7 ?v1) (pred_9 ?v7) 
                  (pred_10 ?v1) (pred_12 ?v7))
:effect (and (pred_6 ) (pred_11 ?v7 ?v1) (not (pred_12 ?v7)))))


	
