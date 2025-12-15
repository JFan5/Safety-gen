(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v8)
             (pred_3 ?v4 ?v13)
             (pred_1 ?v2 ?v13)
             (pred_2 ?v9 ?v2 )
	     (pred_8 ?v2)
             (pred_5 ?v7)
             (pred_12 ?v4)
             (pred_10 ?v13)
             (pred_6 ?v2)
             (pred_7 ?v4)
             (pred_4 ?v2)
             (pred_11 ))



(:action op_3
:parameters (?v5 ?v1 ?v11 ?v12)
:precondition (and (pred_5 ?v5) (pred_5 ?v1) (pred_12 ?v11) (pred_10 ?v12)
          (pred_9 ?v5 ?v1) (pred_3 ?v11 ?v12)
                   (pred_1 ?v1 ?v12) (pred_8 ?v5) 
                   (pred_6 ?v1) (pred_7 ?v11))
:effect (and  (pred_4 ?v1) (not (pred_6 ?v1))))


(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_5 ?v5) (pred_5 ?v6)
               (pred_8 ?v5) (pred_9 ?v5 ?v6) (pred_4 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v5))))

(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_5 ?v5) (pred_12 ?v11) 
                  (pred_8 ?v5) (pred_2 ?v11 ?v5) (pred_11 ))
:effect (and (pred_7 ?v11)
   (not (pred_2 ?v11 ?v5)) (not (pred_11 ))))


(:action op_5
:parameters (?v5 ?v3 ?v10)
:precondition (and (pred_5 ?v5) (pred_12 ?v3) (pred_12 ?v10)
                  (pred_8 ?v5) (pred_7 ?v10) (pred_2 ?v3 ?v5))
:effect (and (pred_7 ?v3) (pred_2 ?v10 ?v5)
        (not (pred_7 ?v10)) (not (pred_2 ?v3 ?v5))))

(:action op_1
:parameters (?v5 ?v11)
:precondition (and (pred_5 ?v5) (pred_12 ?v11) 
                  (pred_8 ?v5) (pred_7 ?v11))
:effect (and (pred_11 ) (pred_2 ?v11 ?v5) (not (pred_7 ?v11)))))


	
