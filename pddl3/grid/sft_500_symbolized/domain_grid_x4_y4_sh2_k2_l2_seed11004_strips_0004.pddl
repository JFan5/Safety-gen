(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v10 ?v5)
             (pred_6 ?v6 ?v9)
             (pred_3 ?v10 ?v9)
             (pred_10 ?v13 ?v10 )
	     (pred_11 ?v10)
             (pred_9 ?v2)
             (pred_12 ?v6)
             (pred_4 ?v9)
             (pred_5 ?v10)
             (pred_8 ?v6)
             (pred_2 ?v10)
             (pred_7 ))



(:action op_2
:parameters (?v4 ?v12 ?v11 ?v7)
:precondition (and (pred_9 ?v4) (pred_9 ?v12) (pred_12 ?v11) (pred_4 ?v7)
          (pred_1 ?v4 ?v12) (pred_6 ?v11 ?v7)
                   (pred_3 ?v12 ?v7) (pred_11 ?v4) 
                   (pred_5 ?v12) (pred_8 ?v11))
:effect (and  (pred_2 ?v12) (not (pred_5 ?v12))))


(:action op_1
:parameters (?v4 ?v1)
:precondition (and (pred_9 ?v4) (pred_9 ?v1)
               (pred_11 ?v4) (pred_1 ?v4 ?v1) (pred_2 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v4))))

(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_9 ?v4) (pred_12 ?v11) 
                  (pred_11 ?v4) (pred_10 ?v11 ?v4) (pred_7 ))
:effect (and (pred_8 ?v11)
   (not (pred_10 ?v11 ?v4)) (not (pred_7 ))))


(:action op_3
:parameters (?v4 ?v8 ?v3)
:precondition (and (pred_9 ?v4) (pred_12 ?v8) (pred_12 ?v3)
                  (pred_11 ?v4) (pred_8 ?v3) (pred_10 ?v8 ?v4))
:effect (and (pred_8 ?v8) (pred_10 ?v3 ?v4)
        (not (pred_8 ?v3)) (not (pred_10 ?v8 ?v4))))

(:action op_5
:parameters (?v4 ?v11)
:precondition (and (pred_9 ?v4) (pred_12 ?v11) 
                  (pred_11 ?v4) (pred_8 ?v11))
:effect (and (pred_7 ) (pred_10 ?v11 ?v4) (not (pred_8 ?v11)))))


	
