(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v4 ?v3)
             (pred_7 ?v12 ?v11)
             (pred_3 ?v4 ?v11)
             (pred_12 ?v10 ?v4 )
	     (pred_10 ?v4)
             (pred_6 ?v2)
             (pred_11 ?v12)
             (pred_5 ?v11)
             (pred_9 ?v4)
             (pred_8 ?v12)
             (pred_1 ?v4)
             (pred_4 ))



(:action op_3
:parameters (?v1 ?v8 ?v13 ?v6)
:precondition (and (pred_6 ?v1) (pred_6 ?v8) (pred_11 ?v13) (pred_5 ?v6)
          (pred_2 ?v1 ?v8) (pred_7 ?v13 ?v6)
                   (pred_3 ?v8 ?v6) (pred_10 ?v1) 
                   (pred_9 ?v8) (pred_8 ?v13))
:effect (and  (pred_1 ?v8) (not (pred_9 ?v8))))


(:action op_2
:parameters (?v1 ?v7)
:precondition (and (pred_6 ?v1) (pred_6 ?v7)
               (pred_10 ?v1) (pred_2 ?v1 ?v7) (pred_1 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v1))))

(:action op_4
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_11 ?v13) 
                  (pred_10 ?v1) (pred_12 ?v13 ?v1) (pred_4 ))
:effect (and (pred_8 ?v13)
   (not (pred_12 ?v13 ?v1)) (not (pred_4 ))))


(:action op_1
:parameters (?v1 ?v5 ?v9)
:precondition (and (pred_6 ?v1) (pred_11 ?v5) (pred_11 ?v9)
                  (pred_10 ?v1) (pred_8 ?v9) (pred_12 ?v5 ?v1))
:effect (and (pred_8 ?v5) (pred_12 ?v9 ?v1)
        (not (pred_8 ?v9)) (not (pred_12 ?v5 ?v1))))

(:action op_5
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_11 ?v13) 
                  (pred_10 ?v1) (pred_8 ?v13))
:effect (and (pred_4 ) (pred_12 ?v13 ?v1) (not (pred_8 ?v13)))))


	
