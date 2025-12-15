(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v3 ?v10)
             (pred_4 ?v12 ?v6)
             (pred_11 ?v3 ?v6)
             (pred_2 ?v13 ?v3 )
	     (pred_9 ?v3)
             (pred_10 ?v7)
             (pred_12 ?v12)
             (pred_7 ?v6)
             (pred_3 ?v3)
             (pred_5 ?v12)
             (pred_8 ?v3)
             (pred_1 ))



(:action op_2
:parameters (?v5 ?v4 ?v2 ?v1)
:precondition (and (pred_10 ?v5) (pred_10 ?v4) (pred_12 ?v2) (pred_7 ?v1)
          (pred_6 ?v5 ?v4) (pred_4 ?v2 ?v1)
                   (pred_11 ?v4 ?v1) (pred_9 ?v5) 
                   (pred_3 ?v4) (pred_5 ?v2))
:effect (and  (pred_8 ?v4) (not (pred_3 ?v4))))


(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_10 ?v5) (pred_10 ?v11)
               (pred_9 ?v5) (pred_6 ?v5 ?v11) (pred_8 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v5))))

(:action op_3
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_12 ?v2) 
                  (pred_9 ?v5) (pred_2 ?v2 ?v5) (pred_1 ))
:effect (and (pred_5 ?v2)
   (not (pred_2 ?v2 ?v5)) (not (pred_1 ))))


(:action op_1
:parameters (?v5 ?v9 ?v8)
:precondition (and (pred_10 ?v5) (pred_12 ?v9) (pred_12 ?v8)
                  (pred_9 ?v5) (pred_5 ?v8) (pred_2 ?v9 ?v5))
:effect (and (pred_5 ?v9) (pred_2 ?v8 ?v5)
        (not (pred_5 ?v8)) (not (pred_2 ?v9 ?v5))))

(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_10 ?v5) (pred_12 ?v2) 
                  (pred_9 ?v5) (pred_5 ?v2))
:effect (and (pred_1 ) (pred_2 ?v2 ?v5) (not (pred_5 ?v2)))))


	
