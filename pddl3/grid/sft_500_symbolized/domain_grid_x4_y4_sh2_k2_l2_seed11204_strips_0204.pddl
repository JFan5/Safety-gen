(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v2 ?v10)
             (pred_5 ?v1 ?v13)
             (pred_4 ?v2 ?v13)
             (pred_12 ?v5 ?v2 )
	     (pred_2 ?v2)
             (pred_10 ?v7)
             (pred_7 ?v1)
             (pred_8 ?v13)
             (pred_11 ?v2)
             (pred_9 ?v1)
             (pred_3 ?v2)
             (pred_6 ))



(:action op_5
:parameters (?v8 ?v12 ?v3 ?v6)
:precondition (and (pred_10 ?v8) (pred_10 ?v12) (pred_7 ?v3) (pred_8 ?v6)
          (pred_1 ?v8 ?v12) (pred_5 ?v3 ?v6)
                   (pred_4 ?v12 ?v6) (pred_2 ?v8) 
                   (pred_11 ?v12) (pred_9 ?v3))
:effect (and  (pred_3 ?v12) (not (pred_11 ?v12))))


(:action op_1
:parameters (?v8 ?v11)
:precondition (and (pred_10 ?v8) (pred_10 ?v11)
               (pred_2 ?v8) (pred_1 ?v8 ?v11) (pred_3 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v8))))

(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_10 ?v8) (pred_7 ?v3) 
                  (pred_2 ?v8) (pred_12 ?v3 ?v8) (pred_6 ))
:effect (and (pred_9 ?v3)
   (not (pred_12 ?v3 ?v8)) (not (pred_6 ))))


(:action op_2
:parameters (?v8 ?v9 ?v4)
:precondition (and (pred_10 ?v8) (pred_7 ?v9) (pred_7 ?v4)
                  (pred_2 ?v8) (pred_9 ?v4) (pred_12 ?v9 ?v8))
:effect (and (pred_9 ?v9) (pred_12 ?v4 ?v8)
        (not (pred_9 ?v4)) (not (pred_12 ?v9 ?v8))))

(:action op_4
:parameters (?v8 ?v3)
:precondition (and (pred_10 ?v8) (pred_7 ?v3) 
                  (pred_2 ?v8) (pred_9 ?v3))
:effect (and (pred_6 ) (pred_12 ?v3 ?v8) (not (pred_9 ?v3)))))


	
