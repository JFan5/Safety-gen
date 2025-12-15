(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v13 ?v8)
             (pred_6 ?v1 ?v5)
             (pred_5 ?v13 ?v5)
             (pred_9 ?v4 ?v13 )
	     (pred_2 ?v13)
             (pred_12 ?v3)
             (pred_1 ?v1)
             (pred_3 ?v5)
             (pred_7 ?v13)
             (pred_10 ?v1)
             (pred_4 ?v13)
             (pred_11 ))



(:action op_1
:parameters (?v6 ?v2 ?v12 ?v11)
:precondition (and (pred_12 ?v6) (pred_12 ?v2) (pred_1 ?v12) (pred_3 ?v11)
          (pred_8 ?v6 ?v2) (pred_6 ?v12 ?v11)
                   (pred_5 ?v2 ?v11) (pred_2 ?v6) 
                   (pred_7 ?v2) (pred_10 ?v12))
:effect (and  (pred_4 ?v2) (not (pred_7 ?v2))))


(:action op_5
:parameters (?v6 ?v7)
:precondition (and (pred_12 ?v6) (pred_12 ?v7)
               (pred_2 ?v6) (pred_8 ?v6 ?v7) (pred_4 ?v7))
:effect (and (pred_2 ?v7) (not (pred_2 ?v6))))

(:action op_3
:parameters (?v6 ?v12)
:precondition (and (pred_12 ?v6) (pred_1 ?v12) 
                  (pred_2 ?v6) (pred_9 ?v12 ?v6) (pred_11 ))
:effect (and (pred_10 ?v12)
   (not (pred_9 ?v12 ?v6)) (not (pred_11 ))))


(:action op_2
:parameters (?v6 ?v10 ?v9)
:precondition (and (pred_12 ?v6) (pred_1 ?v10) (pred_1 ?v9)
                  (pred_2 ?v6) (pred_10 ?v9) (pred_9 ?v10 ?v6))
:effect (and (pred_10 ?v10) (pred_9 ?v9 ?v6)
        (not (pred_10 ?v9)) (not (pred_9 ?v10 ?v6))))

(:action op_4
:parameters (?v6 ?v12)
:precondition (and (pred_12 ?v6) (pred_1 ?v12) 
                  (pred_2 ?v6) (pred_10 ?v12))
:effect (and (pred_11 ) (pred_9 ?v12 ?v6) (not (pred_10 ?v12)))))


	
