(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v12)
             (pred_3 ?v10 ?v4)
             (pred_12 ?v13 ?v4)
             (pred_8 ?v11 ?v13 )
	     (pred_1 ?v13)
             (pred_10 ?v7)
             (pred_5 ?v10)
             (pred_6 ?v4)
             (pred_9 ?v13)
             (pred_7 ?v10)
             (pred_4 ?v13)
             (pred_11 ))



(:action op_4
:parameters (?v9 ?v8 ?v1 ?v5)
:precondition (and (pred_10 ?v9) (pred_10 ?v8) (pred_5 ?v1) (pred_6 ?v5)
          (pred_2 ?v9 ?v8) (pred_3 ?v1 ?v5)
                   (pred_12 ?v8 ?v5) (pred_1 ?v9) 
                   (pred_9 ?v8) (pred_7 ?v1))
:effect (and  (pred_4 ?v8) (not (pred_9 ?v8))))


(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_10 ?v9) (pred_10 ?v6)
               (pred_1 ?v9) (pred_2 ?v9 ?v6) (pred_4 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v9))))

(:action op_2
:parameters (?v9 ?v1)
:precondition (and (pred_10 ?v9) (pred_5 ?v1) 
                  (pred_1 ?v9) (pred_8 ?v1 ?v9) (pred_11 ))
:effect (and (pred_7 ?v1)
   (not (pred_8 ?v1 ?v9)) (not (pred_11 ))))


(:action op_3
:parameters (?v9 ?v2 ?v3)
:precondition (and (pred_10 ?v9) (pred_5 ?v2) (pred_5 ?v3)
                  (pred_1 ?v9) (pred_7 ?v3) (pred_8 ?v2 ?v9))
:effect (and (pred_7 ?v2) (pred_8 ?v3 ?v9)
        (not (pred_7 ?v3)) (not (pred_8 ?v2 ?v9))))

(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_10 ?v9) (pred_5 ?v1) 
                  (pred_1 ?v9) (pred_7 ?v1))
:effect (and (pred_11 ) (pred_8 ?v1 ?v9) (not (pred_7 ?v1)))))


	
