(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v2)
             (pred_10 ?v13 ?v6)
             (pred_1 ?v5 ?v6)
             (pred_12 ?v11 ?v5 )
	     (pred_11 ?v5)
             (pred_8 ?v3)
             (pred_6 ?v13)
             (pred_2 ?v6)
             (pred_9 ?v5)
             (pred_4 ?v13)
             (pred_5 ?v5)
             (pred_3 ))



(:action op_5
:parameters (?v8 ?v9 ?v12 ?v1)
:precondition (and (pred_8 ?v8) (pred_8 ?v9) (pred_6 ?v12) (pred_2 ?v1)
          (pred_7 ?v8 ?v9) (pred_10 ?v12 ?v1)
                   (pred_1 ?v9 ?v1) (pred_11 ?v8) 
                   (pred_9 ?v9) (pred_4 ?v12))
:effect (and  (pred_5 ?v9) (not (pred_9 ?v9))))


(:action op_2
:parameters (?v8 ?v10)
:precondition (and (pred_8 ?v8) (pred_8 ?v10)
               (pred_11 ?v8) (pred_7 ?v8 ?v10) (pred_5 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v8))))

(:action op_3
:parameters (?v8 ?v12)
:precondition (and (pred_8 ?v8) (pred_6 ?v12) 
                  (pred_11 ?v8) (pred_12 ?v12 ?v8) (pred_3 ))
:effect (and (pred_4 ?v12)
   (not (pred_12 ?v12 ?v8)) (not (pred_3 ))))


(:action op_4
:parameters (?v8 ?v4 ?v7)
:precondition (and (pred_8 ?v8) (pred_6 ?v4) (pred_6 ?v7)
                  (pred_11 ?v8) (pred_4 ?v7) (pred_12 ?v4 ?v8))
:effect (and (pred_4 ?v4) (pred_12 ?v7 ?v8)
        (not (pred_4 ?v7)) (not (pred_12 ?v4 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_8 ?v8) (pred_6 ?v12) 
                  (pred_11 ?v8) (pred_4 ?v12))
:effect (and (pred_3 ) (pred_12 ?v12 ?v8) (not (pred_4 ?v12)))))


	
