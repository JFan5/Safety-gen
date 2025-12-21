(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v4 ?v8)
             (pred_10 ?v11 ?v13)
             (pred_11 ?v4 ?v13)
             (pred_7 ?v6 ?v4 )
	     (pred_3 ?v4)
             (pred_1 ?v2)
             (pred_9 ?v11)
             (pred_12 ?v13)
             (pred_2 ?v4)
             (pred_5 ?v11)
             (pred_6 ?v4)
             (pred_8 ))



(:action op_2
:parameters (?v9 ?v1 ?v10 ?v7)
:precondition (and (pred_1 ?v9) (pred_1 ?v1) (pred_9 ?v10) (pred_12 ?v7)
          (pred_4 ?v9 ?v1) (pred_10 ?v10 ?v7)
                   (pred_11 ?v1 ?v7) (pred_3 ?v9) 
                   (pred_2 ?v1) (pred_5 ?v10))
:effect (and  (pred_6 ?v1) (not (pred_2 ?v1))))


(:action op_3
:parameters (?v9 ?v3)
:precondition (and (pred_1 ?v9) (pred_1 ?v3)
               (pred_3 ?v9) (pred_4 ?v9 ?v3) (pred_6 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v9))))

(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_1 ?v9) (pred_9 ?v10) 
                  (pred_3 ?v9) (pred_7 ?v10 ?v9) (pred_8 ))
:effect (and (pred_5 ?v10)
   (not (pred_7 ?v10 ?v9)) (not (pred_8 ))))


(:action op_5
:parameters (?v9 ?v12 ?v5)
:precondition (and (pred_1 ?v9) (pred_9 ?v12) (pred_9 ?v5)
                  (pred_3 ?v9) (pred_5 ?v5) (pred_7 ?v12 ?v9))
:effect (and (pred_5 ?v12) (pred_7 ?v5 ?v9)
        (not (pred_5 ?v5)) (not (pred_7 ?v12 ?v9))))

(:action op_4
:parameters (?v9 ?v10)
:precondition (and (pred_1 ?v9) (pred_9 ?v10) 
                  (pred_3 ?v9) (pred_5 ?v10))
:effect (and (pred_8 ) (pred_7 ?v10 ?v9) (not (pred_5 ?v10)))))


	
