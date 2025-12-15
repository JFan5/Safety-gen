(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v11)
             (pred_12 ?v6 ?v9)
             (pred_11 ?v5 ?v9)
             (pred_3 ?v12 ?v5 )
	     (pred_4 ?v5)
             (pred_1 ?v2)
             (pred_6 ?v6)
             (pred_5 ?v9)
             (pred_2 ?v5)
             (pred_9 ?v6)
             (pred_8 ?v5)
             (pred_10 ))



(:action op_3
:parameters (?v4 ?v1 ?v13 ?v8)
:precondition (and (pred_1 ?v4) (pred_1 ?v1) (pred_6 ?v13) (pred_5 ?v8)
          (pred_7 ?v4 ?v1) (pred_12 ?v13 ?v8)
                   (pred_11 ?v1 ?v8) (pred_4 ?v4) 
                   (pred_2 ?v1) (pred_9 ?v13))
:effect (and  (pred_8 ?v1) (not (pred_2 ?v1))))


(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_1 ?v4) (pred_1 ?v3)
               (pred_4 ?v4) (pred_7 ?v4 ?v3) (pred_8 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v4))))

(:action op_2
:parameters (?v4 ?v13)
:precondition (and (pred_1 ?v4) (pred_6 ?v13) 
                  (pred_4 ?v4) (pred_3 ?v13 ?v4) (pred_10 ))
:effect (and (pred_9 ?v13)
   (not (pred_3 ?v13 ?v4)) (not (pred_10 ))))


(:action op_1
:parameters (?v4 ?v7 ?v10)
:precondition (and (pred_1 ?v4) (pred_6 ?v7) (pred_6 ?v10)
                  (pred_4 ?v4) (pred_9 ?v10) (pred_3 ?v7 ?v4))
:effect (and (pred_9 ?v7) (pred_3 ?v10 ?v4)
        (not (pred_9 ?v10)) (not (pred_3 ?v7 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_1 ?v4) (pred_6 ?v13) 
                  (pred_4 ?v4) (pred_9 ?v13))
:effect (and (pred_10 ) (pred_3 ?v13 ?v4) (not (pred_9 ?v13)))))


	
