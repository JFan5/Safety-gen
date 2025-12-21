(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v2)
             (pred_5 ?v4 ?v5)
             (pred_1 ?v7 ?v5)
             (pred_12 ?v8 ?v7 )
	     (pred_10 ?v7)
             (pred_4 ?v12)
             (pred_3 ?v4)
             (pred_7 ?v5)
             (pred_8 ?v7)
             (pred_2 ?v4)
             (pred_11 ?v7)
             (pred_9 ))



(:action op_3
:parameters (?v9 ?v1 ?v13 ?v10)
:precondition (and (pred_4 ?v9) (pred_4 ?v1) (pred_3 ?v13) (pred_7 ?v10)
          (pred_6 ?v9 ?v1) (pred_5 ?v13 ?v10)
                   (pred_1 ?v1 ?v10) (pred_10 ?v9) 
                   (pred_8 ?v1) (pred_2 ?v13))
:effect (and  (pred_11 ?v1) (not (pred_8 ?v1))))


(:action op_1
:parameters (?v9 ?v3)
:precondition (and (pred_4 ?v9) (pred_4 ?v3)
               (pred_10 ?v9) (pred_6 ?v9 ?v3) (pred_11 ?v3))
:effect (and (pred_10 ?v3) (not (pred_10 ?v9))))

(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_4 ?v9) (pred_3 ?v13) 
                  (pred_10 ?v9) (pred_12 ?v13 ?v9) (pred_9 ))
:effect (and (pred_2 ?v13)
   (not (pred_12 ?v13 ?v9)) (not (pred_9 ))))


(:action op_5
:parameters (?v9 ?v11 ?v6)
:precondition (and (pred_4 ?v9) (pred_3 ?v11) (pred_3 ?v6)
                  (pred_10 ?v9) (pred_2 ?v6) (pred_12 ?v11 ?v9))
:effect (and (pred_2 ?v11) (pred_12 ?v6 ?v9)
        (not (pred_2 ?v6)) (not (pred_12 ?v11 ?v9))))

(:action op_4
:parameters (?v9 ?v13)
:precondition (and (pred_4 ?v9) (pred_3 ?v13) 
                  (pred_10 ?v9) (pred_2 ?v13))
:effect (and (pred_9 ) (pred_12 ?v13 ?v9) (not (pred_2 ?v13)))))


	
