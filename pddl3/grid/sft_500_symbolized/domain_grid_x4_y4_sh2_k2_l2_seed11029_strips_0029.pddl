(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v10 ?v3)
             (pred_9 ?v1 ?v12)
             (pred_12 ?v10 ?v12)
             (pred_6 ?v8 ?v10 )
	     (pred_5 ?v10)
             (pred_1 ?v11)
             (pred_8 ?v1)
             (pred_2 ?v12)
             (pred_4 ?v10)
             (pred_7 ?v1)
             (pred_10 ?v10)
             (pred_11 ))



(:action op_4
:parameters (?v2 ?v9 ?v4 ?v13)
:precondition (and (pred_1 ?v2) (pred_1 ?v9) (pred_8 ?v4) (pred_2 ?v13)
          (pred_3 ?v2 ?v9) (pred_9 ?v4 ?v13)
                   (pred_12 ?v9 ?v13) (pred_5 ?v2) 
                   (pred_4 ?v9) (pred_7 ?v4))
:effect (and  (pred_10 ?v9) (not (pred_4 ?v9))))


(:action op_1
:parameters (?v2 ?v7)
:precondition (and (pred_1 ?v2) (pred_1 ?v7)
               (pred_5 ?v2) (pred_3 ?v2 ?v7) (pred_10 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v2))))

(:action op_2
:parameters (?v2 ?v4)
:precondition (and (pred_1 ?v2) (pred_8 ?v4) 
                  (pred_5 ?v2) (pred_6 ?v4 ?v2) (pred_11 ))
:effect (and (pred_7 ?v4)
   (not (pred_6 ?v4 ?v2)) (not (pred_11 ))))


(:action op_3
:parameters (?v2 ?v6 ?v5)
:precondition (and (pred_1 ?v2) (pred_8 ?v6) (pred_8 ?v5)
                  (pred_5 ?v2) (pred_7 ?v5) (pred_6 ?v6 ?v2))
:effect (and (pred_7 ?v6) (pred_6 ?v5 ?v2)
        (not (pred_7 ?v5)) (not (pred_6 ?v6 ?v2))))

(:action op_5
:parameters (?v2 ?v4)
:precondition (and (pred_1 ?v2) (pred_8 ?v4) 
                  (pred_5 ?v2) (pred_7 ?v4))
:effect (and (pred_11 ) (pred_6 ?v4 ?v2) (not (pred_7 ?v4)))))


	
