(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v10 ?v5)
             (pred_1 ?v3 ?v6)
             (pred_6 ?v10 ?v6)
             (pred_2 ?v9 ?v10 )
	     (pred_12 ?v10)
             (pred_11 ?v2)
             (pred_5 ?v3)
             (pred_4 ?v6)
             (pred_3 ?v10)
             (pred_9 ?v3)
             (pred_8 ?v10)
             (pred_7 ))



(:action op_1
:parameters (?v4 ?v12 ?v11 ?v13)
:precondition (and (pred_11 ?v4) (pred_11 ?v12) (pred_5 ?v11) (pred_4 ?v13)
          (pred_10 ?v4 ?v12) (pred_1 ?v11 ?v13)
                   (pred_6 ?v12 ?v13) (pred_12 ?v4) 
                   (pred_3 ?v12) (pred_9 ?v11))
:effect (and  (pred_8 ?v12) (not (pred_3 ?v12))))


(:action op_5
:parameters (?v4 ?v7)
:precondition (and (pred_11 ?v4) (pred_11 ?v7)
               (pred_12 ?v4) (pred_10 ?v4 ?v7) (pred_8 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_11 ?v4) (pred_5 ?v11) 
                  (pred_12 ?v4) (pred_2 ?v11 ?v4) (pred_7 ))
:effect (and (pred_9 ?v11)
   (not (pred_2 ?v11 ?v4)) (not (pred_7 ))))


(:action op_3
:parameters (?v4 ?v1 ?v8)
:precondition (and (pred_11 ?v4) (pred_5 ?v1) (pred_5 ?v8)
                  (pred_12 ?v4) (pred_9 ?v8) (pred_2 ?v1 ?v4))
:effect (and (pred_9 ?v1) (pred_2 ?v8 ?v4)
        (not (pred_9 ?v8)) (not (pred_2 ?v1 ?v4))))

(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_11 ?v4) (pred_5 ?v11) 
                  (pred_12 ?v4) (pred_9 ?v11))
:effect (and (pred_7 ) (pred_2 ?v11 ?v4) (not (pred_9 ?v11)))))


	
