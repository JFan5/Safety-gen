(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v13 ?v9)
             (pred_11 ?v11 ?v10)
             (pred_10 ?v13 ?v10)
             (pred_12 ?v12 ?v13 )
	     (pred_6 ?v13)
             (pred_3 ?v3)
             (pred_7 ?v11)
             (pred_2 ?v10)
             (pred_5 ?v13)
             (pred_9 ?v11)
             (pred_1 ?v13)
             (pred_8 ))



(:action op_1
:parameters (?v8 ?v2 ?v1 ?v5)
:precondition (and (pred_3 ?v8) (pred_3 ?v2) (pred_7 ?v1) (pred_2 ?v5)
          (pred_4 ?v8 ?v2) (pred_11 ?v1 ?v5)
                   (pred_10 ?v2 ?v5) (pred_6 ?v8) 
                   (pred_5 ?v2) (pred_9 ?v1))
:effect (and  (pred_1 ?v2) (not (pred_5 ?v2))))


(:action op_3
:parameters (?v8 ?v4)
:precondition (and (pred_3 ?v8) (pred_3 ?v4)
               (pred_6 ?v8) (pred_4 ?v8 ?v4) (pred_1 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v8))))

(:action op_5
:parameters (?v8 ?v1)
:precondition (and (pred_3 ?v8) (pred_7 ?v1) 
                  (pred_6 ?v8) (pred_12 ?v1 ?v8) (pred_8 ))
:effect (and (pred_9 ?v1)
   (not (pred_12 ?v1 ?v8)) (not (pred_8 ))))


(:action op_4
:parameters (?v8 ?v6 ?v7)
:precondition (and (pred_3 ?v8) (pred_7 ?v6) (pred_7 ?v7)
                  (pred_6 ?v8) (pred_9 ?v7) (pred_12 ?v6 ?v8))
:effect (and (pred_9 ?v6) (pred_12 ?v7 ?v8)
        (not (pred_9 ?v7)) (not (pred_12 ?v6 ?v8))))

(:action op_2
:parameters (?v8 ?v1)
:precondition (and (pred_3 ?v8) (pred_7 ?v1) 
                  (pred_6 ?v8) (pred_9 ?v1))
:effect (and (pred_8 ) (pred_12 ?v1 ?v8) (not (pred_9 ?v1)))))


	
