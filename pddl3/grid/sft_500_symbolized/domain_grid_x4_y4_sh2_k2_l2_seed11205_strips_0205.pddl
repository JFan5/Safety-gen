(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v3)
             (pred_2 ?v6 ?v7)
             (pred_4 ?v10 ?v7)
             (pred_11 ?v4 ?v10 )
	     (pred_10 ?v10)
             (pred_5 ?v13)
             (pred_1 ?v6)
             (pred_3 ?v7)
             (pred_9 ?v10)
             (pred_7 ?v6)
             (pred_8 ?v10)
             (pred_12 ))



(:action op_3
:parameters (?v1 ?v12 ?v5 ?v8)
:precondition (and (pred_5 ?v1) (pred_5 ?v12) (pred_1 ?v5) (pred_3 ?v8)
          (pred_6 ?v1 ?v12) (pred_2 ?v5 ?v8)
                   (pred_4 ?v12 ?v8) (pred_10 ?v1) 
                   (pred_9 ?v12) (pred_7 ?v5))
:effect (and  (pred_8 ?v12) (not (pred_9 ?v12))))


(:action op_1
:parameters (?v1 ?v11)
:precondition (and (pred_5 ?v1) (pred_5 ?v11)
               (pred_10 ?v1) (pred_6 ?v1 ?v11) (pred_8 ?v11))
:effect (and (pred_10 ?v11) (not (pred_10 ?v1))))

(:action op_5
:parameters (?v1 ?v5)
:precondition (and (pred_5 ?v1) (pred_1 ?v5) 
                  (pred_10 ?v1) (pred_11 ?v5 ?v1) (pred_12 ))
:effect (and (pred_7 ?v5)
   (not (pred_11 ?v5 ?v1)) (not (pred_12 ))))


(:action op_4
:parameters (?v1 ?v9 ?v2)
:precondition (and (pred_5 ?v1) (pred_1 ?v9) (pred_1 ?v2)
                  (pred_10 ?v1) (pred_7 ?v2) (pred_11 ?v9 ?v1))
:effect (and (pred_7 ?v9) (pred_11 ?v2 ?v1)
        (not (pred_7 ?v2)) (not (pred_11 ?v9 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_5 ?v1) (pred_1 ?v5) 
                  (pred_10 ?v1) (pred_7 ?v5))
:effect (and (pred_12 ) (pred_11 ?v5 ?v1) (not (pred_7 ?v5)))))


	
