(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v3)
             (pred_12 ?v13 ?v11)
             (pred_1 ?v4 ?v11)
             (pred_2 ?v8 ?v4 )
	     (pred_11 ?v4)
             (pred_8 ?v1)
             (pred_3 ?v13)
             (pred_5 ?v11)
             (pred_6 ?v4)
             (pred_4 ?v13)
             (pred_7 ?v4)
             (pred_9 ))



(:action op_1
:parameters (?v5 ?v2 ?v6 ?v12)
:precondition (and (pred_8 ?v5) (pred_8 ?v2) (pred_3 ?v6) (pred_5 ?v12)
          (pred_10 ?v5 ?v2) (pred_12 ?v6 ?v12)
                   (pred_1 ?v2 ?v12) (pred_11 ?v5) 
                   (pred_6 ?v2) (pred_4 ?v6))
:effect (and  (pred_7 ?v2) (not (pred_6 ?v2))))


(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_8 ?v5) (pred_8 ?v9)
               (pred_11 ?v5) (pred_10 ?v5 ?v9) (pred_7 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v5))))

(:action op_5
:parameters (?v5 ?v6)
:precondition (and (pred_8 ?v5) (pred_3 ?v6) 
                  (pred_11 ?v5) (pred_2 ?v6 ?v5) (pred_9 ))
:effect (and (pred_4 ?v6)
   (not (pred_2 ?v6 ?v5)) (not (pred_9 ))))


(:action op_3
:parameters (?v5 ?v10 ?v7)
:precondition (and (pred_8 ?v5) (pred_3 ?v10) (pred_3 ?v7)
                  (pred_11 ?v5) (pred_4 ?v7) (pred_2 ?v10 ?v5))
:effect (and (pred_4 ?v10) (pred_2 ?v7 ?v5)
        (not (pred_4 ?v7)) (not (pred_2 ?v10 ?v5))))

(:action op_4
:parameters (?v5 ?v6)
:precondition (and (pred_8 ?v5) (pred_3 ?v6) 
                  (pred_11 ?v5) (pred_4 ?v6))
:effect (and (pred_9 ) (pred_2 ?v6 ?v5) (not (pred_4 ?v6)))))


	
