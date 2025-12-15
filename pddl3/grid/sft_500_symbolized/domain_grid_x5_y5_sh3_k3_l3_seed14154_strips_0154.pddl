(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v11)
             (pred_7 ?v12 ?v1)
             (pred_8 ?v10 ?v1)
             (pred_12 ?v5 ?v10 )
	     (pred_5 ?v10)
             (pred_9 ?v2)
             (pred_11 ?v12)
             (pred_6 ?v1)
             (pred_1 ?v10)
             (pred_4 ?v12)
             (pred_3 ?v10)
             (pred_2 ))



(:action op_4
:parameters (?v8 ?v9 ?v3 ?v13)
:precondition (and (pred_9 ?v8) (pred_9 ?v9) (pred_11 ?v3) (pred_6 ?v13)
          (pred_10 ?v8 ?v9) (pred_7 ?v3 ?v13)
                   (pred_8 ?v9 ?v13) (pred_5 ?v8) 
                   (pred_1 ?v9) (pred_4 ?v3))
:effect (and  (pred_3 ?v9) (not (pred_1 ?v9))))


(:action op_3
:parameters (?v8 ?v7)
:precondition (and (pred_9 ?v8) (pred_9 ?v7)
               (pred_5 ?v8) (pred_10 ?v8 ?v7) (pred_3 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v8))))

(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_9 ?v8) (pred_11 ?v3) 
                  (pred_5 ?v8) (pred_12 ?v3 ?v8) (pred_2 ))
:effect (and (pred_4 ?v3)
   (not (pred_12 ?v3 ?v8)) (not (pred_2 ))))


(:action op_1
:parameters (?v8 ?v6 ?v4)
:precondition (and (pred_9 ?v8) (pred_11 ?v6) (pred_11 ?v4)
                  (pred_5 ?v8) (pred_4 ?v4) (pred_12 ?v6 ?v8))
:effect (and (pred_4 ?v6) (pred_12 ?v4 ?v8)
        (not (pred_4 ?v4)) (not (pred_12 ?v6 ?v8))))

(:action op_2
:parameters (?v8 ?v3)
:precondition (and (pred_9 ?v8) (pred_11 ?v3) 
                  (pred_5 ?v8) (pred_4 ?v3))
:effect (and (pred_2 ) (pred_12 ?v3 ?v8) (not (pred_4 ?v3)))))


	
