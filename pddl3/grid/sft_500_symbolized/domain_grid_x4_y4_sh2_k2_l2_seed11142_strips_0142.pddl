(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v11 ?v1)
             (pred_5 ?v4 ?v13)
             (pred_3 ?v11 ?v13)
             (pred_9 ?v6 ?v11 )
	     (pred_1 ?v11)
             (pred_6 ?v2)
             (pred_11 ?v4)
             (pred_12 ?v13)
             (pred_10 ?v11)
             (pred_4 ?v4)
             (pred_7 ?v11)
             (pred_2 ))



(:action op_2
:parameters (?v8 ?v10 ?v12 ?v3)
:precondition (and (pred_6 ?v8) (pred_6 ?v10) (pred_11 ?v12) (pred_12 ?v3)
          (pred_8 ?v8 ?v10) (pred_5 ?v12 ?v3)
                   (pred_3 ?v10 ?v3) (pred_1 ?v8) 
                   (pred_10 ?v10) (pred_4 ?v12))
:effect (and  (pred_7 ?v10) (not (pred_10 ?v10))))


(:action op_4
:parameters (?v8 ?v7)
:precondition (and (pred_6 ?v8) (pred_6 ?v7)
               (pred_1 ?v8) (pred_8 ?v8 ?v7) (pred_7 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v8))))

(:action op_3
:parameters (?v8 ?v12)
:precondition (and (pred_6 ?v8) (pred_11 ?v12) 
                  (pred_1 ?v8) (pred_9 ?v12 ?v8) (pred_2 ))
:effect (and (pred_4 ?v12)
   (not (pred_9 ?v12 ?v8)) (not (pred_2 ))))


(:action op_5
:parameters (?v8 ?v9 ?v5)
:precondition (and (pred_6 ?v8) (pred_11 ?v9) (pred_11 ?v5)
                  (pred_1 ?v8) (pred_4 ?v5) (pred_9 ?v9 ?v8))
:effect (and (pred_4 ?v9) (pred_9 ?v5 ?v8)
        (not (pred_4 ?v5)) (not (pred_9 ?v9 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_6 ?v8) (pred_11 ?v12) 
                  (pred_1 ?v8) (pred_4 ?v12))
:effect (and (pred_2 ) (pred_9 ?v12 ?v8) (not (pred_4 ?v12)))))


	
