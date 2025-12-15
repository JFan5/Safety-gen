(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v7)
             (pred_2 ?v2 ?v9)
             (pred_7 ?v5 ?v9)
             (pred_11 ?v10 ?v5 )
	     (pred_8 ?v5)
             (pred_10 ?v6)
             (pred_1 ?v2)
             (pred_3 ?v9)
             (pred_5 ?v5)
             (pred_6 ?v2)
             (pred_4 ?v5)
             (pred_12 ))



(:action op_4
:parameters (?v4 ?v8 ?v12 ?v13)
:precondition (and (pred_10 ?v4) (pred_10 ?v8) (pred_1 ?v12) (pred_3 ?v13)
          (pred_9 ?v4 ?v8) (pred_2 ?v12 ?v13)
                   (pred_7 ?v8 ?v13) (pred_8 ?v4) 
                   (pred_5 ?v8) (pred_6 ?v12))
:effect (and  (pred_4 ?v8) (not (pred_5 ?v8))))


(:action op_2
:parameters (?v4 ?v1)
:precondition (and (pred_10 ?v4) (pred_10 ?v1)
               (pred_8 ?v4) (pred_9 ?v4 ?v1) (pred_4 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v4))))

(:action op_1
:parameters (?v4 ?v12)
:precondition (and (pred_10 ?v4) (pred_1 ?v12) 
                  (pred_8 ?v4) (pred_11 ?v12 ?v4) (pred_12 ))
:effect (and (pred_6 ?v12)
   (not (pred_11 ?v12 ?v4)) (not (pred_12 ))))


(:action op_3
:parameters (?v4 ?v3 ?v11)
:precondition (and (pred_10 ?v4) (pred_1 ?v3) (pred_1 ?v11)
                  (pred_8 ?v4) (pred_6 ?v11) (pred_11 ?v3 ?v4))
:effect (and (pred_6 ?v3) (pred_11 ?v11 ?v4)
        (not (pred_6 ?v11)) (not (pred_11 ?v3 ?v4))))

(:action op_5
:parameters (?v4 ?v12)
:precondition (and (pred_10 ?v4) (pred_1 ?v12) 
                  (pred_8 ?v4) (pred_6 ?v12))
:effect (and (pred_12 ) (pred_11 ?v12 ?v4) (not (pred_6 ?v12)))))


	
