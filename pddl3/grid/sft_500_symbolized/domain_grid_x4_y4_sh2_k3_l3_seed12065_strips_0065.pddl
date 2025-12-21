(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v13)
             (pred_4 ?v11 ?v1)
             (pred_1 ?v6 ?v1)
             (pred_9 ?v8 ?v6 )
	     (pred_11 ?v6)
             (pred_8 ?v10)
             (pred_5 ?v11)
             (pred_7 ?v1)
             (pred_12 ?v6)
             (pred_3 ?v11)
             (pred_2 ?v6)
             (pred_6 ))



(:action op_4
:parameters (?v9 ?v4 ?v7 ?v3)
:precondition (and (pred_8 ?v9) (pred_8 ?v4) (pred_5 ?v7) (pred_7 ?v3)
          (pred_10 ?v9 ?v4) (pred_4 ?v7 ?v3)
                   (pred_1 ?v4 ?v3) (pred_11 ?v9) 
                   (pred_12 ?v4) (pred_3 ?v7))
:effect (and  (pred_2 ?v4) (not (pred_12 ?v4))))


(:action op_3
:parameters (?v9 ?v12)
:precondition (and (pred_8 ?v9) (pred_8 ?v12)
               (pred_11 ?v9) (pred_10 ?v9 ?v12) (pred_2 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v9))))

(:action op_1
:parameters (?v9 ?v7)
:precondition (and (pred_8 ?v9) (pred_5 ?v7) 
                  (pred_11 ?v9) (pred_9 ?v7 ?v9) (pred_6 ))
:effect (and (pred_3 ?v7)
   (not (pred_9 ?v7 ?v9)) (not (pred_6 ))))


(:action op_2
:parameters (?v9 ?v2 ?v5)
:precondition (and (pred_8 ?v9) (pred_5 ?v2) (pred_5 ?v5)
                  (pred_11 ?v9) (pred_3 ?v5) (pred_9 ?v2 ?v9))
:effect (and (pred_3 ?v2) (pred_9 ?v5 ?v9)
        (not (pred_3 ?v5)) (not (pred_9 ?v2 ?v9))))

(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_8 ?v9) (pred_5 ?v7) 
                  (pred_11 ?v9) (pred_3 ?v7))
:effect (and (pred_6 ) (pred_9 ?v7 ?v9) (not (pred_3 ?v7)))))


	
