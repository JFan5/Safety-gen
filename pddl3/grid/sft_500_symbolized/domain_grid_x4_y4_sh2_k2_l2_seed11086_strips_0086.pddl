(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v9)
             (pred_10 ?v13 ?v7)
             (pred_9 ?v8 ?v7)
             (pred_5 ?v1 ?v8 )
	     (pred_2 ?v8)
             (pred_11 ?v6)
             (pred_6 ?v13)
             (pred_8 ?v7)
             (pred_4 ?v8)
             (pred_12 ?v13)
             (pred_1 ?v8)
             (pred_3 ))



(:action op_1
:parameters (?v4 ?v5 ?v12 ?v11)
:precondition (and (pred_11 ?v4) (pred_11 ?v5) (pred_6 ?v12) (pred_8 ?v11)
          (pred_7 ?v4 ?v5) (pred_10 ?v12 ?v11)
                   (pred_9 ?v5 ?v11) (pred_2 ?v4) 
                   (pred_4 ?v5) (pred_12 ?v12))
:effect (and  (pred_1 ?v5) (not (pred_4 ?v5))))


(:action op_2
:parameters (?v4 ?v2)
:precondition (and (pred_11 ?v4) (pred_11 ?v2)
               (pred_2 ?v4) (pred_7 ?v4 ?v2) (pred_1 ?v2))
:effect (and (pred_2 ?v2) (not (pred_2 ?v4))))

(:action op_4
:parameters (?v4 ?v12)
:precondition (and (pred_11 ?v4) (pred_6 ?v12) 
                  (pred_2 ?v4) (pred_5 ?v12 ?v4) (pred_3 ))
:effect (and (pred_12 ?v12)
   (not (pred_5 ?v12 ?v4)) (not (pred_3 ))))


(:action op_5
:parameters (?v4 ?v10 ?v3)
:precondition (and (pred_11 ?v4) (pred_6 ?v10) (pred_6 ?v3)
                  (pred_2 ?v4) (pred_12 ?v3) (pred_5 ?v10 ?v4))
:effect (and (pred_12 ?v10) (pred_5 ?v3 ?v4)
        (not (pred_12 ?v3)) (not (pred_5 ?v10 ?v4))))

(:action op_3
:parameters (?v4 ?v12)
:precondition (and (pred_11 ?v4) (pred_6 ?v12) 
                  (pred_2 ?v4) (pred_12 ?v12))
:effect (and (pred_3 ) (pred_5 ?v12 ?v4) (not (pred_12 ?v12)))))


	
