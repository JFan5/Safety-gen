(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v8 ?v5)
             (pred_6 ?v7 ?v11)
             (pred_7 ?v8 ?v11)
             (pred_3 ?v1 ?v8 )
	     (pred_1 ?v8)
             (pred_4 ?v6)
             (pred_8 ?v7)
             (pred_11 ?v11)
             (pred_2 ?v8)
             (pred_10 ?v7)
             (pred_5 ?v8)
             (pred_12 ))



(:action op_3
:parameters (?v4 ?v10 ?v13 ?v9)
:precondition (and (pred_4 ?v4) (pred_4 ?v10) (pred_8 ?v13) (pred_11 ?v9)
          (pred_9 ?v4 ?v10) (pred_6 ?v13 ?v9)
                   (pred_7 ?v10 ?v9) (pred_1 ?v4) 
                   (pred_2 ?v10) (pred_10 ?v13))
:effect (and  (pred_5 ?v10) (not (pred_2 ?v10))))


(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_4 ?v4) (pred_4 ?v2)
               (pred_1 ?v4) (pred_9 ?v4 ?v2) (pred_5 ?v2))
:effect (and (pred_1 ?v2) (not (pred_1 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_4 ?v4) (pred_8 ?v13) 
                  (pred_1 ?v4) (pred_3 ?v13 ?v4) (pred_12 ))
:effect (and (pred_10 ?v13)
   (not (pred_3 ?v13 ?v4)) (not (pred_12 ))))


(:action op_2
:parameters (?v4 ?v12 ?v3)
:precondition (and (pred_4 ?v4) (pred_8 ?v12) (pred_8 ?v3)
                  (pred_1 ?v4) (pred_10 ?v3) (pred_3 ?v12 ?v4))
:effect (and (pred_10 ?v12) (pred_3 ?v3 ?v4)
        (not (pred_10 ?v3)) (not (pred_3 ?v12 ?v4))))

(:action op_4
:parameters (?v4 ?v13)
:precondition (and (pred_4 ?v4) (pred_8 ?v13) 
                  (pred_1 ?v4) (pred_10 ?v13))
:effect (and (pred_12 ) (pred_3 ?v13 ?v4) (not (pred_10 ?v13)))))


	
