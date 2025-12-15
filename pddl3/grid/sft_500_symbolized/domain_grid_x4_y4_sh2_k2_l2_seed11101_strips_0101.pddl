(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v12)
             (pred_10 ?v5 ?v13)
             (pred_12 ?v2 ?v13)
             (pred_11 ?v1 ?v2 )
	     (pred_2 ?v2)
             (pred_5 ?v6)
             (pred_8 ?v5)
             (pred_3 ?v13)
             (pred_6 ?v2)
             (pred_9 ?v5)
             (pred_1 ?v2)
             (pred_7 ))



(:action op_1
:parameters (?v8 ?v9 ?v10 ?v3)
:precondition (and (pred_5 ?v8) (pred_5 ?v9) (pred_8 ?v10) (pred_3 ?v3)
          (pred_4 ?v8 ?v9) (pred_10 ?v10 ?v3)
                   (pred_12 ?v9 ?v3) (pred_2 ?v8) 
                   (pred_6 ?v9) (pred_9 ?v10))
:effect (and  (pred_1 ?v9) (not (pred_6 ?v9))))


(:action op_5
:parameters (?v8 ?v11)
:precondition (and (pred_5 ?v8) (pred_5 ?v11)
               (pred_2 ?v8) (pred_4 ?v8 ?v11) (pred_1 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v8))))

(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_5 ?v8) (pred_8 ?v10) 
                  (pred_2 ?v8) (pred_11 ?v10 ?v8) (pred_7 ))
:effect (and (pred_9 ?v10)
   (not (pred_11 ?v10 ?v8)) (not (pred_7 ))))


(:action op_3
:parameters (?v8 ?v4 ?v7)
:precondition (and (pred_5 ?v8) (pred_8 ?v4) (pred_8 ?v7)
                  (pred_2 ?v8) (pred_9 ?v7) (pred_11 ?v4 ?v8))
:effect (and (pred_9 ?v4) (pred_11 ?v7 ?v8)
        (not (pred_9 ?v7)) (not (pred_11 ?v4 ?v8))))

(:action op_2
:parameters (?v8 ?v10)
:precondition (and (pred_5 ?v8) (pred_8 ?v10) 
                  (pred_2 ?v8) (pred_9 ?v10))
:effect (and (pred_7 ) (pred_11 ?v10 ?v8) (not (pred_9 ?v10)))))


	
