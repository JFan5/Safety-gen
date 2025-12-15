(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v7)
             (pred_5 ?v9 ?v13)
             (pred_11 ?v4 ?v13)
             (pred_3 ?v8 ?v4 )
	     (pred_7 ?v4)
             (pred_12 ?v5)
             (pred_10 ?v9)
             (pred_2 ?v13)
             (pred_4 ?v4)
             (pred_8 ?v9)
             (pred_6 ?v4)
             (pred_9 ))



(:action op_3
:parameters (?v2 ?v12 ?v11 ?v3)
:precondition (and (pred_12 ?v2) (pred_12 ?v12) (pred_10 ?v11) (pred_2 ?v3)
          (pred_1 ?v2 ?v12) (pred_5 ?v11 ?v3)
                   (pred_11 ?v12 ?v3) (pred_7 ?v2) 
                   (pred_4 ?v12) (pred_8 ?v11))
:effect (and  (pred_6 ?v12) (not (pred_4 ?v12))))


(:action op_5
:parameters (?v2 ?v6)
:precondition (and (pred_12 ?v2) (pred_12 ?v6)
               (pred_7 ?v2) (pred_1 ?v2 ?v6) (pred_6 ?v6))
:effect (and (pred_7 ?v6) (not (pred_7 ?v2))))

(:action op_4
:parameters (?v2 ?v11)
:precondition (and (pred_12 ?v2) (pred_10 ?v11) 
                  (pred_7 ?v2) (pred_3 ?v11 ?v2) (pred_9 ))
:effect (and (pred_8 ?v11)
   (not (pred_3 ?v11 ?v2)) (not (pred_9 ))))


(:action op_1
:parameters (?v2 ?v1 ?v10)
:precondition (and (pred_12 ?v2) (pred_10 ?v1) (pred_10 ?v10)
                  (pred_7 ?v2) (pred_8 ?v10) (pred_3 ?v1 ?v2))
:effect (and (pred_8 ?v1) (pred_3 ?v10 ?v2)
        (not (pred_8 ?v10)) (not (pred_3 ?v1 ?v2))))

(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_12 ?v2) (pred_10 ?v11) 
                  (pred_7 ?v2) (pred_8 ?v11))
:effect (and (pred_9 ) (pred_3 ?v11 ?v2) (not (pred_8 ?v11)))))


	
