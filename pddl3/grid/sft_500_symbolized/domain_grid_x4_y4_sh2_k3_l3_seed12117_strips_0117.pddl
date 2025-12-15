(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v5 ?v9)
             (pred_6 ?v10 ?v13)
             (pred_8 ?v5 ?v13)
             (pred_12 ?v11 ?v5 )
	     (pred_3 ?v5)
             (pred_9 ?v3)
             (pred_1 ?v10)
             (pred_4 ?v13)
             (pred_5 ?v5)
             (pred_11 ?v10)
             (pred_7 ?v5)
             (pred_10 ))



(:action op_1
:parameters (?v4 ?v8 ?v12 ?v7)
:precondition (and (pred_9 ?v4) (pred_9 ?v8) (pred_1 ?v12) (pred_4 ?v7)
          (pred_2 ?v4 ?v8) (pred_6 ?v12 ?v7)
                   (pred_8 ?v8 ?v7) (pred_3 ?v4) 
                   (pred_5 ?v8) (pred_11 ?v12))
:effect (and  (pred_7 ?v8) (not (pred_5 ?v8))))


(:action op_5
:parameters (?v4 ?v1)
:precondition (and (pred_9 ?v4) (pred_9 ?v1)
               (pred_3 ?v4) (pred_2 ?v4 ?v1) (pred_7 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v4))))

(:action op_3
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_1 ?v12) 
                  (pred_3 ?v4) (pred_12 ?v12 ?v4) (pred_10 ))
:effect (and (pred_11 ?v12)
   (not (pred_12 ?v12 ?v4)) (not (pred_10 ))))


(:action op_4
:parameters (?v4 ?v6 ?v2)
:precondition (and (pred_9 ?v4) (pred_1 ?v6) (pred_1 ?v2)
                  (pred_3 ?v4) (pred_11 ?v2) (pred_12 ?v6 ?v4))
:effect (and (pred_11 ?v6) (pred_12 ?v2 ?v4)
        (not (pred_11 ?v2)) (not (pred_12 ?v6 ?v4))))

(:action op_2
:parameters (?v4 ?v12)
:precondition (and (pred_9 ?v4) (pred_1 ?v12) 
                  (pred_3 ?v4) (pred_11 ?v12))
:effect (and (pred_10 ) (pred_12 ?v12 ?v4) (not (pred_11 ?v12)))))


	
