(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v7)
             (pred_4 ?v9 ?v4)
             (pred_9 ?v12 ?v4)
             (pred_2 ?v6 ?v12 )
	     (pred_7 ?v12)
             (pred_1 ?v11)
             (pred_10 ?v9)
             (pred_11 ?v4)
             (pred_8 ?v12)
             (pred_12 ?v9)
             (pred_5 ?v12)
             (pred_3 ))



(:action op_4
:parameters (?v5 ?v8 ?v1 ?v13)
:precondition (and (pred_1 ?v5) (pred_1 ?v8) (pred_10 ?v1) (pred_11 ?v13)
          (pred_6 ?v5 ?v8) (pred_4 ?v1 ?v13)
                   (pred_9 ?v8 ?v13) (pred_7 ?v5) 
                   (pred_8 ?v8) (pred_12 ?v1))
:effect (and  (pred_5 ?v8) (not (pred_8 ?v8))))


(:action op_2
:parameters (?v5 ?v3)
:precondition (and (pred_1 ?v5) (pred_1 ?v3)
               (pred_7 ?v5) (pred_6 ?v5 ?v3) (pred_5 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v5))))

(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_1 ?v5) (pred_10 ?v1) 
                  (pred_7 ?v5) (pred_2 ?v1 ?v5) (pred_3 ))
:effect (and (pred_12 ?v1)
   (not (pred_2 ?v1 ?v5)) (not (pred_3 ))))


(:action op_3
:parameters (?v5 ?v2 ?v10)
:precondition (and (pred_1 ?v5) (pred_10 ?v2) (pred_10 ?v10)
                  (pred_7 ?v5) (pred_12 ?v10) (pred_2 ?v2 ?v5))
:effect (and (pred_12 ?v2) (pred_2 ?v10 ?v5)
        (not (pred_12 ?v10)) (not (pred_2 ?v2 ?v5))))

(:action op_1
:parameters (?v5 ?v1)
:precondition (and (pred_1 ?v5) (pred_10 ?v1) 
                  (pred_7 ?v5) (pred_12 ?v1))
:effect (and (pred_3 ) (pred_2 ?v1 ?v5) (not (pred_12 ?v1)))))


	
