(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v4)
             (pred_3 ?v8 ?v3)
             (pred_10 ?v5 ?v3)
             (pred_4 ?v9 ?v5 )
	     (pred_12 ?v5)
             (pred_6 ?v7)
             (pred_2 ?v8)
             (pred_9 ?v3)
             (pred_5 ?v5)
             (pred_8 ?v8)
             (pred_11 ?v5)
             (pred_7 ))



(:action op_4
:parameters (?v1 ?v12 ?v13 ?v11)
:precondition (and (pred_6 ?v1) (pred_6 ?v12) (pred_2 ?v13) (pred_9 ?v11)
          (pred_1 ?v1 ?v12) (pred_3 ?v13 ?v11)
                   (pred_10 ?v12 ?v11) (pred_12 ?v1) 
                   (pred_5 ?v12) (pred_8 ?v13))
:effect (and  (pred_11 ?v12) (not (pred_5 ?v12))))


(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_6 ?v1) (pred_6 ?v2)
               (pred_12 ?v1) (pred_1 ?v1 ?v2) (pred_11 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v1))))

(:action op_1
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_2 ?v13) 
                  (pred_12 ?v1) (pred_4 ?v13 ?v1) (pred_7 ))
:effect (and (pred_8 ?v13)
   (not (pred_4 ?v13 ?v1)) (not (pred_7 ))))


(:action op_5
:parameters (?v1 ?v6 ?v10)
:precondition (and (pred_6 ?v1) (pred_2 ?v6) (pred_2 ?v10)
                  (pred_12 ?v1) (pred_8 ?v10) (pred_4 ?v6 ?v1))
:effect (and (pred_8 ?v6) (pred_4 ?v10 ?v1)
        (not (pred_8 ?v10)) (not (pred_4 ?v6 ?v1))))

(:action op_3
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_2 ?v13) 
                  (pred_12 ?v1) (pred_8 ?v13))
:effect (and (pred_7 ) (pred_4 ?v13 ?v1) (not (pred_8 ?v13)))))


	
