(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v9)
             (pred_4 ?v13 ?v3)
             (pred_1 ?v12 ?v3)
             (pred_12 ?v7 ?v12 )
	     (pred_5 ?v12)
             (pred_10 ?v4)
             (pred_7 ?v13)
             (pred_3 ?v3)
             (pred_2 ?v12)
             (pred_11 ?v13)
             (pred_6 ?v12)
             (pred_8 ))



(:action op_3
:parameters (?v2 ?v5 ?v6 ?v1)
:precondition (and (pred_10 ?v2) (pred_10 ?v5) (pred_7 ?v6) (pred_3 ?v1)
          (pred_9 ?v2 ?v5) (pred_4 ?v6 ?v1)
                   (pred_1 ?v5 ?v1) (pred_5 ?v2) 
                   (pred_2 ?v5) (pred_11 ?v6))
:effect (and  (pred_6 ?v5) (not (pred_2 ?v5))))


(:action op_5
:parameters (?v2 ?v8)
:precondition (and (pred_10 ?v2) (pred_10 ?v8)
               (pred_5 ?v2) (pred_9 ?v2 ?v8) (pred_6 ?v8))
:effect (and (pred_5 ?v8) (not (pred_5 ?v2))))

(:action op_4
:parameters (?v2 ?v6)
:precondition (and (pred_10 ?v2) (pred_7 ?v6) 
                  (pred_5 ?v2) (pred_12 ?v6 ?v2) (pred_8 ))
:effect (and (pred_11 ?v6)
   (not (pred_12 ?v6 ?v2)) (not (pred_8 ))))


(:action op_1
:parameters (?v2 ?v10 ?v11)
:precondition (and (pred_10 ?v2) (pred_7 ?v10) (pred_7 ?v11)
                  (pred_5 ?v2) (pred_11 ?v11) (pred_12 ?v10 ?v2))
:effect (and (pred_11 ?v10) (pred_12 ?v11 ?v2)
        (not (pred_11 ?v11)) (not (pred_12 ?v10 ?v2))))

(:action op_2
:parameters (?v2 ?v6)
:precondition (and (pred_10 ?v2) (pred_7 ?v6) 
                  (pred_5 ?v2) (pred_11 ?v6))
:effect (and (pred_8 ) (pred_12 ?v6 ?v2) (not (pred_11 ?v6)))))


	
