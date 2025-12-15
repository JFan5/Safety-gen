(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v2)
             (pred_11 ?v4 ?v7)
             (pred_9 ?v8 ?v7)
             (pred_6 ?v11 ?v8 )
	     (pred_8 ?v8)
             (pred_7 ?v6)
             (pred_12 ?v4)
             (pred_4 ?v7)
             (pred_1 ?v8)
             (pred_5 ?v4)
             (pred_2 ?v8)
             (pred_3 ))



(:action op_3
:parameters (?v10 ?v5 ?v13 ?v3)
:precondition (and (pred_7 ?v10) (pred_7 ?v5) (pred_12 ?v13) (pred_4 ?v3)
          (pred_10 ?v10 ?v5) (pred_11 ?v13 ?v3)
                   (pred_9 ?v5 ?v3) (pred_8 ?v10) 
                   (pred_1 ?v5) (pred_5 ?v13))
:effect (and  (pred_2 ?v5) (not (pred_1 ?v5))))


(:action op_1
:parameters (?v10 ?v1)
:precondition (and (pred_7 ?v10) (pred_7 ?v1)
               (pred_8 ?v10) (pred_10 ?v10 ?v1) (pred_2 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_7 ?v10) (pred_12 ?v13) 
                  (pred_8 ?v10) (pred_6 ?v13 ?v10) (pred_3 ))
:effect (and (pred_5 ?v13)
   (not (pred_6 ?v13 ?v10)) (not (pred_3 ))))


(:action op_2
:parameters (?v10 ?v9 ?v12)
:precondition (and (pred_7 ?v10) (pred_12 ?v9) (pred_12 ?v12)
                  (pred_8 ?v10) (pred_5 ?v12) (pred_6 ?v9 ?v10))
:effect (and (pred_5 ?v9) (pred_6 ?v12 ?v10)
        (not (pred_5 ?v12)) (not (pred_6 ?v9 ?v10))))

(:action op_5
:parameters (?v10 ?v13)
:precondition (and (pred_7 ?v10) (pred_12 ?v13) 
                  (pred_8 ?v10) (pred_5 ?v13))
:effect (and (pred_3 ) (pred_6 ?v13 ?v10) (not (pred_5 ?v13)))))


	
