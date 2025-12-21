(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v9)
             (pred_12 ?v6 ?v5)
             (pred_2 ?v12 ?v5)
             (pred_6 ?v3 ?v12 )
	     (pred_8 ?v12)
             (pred_9 ?v8)
             (pred_7 ?v6)
             (pred_4 ?v5)
             (pred_5 ?v12)
             (pred_10 ?v6)
             (pred_3 ?v12)
             (pred_11 ))



(:action op_4
:parameters (?v4 ?v1 ?v11 ?v2)
:precondition (and (pred_9 ?v4) (pred_9 ?v1) (pred_7 ?v11) (pred_4 ?v2)
          (pred_1 ?v4 ?v1) (pred_12 ?v11 ?v2)
                   (pred_2 ?v1 ?v2) (pred_8 ?v4) 
                   (pred_5 ?v1) (pred_10 ?v11))
:effect (and  (pred_3 ?v1) (not (pred_5 ?v1))))


(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_9 ?v4) (pred_9 ?v10)
               (pred_8 ?v4) (pred_1 ?v4 ?v10) (pred_3 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v4))))

(:action op_3
:parameters (?v4 ?v11)
:precondition (and (pred_9 ?v4) (pred_7 ?v11) 
                  (pred_8 ?v4) (pred_6 ?v11 ?v4) (pred_11 ))
:effect (and (pred_10 ?v11)
   (not (pred_6 ?v11 ?v4)) (not (pred_11 ))))


(:action op_2
:parameters (?v4 ?v7 ?v13)
:precondition (and (pred_9 ?v4) (pred_7 ?v7) (pred_7 ?v13)
                  (pred_8 ?v4) (pred_10 ?v13) (pred_6 ?v7 ?v4))
:effect (and (pred_10 ?v7) (pred_6 ?v13 ?v4)
        (not (pred_10 ?v13)) (not (pred_6 ?v7 ?v4))))

(:action op_1
:parameters (?v4 ?v11)
:precondition (and (pred_9 ?v4) (pred_7 ?v11) 
                  (pred_8 ?v4) (pred_10 ?v11))
:effect (and (pred_11 ) (pred_6 ?v11 ?v4) (not (pred_10 ?v11)))))


	
