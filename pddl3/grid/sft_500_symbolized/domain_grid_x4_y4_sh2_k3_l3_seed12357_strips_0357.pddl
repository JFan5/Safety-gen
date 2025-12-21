(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v3 ?v9)
             (pred_1 ?v6 ?v13)
             (pred_10 ?v3 ?v13)
             (pred_11 ?v7 ?v3 )
	     (pred_5 ?v3)
             (pred_4 ?v1)
             (pred_3 ?v6)
             (pred_8 ?v13)
             (pred_2 ?v3)
             (pred_7 ?v6)
             (pred_9 ?v3)
             (pred_12 ))



(:action op_2
:parameters (?v10 ?v2 ?v12 ?v8)
:precondition (and (pred_4 ?v10) (pred_4 ?v2) (pred_3 ?v12) (pred_8 ?v8)
          (pred_6 ?v10 ?v2) (pred_1 ?v12 ?v8)
                   (pred_10 ?v2 ?v8) (pred_5 ?v10) 
                   (pred_2 ?v2) (pred_7 ?v12))
:effect (and  (pred_9 ?v2) (not (pred_2 ?v2))))


(:action op_1
:parameters (?v10 ?v11)
:precondition (and (pred_4 ?v10) (pred_4 ?v11)
               (pred_5 ?v10) (pred_6 ?v10 ?v11) (pred_9 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v10))))

(:action op_3
:parameters (?v10 ?v12)
:precondition (and (pred_4 ?v10) (pred_3 ?v12) 
                  (pred_5 ?v10) (pred_11 ?v12 ?v10) (pred_12 ))
:effect (and (pred_7 ?v12)
   (not (pred_11 ?v12 ?v10)) (not (pred_12 ))))


(:action op_4
:parameters (?v10 ?v5 ?v4)
:precondition (and (pred_4 ?v10) (pred_3 ?v5) (pred_3 ?v4)
                  (pred_5 ?v10) (pred_7 ?v4) (pred_11 ?v5 ?v10))
:effect (and (pred_7 ?v5) (pred_11 ?v4 ?v10)
        (not (pred_7 ?v4)) (not (pred_11 ?v5 ?v10))))

(:action op_5
:parameters (?v10 ?v12)
:precondition (and (pred_4 ?v10) (pred_3 ?v12) 
                  (pred_5 ?v10) (pred_7 ?v12))
:effect (and (pred_12 ) (pred_11 ?v12 ?v10) (not (pred_7 ?v12)))))


	
