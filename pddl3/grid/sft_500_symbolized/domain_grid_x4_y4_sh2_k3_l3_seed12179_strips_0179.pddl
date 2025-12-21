(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v4)
             (pred_6 ?v13 ?v5)
             (pred_2 ?v3 ?v5)
             (pred_4 ?v11 ?v3 )
	     (pred_10 ?v3)
             (pred_7 ?v7)
             (pred_12 ?v13)
             (pred_9 ?v5)
             (pred_3 ?v3)
             (pred_11 ?v13)
             (pred_1 ?v3)
             (pred_5 ))



(:action op_5
:parameters (?v1 ?v12 ?v10 ?v9)
:precondition (and (pred_7 ?v1) (pred_7 ?v12) (pred_12 ?v10) (pred_9 ?v9)
          (pred_8 ?v1 ?v12) (pred_6 ?v10 ?v9)
                   (pred_2 ?v12 ?v9) (pred_10 ?v1) 
                   (pred_3 ?v12) (pred_11 ?v10))
:effect (and  (pred_1 ?v12) (not (pred_3 ?v12))))


(:action op_2
:parameters (?v1 ?v6)
:precondition (and (pred_7 ?v1) (pred_7 ?v6)
               (pred_10 ?v1) (pred_8 ?v1 ?v6) (pred_1 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v1))))

(:action op_3
:parameters (?v1 ?v10)
:precondition (and (pred_7 ?v1) (pred_12 ?v10) 
                  (pred_10 ?v1) (pred_4 ?v10 ?v1) (pred_5 ))
:effect (and (pred_11 ?v10)
   (not (pred_4 ?v10 ?v1)) (not (pred_5 ))))


(:action op_4
:parameters (?v1 ?v8 ?v2)
:precondition (and (pred_7 ?v1) (pred_12 ?v8) (pred_12 ?v2)
                  (pred_10 ?v1) (pred_11 ?v2) (pred_4 ?v8 ?v1))
:effect (and (pred_11 ?v8) (pred_4 ?v2 ?v1)
        (not (pred_11 ?v2)) (not (pred_4 ?v8 ?v1))))

(:action op_1
:parameters (?v1 ?v10)
:precondition (and (pred_7 ?v1) (pred_12 ?v10) 
                  (pred_10 ?v1) (pred_11 ?v10))
:effect (and (pred_5 ) (pred_4 ?v10 ?v1) (not (pred_11 ?v10)))))


	
