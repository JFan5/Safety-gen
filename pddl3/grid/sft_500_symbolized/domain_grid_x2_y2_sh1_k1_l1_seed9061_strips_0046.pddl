(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v9)
             (pred_12 ?v1 ?v12)
             (pred_10 ?v13 ?v12)
             (pred_8 ?v4 ?v13 )
	     (pred_11 ?v13)
             (pred_2 ?v10)
             (pred_3 ?v1)
             (pred_5 ?v12)
             (pred_7 ?v13)
             (pred_9 ?v1)
             (pred_1 ?v13)
             (pred_4 ))



(:action op_3
:parameters (?v5 ?v2 ?v6 ?v7)
:precondition (and (pred_2 ?v5) (pred_2 ?v2) (pred_3 ?v6) (pred_5 ?v7)
          (pred_6 ?v5 ?v2) (pred_12 ?v6 ?v7)
                   (pred_10 ?v2 ?v7) (pred_11 ?v5) 
                   (pred_7 ?v2) (pred_9 ?v6))
:effect (and  (pred_1 ?v2) (not (pred_7 ?v2))))


(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_2 ?v5) (pred_2 ?v3)
               (pred_11 ?v5) (pred_6 ?v5 ?v3) (pred_1 ?v3))
:effect (and (pred_11 ?v3) (not (pred_11 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_2 ?v5) (pred_3 ?v6) 
                  (pred_11 ?v5) (pred_8 ?v6 ?v5) (pred_4 ))
:effect (and (pred_9 ?v6)
   (not (pred_8 ?v6 ?v5)) (not (pred_4 ))))


(:action op_4
:parameters (?v5 ?v8 ?v11)
:precondition (and (pred_2 ?v5) (pred_3 ?v8) (pred_3 ?v11)
                  (pred_11 ?v5) (pred_9 ?v11) (pred_8 ?v8 ?v5))
:effect (and (pred_9 ?v8) (pred_8 ?v11 ?v5)
        (not (pred_9 ?v11)) (not (pred_8 ?v8 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_2 ?v5) (pred_3 ?v6) 
                  (pred_11 ?v5) (pred_9 ?v6))
:effect (and (pred_4 ) (pred_8 ?v6 ?v5) (not (pred_9 ?v6)))))


	
