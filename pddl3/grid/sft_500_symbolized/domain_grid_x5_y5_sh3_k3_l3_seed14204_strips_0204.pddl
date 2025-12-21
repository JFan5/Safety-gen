(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v3)
             (pred_2 ?v7 ?v13)
             (pred_4 ?v2 ?v13)
             (pred_7 ?v1 ?v2 )
	     (pred_3 ?v2)
             (pred_11 ?v11)
             (pred_12 ?v7)
             (pred_8 ?v13)
             (pred_1 ?v2)
             (pred_9 ?v7)
             (pred_6 ?v2)
             (pred_10 ))



(:action op_5
:parameters (?v8 ?v10 ?v5 ?v4)
:precondition (and (pred_11 ?v8) (pred_11 ?v10) (pred_12 ?v5) (pred_8 ?v4)
          (pred_5 ?v8 ?v10) (pred_2 ?v5 ?v4)
                   (pred_4 ?v10 ?v4) (pred_3 ?v8) 
                   (pred_1 ?v10) (pred_9 ?v5))
:effect (and  (pred_6 ?v10) (not (pred_1 ?v10))))


(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_11 ?v8) (pred_11 ?v12)
               (pred_3 ?v8) (pred_5 ?v8 ?v12) (pred_6 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v8))))

(:action op_4
:parameters (?v8 ?v5)
:precondition (and (pred_11 ?v8) (pred_12 ?v5) 
                  (pred_3 ?v8) (pred_7 ?v5 ?v8) (pred_10 ))
:effect (and (pred_9 ?v5)
   (not (pred_7 ?v5 ?v8)) (not (pred_10 ))))


(:action op_1
:parameters (?v8 ?v9 ?v6)
:precondition (and (pred_11 ?v8) (pred_12 ?v9) (pred_12 ?v6)
                  (pred_3 ?v8) (pred_9 ?v6) (pred_7 ?v9 ?v8))
:effect (and (pred_9 ?v9) (pred_7 ?v6 ?v8)
        (not (pred_9 ?v6)) (not (pred_7 ?v9 ?v8))))

(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_11 ?v8) (pred_12 ?v5) 
                  (pred_3 ?v8) (pred_9 ?v5))
:effect (and (pred_10 ) (pred_7 ?v5 ?v8) (not (pred_9 ?v5)))))


	
