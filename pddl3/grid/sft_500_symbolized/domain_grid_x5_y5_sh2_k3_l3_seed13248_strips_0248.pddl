(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v7)
             (pred_5 ?v5 ?v3)
             (pred_1 ?v6 ?v3)
             (pred_2 ?v11 ?v6 )
	     (pred_8 ?v6)
             (pred_9 ?v12)
             (pred_12 ?v5)
             (pred_3 ?v3)
             (pred_10 ?v6)
             (pred_6 ?v5)
             (pred_7 ?v6)
             (pred_4 ))



(:action op_4
:parameters (?v8 ?v1 ?v4 ?v2)
:precondition (and (pred_9 ?v8) (pred_9 ?v1) (pred_12 ?v4) (pred_3 ?v2)
          (pred_11 ?v8 ?v1) (pred_5 ?v4 ?v2)
                   (pred_1 ?v1 ?v2) (pred_8 ?v8) 
                   (pred_10 ?v1) (pred_6 ?v4))
:effect (and  (pred_7 ?v1) (not (pred_10 ?v1))))


(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_9 ?v8) (pred_9 ?v10)
               (pred_8 ?v8) (pred_11 ?v8 ?v10) (pred_7 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v8))))

(:action op_5
:parameters (?v8 ?v4)
:precondition (and (pred_9 ?v8) (pred_12 ?v4) 
                  (pred_8 ?v8) (pred_2 ?v4 ?v8) (pred_4 ))
:effect (and (pred_6 ?v4)
   (not (pred_2 ?v4 ?v8)) (not (pred_4 ))))


(:action op_2
:parameters (?v8 ?v9 ?v13)
:precondition (and (pred_9 ?v8) (pred_12 ?v9) (pred_12 ?v13)
                  (pred_8 ?v8) (pred_6 ?v13) (pred_2 ?v9 ?v8))
:effect (and (pred_6 ?v9) (pred_2 ?v13 ?v8)
        (not (pred_6 ?v13)) (not (pred_2 ?v9 ?v8))))

(:action op_1
:parameters (?v8 ?v4)
:precondition (and (pred_9 ?v8) (pred_12 ?v4) 
                  (pred_8 ?v8) (pred_6 ?v4))
:effect (and (pred_4 ) (pred_2 ?v4 ?v8) (not (pred_6 ?v4)))))


	
