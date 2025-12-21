(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v12)
             (pred_3 ?v5 ?v1)
             (pred_6 ?v10 ?v1)
             (pred_11 ?v8 ?v10 )
	     (pred_9 ?v10)
             (pred_1 ?v11)
             (pred_7 ?v5)
             (pred_2 ?v1)
             (pred_10 ?v10)
             (pred_4 ?v5)
             (pred_8 ?v10)
             (pred_5 ))



(:action op_3
:parameters (?v4 ?v6 ?v7 ?v13)
:precondition (and (pred_1 ?v4) (pred_1 ?v6) (pred_7 ?v7) (pred_2 ?v13)
          (pred_12 ?v4 ?v6) (pred_3 ?v7 ?v13)
                   (pred_6 ?v6 ?v13) (pred_9 ?v4) 
                   (pred_10 ?v6) (pred_4 ?v7))
:effect (and  (pred_8 ?v6) (not (pred_10 ?v6))))


(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_1 ?v4) (pred_1 ?v3)
               (pred_9 ?v4) (pred_12 ?v4 ?v3) (pred_8 ?v3))
:effect (and (pred_9 ?v3) (not (pred_9 ?v4))))

(:action op_4
:parameters (?v4 ?v7)
:precondition (and (pred_1 ?v4) (pred_7 ?v7) 
                  (pred_9 ?v4) (pred_11 ?v7 ?v4) (pred_5 ))
:effect (and (pred_4 ?v7)
   (not (pred_11 ?v7 ?v4)) (not (pred_5 ))))


(:action op_2
:parameters (?v4 ?v9 ?v2)
:precondition (and (pred_1 ?v4) (pred_7 ?v9) (pred_7 ?v2)
                  (pred_9 ?v4) (pred_4 ?v2) (pred_11 ?v9 ?v4))
:effect (and (pred_4 ?v9) (pred_11 ?v2 ?v4)
        (not (pred_4 ?v2)) (not (pred_11 ?v9 ?v4))))

(:action op_1
:parameters (?v4 ?v7)
:precondition (and (pred_1 ?v4) (pred_7 ?v7) 
                  (pred_9 ?v4) (pred_4 ?v7))
:effect (and (pred_5 ) (pred_11 ?v7 ?v4) (not (pred_4 ?v7)))))


	
