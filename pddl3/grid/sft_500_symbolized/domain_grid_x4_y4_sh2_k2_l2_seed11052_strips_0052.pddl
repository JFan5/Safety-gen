(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v5)
             (pred_5 ?v1 ?v12)
             (pred_9 ?v4 ?v12)
             (pred_8 ?v8 ?v4 )
	     (pred_7 ?v4)
             (pred_3 ?v11)
             (pred_1 ?v1)
             (pred_4 ?v12)
             (pred_6 ?v4)
             (pred_2 ?v1)
             (pred_12 ?v4)
             (pred_10 ))



(:action op_1
:parameters (?v9 ?v10 ?v13 ?v3)
:precondition (and (pred_3 ?v9) (pred_3 ?v10) (pred_1 ?v13) (pred_4 ?v3)
          (pred_11 ?v9 ?v10) (pred_5 ?v13 ?v3)
                   (pred_9 ?v10 ?v3) (pred_7 ?v9) 
                   (pred_6 ?v10) (pred_2 ?v13))
:effect (and  (pred_12 ?v10) (not (pred_6 ?v10))))


(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_3 ?v9) (pred_3 ?v7)
               (pred_7 ?v9) (pred_11 ?v9 ?v7) (pred_12 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v9))))

(:action op_3
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_1 ?v13) 
                  (pred_7 ?v9) (pred_8 ?v13 ?v9) (pred_10 ))
:effect (and (pred_2 ?v13)
   (not (pred_8 ?v13 ?v9)) (not (pred_10 ))))


(:action op_2
:parameters (?v9 ?v2 ?v6)
:precondition (and (pred_3 ?v9) (pred_1 ?v2) (pred_1 ?v6)
                  (pred_7 ?v9) (pred_2 ?v6) (pred_8 ?v2 ?v9))
:effect (and (pred_2 ?v2) (pred_8 ?v6 ?v9)
        (not (pred_2 ?v6)) (not (pred_8 ?v2 ?v9))))

(:action op_4
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_1 ?v13) 
                  (pred_7 ?v9) (pred_2 ?v13))
:effect (and (pred_10 ) (pred_8 ?v13 ?v9) (not (pred_2 ?v13)))))


	
