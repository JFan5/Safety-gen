(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v6)
             (pred_8 ?v2 ?v7)
             (pred_1 ?v10 ?v7)
             (pred_12 ?v3 ?v10 )
	     (pred_4 ?v10)
             (pred_3 ?v8)
             (pred_5 ?v2)
             (pred_2 ?v7)
             (pred_9 ?v10)
             (pred_11 ?v2)
             (pred_7 ?v10)
             (pred_10 ))



(:action op_4
:parameters (?v4 ?v12 ?v11 ?v1)
:precondition (and (pred_3 ?v4) (pred_3 ?v12) (pred_5 ?v11) (pred_2 ?v1)
          (pred_6 ?v4 ?v12) (pred_8 ?v11 ?v1)
                   (pred_1 ?v12 ?v1) (pred_4 ?v4) 
                   (pred_9 ?v12) (pred_11 ?v11))
:effect (and  (pred_7 ?v12) (not (pred_9 ?v12))))


(:action op_3
:parameters (?v4 ?v9)
:precondition (and (pred_3 ?v4) (pred_3 ?v9)
               (pred_4 ?v4) (pred_6 ?v4 ?v9) (pred_7 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v4))))

(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_5 ?v11) 
                  (pred_4 ?v4) (pred_12 ?v11 ?v4) (pred_10 ))
:effect (and (pred_11 ?v11)
   (not (pred_12 ?v11 ?v4)) (not (pred_10 ))))


(:action op_1
:parameters (?v4 ?v5 ?v13)
:precondition (and (pred_3 ?v4) (pred_5 ?v5) (pred_5 ?v13)
                  (pred_4 ?v4) (pred_11 ?v13) (pred_12 ?v5 ?v4))
:effect (and (pred_11 ?v5) (pred_12 ?v13 ?v4)
        (not (pred_11 ?v13)) (not (pred_12 ?v5 ?v4))))

(:action op_5
:parameters (?v4 ?v11)
:precondition (and (pred_3 ?v4) (pred_5 ?v11) 
                  (pred_4 ?v4) (pred_11 ?v11))
:effect (and (pred_10 ) (pred_12 ?v11 ?v4) (not (pred_11 ?v11)))))


	
