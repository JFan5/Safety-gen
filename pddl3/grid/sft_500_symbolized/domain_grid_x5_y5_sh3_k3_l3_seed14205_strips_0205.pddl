(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v4)
             (pred_2 ?v5 ?v3)
             (pred_8 ?v7 ?v3)
             (pred_11 ?v10 ?v7 )
	     (pred_10 ?v7)
             (pred_7 ?v6)
             (pred_6 ?v5)
             (pred_1 ?v3)
             (pred_5 ?v7)
             (pred_12 ?v5)
             (pred_4 ?v7)
             (pred_3 ))



(:action op_1
:parameters (?v1 ?v12 ?v2 ?v13)
:precondition (and (pred_7 ?v1) (pred_7 ?v12) (pred_6 ?v2) (pred_1 ?v13)
          (pred_9 ?v1 ?v12) (pred_2 ?v2 ?v13)
                   (pred_8 ?v12 ?v13) (pred_10 ?v1) 
                   (pred_5 ?v12) (pred_12 ?v2))
:effect (and  (pred_4 ?v12) (not (pred_5 ?v12))))


(:action op_3
:parameters (?v1 ?v9)
:precondition (and (pred_7 ?v1) (pred_7 ?v9)
               (pred_10 ?v1) (pred_9 ?v1 ?v9) (pred_4 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v1))))

(:action op_4
:parameters (?v1 ?v2)
:precondition (and (pred_7 ?v1) (pred_6 ?v2) 
                  (pred_10 ?v1) (pred_11 ?v2 ?v1) (pred_3 ))
:effect (and (pred_12 ?v2)
   (not (pred_11 ?v2 ?v1)) (not (pred_3 ))))


(:action op_5
:parameters (?v1 ?v11 ?v8)
:precondition (and (pred_7 ?v1) (pred_6 ?v11) (pred_6 ?v8)
                  (pred_10 ?v1) (pred_12 ?v8) (pred_11 ?v11 ?v1))
:effect (and (pred_12 ?v11) (pred_11 ?v8 ?v1)
        (not (pred_12 ?v8)) (not (pred_11 ?v11 ?v1))))

(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_7 ?v1) (pred_6 ?v2) 
                  (pred_10 ?v1) (pred_12 ?v2))
:effect (and (pred_3 ) (pred_11 ?v2 ?v1) (not (pred_12 ?v2)))))


	
