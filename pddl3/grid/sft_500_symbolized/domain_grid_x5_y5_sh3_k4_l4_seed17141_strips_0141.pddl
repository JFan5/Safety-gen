(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v1 ?v7)
             (pred_3 ?v10 ?v4)
             (pred_12 ?v1 ?v4)
             (pred_9 ?v12 ?v1 )
	     (pred_8 ?v1)
             (pred_10 ?v6)
             (pred_7 ?v10)
             (pred_2 ?v4)
             (pred_11 ?v1)
             (pred_1 ?v10)
             (pred_5 ?v1)
             (pred_6 ))



(:action op_2
:parameters (?v11 ?v9 ?v8 ?v13)
:precondition (and (pred_10 ?v11) (pred_10 ?v9) (pred_7 ?v8) (pred_2 ?v13)
          (pred_4 ?v11 ?v9) (pred_3 ?v8 ?v13)
                   (pred_12 ?v9 ?v13) (pred_8 ?v11) 
                   (pred_11 ?v9) (pred_1 ?v8))
:effect (and  (pred_5 ?v9) (not (pred_11 ?v9))))


(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_10 ?v11) (pred_10 ?v5)
               (pred_8 ?v11) (pred_4 ?v11 ?v5) (pred_5 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v11))))

(:action op_1
:parameters (?v11 ?v8)
:precondition (and (pred_10 ?v11) (pred_7 ?v8) 
                  (pred_8 ?v11) (pred_9 ?v8 ?v11) (pred_6 ))
:effect (and (pred_1 ?v8)
   (not (pred_9 ?v8 ?v11)) (not (pred_6 ))))


(:action op_5
:parameters (?v11 ?v2 ?v3)
:precondition (and (pred_10 ?v11) (pred_7 ?v2) (pred_7 ?v3)
                  (pred_8 ?v11) (pred_1 ?v3) (pred_9 ?v2 ?v11))
:effect (and (pred_1 ?v2) (pred_9 ?v3 ?v11)
        (not (pred_1 ?v3)) (not (pred_9 ?v2 ?v11))))

(:action op_4
:parameters (?v11 ?v8)
:precondition (and (pred_10 ?v11) (pred_7 ?v8) 
                  (pred_8 ?v11) (pred_1 ?v8))
:effect (and (pred_6 ) (pred_9 ?v8 ?v11) (not (pred_1 ?v8)))))


	
