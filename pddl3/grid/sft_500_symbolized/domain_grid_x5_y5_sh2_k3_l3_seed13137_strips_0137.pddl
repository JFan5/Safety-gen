(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v13)
             (pred_7 ?v9 ?v7)
             (pred_10 ?v5 ?v7)
             (pred_4 ?v8 ?v5 )
	     (pred_1 ?v5)
             (pred_2 ?v10)
             (pred_12 ?v9)
             (pred_3 ?v7)
             (pred_11 ?v5)
             (pred_9 ?v9)
             (pred_5 ?v5)
             (pred_8 ))



(:action op_1
:parameters (?v4 ?v6 ?v12 ?v1)
:precondition (and (pred_2 ?v4) (pred_2 ?v6) (pred_12 ?v12) (pred_3 ?v1)
          (pred_6 ?v4 ?v6) (pred_7 ?v12 ?v1)
                   (pred_10 ?v6 ?v1) (pred_1 ?v4) 
                   (pred_11 ?v6) (pred_9 ?v12))
:effect (and  (pred_5 ?v6) (not (pred_11 ?v6))))


(:action op_3
:parameters (?v4 ?v2)
:precondition (and (pred_2 ?v4) (pred_2 ?v2)
               (pred_1 ?v4) (pred_6 ?v4 ?v2) (pred_5 ?v2))
:effect (and (pred_1 ?v2) (not (pred_1 ?v4))))

(:action op_4
:parameters (?v4 ?v12)
:precondition (and (pred_2 ?v4) (pred_12 ?v12) 
                  (pred_1 ?v4) (pred_4 ?v12 ?v4) (pred_8 ))
:effect (and (pred_9 ?v12)
   (not (pred_4 ?v12 ?v4)) (not (pred_8 ))))


(:action op_5
:parameters (?v4 ?v11 ?v3)
:precondition (and (pred_2 ?v4) (pred_12 ?v11) (pred_12 ?v3)
                  (pred_1 ?v4) (pred_9 ?v3) (pred_4 ?v11 ?v4))
:effect (and (pred_9 ?v11) (pred_4 ?v3 ?v4)
        (not (pred_9 ?v3)) (not (pred_4 ?v11 ?v4))))

(:action op_2
:parameters (?v4 ?v12)
:precondition (and (pred_2 ?v4) (pred_12 ?v12) 
                  (pred_1 ?v4) (pred_9 ?v12))
:effect (and (pred_8 ) (pred_4 ?v12 ?v4) (not (pred_9 ?v12)))))


	
