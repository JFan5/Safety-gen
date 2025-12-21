(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v6)
             (pred_12 ?v13 ?v9)
             (pred_1 ?v4 ?v9)
             (pred_8 ?v1 ?v4 )
	     (pred_10 ?v4)
             (pred_9 ?v5)
             (pred_7 ?v13)
             (pred_3 ?v9)
             (pred_11 ?v4)
             (pred_5 ?v13)
             (pred_4 ?v4)
             (pred_2 ))



(:action op_3
:parameters (?v8 ?v2 ?v12 ?v11)
:precondition (and (pred_9 ?v8) (pred_9 ?v2) (pred_7 ?v12) (pred_3 ?v11)
          (pred_6 ?v8 ?v2) (pred_12 ?v12 ?v11)
                   (pred_1 ?v2 ?v11) (pred_10 ?v8) 
                   (pred_11 ?v2) (pred_5 ?v12))
:effect (and  (pred_4 ?v2) (not (pred_11 ?v2))))


(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_9 ?v8) (pred_9 ?v3)
               (pred_10 ?v8) (pred_6 ?v8 ?v3) (pred_4 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v8))))

(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_9 ?v8) (pred_7 ?v12) 
                  (pred_10 ?v8) (pred_8 ?v12 ?v8) (pred_2 ))
:effect (and (pred_5 ?v12)
   (not (pred_8 ?v12 ?v8)) (not (pred_2 ))))


(:action op_1
:parameters (?v8 ?v10 ?v7)
:precondition (and (pred_9 ?v8) (pred_7 ?v10) (pred_7 ?v7)
                  (pred_10 ?v8) (pred_5 ?v7) (pred_8 ?v10 ?v8))
:effect (and (pred_5 ?v10) (pred_8 ?v7 ?v8)
        (not (pred_5 ?v7)) (not (pred_8 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v12)
:precondition (and (pred_9 ?v8) (pred_7 ?v12) 
                  (pred_10 ?v8) (pred_5 ?v12))
:effect (and (pred_2 ) (pred_8 ?v12 ?v8) (not (pred_5 ?v12)))))


	
