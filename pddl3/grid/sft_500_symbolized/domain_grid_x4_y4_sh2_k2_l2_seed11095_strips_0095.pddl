(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v6)
             (pred_9 ?v5 ?v3)
             (pred_4 ?v9 ?v3)
             (pred_1 ?v8 ?v9 )
	     (pred_3 ?v9)
             (pred_11 ?v7)
             (pred_8 ?v5)
             (pred_10 ?v3)
             (pred_12 ?v9)
             (pred_7 ?v5)
             (pred_2 ?v9)
             (pred_6 ))



(:action op_4
:parameters (?v2 ?v1 ?v10 ?v4)
:precondition (and (pred_11 ?v2) (pred_11 ?v1) (pred_8 ?v10) (pred_10 ?v4)
          (pred_5 ?v2 ?v1) (pred_9 ?v10 ?v4)
                   (pred_4 ?v1 ?v4) (pred_3 ?v2) 
                   (pred_12 ?v1) (pred_7 ?v10))
:effect (and  (pred_2 ?v1) (not (pred_12 ?v1))))


(:action op_3
:parameters (?v2 ?v12)
:precondition (and (pred_11 ?v2) (pred_11 ?v12)
               (pred_3 ?v2) (pred_5 ?v2 ?v12) (pred_2 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v2))))

(:action op_5
:parameters (?v2 ?v10)
:precondition (and (pred_11 ?v2) (pred_8 ?v10) 
                  (pred_3 ?v2) (pred_1 ?v10 ?v2) (pred_6 ))
:effect (and (pred_7 ?v10)
   (not (pred_1 ?v10 ?v2)) (not (pred_6 ))))


(:action op_1
:parameters (?v2 ?v11 ?v13)
:precondition (and (pred_11 ?v2) (pred_8 ?v11) (pred_8 ?v13)
                  (pred_3 ?v2) (pred_7 ?v13) (pred_1 ?v11 ?v2))
:effect (and (pred_7 ?v11) (pred_1 ?v13 ?v2)
        (not (pred_7 ?v13)) (not (pred_1 ?v11 ?v2))))

(:action op_2
:parameters (?v2 ?v10)
:precondition (and (pred_11 ?v2) (pred_8 ?v10) 
                  (pred_3 ?v2) (pred_7 ?v10))
:effect (and (pred_6 ) (pred_1 ?v10 ?v2) (not (pred_7 ?v10)))))


	
