(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v3)
             (pred_4 ?v4 ?v8)
             (pred_3 ?v13 ?v8)
             (pred_10 ?v5 ?v13 )
	     (pred_5 ?v13)
             (pred_12 ?v11)
             (pred_7 ?v4)
             (pred_1 ?v8)
             (pred_2 ?v13)
             (pred_11 ?v4)
             (pred_8 ?v13)
             (pred_9 ))



(:action op_2
:parameters (?v7 ?v9 ?v6 ?v12)
:precondition (and (pred_12 ?v7) (pred_12 ?v9) (pred_7 ?v6) (pred_1 ?v12)
          (pred_6 ?v7 ?v9) (pred_4 ?v6 ?v12)
                   (pred_3 ?v9 ?v12) (pred_5 ?v7) 
                   (pred_2 ?v9) (pred_11 ?v6))
:effect (and  (pred_8 ?v9) (not (pred_2 ?v9))))


(:action op_1
:parameters (?v7 ?v2)
:precondition (and (pred_12 ?v7) (pred_12 ?v2)
               (pred_5 ?v7) (pred_6 ?v7 ?v2) (pred_8 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v7))))

(:action op_3
:parameters (?v7 ?v6)
:precondition (and (pred_12 ?v7) (pred_7 ?v6) 
                  (pred_5 ?v7) (pred_10 ?v6 ?v7) (pred_9 ))
:effect (and (pred_11 ?v6)
   (not (pred_10 ?v6 ?v7)) (not (pred_9 ))))


(:action op_4
:parameters (?v7 ?v10 ?v1)
:precondition (and (pred_12 ?v7) (pred_7 ?v10) (pred_7 ?v1)
                  (pred_5 ?v7) (pred_11 ?v1) (pred_10 ?v10 ?v7))
:effect (and (pred_11 ?v10) (pred_10 ?v1 ?v7)
        (not (pred_11 ?v1)) (not (pred_10 ?v10 ?v7))))

(:action op_5
:parameters (?v7 ?v6)
:precondition (and (pred_12 ?v7) (pred_7 ?v6) 
                  (pred_5 ?v7) (pred_11 ?v6))
:effect (and (pred_9 ) (pred_10 ?v6 ?v7) (not (pred_11 ?v6)))))


	
