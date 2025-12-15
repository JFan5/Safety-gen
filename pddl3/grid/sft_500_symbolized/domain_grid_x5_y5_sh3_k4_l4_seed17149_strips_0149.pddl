(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v3)
             (pred_12 ?v11 ?v4)
             (pred_3 ?v13 ?v4)
             (pred_10 ?v12 ?v13 )
	     (pred_5 ?v13)
             (pred_4 ?v10)
             (pred_9 ?v11)
             (pred_1 ?v4)
             (pred_7 ?v13)
             (pred_2 ?v11)
             (pred_8 ?v13)
             (pred_11 ))



(:action op_3
:parameters (?v5 ?v1 ?v2 ?v9)
:precondition (and (pred_4 ?v5) (pred_4 ?v1) (pred_9 ?v2) (pred_1 ?v9)
          (pred_6 ?v5 ?v1) (pred_12 ?v2 ?v9)
                   (pred_3 ?v1 ?v9) (pred_5 ?v5) 
                   (pred_7 ?v1) (pred_2 ?v2))
:effect (and  (pred_8 ?v1) (not (pred_7 ?v1))))


(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_4 ?v5) (pred_4 ?v6)
               (pred_5 ?v5) (pred_6 ?v5 ?v6) (pred_8 ?v6))
:effect (and (pred_5 ?v6) (not (pred_5 ?v5))))

(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_4 ?v5) (pred_9 ?v2) 
                  (pred_5 ?v5) (pred_10 ?v2 ?v5) (pred_11 ))
:effect (and (pred_2 ?v2)
   (not (pred_10 ?v2 ?v5)) (not (pred_11 ))))


(:action op_4
:parameters (?v5 ?v8 ?v7)
:precondition (and (pred_4 ?v5) (pred_9 ?v8) (pred_9 ?v7)
                  (pred_5 ?v5) (pred_2 ?v7) (pred_10 ?v8 ?v5))
:effect (and (pred_2 ?v8) (pred_10 ?v7 ?v5)
        (not (pred_2 ?v7)) (not (pred_10 ?v8 ?v5))))

(:action op_5
:parameters (?v5 ?v2)
:precondition (and (pred_4 ?v5) (pred_9 ?v2) 
                  (pred_5 ?v5) (pred_2 ?v2))
:effect (and (pred_11 ) (pred_10 ?v2 ?v5) (not (pred_2 ?v2)))))


	
