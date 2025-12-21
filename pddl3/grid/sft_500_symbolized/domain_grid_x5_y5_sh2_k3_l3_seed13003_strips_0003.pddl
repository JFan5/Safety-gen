(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v5)
             (pred_12 ?v1 ?v2)
             (pred_8 ?v10 ?v2)
             (pred_9 ?v13 ?v10 )
	     (pred_1 ?v10)
             (pred_6 ?v6)
             (pred_10 ?v1)
             (pred_11 ?v2)
             (pred_2 ?v10)
             (pred_3 ?v1)
             (pred_5 ?v10)
             (pred_4 ))



(:action op_2
:parameters (?v8 ?v4 ?v11 ?v3)
:precondition (and (pred_6 ?v8) (pred_6 ?v4) (pred_10 ?v11) (pred_11 ?v3)
          (pred_7 ?v8 ?v4) (pred_12 ?v11 ?v3)
                   (pred_8 ?v4 ?v3) (pred_1 ?v8) 
                   (pred_2 ?v4) (pred_3 ?v11))
:effect (and  (pred_5 ?v4) (not (pred_2 ?v4))))


(:action op_4
:parameters (?v8 ?v9)
:precondition (and (pred_6 ?v8) (pred_6 ?v9)
               (pred_1 ?v8) (pred_7 ?v8 ?v9) (pred_5 ?v9))
:effect (and (pred_1 ?v9) (not (pred_1 ?v8))))

(:action op_1
:parameters (?v8 ?v11)
:precondition (and (pred_6 ?v8) (pred_10 ?v11) 
                  (pred_1 ?v8) (pred_9 ?v11 ?v8) (pred_4 ))
:effect (and (pred_3 ?v11)
   (not (pred_9 ?v11 ?v8)) (not (pred_4 ))))


(:action op_3
:parameters (?v8 ?v12 ?v7)
:precondition (and (pred_6 ?v8) (pred_10 ?v12) (pred_10 ?v7)
                  (pred_1 ?v8) (pred_3 ?v7) (pred_9 ?v12 ?v8))
:effect (and (pred_3 ?v12) (pred_9 ?v7 ?v8)
        (not (pred_3 ?v7)) (not (pred_9 ?v12 ?v8))))

(:action op_5
:parameters (?v8 ?v11)
:precondition (and (pred_6 ?v8) (pred_10 ?v11) 
                  (pred_1 ?v8) (pred_3 ?v11))
:effect (and (pred_4 ) (pred_9 ?v11 ?v8) (not (pred_3 ?v11)))))


	
