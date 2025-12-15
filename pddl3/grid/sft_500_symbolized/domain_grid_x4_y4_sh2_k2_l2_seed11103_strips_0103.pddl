(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v5)
             (pred_3 ?v9 ?v7)
             (pred_11 ?v10 ?v7)
             (pred_1 ?v11 ?v10 )
	     (pred_5 ?v10)
             (pred_4 ?v6)
             (pred_6 ?v9)
             (pred_7 ?v7)
             (pred_10 ?v10)
             (pred_9 ?v9)
             (pred_12 ?v10)
             (pred_8 ))



(:action op_4
:parameters (?v8 ?v4 ?v3 ?v12)
:precondition (and (pred_4 ?v8) (pred_4 ?v4) (pred_6 ?v3) (pred_7 ?v12)
          (pred_2 ?v8 ?v4) (pred_3 ?v3 ?v12)
                   (pred_11 ?v4 ?v12) (pred_5 ?v8) 
                   (pred_10 ?v4) (pred_9 ?v3))
:effect (and  (pred_12 ?v4) (not (pred_10 ?v4))))


(:action op_1
:parameters (?v8 ?v2)
:precondition (and (pred_4 ?v8) (pred_4 ?v2)
               (pred_5 ?v8) (pred_2 ?v8 ?v2) (pred_12 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v8))))

(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_4 ?v8) (pred_6 ?v3) 
                  (pred_5 ?v8) (pred_1 ?v3 ?v8) (pred_8 ))
:effect (and (pred_9 ?v3)
   (not (pred_1 ?v3 ?v8)) (not (pred_8 ))))


(:action op_3
:parameters (?v8 ?v1 ?v13)
:precondition (and (pred_4 ?v8) (pred_6 ?v1) (pred_6 ?v13)
                  (pred_5 ?v8) (pred_9 ?v13) (pred_1 ?v1 ?v8))
:effect (and (pred_9 ?v1) (pred_1 ?v13 ?v8)
        (not (pred_9 ?v13)) (not (pred_1 ?v1 ?v8))))

(:action op_2
:parameters (?v8 ?v3)
:precondition (and (pred_4 ?v8) (pred_6 ?v3) 
                  (pred_5 ?v8) (pred_9 ?v3))
:effect (and (pred_8 ) (pred_1 ?v3 ?v8) (not (pred_9 ?v3)))))


	
