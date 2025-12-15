(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v2 ?v1)
             (pred_6 ?v3 ?v10)
             (pred_4 ?v2 ?v10)
             (pred_12 ?v13 ?v2 )
	     (pred_1 ?v2)
             (pred_10 ?v6)
             (pred_5 ?v3)
             (pred_11 ?v10)
             (pred_2 ?v2)
             (pred_3 ?v3)
             (pred_9 ?v2)
             (pred_7 ))



(:action op_4
:parameters (?v4 ?v7 ?v12 ?v11)
:precondition (and (pred_10 ?v4) (pred_10 ?v7) (pred_5 ?v12) (pred_11 ?v11)
          (pred_8 ?v4 ?v7) (pred_6 ?v12 ?v11)
                   (pred_4 ?v7 ?v11) (pred_1 ?v4) 
                   (pred_2 ?v7) (pred_3 ?v12))
:effect (and  (pred_9 ?v7) (not (pred_2 ?v7))))


(:action op_5
:parameters (?v4 ?v5)
:precondition (and (pred_10 ?v4) (pred_10 ?v5)
               (pred_1 ?v4) (pred_8 ?v4 ?v5) (pred_9 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v4))))

(:action op_1
:parameters (?v4 ?v12)
:precondition (and (pred_10 ?v4) (pred_5 ?v12) 
                  (pred_1 ?v4) (pred_12 ?v12 ?v4) (pred_7 ))
:effect (and (pred_3 ?v12)
   (not (pred_12 ?v12 ?v4)) (not (pred_7 ))))


(:action op_3
:parameters (?v4 ?v9 ?v8)
:precondition (and (pred_10 ?v4) (pred_5 ?v9) (pred_5 ?v8)
                  (pred_1 ?v4) (pred_3 ?v8) (pred_12 ?v9 ?v4))
:effect (and (pred_3 ?v9) (pred_12 ?v8 ?v4)
        (not (pred_3 ?v8)) (not (pred_12 ?v9 ?v4))))

(:action op_2
:parameters (?v4 ?v12)
:precondition (and (pred_10 ?v4) (pred_5 ?v12) 
                  (pred_1 ?v4) (pred_3 ?v12))
:effect (and (pred_7 ) (pred_12 ?v12 ?v4) (not (pred_3 ?v12)))))


	
