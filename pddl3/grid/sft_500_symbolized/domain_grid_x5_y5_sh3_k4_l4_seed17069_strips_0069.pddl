(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v5)
             (pred_10 ?v10 ?v3)
             (pred_7 ?v8 ?v3)
             (pred_2 ?v6 ?v8 )
	     (pred_9 ?v8)
             (pred_6 ?v7)
             (pred_12 ?v10)
             (pred_4 ?v3)
             (pred_3 ?v8)
             (pred_5 ?v10)
             (pred_11 ?v8)
             (pred_8 ))



(:action op_4
:parameters (?v2 ?v11 ?v4 ?v1)
:precondition (and (pred_6 ?v2) (pred_6 ?v11) (pred_12 ?v4) (pred_4 ?v1)
          (pred_1 ?v2 ?v11) (pred_10 ?v4 ?v1)
                   (pred_7 ?v11 ?v1) (pred_9 ?v2) 
                   (pred_3 ?v11) (pred_5 ?v4))
:effect (and  (pred_11 ?v11) (not (pred_3 ?v11))))


(:action op_5
:parameters (?v2 ?v9)
:precondition (and (pred_6 ?v2) (pred_6 ?v9)
               (pred_9 ?v2) (pred_1 ?v2 ?v9) (pred_11 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v2))))

(:action op_3
:parameters (?v2 ?v4)
:precondition (and (pred_6 ?v2) (pred_12 ?v4) 
                  (pred_9 ?v2) (pred_2 ?v4 ?v2) (pred_8 ))
:effect (and (pred_5 ?v4)
   (not (pred_2 ?v4 ?v2)) (not (pred_8 ))))


(:action op_2
:parameters (?v2 ?v12 ?v13)
:precondition (and (pred_6 ?v2) (pred_12 ?v12) (pred_12 ?v13)
                  (pred_9 ?v2) (pred_5 ?v13) (pred_2 ?v12 ?v2))
:effect (and (pred_5 ?v12) (pred_2 ?v13 ?v2)
        (not (pred_5 ?v13)) (not (pred_2 ?v12 ?v2))))

(:action op_1
:parameters (?v2 ?v4)
:precondition (and (pred_6 ?v2) (pred_12 ?v4) 
                  (pred_9 ?v2) (pred_5 ?v4))
:effect (and (pred_8 ) (pred_2 ?v4 ?v2) (not (pred_5 ?v4)))))


	
