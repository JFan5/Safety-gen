(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v13)
             (pred_7 ?v3 ?v1)
             (pred_8 ?v2 ?v1)
             (pred_4 ?v7 ?v2 )
	     (pred_2 ?v2)
             (pred_9 ?v9)
             (pred_12 ?v3)
             (pred_5 ?v1)
             (pred_1 ?v2)
             (pred_11 ?v3)
             (pred_6 ?v2)
             (pred_3 ))



(:action op_1
:parameters (?v4 ?v5 ?v8 ?v10)
:precondition (and (pred_9 ?v4) (pred_9 ?v5) (pred_12 ?v8) (pred_5 ?v10)
          (pred_10 ?v4 ?v5) (pred_7 ?v8 ?v10)
                   (pred_8 ?v5 ?v10) (pred_2 ?v4) 
                   (pred_1 ?v5) (pred_11 ?v8))
:effect (and  (pred_6 ?v5) (not (pred_1 ?v5))))


(:action op_3
:parameters (?v4 ?v6)
:precondition (and (pred_9 ?v4) (pred_9 ?v6)
               (pred_2 ?v4) (pred_10 ?v4 ?v6) (pred_6 ?v6))
:effect (and (pred_2 ?v6) (not (pred_2 ?v4))))

(:action op_2
:parameters (?v4 ?v8)
:precondition (and (pred_9 ?v4) (pred_12 ?v8) 
                  (pred_2 ?v4) (pred_4 ?v8 ?v4) (pred_3 ))
:effect (and (pred_11 ?v8)
   (not (pred_4 ?v8 ?v4)) (not (pred_3 ))))


(:action op_4
:parameters (?v4 ?v12 ?v11)
:precondition (and (pred_9 ?v4) (pred_12 ?v12) (pred_12 ?v11)
                  (pred_2 ?v4) (pred_11 ?v11) (pred_4 ?v12 ?v4))
:effect (and (pred_11 ?v12) (pred_4 ?v11 ?v4)
        (not (pred_11 ?v11)) (not (pred_4 ?v12 ?v4))))

(:action op_5
:parameters (?v4 ?v8)
:precondition (and (pred_9 ?v4) (pred_12 ?v8) 
                  (pred_2 ?v4) (pred_11 ?v8))
:effect (and (pred_3 ) (pred_4 ?v8 ?v4) (not (pred_11 ?v8)))))


	
