(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v6)
             (pred_4 ?v13 ?v7)
             (pred_7 ?v5 ?v7)
             (pred_10 ?v12 ?v5 )
	     (pred_8 ?v5)
             (pred_9 ?v9)
             (pred_12 ?v13)
             (pred_1 ?v7)
             (pred_3 ?v5)
             (pred_2 ?v13)
             (pred_6 ?v5)
             (pred_5 ))



(:action op_5
:parameters (?v11 ?v8 ?v2 ?v4)
:precondition (and (pred_9 ?v11) (pred_9 ?v8) (pred_12 ?v2) (pred_1 ?v4)
          (pred_11 ?v11 ?v8) (pred_4 ?v2 ?v4)
                   (pred_7 ?v8 ?v4) (pred_8 ?v11) 
                   (pred_3 ?v8) (pred_2 ?v2))
:effect (and  (pred_6 ?v8) (not (pred_3 ?v8))))


(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_9 ?v11) (pred_9 ?v10)
               (pred_8 ?v11) (pred_11 ?v11 ?v10) (pred_6 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v11))))

(:action op_3
:parameters (?v11 ?v2)
:precondition (and (pred_9 ?v11) (pred_12 ?v2) 
                  (pred_8 ?v11) (pred_10 ?v2 ?v11) (pred_5 ))
:effect (and (pred_2 ?v2)
   (not (pred_10 ?v2 ?v11)) (not (pred_5 ))))


(:action op_4
:parameters (?v11 ?v1 ?v3)
:precondition (and (pred_9 ?v11) (pred_12 ?v1) (pred_12 ?v3)
                  (pred_8 ?v11) (pred_2 ?v3) (pred_10 ?v1 ?v11))
:effect (and (pred_2 ?v1) (pred_10 ?v3 ?v11)
        (not (pred_2 ?v3)) (not (pred_10 ?v1 ?v11))))

(:action op_2
:parameters (?v11 ?v2)
:precondition (and (pred_9 ?v11) (pred_12 ?v2) 
                  (pred_8 ?v11) (pred_2 ?v2))
:effect (and (pred_5 ) (pred_10 ?v2 ?v11) (not (pred_2 ?v2)))))


	
