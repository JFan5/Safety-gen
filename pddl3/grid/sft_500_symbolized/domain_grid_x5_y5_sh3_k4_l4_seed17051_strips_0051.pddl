(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v10)
             (pred_8 ?v11 ?v2)
             (pred_7 ?v3 ?v2)
             (pred_12 ?v8 ?v3 )
	     (pred_3 ?v3)
             (pred_6 ?v9)
             (pred_10 ?v11)
             (pred_2 ?v2)
             (pred_5 ?v3)
             (pred_11 ?v11)
             (pred_1 ?v3)
             (pred_4 ))



(:action op_2
:parameters (?v5 ?v4 ?v13 ?v1)
:precondition (and (pred_6 ?v5) (pred_6 ?v4) (pred_10 ?v13) (pred_2 ?v1)
          (pred_9 ?v5 ?v4) (pred_8 ?v13 ?v1)
                   (pred_7 ?v4 ?v1) (pred_3 ?v5) 
                   (pred_5 ?v4) (pred_11 ?v13))
:effect (and  (pred_1 ?v4) (not (pred_5 ?v4))))


(:action op_5
:parameters (?v5 ?v7)
:precondition (and (pred_6 ?v5) (pred_6 ?v7)
               (pred_3 ?v5) (pred_9 ?v5 ?v7) (pred_1 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v5))))

(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_6 ?v5) (pred_10 ?v13) 
                  (pred_3 ?v5) (pred_12 ?v13 ?v5) (pred_4 ))
:effect (and (pred_11 ?v13)
   (not (pred_12 ?v13 ?v5)) (not (pred_4 ))))


(:action op_4
:parameters (?v5 ?v12 ?v6)
:precondition (and (pred_6 ?v5) (pred_10 ?v12) (pred_10 ?v6)
                  (pred_3 ?v5) (pred_11 ?v6) (pred_12 ?v12 ?v5))
:effect (and (pred_11 ?v12) (pred_12 ?v6 ?v5)
        (not (pred_11 ?v6)) (not (pred_12 ?v12 ?v5))))

(:action op_3
:parameters (?v5 ?v13)
:precondition (and (pred_6 ?v5) (pred_10 ?v13) 
                  (pred_3 ?v5) (pred_11 ?v13))
:effect (and (pred_4 ) (pred_12 ?v13 ?v5) (not (pred_11 ?v13)))))


	
