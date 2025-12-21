(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v1)
             (pred_3 ?v11 ?v2)
             (pred_10 ?v13 ?v2)
             (pred_9 ?v10 ?v13 )
	     (pred_7 ?v13)
             (pred_5 ?v8)
             (pred_4 ?v11)
             (pred_1 ?v2)
             (pred_11 ?v13)
             (pred_6 ?v11)
             (pred_8 ?v13)
             (pred_12 ))



(:action op_4
:parameters (?v4 ?v6 ?v3 ?v5)
:precondition (and (pred_5 ?v4) (pred_5 ?v6) (pred_4 ?v3) (pred_1 ?v5)
          (pred_2 ?v4 ?v6) (pred_3 ?v3 ?v5)
                   (pred_10 ?v6 ?v5) (pred_7 ?v4) 
                   (pred_11 ?v6) (pred_6 ?v3))
:effect (and  (pred_8 ?v6) (not (pred_11 ?v6))))


(:action op_2
:parameters (?v4 ?v12)
:precondition (and (pred_5 ?v4) (pred_5 ?v12)
               (pred_7 ?v4) (pred_2 ?v4 ?v12) (pred_8 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v4))))

(:action op_3
:parameters (?v4 ?v3)
:precondition (and (pred_5 ?v4) (pred_4 ?v3) 
                  (pred_7 ?v4) (pred_9 ?v3 ?v4) (pred_12 ))
:effect (and (pred_6 ?v3)
   (not (pred_9 ?v3 ?v4)) (not (pred_12 ))))


(:action op_5
:parameters (?v4 ?v9 ?v7)
:precondition (and (pred_5 ?v4) (pred_4 ?v9) (pred_4 ?v7)
                  (pred_7 ?v4) (pred_6 ?v7) (pred_9 ?v9 ?v4))
:effect (and (pred_6 ?v9) (pred_9 ?v7 ?v4)
        (not (pred_6 ?v7)) (not (pred_9 ?v9 ?v4))))

(:action op_1
:parameters (?v4 ?v3)
:precondition (and (pred_5 ?v4) (pred_4 ?v3) 
                  (pred_7 ?v4) (pred_6 ?v3))
:effect (and (pred_12 ) (pred_9 ?v3 ?v4) (not (pred_6 ?v3)))))


	
