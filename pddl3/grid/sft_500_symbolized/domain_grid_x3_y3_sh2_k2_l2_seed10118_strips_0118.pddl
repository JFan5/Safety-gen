(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v10 ?v8)
             (pred_11 ?v2 ?v6)
             (pred_4 ?v10 ?v6)
             (pred_8 ?v9 ?v10 )
	     (pred_5 ?v10)
             (pred_9 ?v12)
             (pred_10 ?v2)
             (pred_2 ?v6)
             (pred_3 ?v10)
             (pred_6 ?v2)
             (pred_7 ?v10)
             (pred_1 ))



(:action op_4
:parameters (?v4 ?v1 ?v13 ?v3)
:precondition (and (pred_9 ?v4) (pred_9 ?v1) (pred_10 ?v13) (pred_2 ?v3)
          (pred_12 ?v4 ?v1) (pred_11 ?v13 ?v3)
                   (pred_4 ?v1 ?v3) (pred_5 ?v4) 
                   (pred_3 ?v1) (pred_6 ?v13))
:effect (and  (pred_7 ?v1) (not (pred_3 ?v1))))


(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_9 ?v4) (pred_9 ?v5)
               (pred_5 ?v4) (pred_12 ?v4 ?v5) (pred_7 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v4))))

(:action op_1
:parameters (?v4 ?v13)
:precondition (and (pred_9 ?v4) (pred_10 ?v13) 
                  (pred_5 ?v4) (pred_8 ?v13 ?v4) (pred_1 ))
:effect (and (pred_6 ?v13)
   (not (pred_8 ?v13 ?v4)) (not (pred_1 ))))


(:action op_2
:parameters (?v4 ?v7 ?v11)
:precondition (and (pred_9 ?v4) (pred_10 ?v7) (pred_10 ?v11)
                  (pred_5 ?v4) (pred_6 ?v11) (pred_8 ?v7 ?v4))
:effect (and (pred_6 ?v7) (pred_8 ?v11 ?v4)
        (not (pred_6 ?v11)) (not (pred_8 ?v7 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_9 ?v4) (pred_10 ?v13) 
                  (pred_5 ?v4) (pred_6 ?v13))
:effect (and (pred_1 ) (pred_8 ?v13 ?v4) (not (pred_6 ?v13)))))


	
