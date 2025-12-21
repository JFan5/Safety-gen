(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v8)
             (pred_10 ?v3 ?v9)
             (pred_1 ?v12 ?v9)
             (pred_11 ?v6 ?v12 )
	     (pred_8 ?v12)
             (pred_5 ?v1)
             (pred_3 ?v3)
             (pred_7 ?v9)
             (pred_4 ?v12)
             (pred_9 ?v3)
             (pred_12 ?v12)
             (pred_2 ))



(:action op_5
:parameters (?v5 ?v2 ?v11 ?v10)
:precondition (and (pred_5 ?v5) (pred_5 ?v2) (pred_3 ?v11) (pred_7 ?v10)
          (pred_6 ?v5 ?v2) (pred_10 ?v11 ?v10)
                   (pred_1 ?v2 ?v10) (pred_8 ?v5) 
                   (pred_4 ?v2) (pred_9 ?v11))
:effect (and  (pred_12 ?v2) (not (pred_4 ?v2))))


(:action op_4
:parameters (?v5 ?v4)
:precondition (and (pred_5 ?v5) (pred_5 ?v4)
               (pred_8 ?v5) (pred_6 ?v5 ?v4) (pred_12 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v5))))

(:action op_2
:parameters (?v5 ?v11)
:precondition (and (pred_5 ?v5) (pred_3 ?v11) 
                  (pred_8 ?v5) (pred_11 ?v11 ?v5) (pred_2 ))
:effect (and (pred_9 ?v11)
   (not (pred_11 ?v11 ?v5)) (not (pred_2 ))))


(:action op_1
:parameters (?v5 ?v7 ?v13)
:precondition (and (pred_5 ?v5) (pred_3 ?v7) (pred_3 ?v13)
                  (pred_8 ?v5) (pred_9 ?v13) (pred_11 ?v7 ?v5))
:effect (and (pred_9 ?v7) (pred_11 ?v13 ?v5)
        (not (pred_9 ?v13)) (not (pred_11 ?v7 ?v5))))

(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_5 ?v5) (pred_3 ?v11) 
                  (pred_8 ?v5) (pred_9 ?v11))
:effect (and (pred_2 ) (pred_11 ?v11 ?v5) (not (pred_9 ?v11)))))


	
