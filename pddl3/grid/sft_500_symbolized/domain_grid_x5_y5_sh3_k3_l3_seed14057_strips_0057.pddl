(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v7)
             (pred_3 ?v10 ?v9)
             (pred_2 ?v5 ?v9)
             (pred_12 ?v2 ?v5 )
	     (pred_9 ?v5)
             (pred_6 ?v13)
             (pred_8 ?v10)
             (pred_10 ?v9)
             (pred_7 ?v5)
             (pred_11 ?v10)
             (pred_4 ?v5)
             (pred_1 ))



(:action op_4
:parameters (?v1 ?v3 ?v4 ?v8)
:precondition (and (pred_6 ?v1) (pred_6 ?v3) (pred_8 ?v4) (pred_10 ?v8)
          (pred_5 ?v1 ?v3) (pred_3 ?v4 ?v8)
                   (pred_2 ?v3 ?v8) (pred_9 ?v1) 
                   (pred_7 ?v3) (pred_11 ?v4))
:effect (and  (pred_4 ?v3) (not (pred_7 ?v3))))


(:action op_2
:parameters (?v1 ?v11)
:precondition (and (pred_6 ?v1) (pred_6 ?v11)
               (pred_9 ?v1) (pred_5 ?v1 ?v11) (pred_4 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v1))))

(:action op_3
:parameters (?v1 ?v4)
:precondition (and (pred_6 ?v1) (pred_8 ?v4) 
                  (pred_9 ?v1) (pred_12 ?v4 ?v1) (pred_1 ))
:effect (and (pred_11 ?v4)
   (not (pred_12 ?v4 ?v1)) (not (pred_1 ))))


(:action op_5
:parameters (?v1 ?v12 ?v6)
:precondition (and (pred_6 ?v1) (pred_8 ?v12) (pred_8 ?v6)
                  (pred_9 ?v1) (pred_11 ?v6) (pred_12 ?v12 ?v1))
:effect (and (pred_11 ?v12) (pred_12 ?v6 ?v1)
        (not (pred_11 ?v6)) (not (pred_12 ?v12 ?v1))))

(:action op_1
:parameters (?v1 ?v4)
:precondition (and (pred_6 ?v1) (pred_8 ?v4) 
                  (pred_9 ?v1) (pred_11 ?v4))
:effect (and (pred_1 ) (pred_12 ?v4 ?v1) (not (pred_11 ?v4)))))


	
