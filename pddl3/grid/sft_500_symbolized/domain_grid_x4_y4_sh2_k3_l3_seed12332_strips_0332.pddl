(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v1)
             (pred_7 ?v12 ?v5)
             (pred_8 ?v13 ?v5)
             (pred_12 ?v11 ?v13 )
	     (pred_4 ?v13)
             (pred_11 ?v2)
             (pred_2 ?v12)
             (pred_10 ?v5)
             (pred_3 ?v13)
             (pred_1 ?v12)
             (pred_5 ?v13)
             (pred_9 ))



(:action op_4
:parameters (?v8 ?v9 ?v4 ?v6)
:precondition (and (pred_11 ?v8) (pred_11 ?v9) (pred_2 ?v4) (pred_10 ?v6)
          (pred_6 ?v8 ?v9) (pred_7 ?v4 ?v6)
                   (pred_8 ?v9 ?v6) (pred_4 ?v8) 
                   (pred_3 ?v9) (pred_1 ?v4))
:effect (and  (pred_5 ?v9) (not (pred_3 ?v9))))


(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_11 ?v8) (pred_11 ?v10)
               (pred_4 ?v8) (pred_6 ?v8 ?v10) (pred_5 ?v10))
:effect (and (pred_4 ?v10) (not (pred_4 ?v8))))

(:action op_1
:parameters (?v8 ?v4)
:precondition (and (pred_11 ?v8) (pred_2 ?v4) 
                  (pred_4 ?v8) (pred_12 ?v4 ?v8) (pred_9 ))
:effect (and (pred_1 ?v4)
   (not (pred_12 ?v4 ?v8)) (not (pred_9 ))))


(:action op_3
:parameters (?v8 ?v7 ?v3)
:precondition (and (pred_11 ?v8) (pred_2 ?v7) (pred_2 ?v3)
                  (pred_4 ?v8) (pred_1 ?v3) (pred_12 ?v7 ?v8))
:effect (and (pred_1 ?v7) (pred_12 ?v3 ?v8)
        (not (pred_1 ?v3)) (not (pred_12 ?v7 ?v8))))

(:action op_2
:parameters (?v8 ?v4)
:precondition (and (pred_11 ?v8) (pred_2 ?v4) 
                  (pred_4 ?v8) (pred_1 ?v4))
:effect (and (pred_9 ) (pred_12 ?v4 ?v8) (not (pred_1 ?v4)))))


	
