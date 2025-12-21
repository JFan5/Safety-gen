(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v4 ?v3)
             (pred_3 ?v13 ?v8)
             (pred_4 ?v4 ?v8)
             (pred_2 ?v1 ?v4 )
	     (pred_1 ?v4)
             (pred_12 ?v10)
             (pred_5 ?v13)
             (pred_10 ?v8)
             (pred_11 ?v4)
             (pred_9 ?v13)
             (pred_7 ?v4)
             (pred_6 ))



(:action op_5
:parameters (?v9 ?v7 ?v12 ?v6)
:precondition (and (pred_12 ?v9) (pred_12 ?v7) (pred_5 ?v12) (pred_10 ?v6)
          (pred_8 ?v9 ?v7) (pred_3 ?v12 ?v6)
                   (pred_4 ?v7 ?v6) (pred_1 ?v9) 
                   (pred_11 ?v7) (pred_9 ?v12))
:effect (and  (pred_7 ?v7) (not (pred_11 ?v7))))


(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_12 ?v9) (pred_12 ?v11)
               (pred_1 ?v9) (pred_8 ?v9 ?v11) (pred_7 ?v11))
:effect (and (pred_1 ?v11) (not (pred_1 ?v9))))

(:action op_3
:parameters (?v9 ?v12)
:precondition (and (pred_12 ?v9) (pred_5 ?v12) 
                  (pred_1 ?v9) (pred_2 ?v12 ?v9) (pred_6 ))
:effect (and (pred_9 ?v12)
   (not (pred_2 ?v12 ?v9)) (not (pred_6 ))))


(:action op_1
:parameters (?v9 ?v2 ?v5)
:precondition (and (pred_12 ?v9) (pred_5 ?v2) (pred_5 ?v5)
                  (pred_1 ?v9) (pred_9 ?v5) (pred_2 ?v2 ?v9))
:effect (and (pred_9 ?v2) (pred_2 ?v5 ?v9)
        (not (pred_9 ?v5)) (not (pred_2 ?v2 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_12 ?v9) (pred_5 ?v12) 
                  (pred_1 ?v9) (pred_9 ?v12))
:effect (and (pred_6 ) (pred_2 ?v12 ?v9) (not (pred_9 ?v12)))))


	
