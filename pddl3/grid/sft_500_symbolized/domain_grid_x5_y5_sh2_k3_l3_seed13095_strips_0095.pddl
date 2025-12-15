(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v6)
             (pred_8 ?v3 ?v13)
             (pred_10 ?v12 ?v13)
             (pred_3 ?v2 ?v12 )
	     (pred_11 ?v12)
             (pred_5 ?v9)
             (pred_9 ?v3)
             (pred_6 ?v13)
             (pred_2 ?v12)
             (pred_1 ?v3)
             (pred_7 ?v12)
             (pred_4 ))



(:action op_5
:parameters (?v5 ?v4 ?v7 ?v1)
:precondition (and (pred_5 ?v5) (pred_5 ?v4) (pred_9 ?v7) (pred_6 ?v1)
          (pred_12 ?v5 ?v4) (pred_8 ?v7 ?v1)
                   (pred_10 ?v4 ?v1) (pred_11 ?v5) 
                   (pred_2 ?v4) (pred_1 ?v7))
:effect (and  (pred_7 ?v4) (not (pred_2 ?v4))))


(:action op_1
:parameters (?v5 ?v10)
:precondition (and (pred_5 ?v5) (pred_5 ?v10)
               (pred_11 ?v5) (pred_12 ?v5 ?v10) (pred_7 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v5))))

(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_5 ?v5) (pred_9 ?v7) 
                  (pred_11 ?v5) (pred_3 ?v7 ?v5) (pred_4 ))
:effect (and (pred_1 ?v7)
   (not (pred_3 ?v7 ?v5)) (not (pred_4 ))))


(:action op_4
:parameters (?v5 ?v11 ?v8)
:precondition (and (pred_5 ?v5) (pred_9 ?v11) (pred_9 ?v8)
                  (pred_11 ?v5) (pred_1 ?v8) (pred_3 ?v11 ?v5))
:effect (and (pred_1 ?v11) (pred_3 ?v8 ?v5)
        (not (pred_1 ?v8)) (not (pred_3 ?v11 ?v5))))

(:action op_2
:parameters (?v5 ?v7)
:precondition (and (pred_5 ?v5) (pred_9 ?v7) 
                  (pred_11 ?v5) (pred_1 ?v7))
:effect (and (pred_4 ) (pred_3 ?v7 ?v5) (not (pred_1 ?v7)))))


	
