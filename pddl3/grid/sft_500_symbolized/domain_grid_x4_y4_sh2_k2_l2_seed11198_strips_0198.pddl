(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v4 ?v2)
             (pred_5 ?v7 ?v6)
             (pred_11 ?v4 ?v6)
             (pred_6 ?v1 ?v4 )
	     (pred_2 ?v4)
             (pred_12 ?v11)
             (pred_4 ?v7)
             (pred_7 ?v6)
             (pred_1 ?v4)
             (pred_3 ?v7)
             (pred_8 ?v4)
             (pred_10 ))



(:action op_1
:parameters (?v9 ?v8 ?v10 ?v3)
:precondition (and (pred_12 ?v9) (pred_12 ?v8) (pred_4 ?v10) (pred_7 ?v3)
          (pred_9 ?v9 ?v8) (pred_5 ?v10 ?v3)
                   (pred_11 ?v8 ?v3) (pred_2 ?v9) 
                   (pred_1 ?v8) (pred_3 ?v10))
:effect (and  (pred_8 ?v8) (not (pred_1 ?v8))))


(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_12 ?v9) (pred_12 ?v13)
               (pred_2 ?v9) (pred_9 ?v9 ?v13) (pred_8 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v9))))

(:action op_3
:parameters (?v9 ?v10)
:precondition (and (pred_12 ?v9) (pred_4 ?v10) 
                  (pred_2 ?v9) (pred_6 ?v10 ?v9) (pred_10 ))
:effect (and (pred_3 ?v10)
   (not (pred_6 ?v10 ?v9)) (not (pred_10 ))))


(:action op_4
:parameters (?v9 ?v12 ?v5)
:precondition (and (pred_12 ?v9) (pred_4 ?v12) (pred_4 ?v5)
                  (pred_2 ?v9) (pred_3 ?v5) (pred_6 ?v12 ?v9))
:effect (and (pred_3 ?v12) (pred_6 ?v5 ?v9)
        (not (pred_3 ?v5)) (not (pred_6 ?v12 ?v9))))

(:action op_5
:parameters (?v9 ?v10)
:precondition (and (pred_12 ?v9) (pred_4 ?v10) 
                  (pred_2 ?v9) (pred_3 ?v10))
:effect (and (pred_10 ) (pred_6 ?v10 ?v9) (not (pred_3 ?v10)))))


	
