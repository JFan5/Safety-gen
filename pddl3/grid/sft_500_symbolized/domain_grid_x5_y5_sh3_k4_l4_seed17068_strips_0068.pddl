(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v3)
             (pred_11 ?v9 ?v7)
             (pred_1 ?v8 ?v7)
             (pred_2 ?v6 ?v8 )
	     (pred_9 ?v8)
             (pred_10 ?v4)
             (pred_8 ?v9)
             (pred_12 ?v7)
             (pred_4 ?v8)
             (pred_3 ?v9)
             (pred_7 ?v8)
             (pred_5 ))



(:action op_1
:parameters (?v1 ?v5 ?v13 ?v10)
:precondition (and (pred_10 ?v1) (pred_10 ?v5) (pred_8 ?v13) (pred_12 ?v10)
          (pred_6 ?v1 ?v5) (pred_11 ?v13 ?v10)
                   (pred_1 ?v5 ?v10) (pred_9 ?v1) 
                   (pred_4 ?v5) (pred_3 ?v13))
:effect (and  (pred_7 ?v5) (not (pred_4 ?v5))))


(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_10 ?v1) (pred_10 ?v2)
               (pred_9 ?v1) (pred_6 ?v1 ?v2) (pred_7 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v1))))

(:action op_4
:parameters (?v1 ?v13)
:precondition (and (pred_10 ?v1) (pred_8 ?v13) 
                  (pred_9 ?v1) (pred_2 ?v13 ?v1) (pred_5 ))
:effect (and (pred_3 ?v13)
   (not (pred_2 ?v13 ?v1)) (not (pred_5 ))))


(:action op_3
:parameters (?v1 ?v12 ?v11)
:precondition (and (pred_10 ?v1) (pred_8 ?v12) (pred_8 ?v11)
                  (pred_9 ?v1) (pred_3 ?v11) (pred_2 ?v12 ?v1))
:effect (and (pred_3 ?v12) (pred_2 ?v11 ?v1)
        (not (pred_3 ?v11)) (not (pred_2 ?v12 ?v1))))

(:action op_5
:parameters (?v1 ?v13)
:precondition (and (pred_10 ?v1) (pred_8 ?v13) 
                  (pred_9 ?v1) (pred_3 ?v13))
:effect (and (pred_5 ) (pred_2 ?v13 ?v1) (not (pred_3 ?v13)))))


	
