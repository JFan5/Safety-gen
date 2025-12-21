(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v11 ?v8)
             (pred_8 ?v13 ?v10)
             (pred_6 ?v11 ?v10)
             (pred_5 ?v5 ?v11 )
	     (pred_7 ?v11)
             (pred_9 ?v12)
             (pred_1 ?v13)
             (pred_12 ?v10)
             (pred_3 ?v11)
             (pred_2 ?v13)
             (pred_11 ?v11)
             (pred_10 ))



(:action op_1
:parameters (?v9 ?v3 ?v7 ?v6)
:precondition (and (pred_9 ?v9) (pred_9 ?v3) (pred_1 ?v7) (pred_12 ?v6)
          (pred_4 ?v9 ?v3) (pred_8 ?v7 ?v6)
                   (pred_6 ?v3 ?v6) (pred_7 ?v9) 
                   (pred_3 ?v3) (pred_2 ?v7))
:effect (and  (pred_11 ?v3) (not (pred_3 ?v3))))


(:action op_4
:parameters (?v9 ?v2)
:precondition (and (pred_9 ?v9) (pred_9 ?v2)
               (pred_7 ?v9) (pred_4 ?v9 ?v2) (pred_11 ?v2))
:effect (and (pred_7 ?v2) (not (pred_7 ?v9))))

(:action op_2
:parameters (?v9 ?v7)
:precondition (and (pred_9 ?v9) (pred_1 ?v7) 
                  (pred_7 ?v9) (pred_5 ?v7 ?v9) (pred_10 ))
:effect (and (pred_2 ?v7)
   (not (pred_5 ?v7 ?v9)) (not (pred_10 ))))


(:action op_5
:parameters (?v9 ?v1 ?v4)
:precondition (and (pred_9 ?v9) (pred_1 ?v1) (pred_1 ?v4)
                  (pred_7 ?v9) (pred_2 ?v4) (pred_5 ?v1 ?v9))
:effect (and (pred_2 ?v1) (pred_5 ?v4 ?v9)
        (not (pred_2 ?v4)) (not (pred_5 ?v1 ?v9))))

(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_9 ?v9) (pred_1 ?v7) 
                  (pred_7 ?v9) (pred_2 ?v7))
:effect (and (pred_10 ) (pred_5 ?v7 ?v9) (not (pred_2 ?v7)))))


	
