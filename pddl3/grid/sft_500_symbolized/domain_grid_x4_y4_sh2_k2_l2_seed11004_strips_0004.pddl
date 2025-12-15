(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v10 ?v3)
             (pred_3 ?v11 ?v2)
             (pred_6 ?v10 ?v2)
             (pred_12 ?v9 ?v10 )
	     (pred_1 ?v10)
             (pred_5 ?v12)
             (pred_9 ?v11)
             (pred_10 ?v2)
             (pred_11 ?v10)
             (pred_8 ?v11)
             (pred_2 ?v10)
             (pred_4 ))



(:action op_2
:parameters (?v4 ?v6 ?v13 ?v8)
:precondition (and (pred_5 ?v4) (pred_5 ?v6) (pred_9 ?v13) (pred_10 ?v8)
          (pred_7 ?v4 ?v6) (pred_3 ?v13 ?v8)
                   (pred_6 ?v6 ?v8) (pred_1 ?v4) 
                   (pred_11 ?v6) (pred_8 ?v13))
:effect (and  (pred_2 ?v6) (not (pred_11 ?v6))))


(:action op_5
:parameters (?v4 ?v7)
:precondition (and (pred_5 ?v4) (pred_5 ?v7)
               (pred_1 ?v4) (pred_7 ?v4 ?v7) (pred_2 ?v7))
:effect (and (pred_1 ?v7) (not (pred_1 ?v4))))

(:action op_3
:parameters (?v4 ?v13)
:precondition (and (pred_5 ?v4) (pred_9 ?v13) 
                  (pred_1 ?v4) (pred_12 ?v13 ?v4) (pred_4 ))
:effect (and (pred_8 ?v13)
   (not (pred_12 ?v13 ?v4)) (not (pred_4 ))))


(:action op_4
:parameters (?v4 ?v5 ?v1)
:precondition (and (pred_5 ?v4) (pred_9 ?v5) (pred_9 ?v1)
                  (pred_1 ?v4) (pred_8 ?v1) (pred_12 ?v5 ?v4))
:effect (and (pred_8 ?v5) (pred_12 ?v1 ?v4)
        (not (pred_8 ?v1)) (not (pred_12 ?v5 ?v4))))

(:action op_1
:parameters (?v4 ?v13)
:precondition (and (pred_5 ?v4) (pred_9 ?v13) 
                  (pred_1 ?v4) (pred_8 ?v13))
:effect (and (pred_4 ) (pred_12 ?v13 ?v4) (not (pred_8 ?v13)))))


	
