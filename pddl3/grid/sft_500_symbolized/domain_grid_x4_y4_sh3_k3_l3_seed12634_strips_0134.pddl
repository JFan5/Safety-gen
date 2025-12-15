(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v7)
             (pred_5 ?v10 ?v13)
             (pred_1 ?v4 ?v13)
             (pred_6 ?v12 ?v4 )
	     (pred_10 ?v4)
             (pred_4 ?v8)
             (pred_2 ?v10)
             (pred_11 ?v13)
             (pred_9 ?v4)
             (pred_12 ?v10)
             (pred_8 ?v4)
             (pred_7 ))



(:action op_4
:parameters (?v5 ?v2 ?v11 ?v3)
:precondition (and (pred_4 ?v5) (pred_4 ?v2) (pred_2 ?v11) (pred_11 ?v3)
          (pred_3 ?v5 ?v2) (pred_5 ?v11 ?v3)
                   (pred_1 ?v2 ?v3) (pred_10 ?v5) 
                   (pred_9 ?v2) (pred_12 ?v11))
:effect (and  (pred_8 ?v2) (not (pred_9 ?v2))))


(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_4 ?v5) (pred_4 ?v9)
               (pred_10 ?v5) (pred_3 ?v5 ?v9) (pred_8 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v5))))

(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_4 ?v5) (pred_2 ?v11) 
                  (pred_10 ?v5) (pred_6 ?v11 ?v5) (pred_7 ))
:effect (and (pred_12 ?v11)
   (not (pred_6 ?v11 ?v5)) (not (pred_7 ))))


(:action op_1
:parameters (?v5 ?v6 ?v1)
:precondition (and (pred_4 ?v5) (pred_2 ?v6) (pred_2 ?v1)
                  (pred_10 ?v5) (pred_12 ?v1) (pred_6 ?v6 ?v5))
:effect (and (pred_12 ?v6) (pred_6 ?v1 ?v5)
        (not (pred_12 ?v1)) (not (pred_6 ?v6 ?v5))))

(:action op_5
:parameters (?v5 ?v11)
:precondition (and (pred_4 ?v5) (pred_2 ?v11) 
                  (pred_10 ?v5) (pred_12 ?v11))
:effect (and (pred_7 ) (pred_6 ?v11 ?v5) (not (pred_12 ?v11)))))


	
