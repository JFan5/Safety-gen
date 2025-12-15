(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v2)
             (pred_6 ?v6 ?v11)
             (pred_7 ?v3 ?v11)
             (pred_11 ?v12 ?v3 )
	     (pred_3 ?v3)
             (pred_12 ?v8)
             (pred_1 ?v6)
             (pred_9 ?v11)
             (pred_5 ?v3)
             (pred_10 ?v6)
             (pred_4 ?v3)
             (pred_2 ))



(:action op_3
:parameters (?v9 ?v10 ?v1 ?v5)
:precondition (and (pred_12 ?v9) (pred_12 ?v10) (pred_1 ?v1) (pred_9 ?v5)
          (pred_8 ?v9 ?v10) (pred_6 ?v1 ?v5)
                   (pred_7 ?v10 ?v5) (pred_3 ?v9) 
                   (pred_5 ?v10) (pred_10 ?v1))
:effect (and  (pred_4 ?v10) (not (pred_5 ?v10))))


(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_12 ?v9) (pred_12 ?v13)
               (pred_3 ?v9) (pred_8 ?v9 ?v13) (pred_4 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v9))))

(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_12 ?v9) (pred_1 ?v1) 
                  (pred_3 ?v9) (pred_11 ?v1 ?v9) (pred_2 ))
:effect (and (pred_10 ?v1)
   (not (pred_11 ?v1 ?v9)) (not (pred_2 ))))


(:action op_5
:parameters (?v9 ?v4 ?v7)
:precondition (and (pred_12 ?v9) (pred_1 ?v4) (pred_1 ?v7)
                  (pred_3 ?v9) (pred_10 ?v7) (pred_11 ?v4 ?v9))
:effect (and (pred_10 ?v4) (pred_11 ?v7 ?v9)
        (not (pred_10 ?v7)) (not (pred_11 ?v4 ?v9))))

(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_12 ?v9) (pred_1 ?v1) 
                  (pred_3 ?v9) (pred_10 ?v1))
:effect (and (pred_2 ) (pred_11 ?v1 ?v9) (not (pred_10 ?v1)))))


	
