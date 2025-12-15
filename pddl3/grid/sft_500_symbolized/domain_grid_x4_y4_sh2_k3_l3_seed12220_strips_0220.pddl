(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v3 ?v6)
             (pred_2 ?v13 ?v4)
             (pred_4 ?v3 ?v4)
             (pred_5 ?v1 ?v3 )
	     (pred_1 ?v3)
             (pred_10 ?v11)
             (pred_11 ?v13)
             (pred_3 ?v4)
             (pred_9 ?v3)
             (pred_7 ?v13)
             (pred_12 ?v3)
             (pred_6 ))



(:action op_3
:parameters (?v9 ?v7 ?v2 ?v12)
:precondition (and (pred_10 ?v9) (pred_10 ?v7) (pred_11 ?v2) (pred_3 ?v12)
          (pred_8 ?v9 ?v7) (pred_2 ?v2 ?v12)
                   (pred_4 ?v7 ?v12) (pred_1 ?v9) 
                   (pred_9 ?v7) (pred_7 ?v2))
:effect (and  (pred_12 ?v7) (not (pred_9 ?v7))))


(:action op_2
:parameters (?v9 ?v5)
:precondition (and (pred_10 ?v9) (pred_10 ?v5)
               (pred_1 ?v9) (pred_8 ?v9 ?v5) (pred_12 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v9))))

(:action op_1
:parameters (?v9 ?v2)
:precondition (and (pred_10 ?v9) (pred_11 ?v2) 
                  (pred_1 ?v9) (pred_5 ?v2 ?v9) (pred_6 ))
:effect (and (pred_7 ?v2)
   (not (pred_5 ?v2 ?v9)) (not (pred_6 ))))


(:action op_4
:parameters (?v9 ?v8 ?v10)
:precondition (and (pred_10 ?v9) (pred_11 ?v8) (pred_11 ?v10)
                  (pred_1 ?v9) (pred_7 ?v10) (pred_5 ?v8 ?v9))
:effect (and (pred_7 ?v8) (pred_5 ?v10 ?v9)
        (not (pred_7 ?v10)) (not (pred_5 ?v8 ?v9))))

(:action op_5
:parameters (?v9 ?v2)
:precondition (and (pred_10 ?v9) (pred_11 ?v2) 
                  (pred_1 ?v9) (pred_7 ?v2))
:effect (and (pred_6 ) (pred_5 ?v2 ?v9) (not (pred_7 ?v2)))))


	
