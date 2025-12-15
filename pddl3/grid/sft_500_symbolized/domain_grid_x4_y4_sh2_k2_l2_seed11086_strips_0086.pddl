(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v1)
             (pred_12 ?v10 ?v11)
             (pred_11 ?v5 ?v11)
             (pred_9 ?v8 ?v5 )
	     (pred_8 ?v5)
             (pred_1 ?v6)
             (pred_5 ?v10)
             (pred_7 ?v11)
             (pred_3 ?v5)
             (pred_4 ?v10)
             (pred_2 ?v5)
             (pred_10 ))



(:action op_4
:parameters (?v9 ?v12 ?v2 ?v13)
:precondition (and (pred_1 ?v9) (pred_1 ?v12) (pred_5 ?v2) (pred_7 ?v13)
          (pred_6 ?v9 ?v12) (pred_12 ?v2 ?v13)
                   (pred_11 ?v12 ?v13) (pred_8 ?v9) 
                   (pred_3 ?v12) (pred_4 ?v2))
:effect (and  (pred_2 ?v12) (not (pred_3 ?v12))))


(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_1 ?v9) (pred_1 ?v7)
               (pred_8 ?v9) (pred_6 ?v9 ?v7) (pred_2 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v9))))

(:action op_5
:parameters (?v9 ?v2)
:precondition (and (pred_1 ?v9) (pred_5 ?v2) 
                  (pred_8 ?v9) (pred_9 ?v2 ?v9) (pred_10 ))
:effect (and (pred_4 ?v2)
   (not (pred_9 ?v2 ?v9)) (not (pred_10 ))))


(:action op_2
:parameters (?v9 ?v3 ?v4)
:precondition (and (pred_1 ?v9) (pred_5 ?v3) (pred_5 ?v4)
                  (pred_8 ?v9) (pred_4 ?v4) (pred_9 ?v3 ?v9))
:effect (and (pred_4 ?v3) (pred_9 ?v4 ?v9)
        (not (pred_4 ?v4)) (not (pred_9 ?v3 ?v9))))

(:action op_1
:parameters (?v9 ?v2)
:precondition (and (pred_1 ?v9) (pred_5 ?v2) 
                  (pred_8 ?v9) (pred_4 ?v2))
:effect (and (pred_10 ) (pred_9 ?v2 ?v9) (not (pred_4 ?v2)))))


	
