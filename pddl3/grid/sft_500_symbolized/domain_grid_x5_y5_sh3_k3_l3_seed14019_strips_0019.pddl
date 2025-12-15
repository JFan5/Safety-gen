(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v11)
             (pred_3 ?v8 ?v1)
             (pred_7 ?v3 ?v1)
             (pred_10 ?v7 ?v3 )
	     (pred_2 ?v3)
             (pred_4 ?v6)
             (pred_1 ?v8)
             (pred_12 ?v1)
             (pred_11 ?v3)
             (pred_5 ?v8)
             (pred_6 ?v3)
             (pred_8 ))



(:action op_2
:parameters (?v9 ?v2 ?v10 ?v5)
:precondition (and (pred_4 ?v9) (pred_4 ?v2) (pred_1 ?v10) (pred_12 ?v5)
          (pred_9 ?v9 ?v2) (pred_3 ?v10 ?v5)
                   (pred_7 ?v2 ?v5) (pred_2 ?v9) 
                   (pred_11 ?v2) (pred_5 ?v10))
:effect (and  (pred_6 ?v2) (not (pred_11 ?v2))))


(:action op_1
:parameters (?v9 ?v4)
:precondition (and (pred_4 ?v9) (pred_4 ?v4)
               (pred_2 ?v9) (pred_9 ?v9 ?v4) (pred_6 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v9))))

(:action op_3
:parameters (?v9 ?v10)
:precondition (and (pred_4 ?v9) (pred_1 ?v10) 
                  (pred_2 ?v9) (pred_10 ?v10 ?v9) (pred_8 ))
:effect (and (pred_5 ?v10)
   (not (pred_10 ?v10 ?v9)) (not (pred_8 ))))


(:action op_5
:parameters (?v9 ?v13 ?v12)
:precondition (and (pred_4 ?v9) (pred_1 ?v13) (pred_1 ?v12)
                  (pred_2 ?v9) (pred_5 ?v12) (pred_10 ?v13 ?v9))
:effect (and (pred_5 ?v13) (pred_10 ?v12 ?v9)
        (not (pred_5 ?v12)) (not (pred_10 ?v13 ?v9))))

(:action op_4
:parameters (?v9 ?v10)
:precondition (and (pred_4 ?v9) (pred_1 ?v10) 
                  (pred_2 ?v9) (pred_5 ?v10))
:effect (and (pred_8 ) (pred_10 ?v10 ?v9) (not (pred_5 ?v10)))))


	
