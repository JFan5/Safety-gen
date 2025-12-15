(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v4)
             (pred_12 ?v3 ?v5)
             (pred_7 ?v7 ?v5)
             (pred_4 ?v1 ?v7 )
	     (pred_3 ?v7)
             (pred_8 ?v12)
             (pred_11 ?v3)
             (pred_2 ?v5)
             (pred_9 ?v7)
             (pred_10 ?v3)
             (pred_1 ?v7)
             (pred_5 ))



(:action op_5
:parameters (?v9 ?v8 ?v13 ?v11)
:precondition (and (pred_8 ?v9) (pred_8 ?v8) (pred_11 ?v13) (pred_2 ?v11)
          (pred_6 ?v9 ?v8) (pred_12 ?v13 ?v11)
                   (pred_7 ?v8 ?v11) (pred_3 ?v9) 
                   (pred_9 ?v8) (pred_10 ?v13))
:effect (and  (pred_1 ?v8) (not (pred_9 ?v8))))


(:action op_3
:parameters (?v9 ?v2)
:precondition (and (pred_8 ?v9) (pred_8 ?v2)
               (pred_3 ?v9) (pred_6 ?v9 ?v2) (pred_1 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v9))))

(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_8 ?v9) (pred_11 ?v13) 
                  (pred_3 ?v9) (pred_4 ?v13 ?v9) (pred_5 ))
:effect (and (pred_10 ?v13)
   (not (pred_4 ?v13 ?v9)) (not (pred_5 ))))


(:action op_4
:parameters (?v9 ?v6 ?v10)
:precondition (and (pred_8 ?v9) (pred_11 ?v6) (pred_11 ?v10)
                  (pred_3 ?v9) (pred_10 ?v10) (pred_4 ?v6 ?v9))
:effect (and (pred_10 ?v6) (pred_4 ?v10 ?v9)
        (not (pred_10 ?v10)) (not (pred_4 ?v6 ?v9))))

(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_8 ?v9) (pred_11 ?v13) 
                  (pred_3 ?v9) (pred_10 ?v13))
:effect (and (pred_5 ) (pred_4 ?v13 ?v9) (not (pred_10 ?v13)))))


	
