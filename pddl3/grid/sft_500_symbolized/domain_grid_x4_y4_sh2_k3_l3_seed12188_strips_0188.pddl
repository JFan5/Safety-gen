(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v11)
             (pred_7 ?v4 ?v9)
             (pred_4 ?v13 ?v9)
             (pred_3 ?v2 ?v13 )
	     (pred_11 ?v13)
             (pred_9 ?v7)
             (pred_12 ?v4)
             (pred_5 ?v9)
             (pred_2 ?v13)
             (pred_1 ?v4)
             (pred_6 ?v13)
             (pred_8 ))



(:action op_5
:parameters (?v8 ?v1 ?v12 ?v3)
:precondition (and (pred_9 ?v8) (pred_9 ?v1) (pred_12 ?v12) (pred_5 ?v3)
          (pred_10 ?v8 ?v1) (pred_7 ?v12 ?v3)
                   (pred_4 ?v1 ?v3) (pred_11 ?v8) 
                   (pred_2 ?v1) (pred_1 ?v12))
:effect (and  (pred_6 ?v1) (not (pred_2 ?v1))))


(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_9 ?v8) (pred_9 ?v10)
               (pred_11 ?v8) (pred_10 ?v8 ?v10) (pred_6 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_9 ?v8) (pred_12 ?v12) 
                  (pred_11 ?v8) (pred_3 ?v12 ?v8) (pred_8 ))
:effect (and (pred_1 ?v12)
   (not (pred_3 ?v12 ?v8)) (not (pred_8 ))))


(:action op_4
:parameters (?v8 ?v5 ?v6)
:precondition (and (pred_9 ?v8) (pred_12 ?v5) (pred_12 ?v6)
                  (pred_11 ?v8) (pred_1 ?v6) (pred_3 ?v5 ?v8))
:effect (and (pred_1 ?v5) (pred_3 ?v6 ?v8)
        (not (pred_1 ?v6)) (not (pred_3 ?v5 ?v8))))

(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_9 ?v8) (pred_12 ?v12) 
                  (pred_11 ?v8) (pred_1 ?v12))
:effect (and (pred_8 ) (pred_3 ?v12 ?v8) (not (pred_1 ?v12)))))


	
