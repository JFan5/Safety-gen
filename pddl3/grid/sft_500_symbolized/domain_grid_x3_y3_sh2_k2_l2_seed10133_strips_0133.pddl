(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v9 ?v7)
             (pred_2 ?v10 ?v12)
             (pred_6 ?v9 ?v12)
             (pred_7 ?v13 ?v9 )
	     (pred_10 ?v9)
             (pred_9 ?v4)
             (pred_3 ?v10)
             (pred_1 ?v12)
             (pred_5 ?v9)
             (pred_12 ?v10)
             (pred_11 ?v9)
             (pred_8 ))



(:action op_3
:parameters (?v1 ?v8 ?v6 ?v5)
:precondition (and (pred_9 ?v1) (pred_9 ?v8) (pred_3 ?v6) (pred_1 ?v5)
          (pred_4 ?v1 ?v8) (pred_2 ?v6 ?v5)
                   (pred_6 ?v8 ?v5) (pred_10 ?v1) 
                   (pred_5 ?v8) (pred_12 ?v6))
:effect (and  (pred_11 ?v8) (not (pred_5 ?v8))))


(:action op_5
:parameters (?v1 ?v2)
:precondition (and (pred_9 ?v1) (pred_9 ?v2)
               (pred_10 ?v1) (pred_4 ?v1 ?v2) (pred_11 ?v2))
:effect (and (pred_10 ?v2) (not (pred_10 ?v1))))

(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_9 ?v1) (pred_3 ?v6) 
                  (pred_10 ?v1) (pred_7 ?v6 ?v1) (pred_8 ))
:effect (and (pred_12 ?v6)
   (not (pred_7 ?v6 ?v1)) (not (pred_8 ))))


(:action op_2
:parameters (?v1 ?v11 ?v3)
:precondition (and (pred_9 ?v1) (pred_3 ?v11) (pred_3 ?v3)
                  (pred_10 ?v1) (pred_12 ?v3) (pred_7 ?v11 ?v1))
:effect (and (pred_12 ?v11) (pred_7 ?v3 ?v1)
        (not (pred_12 ?v3)) (not (pred_7 ?v11 ?v1))))

(:action op_4
:parameters (?v1 ?v6)
:precondition (and (pred_9 ?v1) (pred_3 ?v6) 
                  (pred_10 ?v1) (pred_12 ?v6))
:effect (and (pred_8 ) (pred_7 ?v6 ?v1) (not (pred_12 ?v6)))))


	
