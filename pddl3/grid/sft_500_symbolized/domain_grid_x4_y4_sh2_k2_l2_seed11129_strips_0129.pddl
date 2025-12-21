(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v6)
             (pred_7 ?v1 ?v13)
             (pred_4 ?v11 ?v13)
             (pred_3 ?v3 ?v11 )
	     (pred_8 ?v11)
             (pred_11 ?v7)
             (pred_2 ?v1)
             (pred_5 ?v13)
             (pred_12 ?v11)
             (pred_1 ?v1)
             (pred_10 ?v11)
             (pred_9 ))



(:action op_4
:parameters (?v8 ?v10 ?v9 ?v5)
:precondition (and (pred_11 ?v8) (pred_11 ?v10) (pred_2 ?v9) (pred_5 ?v5)
          (pred_6 ?v8 ?v10) (pred_7 ?v9 ?v5)
                   (pred_4 ?v10 ?v5) (pred_8 ?v8) 
                   (pred_12 ?v10) (pred_1 ?v9))
:effect (and  (pred_10 ?v10) (not (pred_12 ?v10))))


(:action op_3
:parameters (?v8 ?v2)
:precondition (and (pred_11 ?v8) (pred_11 ?v2)
               (pred_8 ?v8) (pred_6 ?v8 ?v2) (pred_10 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v8))))

(:action op_1
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_2 ?v9) 
                  (pred_8 ?v8) (pred_3 ?v9 ?v8) (pred_9 ))
:effect (and (pred_1 ?v9)
   (not (pred_3 ?v9 ?v8)) (not (pred_9 ))))


(:action op_2
:parameters (?v8 ?v12 ?v4)
:precondition (and (pred_11 ?v8) (pred_2 ?v12) (pred_2 ?v4)
                  (pred_8 ?v8) (pred_1 ?v4) (pred_3 ?v12 ?v8))
:effect (and (pred_1 ?v12) (pred_3 ?v4 ?v8)
        (not (pred_1 ?v4)) (not (pred_3 ?v12 ?v8))))

(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_2 ?v9) 
                  (pred_8 ?v8) (pred_1 ?v9))
:effect (and (pred_9 ) (pred_3 ?v9 ?v8) (not (pred_1 ?v9)))))


	
