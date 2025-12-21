(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v12 ?v7)
             (pred_4 ?v6 ?v3)
             (pred_1 ?v12 ?v3)
             (pred_2 ?v4 ?v12 )
	     (pred_10 ?v12)
             (pred_9 ?v1)
             (pred_7 ?v6)
             (pred_8 ?v3)
             (pred_3 ?v12)
             (pred_6 ?v6)
             (pred_5 ?v12)
             (pred_12 ))



(:action op_1
:parameters (?v11 ?v2 ?v5 ?v13)
:precondition (and (pred_9 ?v11) (pred_9 ?v2) (pred_7 ?v5) (pred_8 ?v13)
          (pred_11 ?v11 ?v2) (pred_4 ?v5 ?v13)
                   (pred_1 ?v2 ?v13) (pred_10 ?v11) 
                   (pred_3 ?v2) (pred_6 ?v5))
:effect (and  (pred_5 ?v2) (not (pred_3 ?v2))))


(:action op_3
:parameters (?v11 ?v9)
:precondition (and (pred_9 ?v11) (pred_9 ?v9)
               (pred_10 ?v11) (pred_11 ?v11 ?v9) (pred_5 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v11))))

(:action op_5
:parameters (?v11 ?v5)
:precondition (and (pred_9 ?v11) (pred_7 ?v5) 
                  (pred_10 ?v11) (pred_2 ?v5 ?v11) (pred_12 ))
:effect (and (pred_6 ?v5)
   (not (pred_2 ?v5 ?v11)) (not (pred_12 ))))


(:action op_4
:parameters (?v11 ?v8 ?v10)
:precondition (and (pred_9 ?v11) (pred_7 ?v8) (pred_7 ?v10)
                  (pred_10 ?v11) (pred_6 ?v10) (pred_2 ?v8 ?v11))
:effect (and (pred_6 ?v8) (pred_2 ?v10 ?v11)
        (not (pred_6 ?v10)) (not (pred_2 ?v8 ?v11))))

(:action op_2
:parameters (?v11 ?v5)
:precondition (and (pred_9 ?v11) (pred_7 ?v5) 
                  (pred_10 ?v11) (pred_6 ?v5))
:effect (and (pred_12 ) (pred_2 ?v5 ?v11) (not (pred_6 ?v5)))))


	
