(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v1)
             (pred_12 ?v10 ?v7)
             (pred_6 ?v4 ?v7)
             (pred_4 ?v12 ?v4 )
	     (pred_2 ?v4)
             (pred_1 ?v9)
             (pred_10 ?v10)
             (pred_8 ?v7)
             (pred_11 ?v4)
             (pred_7 ?v10)
             (pred_9 ?v4)
             (pred_5 ))



(:action op_2
:parameters (?v5 ?v2 ?v11 ?v8)
:precondition (and (pred_1 ?v5) (pred_1 ?v2) (pred_10 ?v11) (pred_8 ?v8)
          (pred_3 ?v5 ?v2) (pred_12 ?v11 ?v8)
                   (pred_6 ?v2 ?v8) (pred_2 ?v5) 
                   (pred_11 ?v2) (pred_7 ?v11))
:effect (and  (pred_9 ?v2) (not (pred_11 ?v2))))


(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_1 ?v5) (pred_1 ?v13)
               (pred_2 ?v5) (pred_3 ?v5 ?v13) (pred_9 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v5))))

(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_1 ?v5) (pred_10 ?v11) 
                  (pred_2 ?v5) (pred_4 ?v11 ?v5) (pred_5 ))
:effect (and (pred_7 ?v11)
   (not (pred_4 ?v11 ?v5)) (not (pred_5 ))))


(:action op_1
:parameters (?v5 ?v6 ?v3)
:precondition (and (pred_1 ?v5) (pred_10 ?v6) (pred_10 ?v3)
                  (pred_2 ?v5) (pred_7 ?v3) (pred_4 ?v6 ?v5))
:effect (and (pred_7 ?v6) (pred_4 ?v3 ?v5)
        (not (pred_7 ?v3)) (not (pred_4 ?v6 ?v5))))

(:action op_5
:parameters (?v5 ?v11)
:precondition (and (pred_1 ?v5) (pred_10 ?v11) 
                  (pred_2 ?v5) (pred_7 ?v11))
:effect (and (pred_5 ) (pred_4 ?v11 ?v5) (not (pred_7 ?v11)))))


	
