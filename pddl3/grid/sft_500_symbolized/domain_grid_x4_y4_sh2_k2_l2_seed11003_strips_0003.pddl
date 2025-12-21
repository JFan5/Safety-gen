(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v6)
             (pred_2 ?v11 ?v7)
             (pred_5 ?v8 ?v7)
             (pred_10 ?v2 ?v8 )
	     (pred_1 ?v8)
             (pred_11 ?v9)
             (pred_12 ?v11)
             (pred_7 ?v7)
             (pred_4 ?v8)
             (pred_3 ?v11)
             (pred_6 ?v8)
             (pred_9 ))



(:action op_3
:parameters (?v1 ?v10 ?v12 ?v3)
:precondition (and (pred_11 ?v1) (pred_11 ?v10) (pred_12 ?v12) (pred_7 ?v3)
          (pred_8 ?v1 ?v10) (pred_2 ?v12 ?v3)
                   (pred_5 ?v10 ?v3) (pred_1 ?v1) 
                   (pred_4 ?v10) (pred_3 ?v12))
:effect (and  (pred_6 ?v10) (not (pred_4 ?v10))))


(:action op_4
:parameters (?v1 ?v13)
:precondition (and (pred_11 ?v1) (pred_11 ?v13)
               (pred_1 ?v1) (pred_8 ?v1 ?v13) (pred_6 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v1))))

(:action op_1
:parameters (?v1 ?v12)
:precondition (and (pred_11 ?v1) (pred_12 ?v12) 
                  (pred_1 ?v1) (pred_10 ?v12 ?v1) (pred_9 ))
:effect (and (pred_3 ?v12)
   (not (pred_10 ?v12 ?v1)) (not (pred_9 ))))


(:action op_2
:parameters (?v1 ?v4 ?v5)
:precondition (and (pred_11 ?v1) (pred_12 ?v4) (pred_12 ?v5)
                  (pred_1 ?v1) (pred_3 ?v5) (pred_10 ?v4 ?v1))
:effect (and (pred_3 ?v4) (pred_10 ?v5 ?v1)
        (not (pred_3 ?v5)) (not (pred_10 ?v4 ?v1))))

(:action op_5
:parameters (?v1 ?v12)
:precondition (and (pred_11 ?v1) (pred_12 ?v12) 
                  (pred_1 ?v1) (pred_3 ?v12))
:effect (and (pred_9 ) (pred_10 ?v12 ?v1) (not (pred_3 ?v12)))))


	
