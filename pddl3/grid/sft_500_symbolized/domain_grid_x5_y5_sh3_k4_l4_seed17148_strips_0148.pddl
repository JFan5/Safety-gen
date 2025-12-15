(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v3 ?v6)
             (pred_2 ?v5 ?v10)
             (pred_10 ?v3 ?v10)
             (pred_1 ?v2 ?v3 )
	     (pred_11 ?v3)
             (pred_9 ?v13)
             (pred_3 ?v5)
             (pred_5 ?v10)
             (pred_7 ?v3)
             (pred_8 ?v5)
             (pred_12 ?v3)
             (pred_6 ))



(:action op_5
:parameters (?v1 ?v9 ?v12 ?v4)
:precondition (and (pred_9 ?v1) (pred_9 ?v9) (pred_3 ?v12) (pred_5 ?v4)
          (pred_4 ?v1 ?v9) (pred_2 ?v12 ?v4)
                   (pred_10 ?v9 ?v4) (pred_11 ?v1) 
                   (pred_7 ?v9) (pred_8 ?v12))
:effect (and  (pred_12 ?v9) (not (pred_7 ?v9))))


(:action op_3
:parameters (?v1 ?v7)
:precondition (and (pred_9 ?v1) (pred_9 ?v7)
               (pred_11 ?v1) (pred_4 ?v1 ?v7) (pred_12 ?v7))
:effect (and (pred_11 ?v7) (not (pred_11 ?v1))))

(:action op_1
:parameters (?v1 ?v12)
:precondition (and (pred_9 ?v1) (pred_3 ?v12) 
                  (pred_11 ?v1) (pred_1 ?v12 ?v1) (pred_6 ))
:effect (and (pred_8 ?v12)
   (not (pred_1 ?v12 ?v1)) (not (pred_6 ))))


(:action op_2
:parameters (?v1 ?v11 ?v8)
:precondition (and (pred_9 ?v1) (pred_3 ?v11) (pred_3 ?v8)
                  (pred_11 ?v1) (pred_8 ?v8) (pred_1 ?v11 ?v1))
:effect (and (pred_8 ?v11) (pred_1 ?v8 ?v1)
        (not (pred_8 ?v8)) (not (pred_1 ?v11 ?v1))))

(:action op_4
:parameters (?v1 ?v12)
:precondition (and (pred_9 ?v1) (pred_3 ?v12) 
                  (pred_11 ?v1) (pred_8 ?v12))
:effect (and (pred_6 ) (pred_1 ?v12 ?v1) (not (pred_8 ?v12)))))


	
