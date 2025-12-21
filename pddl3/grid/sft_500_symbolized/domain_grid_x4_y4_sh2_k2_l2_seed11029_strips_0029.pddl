(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v3)
             (pred_6 ?v10 ?v2)
             (pred_3 ?v7 ?v2)
             (pred_12 ?v6 ?v7 )
	     (pred_4 ?v7)
             (pred_5 ?v13)
             (pred_9 ?v10)
             (pred_7 ?v2)
             (pred_8 ?v7)
             (pred_1 ?v10)
             (pred_10 ?v7)
             (pred_2 ))



(:action op_2
:parameters (?v8 ?v5 ?v9 ?v1)
:precondition (and (pred_5 ?v8) (pred_5 ?v5) (pred_9 ?v9) (pred_7 ?v1)
          (pred_11 ?v8 ?v5) (pred_6 ?v9 ?v1)
                   (pred_3 ?v5 ?v1) (pred_4 ?v8) 
                   (pred_8 ?v5) (pred_1 ?v9))
:effect (and  (pred_10 ?v5) (not (pred_8 ?v5))))


(:action op_3
:parameters (?v8 ?v11)
:precondition (and (pred_5 ?v8) (pred_5 ?v11)
               (pred_4 ?v8) (pred_11 ?v8 ?v11) (pred_10 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v8))))

(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_5 ?v8) (pred_9 ?v9) 
                  (pred_4 ?v8) (pred_12 ?v9 ?v8) (pred_2 ))
:effect (and (pred_1 ?v9)
   (not (pred_12 ?v9 ?v8)) (not (pred_2 ))))


(:action op_5
:parameters (?v8 ?v4 ?v12)
:precondition (and (pred_5 ?v8) (pred_9 ?v4) (pred_9 ?v12)
                  (pred_4 ?v8) (pred_1 ?v12) (pred_12 ?v4 ?v8))
:effect (and (pred_1 ?v4) (pred_12 ?v12 ?v8)
        (not (pred_1 ?v12)) (not (pred_12 ?v4 ?v8))))

(:action op_4
:parameters (?v8 ?v9)
:precondition (and (pred_5 ?v8) (pred_9 ?v9) 
                  (pred_4 ?v8) (pred_1 ?v9))
:effect (and (pred_2 ) (pred_12 ?v9 ?v8) (not (pred_1 ?v9)))))


	
