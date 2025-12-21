(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v6)
             (pred_6 ?v11 ?v2)
             (pred_10 ?v4 ?v2)
             (pred_11 ?v12 ?v4 )
	     (pred_5 ?v4)
             (pred_12 ?v13)
             (pred_1 ?v11)
             (pred_7 ?v2)
             (pred_4 ?v4)
             (pred_2 ?v11)
             (pred_9 ?v4)
             (pred_8 ))



(:action op_2
:parameters (?v8 ?v9 ?v5 ?v10)
:precondition (and (pred_12 ?v8) (pred_12 ?v9) (pred_1 ?v5) (pred_7 ?v10)
          (pred_3 ?v8 ?v9) (pred_6 ?v5 ?v10)
                   (pred_10 ?v9 ?v10) (pred_5 ?v8) 
                   (pred_4 ?v9) (pred_2 ?v5))
:effect (and  (pred_9 ?v9) (not (pred_4 ?v9))))


(:action op_5
:parameters (?v8 ?v7)
:precondition (and (pred_12 ?v8) (pred_12 ?v7)
               (pred_5 ?v8) (pred_3 ?v8 ?v7) (pred_9 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v8))))

(:action op_1
:parameters (?v8 ?v5)
:precondition (and (pred_12 ?v8) (pred_1 ?v5) 
                  (pred_5 ?v8) (pred_11 ?v5 ?v8) (pred_8 ))
:effect (and (pred_2 ?v5)
   (not (pred_11 ?v5 ?v8)) (not (pred_8 ))))


(:action op_3
:parameters (?v8 ?v1 ?v3)
:precondition (and (pred_12 ?v8) (pred_1 ?v1) (pred_1 ?v3)
                  (pred_5 ?v8) (pred_2 ?v3) (pred_11 ?v1 ?v8))
:effect (and (pred_2 ?v1) (pred_11 ?v3 ?v8)
        (not (pred_2 ?v3)) (not (pred_11 ?v1 ?v8))))

(:action op_4
:parameters (?v8 ?v5)
:precondition (and (pred_12 ?v8) (pred_1 ?v5) 
                  (pred_5 ?v8) (pred_2 ?v5))
:effect (and (pred_8 ) (pred_11 ?v5 ?v8) (not (pred_2 ?v5)))))


	
