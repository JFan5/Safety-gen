(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v3)
             (pred_6 ?v10 ?v13)
             (pred_12 ?v11 ?v13)
             (pred_7 ?v6 ?v11 )
	     (pred_4 ?v11)
             (pred_10 ?v2)
             (pred_2 ?v10)
             (pred_3 ?v13)
             (pred_5 ?v11)
             (pred_8 ?v10)
             (pred_9 ?v11)
             (pred_11 ))



(:action op_5
:parameters (?v4 ?v5 ?v8 ?v9)
:precondition (and (pred_10 ?v4) (pred_10 ?v5) (pred_2 ?v8) (pred_3 ?v9)
          (pred_1 ?v4 ?v5) (pred_6 ?v8 ?v9)
                   (pred_12 ?v5 ?v9) (pred_4 ?v4) 
                   (pred_5 ?v5) (pred_8 ?v8))
:effect (and  (pred_9 ?v5) (not (pred_5 ?v5))))


(:action op_3
:parameters (?v4 ?v12)
:precondition (and (pred_10 ?v4) (pred_10 ?v12)
               (pred_4 ?v4) (pred_1 ?v4 ?v12) (pred_9 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v4))))

(:action op_2
:parameters (?v4 ?v8)
:precondition (and (pred_10 ?v4) (pred_2 ?v8) 
                  (pred_4 ?v4) (pred_7 ?v8 ?v4) (pred_11 ))
:effect (and (pred_8 ?v8)
   (not (pred_7 ?v8 ?v4)) (not (pred_11 ))))


(:action op_1
:parameters (?v4 ?v1 ?v7)
:precondition (and (pred_10 ?v4) (pred_2 ?v1) (pred_2 ?v7)
                  (pred_4 ?v4) (pred_8 ?v7) (pred_7 ?v1 ?v4))
:effect (and (pred_8 ?v1) (pred_7 ?v7 ?v4)
        (not (pred_8 ?v7)) (not (pred_7 ?v1 ?v4))))

(:action op_4
:parameters (?v4 ?v8)
:precondition (and (pred_10 ?v4) (pred_2 ?v8) 
                  (pred_4 ?v4) (pred_8 ?v8))
:effect (and (pred_11 ) (pred_7 ?v8 ?v4) (not (pred_8 ?v8)))))


	
