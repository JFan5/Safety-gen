(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v13)
             (pred_5 ?v3 ?v7)
             (pred_11 ?v6 ?v7)
             (pred_6 ?v12 ?v6 )
	     (pred_10 ?v6)
             (pred_7 ?v8)
             (pred_1 ?v3)
             (pred_3 ?v7)
             (pred_9 ?v6)
             (pred_2 ?v3)
             (pred_8 ?v6)
             (pred_4 ))



(:action op_3
:parameters (?v1 ?v9 ?v5 ?v2)
:precondition (and (pred_7 ?v1) (pred_7 ?v9) (pred_1 ?v5) (pred_3 ?v2)
          (pred_12 ?v1 ?v9) (pred_5 ?v5 ?v2)
                   (pred_11 ?v9 ?v2) (pred_10 ?v1) 
                   (pred_9 ?v9) (pred_2 ?v5))
:effect (and  (pred_8 ?v9) (not (pred_9 ?v9))))


(:action op_1
:parameters (?v1 ?v10)
:precondition (and (pred_7 ?v1) (pred_7 ?v10)
               (pred_10 ?v1) (pred_12 ?v1 ?v10) (pred_8 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_7 ?v1) (pred_1 ?v5) 
                  (pred_10 ?v1) (pred_6 ?v5 ?v1) (pred_4 ))
:effect (and (pred_2 ?v5)
   (not (pred_6 ?v5 ?v1)) (not (pred_4 ))))


(:action op_5
:parameters (?v1 ?v4 ?v11)
:precondition (and (pred_7 ?v1) (pred_1 ?v4) (pred_1 ?v11)
                  (pred_10 ?v1) (pred_2 ?v11) (pred_6 ?v4 ?v1))
:effect (and (pred_2 ?v4) (pred_6 ?v11 ?v1)
        (not (pred_2 ?v11)) (not (pred_6 ?v4 ?v1))))

(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_7 ?v1) (pred_1 ?v5) 
                  (pred_10 ?v1) (pred_2 ?v5))
:effect (and (pred_4 ) (pred_6 ?v5 ?v1) (not (pred_2 ?v5)))))


	
