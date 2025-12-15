(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v3)
             (pred_11 ?v8 ?v11)
             (pred_2 ?v10 ?v11)
             (pred_8 ?v9 ?v10 )
	     (pred_10 ?v10)
             (pred_1 ?v13)
             (pred_4 ?v8)
             (pred_3 ?v11)
             (pred_5 ?v10)
             (pred_9 ?v8)
             (pred_7 ?v10)
             (pred_6 ))



(:action op_3
:parameters (?v2 ?v6 ?v1 ?v7)
:precondition (and (pred_1 ?v2) (pred_1 ?v6) (pred_4 ?v1) (pred_3 ?v7)
          (pred_12 ?v2 ?v6) (pred_11 ?v1 ?v7)
                   (pred_2 ?v6 ?v7) (pred_10 ?v2) 
                   (pred_5 ?v6) (pred_9 ?v1))
:effect (and  (pred_7 ?v6) (not (pred_5 ?v6))))


(:action op_4
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_1 ?v12)
               (pred_10 ?v2) (pred_12 ?v2 ?v12) (pred_7 ?v12))
:effect (and (pred_10 ?v12) (not (pred_10 ?v2))))

(:action op_1
:parameters (?v2 ?v1)
:precondition (and (pred_1 ?v2) (pred_4 ?v1) 
                  (pred_10 ?v2) (pred_8 ?v1 ?v2) (pred_6 ))
:effect (and (pred_9 ?v1)
   (not (pred_8 ?v1 ?v2)) (not (pred_6 ))))


(:action op_5
:parameters (?v2 ?v5 ?v4)
:precondition (and (pred_1 ?v2) (pred_4 ?v5) (pred_4 ?v4)
                  (pred_10 ?v2) (pred_9 ?v4) (pred_8 ?v5 ?v2))
:effect (and (pred_9 ?v5) (pred_8 ?v4 ?v2)
        (not (pred_9 ?v4)) (not (pred_8 ?v5 ?v2))))

(:action op_2
:parameters (?v2 ?v1)
:precondition (and (pred_1 ?v2) (pred_4 ?v1) 
                  (pred_10 ?v2) (pred_9 ?v1))
:effect (and (pred_6 ) (pred_8 ?v1 ?v2) (not (pred_9 ?v1)))))


	
