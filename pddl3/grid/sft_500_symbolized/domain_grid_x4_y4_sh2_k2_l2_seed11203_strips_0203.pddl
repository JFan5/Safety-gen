(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v13)
             (pred_4 ?v3 ?v11)
             (pred_10 ?v8 ?v11)
             (pred_5 ?v10 ?v8 )
	     (pred_1 ?v8)
             (pred_2 ?v5)
             (pred_9 ?v3)
             (pred_11 ?v11)
             (pred_3 ?v8)
             (pred_12 ?v3)
             (pred_7 ?v8)
             (pred_8 ))



(:action op_4
:parameters (?v4 ?v7 ?v2 ?v12)
:precondition (and (pred_2 ?v4) (pred_2 ?v7) (pred_9 ?v2) (pred_11 ?v12)
          (pred_6 ?v4 ?v7) (pred_4 ?v2 ?v12)
                   (pred_10 ?v7 ?v12) (pred_1 ?v4) 
                   (pred_3 ?v7) (pred_12 ?v2))
:effect (and  (pred_7 ?v7) (not (pred_3 ?v7))))


(:action op_2
:parameters (?v4 ?v9)
:precondition (and (pred_2 ?v4) (pred_2 ?v9)
               (pred_1 ?v4) (pred_6 ?v4 ?v9) (pred_7 ?v9))
:effect (and (pred_1 ?v9) (not (pred_1 ?v4))))

(:action op_3
:parameters (?v4 ?v2)
:precondition (and (pred_2 ?v4) (pred_9 ?v2) 
                  (pred_1 ?v4) (pred_5 ?v2 ?v4) (pred_8 ))
:effect (and (pred_12 ?v2)
   (not (pred_5 ?v2 ?v4)) (not (pred_8 ))))


(:action op_5
:parameters (?v4 ?v6 ?v1)
:precondition (and (pred_2 ?v4) (pred_9 ?v6) (pred_9 ?v1)
                  (pred_1 ?v4) (pred_12 ?v1) (pred_5 ?v6 ?v4))
:effect (and (pred_12 ?v6) (pred_5 ?v1 ?v4)
        (not (pred_12 ?v1)) (not (pred_5 ?v6 ?v4))))

(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_2 ?v4) (pred_9 ?v2) 
                  (pred_1 ?v4) (pred_12 ?v2))
:effect (and (pred_8 ) (pred_5 ?v2 ?v4) (not (pred_12 ?v2)))))


	
