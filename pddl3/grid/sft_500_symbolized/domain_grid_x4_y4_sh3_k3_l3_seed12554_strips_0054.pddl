(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v9 ?v3)
             (pred_8 ?v11 ?v13)
             (pred_4 ?v9 ?v13)
             (pred_6 ?v4 ?v9 )
	     (pred_11 ?v9)
             (pred_9 ?v6)
             (pred_5 ?v11)
             (pred_3 ?v13)
             (pred_2 ?v9)
             (pred_1 ?v11)
             (pred_12 ?v9)
             (pred_10 ))



(:action op_5
:parameters (?v10 ?v5 ?v1 ?v7)
:precondition (and (pred_9 ?v10) (pred_9 ?v5) (pred_5 ?v1) (pred_3 ?v7)
          (pred_7 ?v10 ?v5) (pred_8 ?v1 ?v7)
                   (pred_4 ?v5 ?v7) (pred_11 ?v10) 
                   (pred_2 ?v5) (pred_1 ?v1))
:effect (and  (pred_12 ?v5) (not (pred_2 ?v5))))


(:action op_4
:parameters (?v10 ?v8)
:precondition (and (pred_9 ?v10) (pred_9 ?v8)
               (pred_11 ?v10) (pred_7 ?v10 ?v8) (pred_12 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v10))))

(:action op_1
:parameters (?v10 ?v1)
:precondition (and (pred_9 ?v10) (pred_5 ?v1) 
                  (pred_11 ?v10) (pred_6 ?v1 ?v10) (pred_10 ))
:effect (and (pred_1 ?v1)
   (not (pred_6 ?v1 ?v10)) (not (pred_10 ))))


(:action op_2
:parameters (?v10 ?v2 ?v12)
:precondition (and (pred_9 ?v10) (pred_5 ?v2) (pred_5 ?v12)
                  (pred_11 ?v10) (pred_1 ?v12) (pred_6 ?v2 ?v10))
:effect (and (pred_1 ?v2) (pred_6 ?v12 ?v10)
        (not (pred_1 ?v12)) (not (pred_6 ?v2 ?v10))))

(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_9 ?v10) (pred_5 ?v1) 
                  (pred_11 ?v10) (pred_1 ?v1))
:effect (and (pred_10 ) (pred_6 ?v1 ?v10) (not (pred_1 ?v1)))))


	
