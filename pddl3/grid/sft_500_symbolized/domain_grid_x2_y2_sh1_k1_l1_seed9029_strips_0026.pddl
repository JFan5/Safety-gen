(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v3 ?v8)
             (pred_1 ?v7 ?v9)
             (pred_2 ?v3 ?v9)
             (pred_7 ?v5 ?v3 )
	     (pred_12 ?v3)
             (pred_5 ?v6)
             (pred_9 ?v7)
             (pred_8 ?v9)
             (pred_11 ?v3)
             (pred_4 ?v7)
             (pred_10 ?v3)
             (pred_3 ))



(:action op_2
:parameters (?v10 ?v4 ?v13 ?v11)
:precondition (and (pred_5 ?v10) (pred_5 ?v4) (pred_9 ?v13) (pred_8 ?v11)
          (pred_6 ?v10 ?v4) (pred_1 ?v13 ?v11)
                   (pred_2 ?v4 ?v11) (pred_12 ?v10) 
                   (pred_11 ?v4) (pred_4 ?v13))
:effect (and  (pred_10 ?v4) (not (pred_11 ?v4))))


(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_5 ?v1)
               (pred_12 ?v10) (pred_6 ?v10 ?v1) (pred_10 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_5 ?v10) (pred_9 ?v13) 
                  (pred_12 ?v10) (pred_7 ?v13 ?v10) (pred_3 ))
:effect (and (pred_4 ?v13)
   (not (pred_7 ?v13 ?v10)) (not (pred_3 ))))


(:action op_5
:parameters (?v10 ?v12 ?v2)
:precondition (and (pred_5 ?v10) (pred_9 ?v12) (pred_9 ?v2)
                  (pred_12 ?v10) (pred_4 ?v2) (pred_7 ?v12 ?v10))
:effect (and (pred_4 ?v12) (pred_7 ?v2 ?v10)
        (not (pred_4 ?v2)) (not (pred_7 ?v12 ?v10))))

(:action op_1
:parameters (?v10 ?v13)
:precondition (and (pred_5 ?v10) (pred_9 ?v13) 
                  (pred_12 ?v10) (pred_4 ?v13))
:effect (and (pred_3 ) (pred_7 ?v13 ?v10) (not (pred_4 ?v13)))))


	
