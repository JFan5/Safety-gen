(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v9)
             (pred_10 ?v11 ?v12)
             (pred_5 ?v1 ?v12)
             (pred_9 ?v5 ?v1 )
	     (pred_11 ?v1)
             (pred_12 ?v7)
             (pred_1 ?v11)
             (pred_6 ?v12)
             (pred_4 ?v1)
             (pred_7 ?v11)
             (pred_2 ?v1)
             (pred_3 ))



(:action op_4
:parameters (?v8 ?v2 ?v4 ?v13)
:precondition (and (pred_12 ?v8) (pred_12 ?v2) (pred_1 ?v4) (pred_6 ?v13)
          (pred_8 ?v8 ?v2) (pred_10 ?v4 ?v13)
                   (pred_5 ?v2 ?v13) (pred_11 ?v8) 
                   (pred_4 ?v2) (pred_7 ?v4))
:effect (and  (pred_2 ?v2) (not (pred_4 ?v2))))


(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_12 ?v8) (pred_12 ?v3)
               (pred_11 ?v8) (pred_8 ?v8 ?v3) (pred_2 ?v3))
:effect (and (pred_11 ?v3) (not (pred_11 ?v8))))

(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_12 ?v8) (pred_1 ?v4) 
                  (pred_11 ?v8) (pred_9 ?v4 ?v8) (pred_3 ))
:effect (and (pred_7 ?v4)
   (not (pred_9 ?v4 ?v8)) (not (pred_3 ))))


(:action op_1
:parameters (?v8 ?v6 ?v10)
:precondition (and (pred_12 ?v8) (pred_1 ?v6) (pred_1 ?v10)
                  (pred_11 ?v8) (pred_7 ?v10) (pred_9 ?v6 ?v8))
:effect (and (pred_7 ?v6) (pred_9 ?v10 ?v8)
        (not (pred_7 ?v10)) (not (pred_9 ?v6 ?v8))))

(:action op_2
:parameters (?v8 ?v4)
:precondition (and (pred_12 ?v8) (pred_1 ?v4) 
                  (pred_11 ?v8) (pred_7 ?v4))
:effect (and (pred_3 ) (pred_9 ?v4 ?v8) (not (pred_7 ?v4)))))


	
