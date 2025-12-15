(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v3)
             (pred_6 ?v12 ?v2)
             (pred_2 ?v13 ?v2)
             (pred_10 ?v7 ?v13 )
	     (pred_3 ?v13)
             (pred_5 ?v6)
             (pred_9 ?v12)
             (pred_7 ?v2)
             (pred_1 ?v13)
             (pred_4 ?v12)
             (pred_8 ?v13)
             (pred_12 ))



(:action op_2
:parameters (?v4 ?v10 ?v9 ?v1)
:precondition (and (pred_5 ?v4) (pred_5 ?v10) (pred_9 ?v9) (pred_7 ?v1)
          (pred_11 ?v4 ?v10) (pred_6 ?v9 ?v1)
                   (pred_2 ?v10 ?v1) (pred_3 ?v4) 
                   (pred_1 ?v10) (pred_4 ?v9))
:effect (and  (pred_8 ?v10) (not (pred_1 ?v10))))


(:action op_5
:parameters (?v4 ?v11)
:precondition (and (pred_5 ?v4) (pred_5 ?v11)
               (pred_3 ?v4) (pred_11 ?v4 ?v11) (pred_8 ?v11))
:effect (and (pred_3 ?v11) (not (pred_3 ?v4))))

(:action op_3
:parameters (?v4 ?v9)
:precondition (and (pred_5 ?v4) (pred_9 ?v9) 
                  (pred_3 ?v4) (pred_10 ?v9 ?v4) (pred_12 ))
:effect (and (pred_4 ?v9)
   (not (pred_10 ?v9 ?v4)) (not (pred_12 ))))


(:action op_1
:parameters (?v4 ?v8 ?v5)
:precondition (and (pred_5 ?v4) (pred_9 ?v8) (pred_9 ?v5)
                  (pred_3 ?v4) (pred_4 ?v5) (pred_10 ?v8 ?v4))
:effect (and (pred_4 ?v8) (pred_10 ?v5 ?v4)
        (not (pred_4 ?v5)) (not (pred_10 ?v8 ?v4))))

(:action op_4
:parameters (?v4 ?v9)
:precondition (and (pred_5 ?v4) (pred_9 ?v9) 
                  (pred_3 ?v4) (pred_4 ?v9))
:effect (and (pred_12 ) (pred_10 ?v9 ?v4) (not (pred_4 ?v9)))))


	
