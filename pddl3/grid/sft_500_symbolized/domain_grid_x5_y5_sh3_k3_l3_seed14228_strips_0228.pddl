(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v3)
             (pred_1 ?v10 ?v6)
             (pred_3 ?v7 ?v6)
             (pred_12 ?v9 ?v7 )
	     (pred_2 ?v7)
             (pred_7 ?v4)
             (pred_8 ?v10)
             (pred_4 ?v6)
             (pred_9 ?v7)
             (pred_11 ?v10)
             (pred_6 ?v7)
             (pred_10 ))



(:action op_2
:parameters (?v8 ?v1 ?v12 ?v2)
:precondition (and (pred_7 ?v8) (pred_7 ?v1) (pred_8 ?v12) (pred_4 ?v2)
          (pred_5 ?v8 ?v1) (pred_1 ?v12 ?v2)
                   (pred_3 ?v1 ?v2) (pred_2 ?v8) 
                   (pred_9 ?v1) (pred_11 ?v12))
:effect (and  (pred_6 ?v1) (not (pred_9 ?v1))))


(:action op_4
:parameters (?v8 ?v13)
:precondition (and (pred_7 ?v8) (pred_7 ?v13)
               (pred_2 ?v8) (pred_5 ?v8 ?v13) (pred_6 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v8))))

(:action op_3
:parameters (?v8 ?v12)
:precondition (and (pred_7 ?v8) (pred_8 ?v12) 
                  (pred_2 ?v8) (pred_12 ?v12 ?v8) (pred_10 ))
:effect (and (pred_11 ?v12)
   (not (pred_12 ?v12 ?v8)) (not (pred_10 ))))


(:action op_5
:parameters (?v8 ?v11 ?v5)
:precondition (and (pred_7 ?v8) (pred_8 ?v11) (pred_8 ?v5)
                  (pred_2 ?v8) (pred_11 ?v5) (pred_12 ?v11 ?v8))
:effect (and (pred_11 ?v11) (pred_12 ?v5 ?v8)
        (not (pred_11 ?v5)) (not (pred_12 ?v11 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_7 ?v8) (pred_8 ?v12) 
                  (pred_2 ?v8) (pred_11 ?v12))
:effect (and (pred_10 ) (pred_12 ?v12 ?v8) (not (pred_11 ?v12)))))


	
