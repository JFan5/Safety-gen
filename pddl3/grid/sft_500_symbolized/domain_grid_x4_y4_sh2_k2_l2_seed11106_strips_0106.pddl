(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v13 ?v5)
             (pred_11 ?v9 ?v6)
             (pred_8 ?v13 ?v6)
             (pred_9 ?v12 ?v13 )
	     (pred_12 ?v13)
             (pred_1 ?v10)
             (pred_4 ?v9)
             (pred_6 ?v6)
             (pred_5 ?v13)
             (pred_2 ?v9)
             (pred_10 ?v13)
             (pred_7 ))



(:action op_2
:parameters (?v11 ?v1 ?v8 ?v3)
:precondition (and (pred_1 ?v11) (pred_1 ?v1) (pred_4 ?v8) (pred_6 ?v3)
          (pred_3 ?v11 ?v1) (pred_11 ?v8 ?v3)
                   (pred_8 ?v1 ?v3) (pred_12 ?v11) 
                   (pred_5 ?v1) (pred_2 ?v8))
:effect (and  (pred_10 ?v1) (not (pred_5 ?v1))))


(:action op_3
:parameters (?v11 ?v2)
:precondition (and (pred_1 ?v11) (pred_1 ?v2)
               (pred_12 ?v11) (pred_3 ?v11 ?v2) (pred_10 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v11))))

(:action op_4
:parameters (?v11 ?v8)
:precondition (and (pred_1 ?v11) (pred_4 ?v8) 
                  (pred_12 ?v11) (pred_9 ?v8 ?v11) (pred_7 ))
:effect (and (pred_2 ?v8)
   (not (pred_9 ?v8 ?v11)) (not (pred_7 ))))


(:action op_1
:parameters (?v11 ?v7 ?v4)
:precondition (and (pred_1 ?v11) (pred_4 ?v7) (pred_4 ?v4)
                  (pred_12 ?v11) (pred_2 ?v4) (pred_9 ?v7 ?v11))
:effect (and (pred_2 ?v7) (pred_9 ?v4 ?v11)
        (not (pred_2 ?v4)) (not (pred_9 ?v7 ?v11))))

(:action op_5
:parameters (?v11 ?v8)
:precondition (and (pred_1 ?v11) (pred_4 ?v8) 
                  (pred_12 ?v11) (pred_2 ?v8))
:effect (and (pred_7 ) (pred_9 ?v8 ?v11) (not (pred_2 ?v8)))))


	
