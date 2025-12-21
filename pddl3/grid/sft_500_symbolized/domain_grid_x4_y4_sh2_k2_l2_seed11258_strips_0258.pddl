(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v13 ?v10)
             (pred_6 ?v3 ?v8)
             (pred_11 ?v13 ?v8)
             (pred_12 ?v11 ?v13 )
	     (pred_7 ?v13)
             (pred_10 ?v9)
             (pred_8 ?v3)
             (pred_5 ?v8)
             (pred_1 ?v13)
             (pred_9 ?v3)
             (pred_4 ?v13)
             (pred_2 ))



(:action op_4
:parameters (?v2 ?v6 ?v1 ?v7)
:precondition (and (pred_10 ?v2) (pred_10 ?v6) (pred_8 ?v1) (pred_5 ?v7)
          (pred_3 ?v2 ?v6) (pred_6 ?v1 ?v7)
                   (pred_11 ?v6 ?v7) (pred_7 ?v2) 
                   (pred_1 ?v6) (pred_9 ?v1))
:effect (and  (pred_4 ?v6) (not (pred_1 ?v6))))


(:action op_3
:parameters (?v2 ?v4)
:precondition (and (pred_10 ?v2) (pred_10 ?v4)
               (pred_7 ?v2) (pred_3 ?v2 ?v4) (pred_4 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v2))))

(:action op_5
:parameters (?v2 ?v1)
:precondition (and (pred_10 ?v2) (pred_8 ?v1) 
                  (pred_7 ?v2) (pred_12 ?v1 ?v2) (pred_2 ))
:effect (and (pred_9 ?v1)
   (not (pred_12 ?v1 ?v2)) (not (pred_2 ))))


(:action op_2
:parameters (?v2 ?v12 ?v5)
:precondition (and (pred_10 ?v2) (pred_8 ?v12) (pred_8 ?v5)
                  (pred_7 ?v2) (pred_9 ?v5) (pred_12 ?v12 ?v2))
:effect (and (pred_9 ?v12) (pred_12 ?v5 ?v2)
        (not (pred_9 ?v5)) (not (pred_12 ?v12 ?v2))))

(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_10 ?v2) (pred_8 ?v1) 
                  (pred_7 ?v2) (pred_9 ?v1))
:effect (and (pred_2 ) (pred_12 ?v1 ?v2) (not (pred_9 ?v1)))))


	
