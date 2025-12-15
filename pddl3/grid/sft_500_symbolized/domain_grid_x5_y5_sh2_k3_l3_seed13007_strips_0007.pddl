(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v12)
             (pred_3 ?v7 ?v4)
             (pred_4 ?v1 ?v4)
             (pred_6 ?v9 ?v1 )
	     (pred_8 ?v1)
             (pred_2 ?v8)
             (pred_11 ?v7)
             (pred_7 ?v4)
             (pred_12 ?v1)
             (pred_9 ?v7)
             (pred_10 ?v1)
             (pred_1 ))



(:action op_3
:parameters (?v5 ?v10 ?v13 ?v6)
:precondition (and (pred_2 ?v5) (pred_2 ?v10) (pred_11 ?v13) (pred_7 ?v6)
          (pred_5 ?v5 ?v10) (pred_3 ?v13 ?v6)
                   (pred_4 ?v10 ?v6) (pred_8 ?v5) 
                   (pred_12 ?v10) (pred_9 ?v13))
:effect (and  (pred_10 ?v10) (not (pred_12 ?v10))))


(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_2 ?v5) (pred_2 ?v2)
               (pred_8 ?v5) (pred_5 ?v5 ?v2) (pred_10 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v5))))

(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_2 ?v5) (pred_11 ?v13) 
                  (pred_8 ?v5) (pred_6 ?v13 ?v5) (pred_1 ))
:effect (and (pred_9 ?v13)
   (not (pred_6 ?v13 ?v5)) (not (pred_1 ))))


(:action op_4
:parameters (?v5 ?v11 ?v3)
:precondition (and (pred_2 ?v5) (pred_11 ?v11) (pred_11 ?v3)
                  (pred_8 ?v5) (pred_9 ?v3) (pred_6 ?v11 ?v5))
:effect (and (pred_9 ?v11) (pred_6 ?v3 ?v5)
        (not (pred_9 ?v3)) (not (pred_6 ?v11 ?v5))))

(:action op_5
:parameters (?v5 ?v13)
:precondition (and (pred_2 ?v5) (pred_11 ?v13) 
                  (pred_8 ?v5) (pred_9 ?v13))
:effect (and (pred_1 ) (pred_6 ?v13 ?v5) (not (pred_9 ?v13)))))


	
