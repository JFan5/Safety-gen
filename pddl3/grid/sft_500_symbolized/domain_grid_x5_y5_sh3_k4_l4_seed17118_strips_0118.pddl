(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v5)
             (pred_3 ?v6 ?v9)
             (pred_2 ?v11 ?v9)
             (pred_5 ?v4 ?v11 )
	     (pred_9 ?v11)
             (pred_8 ?v3)
             (pred_1 ?v6)
             (pred_6 ?v9)
             (pred_4 ?v11)
             (pred_11 ?v6)
             (pred_7 ?v11)
             (pred_12 ))



(:action op_2
:parameters (?v1 ?v12 ?v13 ?v7)
:precondition (and (pred_8 ?v1) (pred_8 ?v12) (pred_1 ?v13) (pred_6 ?v7)
          (pred_10 ?v1 ?v12) (pred_3 ?v13 ?v7)
                   (pred_2 ?v12 ?v7) (pred_9 ?v1) 
                   (pred_4 ?v12) (pred_11 ?v13))
:effect (and  (pred_7 ?v12) (not (pred_4 ?v12))))


(:action op_3
:parameters (?v1 ?v2)
:precondition (and (pred_8 ?v1) (pred_8 ?v2)
               (pred_9 ?v1) (pred_10 ?v1 ?v2) (pred_7 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v1))))

(:action op_5
:parameters (?v1 ?v13)
:precondition (and (pred_8 ?v1) (pred_1 ?v13) 
                  (pred_9 ?v1) (pred_5 ?v13 ?v1) (pred_12 ))
:effect (and (pred_11 ?v13)
   (not (pred_5 ?v13 ?v1)) (not (pred_12 ))))


(:action op_4
:parameters (?v1 ?v8 ?v10)
:precondition (and (pred_8 ?v1) (pred_1 ?v8) (pred_1 ?v10)
                  (pred_9 ?v1) (pred_11 ?v10) (pred_5 ?v8 ?v1))
:effect (and (pred_11 ?v8) (pred_5 ?v10 ?v1)
        (not (pred_11 ?v10)) (not (pred_5 ?v8 ?v1))))

(:action op_1
:parameters (?v1 ?v13)
:precondition (and (pred_8 ?v1) (pred_1 ?v13) 
                  (pred_9 ?v1) (pred_11 ?v13))
:effect (and (pred_12 ) (pred_5 ?v13 ?v1) (not (pred_11 ?v13)))))


	
