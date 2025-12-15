(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v7)
             (pred_1 ?v13 ?v11)
             (pred_10 ?v12 ?v11)
             (pred_4 ?v3 ?v12 )
	     (pred_6 ?v12)
             (pred_8 ?v1)
             (pred_9 ?v13)
             (pred_7 ?v11)
             (pred_12 ?v12)
             (pred_2 ?v13)
             (pred_5 ?v12)
             (pred_11 ))



(:action op_2
:parameters (?v4 ?v8 ?v2 ?v10)
:precondition (and (pred_8 ?v4) (pred_8 ?v8) (pred_9 ?v2) (pred_7 ?v10)
          (pred_3 ?v4 ?v8) (pred_1 ?v2 ?v10)
                   (pred_10 ?v8 ?v10) (pred_6 ?v4) 
                   (pred_12 ?v8) (pred_2 ?v2))
:effect (and  (pred_5 ?v8) (not (pred_12 ?v8))))


(:action op_1
:parameters (?v4 ?v5)
:precondition (and (pred_8 ?v4) (pred_8 ?v5)
               (pred_6 ?v4) (pred_3 ?v4 ?v5) (pred_5 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v4))))

(:action op_3
:parameters (?v4 ?v2)
:precondition (and (pred_8 ?v4) (pred_9 ?v2) 
                  (pred_6 ?v4) (pred_4 ?v2 ?v4) (pred_11 ))
:effect (and (pred_2 ?v2)
   (not (pred_4 ?v2 ?v4)) (not (pred_11 ))))


(:action op_5
:parameters (?v4 ?v6 ?v9)
:precondition (and (pred_8 ?v4) (pred_9 ?v6) (pred_9 ?v9)
                  (pred_6 ?v4) (pred_2 ?v9) (pred_4 ?v6 ?v4))
:effect (and (pred_2 ?v6) (pred_4 ?v9 ?v4)
        (not (pred_2 ?v9)) (not (pred_4 ?v6 ?v4))))

(:action op_4
:parameters (?v4 ?v2)
:precondition (and (pred_8 ?v4) (pred_9 ?v2) 
                  (pred_6 ?v4) (pred_2 ?v2))
:effect (and (pred_11 ) (pred_4 ?v2 ?v4) (not (pred_2 ?v2)))))


	
