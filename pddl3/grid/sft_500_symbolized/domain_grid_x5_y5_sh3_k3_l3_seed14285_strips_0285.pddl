(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v13)
             (pred_8 ?v3 ?v6)
             (pred_4 ?v7 ?v6)
             (pred_5 ?v9 ?v7 )
	     (pred_11 ?v7)
             (pred_2 ?v5)
             (pred_1 ?v3)
             (pred_9 ?v6)
             (pred_7 ?v7)
             (pred_3 ?v3)
             (pred_12 ?v7)
             (pred_6 ))



(:action op_2
:parameters (?v8 ?v4 ?v12 ?v11)
:precondition (and (pred_2 ?v8) (pred_2 ?v4) (pred_1 ?v12) (pred_9 ?v11)
          (pred_10 ?v8 ?v4) (pred_8 ?v12 ?v11)
                   (pred_4 ?v4 ?v11) (pred_11 ?v8) 
                   (pred_7 ?v4) (pred_3 ?v12))
:effect (and  (pred_12 ?v4) (not (pred_7 ?v4))))


(:action op_4
:parameters (?v8 ?v2)
:precondition (and (pred_2 ?v8) (pred_2 ?v2)
               (pred_11 ?v8) (pred_10 ?v8 ?v2) (pred_12 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_2 ?v8) (pred_1 ?v12) 
                  (pred_11 ?v8) (pred_5 ?v12 ?v8) (pred_6 ))
:effect (and (pred_3 ?v12)
   (not (pred_5 ?v12 ?v8)) (not (pred_6 ))))


(:action op_3
:parameters (?v8 ?v10 ?v1)
:precondition (and (pred_2 ?v8) (pred_1 ?v10) (pred_1 ?v1)
                  (pred_11 ?v8) (pred_3 ?v1) (pred_5 ?v10 ?v8))
:effect (and (pred_3 ?v10) (pred_5 ?v1 ?v8)
        (not (pred_3 ?v1)) (not (pred_5 ?v10 ?v8))))

(:action op_5
:parameters (?v8 ?v12)
:precondition (and (pred_2 ?v8) (pred_1 ?v12) 
                  (pred_11 ?v8) (pred_3 ?v12))
:effect (and (pred_6 ) (pred_5 ?v12 ?v8) (not (pred_3 ?v12)))))


	
