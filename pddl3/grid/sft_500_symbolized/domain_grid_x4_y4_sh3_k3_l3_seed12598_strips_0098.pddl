(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v6)
             (pred_2 ?v13 ?v4)
             (pred_8 ?v5 ?v4)
             (pred_6 ?v3 ?v5 )
	     (pred_5 ?v5)
             (pred_10 ?v7)
             (pred_4 ?v13)
             (pred_11 ?v4)
             (pred_12 ?v5)
             (pred_7 ?v13)
             (pred_3 ?v5)
             (pred_9 ))



(:action op_3
:parameters (?v10 ?v9 ?v12 ?v1)
:precondition (and (pred_10 ?v10) (pred_10 ?v9) (pred_4 ?v12) (pred_11 ?v1)
          (pred_1 ?v10 ?v9) (pred_2 ?v12 ?v1)
                   (pred_8 ?v9 ?v1) (pred_5 ?v10) 
                   (pred_12 ?v9) (pred_7 ?v12))
:effect (and  (pred_3 ?v9) (not (pred_12 ?v9))))


(:action op_5
:parameters (?v10 ?v11)
:precondition (and (pred_10 ?v10) (pred_10 ?v11)
               (pred_5 ?v10) (pred_1 ?v10 ?v11) (pred_3 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v10))))

(:action op_2
:parameters (?v10 ?v12)
:precondition (and (pred_10 ?v10) (pred_4 ?v12) 
                  (pred_5 ?v10) (pred_6 ?v12 ?v10) (pred_9 ))
:effect (and (pred_7 ?v12)
   (not (pred_6 ?v12 ?v10)) (not (pred_9 ))))


(:action op_1
:parameters (?v10 ?v2 ?v8)
:precondition (and (pred_10 ?v10) (pred_4 ?v2) (pred_4 ?v8)
                  (pred_5 ?v10) (pred_7 ?v8) (pred_6 ?v2 ?v10))
:effect (and (pred_7 ?v2) (pred_6 ?v8 ?v10)
        (not (pred_7 ?v8)) (not (pred_6 ?v2 ?v10))))

(:action op_4
:parameters (?v10 ?v12)
:precondition (and (pred_10 ?v10) (pred_4 ?v12) 
                  (pred_5 ?v10) (pred_7 ?v12))
:effect (and (pred_9 ) (pred_6 ?v12 ?v10) (not (pred_7 ?v12)))))


	
