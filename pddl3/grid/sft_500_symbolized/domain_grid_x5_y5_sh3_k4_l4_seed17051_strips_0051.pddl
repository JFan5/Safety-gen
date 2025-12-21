(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v11)
             (pred_5 ?v12 ?v3)
             (pred_7 ?v1 ?v3)
             (pred_11 ?v2 ?v1 )
	     (pred_2 ?v1)
             (pred_4 ?v6)
             (pred_12 ?v12)
             (pred_1 ?v3)
             (pred_6 ?v1)
             (pred_8 ?v12)
             (pred_9 ?v1)
             (pred_10 ))



(:action op_1
:parameters (?v10 ?v4 ?v13 ?v9)
:precondition (and (pred_4 ?v10) (pred_4 ?v4) (pred_12 ?v13) (pred_1 ?v9)
          (pred_3 ?v10 ?v4) (pred_5 ?v13 ?v9)
                   (pred_7 ?v4 ?v9) (pred_2 ?v10) 
                   (pred_6 ?v4) (pred_8 ?v13))
:effect (and  (pred_9 ?v4) (not (pred_6 ?v4))))


(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_4 ?v10) (pred_4 ?v5)
               (pred_2 ?v10) (pred_3 ?v10 ?v5) (pred_9 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v10))))

(:action op_2
:parameters (?v10 ?v13)
:precondition (and (pred_4 ?v10) (pred_12 ?v13) 
                  (pred_2 ?v10) (pred_11 ?v13 ?v10) (pred_10 ))
:effect (and (pred_8 ?v13)
   (not (pred_11 ?v13 ?v10)) (not (pred_10 ))))


(:action op_3
:parameters (?v10 ?v8 ?v7)
:precondition (and (pred_4 ?v10) (pred_12 ?v8) (pred_12 ?v7)
                  (pred_2 ?v10) (pred_8 ?v7) (pred_11 ?v8 ?v10))
:effect (and (pred_8 ?v8) (pred_11 ?v7 ?v10)
        (not (pred_8 ?v7)) (not (pred_11 ?v8 ?v10))))

(:action op_5
:parameters (?v10 ?v13)
:precondition (and (pred_4 ?v10) (pred_12 ?v13) 
                  (pred_2 ?v10) (pred_8 ?v13))
:effect (and (pred_10 ) (pred_11 ?v13 ?v10) (not (pred_8 ?v13)))))


	
