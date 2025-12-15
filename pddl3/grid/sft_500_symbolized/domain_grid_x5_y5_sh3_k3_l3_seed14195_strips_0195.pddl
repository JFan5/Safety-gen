(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v4 ?v8)
             (pred_11 ?v6 ?v5)
             (pred_10 ?v4 ?v5)
             (pred_5 ?v13 ?v4 )
	     (pred_9 ?v4)
             (pred_3 ?v7)
             (pred_6 ?v6)
             (pred_7 ?v5)
             (pred_4 ?v4)
             (pred_2 ?v6)
             (pred_12 ?v4)
             (pred_1 ))



(:action op_4
:parameters (?v9 ?v3 ?v10 ?v1)
:precondition (and (pred_3 ?v9) (pred_3 ?v3) (pred_6 ?v10) (pred_7 ?v1)
          (pred_8 ?v9 ?v3) (pred_11 ?v10 ?v1)
                   (pred_10 ?v3 ?v1) (pred_9 ?v9) 
                   (pred_4 ?v3) (pred_2 ?v10))
:effect (and  (pred_12 ?v3) (not (pred_4 ?v3))))


(:action op_2
:parameters (?v9 ?v12)
:precondition (and (pred_3 ?v9) (pred_3 ?v12)
               (pred_9 ?v9) (pred_8 ?v9 ?v12) (pred_12 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v9))))

(:action op_3
:parameters (?v9 ?v10)
:precondition (and (pred_3 ?v9) (pred_6 ?v10) 
                  (pred_9 ?v9) (pred_5 ?v10 ?v9) (pred_1 ))
:effect (and (pred_2 ?v10)
   (not (pred_5 ?v10 ?v9)) (not (pred_1 ))))


(:action op_5
:parameters (?v9 ?v2 ?v11)
:precondition (and (pred_3 ?v9) (pred_6 ?v2) (pred_6 ?v11)
                  (pred_9 ?v9) (pred_2 ?v11) (pred_5 ?v2 ?v9))
:effect (and (pred_2 ?v2) (pred_5 ?v11 ?v9)
        (not (pred_2 ?v11)) (not (pred_5 ?v2 ?v9))))

(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_3 ?v9) (pred_6 ?v10) 
                  (pred_9 ?v9) (pred_2 ?v10))
:effect (and (pred_1 ) (pred_5 ?v10 ?v9) (not (pred_2 ?v10)))))


	
