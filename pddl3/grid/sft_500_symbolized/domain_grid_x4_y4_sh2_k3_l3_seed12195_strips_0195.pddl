(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v1)
             (pred_3 ?v3 ?v10)
             (pred_12 ?v6 ?v10)
             (pred_2 ?v5 ?v6 )
	     (pred_11 ?v6)
             (pred_8 ?v11)
             (pred_10 ?v3)
             (pred_5 ?v10)
             (pred_1 ?v6)
             (pred_9 ?v3)
             (pred_4 ?v6)
             (pred_6 ))



(:action op_1
:parameters (?v8 ?v4 ?v7 ?v2)
:precondition (and (pred_8 ?v8) (pred_8 ?v4) (pred_10 ?v7) (pred_5 ?v2)
          (pred_7 ?v8 ?v4) (pred_3 ?v7 ?v2)
                   (pred_12 ?v4 ?v2) (pred_11 ?v8) 
                   (pred_1 ?v4) (pred_9 ?v7))
:effect (and  (pred_4 ?v4) (not (pred_1 ?v4))))


(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_8 ?v8) (pred_8 ?v12)
               (pred_11 ?v8) (pred_7 ?v8 ?v12) (pred_4 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v8))))

(:action op_4
:parameters (?v8 ?v7)
:precondition (and (pred_8 ?v8) (pred_10 ?v7) 
                  (pred_11 ?v8) (pred_2 ?v7 ?v8) (pred_6 ))
:effect (and (pred_9 ?v7)
   (not (pred_2 ?v7 ?v8)) (not (pred_6 ))))


(:action op_5
:parameters (?v8 ?v9 ?v13)
:precondition (and (pred_8 ?v8) (pred_10 ?v9) (pred_10 ?v13)
                  (pred_11 ?v8) (pred_9 ?v13) (pred_2 ?v9 ?v8))
:effect (and (pred_9 ?v9) (pred_2 ?v13 ?v8)
        (not (pred_9 ?v13)) (not (pred_2 ?v9 ?v8))))

(:action op_3
:parameters (?v8 ?v7)
:precondition (and (pred_8 ?v8) (pred_10 ?v7) 
                  (pred_11 ?v8) (pred_9 ?v7))
:effect (and (pred_6 ) (pred_2 ?v7 ?v8) (not (pred_9 ?v7)))))


	
