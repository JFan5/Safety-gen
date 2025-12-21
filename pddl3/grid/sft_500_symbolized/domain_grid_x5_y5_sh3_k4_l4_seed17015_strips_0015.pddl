(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v9)
             (pred_12 ?v5 ?v3)
             (pred_8 ?v7 ?v3)
             (pred_5 ?v6 ?v7 )
	     (pred_3 ?v7)
             (pred_10 ?v13)
             (pred_9 ?v5)
             (pred_1 ?v3)
             (pred_6 ?v7)
             (pred_7 ?v5)
             (pred_4 ?v7)
             (pred_2 ))



(:action op_4
:parameters (?v10 ?v1 ?v2 ?v12)
:precondition (and (pred_10 ?v10) (pred_10 ?v1) (pred_9 ?v2) (pred_1 ?v12)
          (pred_11 ?v10 ?v1) (pred_12 ?v2 ?v12)
                   (pred_8 ?v1 ?v12) (pred_3 ?v10) 
                   (pred_6 ?v1) (pred_7 ?v2))
:effect (and  (pred_4 ?v1) (not (pred_6 ?v1))))


(:action op_3
:parameters (?v10 ?v11)
:precondition (and (pred_10 ?v10) (pred_10 ?v11)
               (pred_3 ?v10) (pred_11 ?v10 ?v11) (pred_4 ?v11))
:effect (and (pred_3 ?v11) (not (pred_3 ?v10))))

(:action op_1
:parameters (?v10 ?v2)
:precondition (and (pred_10 ?v10) (pred_9 ?v2) 
                  (pred_3 ?v10) (pred_5 ?v2 ?v10) (pred_2 ))
:effect (and (pred_7 ?v2)
   (not (pred_5 ?v2 ?v10)) (not (pred_2 ))))


(:action op_5
:parameters (?v10 ?v4 ?v8)
:precondition (and (pred_10 ?v10) (pred_9 ?v4) (pred_9 ?v8)
                  (pred_3 ?v10) (pred_7 ?v8) (pred_5 ?v4 ?v10))
:effect (and (pred_7 ?v4) (pred_5 ?v8 ?v10)
        (not (pred_7 ?v8)) (not (pred_5 ?v4 ?v10))))

(:action op_2
:parameters (?v10 ?v2)
:precondition (and (pred_10 ?v10) (pred_9 ?v2) 
                  (pred_3 ?v10) (pred_7 ?v2))
:effect (and (pred_2 ) (pred_5 ?v2 ?v10) (not (pred_7 ?v2)))))


	
