(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v13 ?v7)
             (pred_2 ?v5 ?v9)
             (pred_8 ?v13 ?v9)
             (pred_6 ?v6 ?v13 )
	     (pred_1 ?v13)
             (pred_7 ?v8)
             (pred_3 ?v5)
             (pred_9 ?v9)
             (pred_11 ?v13)
             (pred_4 ?v5)
             (pred_12 ?v13)
             (pred_10 ))



(:action op_3
:parameters (?v2 ?v1 ?v3 ?v10)
:precondition (and (pred_7 ?v2) (pred_7 ?v1) (pred_3 ?v3) (pred_9 ?v10)
          (pred_5 ?v2 ?v1) (pred_2 ?v3 ?v10)
                   (pred_8 ?v1 ?v10) (pred_1 ?v2) 
                   (pred_11 ?v1) (pred_4 ?v3))
:effect (and  (pred_12 ?v1) (not (pred_11 ?v1))))


(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_7 ?v2) (pred_7 ?v4)
               (pred_1 ?v2) (pred_5 ?v2 ?v4) (pred_12 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v2))))

(:action op_1
:parameters (?v2 ?v3)
:precondition (and (pred_7 ?v2) (pred_3 ?v3) 
                  (pred_1 ?v2) (pred_6 ?v3 ?v2) (pred_10 ))
:effect (and (pred_4 ?v3)
   (not (pred_6 ?v3 ?v2)) (not (pred_10 ))))


(:action op_5
:parameters (?v2 ?v11 ?v12)
:precondition (and (pred_7 ?v2) (pred_3 ?v11) (pred_3 ?v12)
                  (pred_1 ?v2) (pred_4 ?v12) (pred_6 ?v11 ?v2))
:effect (and (pred_4 ?v11) (pred_6 ?v12 ?v2)
        (not (pred_4 ?v12)) (not (pred_6 ?v11 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_7 ?v2) (pred_3 ?v3) 
                  (pred_1 ?v2) (pred_4 ?v3))
:effect (and (pred_10 ) (pred_6 ?v3 ?v2) (not (pred_4 ?v3)))))


	
