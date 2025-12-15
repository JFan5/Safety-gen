(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v10 ?v8)
             (pred_10 ?v12 ?v9)
             (pred_2 ?v10 ?v9)
             (pred_5 ?v5 ?v10 )
	     (pred_8 ?v10)
             (pred_7 ?v1)
             (pred_11 ?v12)
             (pred_4 ?v9)
             (pred_1 ?v10)
             (pred_9 ?v12)
             (pred_3 ?v10)
             (pred_12 ))



(:action op_1
:parameters (?v4 ?v7 ?v13 ?v3)
:precondition (and (pred_7 ?v4) (pred_7 ?v7) (pred_11 ?v13) (pred_4 ?v3)
          (pred_6 ?v4 ?v7) (pred_10 ?v13 ?v3)
                   (pred_2 ?v7 ?v3) (pred_8 ?v4) 
                   (pred_1 ?v7) (pred_9 ?v13))
:effect (and  (pred_3 ?v7) (not (pred_1 ?v7))))


(:action op_2
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_7 ?v11)
               (pred_8 ?v4) (pred_6 ?v4 ?v11) (pred_3 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v4))))

(:action op_4
:parameters (?v4 ?v13)
:precondition (and (pred_7 ?v4) (pred_11 ?v13) 
                  (pred_8 ?v4) (pred_5 ?v13 ?v4) (pred_12 ))
:effect (and (pred_9 ?v13)
   (not (pred_5 ?v13 ?v4)) (not (pred_12 ))))


(:action op_3
:parameters (?v4 ?v6 ?v2)
:precondition (and (pred_7 ?v4) (pred_11 ?v6) (pred_11 ?v2)
                  (pred_8 ?v4) (pred_9 ?v2) (pred_5 ?v6 ?v4))
:effect (and (pred_9 ?v6) (pred_5 ?v2 ?v4)
        (not (pred_9 ?v2)) (not (pred_5 ?v6 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_7 ?v4) (pred_11 ?v13) 
                  (pred_8 ?v4) (pred_9 ?v13))
:effect (and (pred_12 ) (pred_5 ?v13 ?v4) (not (pred_9 ?v13)))))


	
