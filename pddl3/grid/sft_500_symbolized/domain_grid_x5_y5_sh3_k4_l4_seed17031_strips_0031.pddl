(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v11)
             (pred_10 ?v7 ?v10)
             (pred_3 ?v3 ?v10)
             (pred_6 ?v13 ?v3 )
	     (pred_9 ?v3)
             (pred_1 ?v9)
             (pred_12 ?v7)
             (pred_11 ?v10)
             (pred_2 ?v3)
             (pred_7 ?v7)
             (pred_5 ?v3)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v6 ?v12 ?v5)
:precondition (and (pred_1 ?v1) (pred_1 ?v6) (pred_12 ?v12) (pred_11 ?v5)
          (pred_8 ?v1 ?v6) (pred_10 ?v12 ?v5)
                   (pred_3 ?v6 ?v5) (pred_9 ?v1) 
                   (pred_2 ?v6) (pred_7 ?v12))
:effect (and  (pred_5 ?v6) (not (pred_2 ?v6))))


(:action op_1
:parameters (?v1 ?v8)
:precondition (and (pred_1 ?v1) (pred_1 ?v8)
               (pred_9 ?v1) (pred_8 ?v1 ?v8) (pred_5 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v1))))

(:action op_4
:parameters (?v1 ?v12)
:precondition (and (pred_1 ?v1) (pred_12 ?v12) 
                  (pred_9 ?v1) (pred_6 ?v12 ?v1) (pred_4 ))
:effect (and (pred_7 ?v12)
   (not (pred_6 ?v12 ?v1)) (not (pred_4 ))))


(:action op_3
:parameters (?v1 ?v2 ?v4)
:precondition (and (pred_1 ?v1) (pred_12 ?v2) (pred_12 ?v4)
                  (pred_9 ?v1) (pred_7 ?v4) (pred_6 ?v2 ?v1))
:effect (and (pred_7 ?v2) (pred_6 ?v4 ?v1)
        (not (pred_7 ?v4)) (not (pred_6 ?v2 ?v1))))

(:action op_5
:parameters (?v1 ?v12)
:precondition (and (pred_1 ?v1) (pred_12 ?v12) 
                  (pred_9 ?v1) (pred_7 ?v12))
:effect (and (pred_4 ) (pred_6 ?v12 ?v1) (not (pred_7 ?v12)))))


	
