(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v1 ?v9)
             (pred_10 ?v7 ?v4)
             (pred_11 ?v1 ?v4)
             (pred_9 ?v12 ?v1 )
	     (pred_5 ?v1)
             (pred_12 ?v5)
             (pred_7 ?v7)
             (pred_1 ?v4)
             (pred_8 ?v1)
             (pred_6 ?v7)
             (pred_4 ?v1)
             (pred_2 ))



(:action op_2
:parameters (?v8 ?v11 ?v2 ?v13)
:precondition (and (pred_12 ?v8) (pred_12 ?v11) (pred_7 ?v2) (pred_1 ?v13)
          (pred_3 ?v8 ?v11) (pred_10 ?v2 ?v13)
                   (pred_11 ?v11 ?v13) (pred_5 ?v8) 
                   (pred_8 ?v11) (pred_6 ?v2))
:effect (and  (pred_4 ?v11) (not (pred_8 ?v11))))


(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_12 ?v8) (pred_12 ?v3)
               (pred_5 ?v8) (pred_3 ?v8 ?v3) (pred_4 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v8))))

(:action op_3
:parameters (?v8 ?v2)
:precondition (and (pred_12 ?v8) (pred_7 ?v2) 
                  (pred_5 ?v8) (pred_9 ?v2 ?v8) (pred_2 ))
:effect (and (pred_6 ?v2)
   (not (pred_9 ?v2 ?v8)) (not (pred_2 ))))


(:action op_1
:parameters (?v8 ?v10 ?v6)
:precondition (and (pred_12 ?v8) (pred_7 ?v10) (pred_7 ?v6)
                  (pred_5 ?v8) (pred_6 ?v6) (pred_9 ?v10 ?v8))
:effect (and (pred_6 ?v10) (pred_9 ?v6 ?v8)
        (not (pred_6 ?v6)) (not (pred_9 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v2)
:precondition (and (pred_12 ?v8) (pred_7 ?v2) 
                  (pred_5 ?v8) (pred_6 ?v2))
:effect (and (pred_2 ) (pred_9 ?v2 ?v8) (not (pred_6 ?v2)))))


	
