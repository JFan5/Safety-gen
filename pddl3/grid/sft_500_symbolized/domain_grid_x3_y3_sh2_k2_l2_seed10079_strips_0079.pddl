(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v3)
             (pred_12 ?v1 ?v9)
             (pred_6 ?v7 ?v9)
             (pred_1 ?v8 ?v7 )
	     (pred_9 ?v7)
             (pred_8 ?v6)
             (pred_3 ?v1)
             (pred_10 ?v9)
             (pred_7 ?v7)
             (pred_11 ?v1)
             (pred_4 ?v7)
             (pred_2 ))



(:action op_5
:parameters (?v11 ?v5 ?v2 ?v12)
:precondition (and (pred_8 ?v11) (pred_8 ?v5) (pred_3 ?v2) (pred_10 ?v12)
          (pred_5 ?v11 ?v5) (pred_12 ?v2 ?v12)
                   (pred_6 ?v5 ?v12) (pred_9 ?v11) 
                   (pred_7 ?v5) (pred_11 ?v2))
:effect (and  (pred_4 ?v5) (not (pred_7 ?v5))))


(:action op_4
:parameters (?v11 ?v13)
:precondition (and (pred_8 ?v11) (pred_8 ?v13)
               (pred_9 ?v11) (pred_5 ?v11 ?v13) (pred_4 ?v13))
:effect (and (pred_9 ?v13) (not (pred_9 ?v11))))

(:action op_1
:parameters (?v11 ?v2)
:precondition (and (pred_8 ?v11) (pred_3 ?v2) 
                  (pred_9 ?v11) (pred_1 ?v2 ?v11) (pred_2 ))
:effect (and (pred_11 ?v2)
   (not (pred_1 ?v2 ?v11)) (not (pred_2 ))))


(:action op_2
:parameters (?v11 ?v10 ?v4)
:precondition (and (pred_8 ?v11) (pred_3 ?v10) (pred_3 ?v4)
                  (pred_9 ?v11) (pred_11 ?v4) (pred_1 ?v10 ?v11))
:effect (and (pred_11 ?v10) (pred_1 ?v4 ?v11)
        (not (pred_11 ?v4)) (not (pred_1 ?v10 ?v11))))

(:action op_3
:parameters (?v11 ?v2)
:precondition (and (pred_8 ?v11) (pred_3 ?v2) 
                  (pred_9 ?v11) (pred_11 ?v2))
:effect (and (pred_2 ) (pred_1 ?v2 ?v11) (not (pred_11 ?v2)))))


	
