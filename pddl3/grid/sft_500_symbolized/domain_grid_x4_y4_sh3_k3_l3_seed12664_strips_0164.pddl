(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v12)
             (pred_7 ?v4 ?v2)
             (pred_4 ?v13 ?v2)
             (pred_11 ?v6 ?v13 )
	     (pred_2 ?v13)
             (pred_9 ?v9)
             (pred_12 ?v4)
             (pred_8 ?v2)
             (pred_10 ?v13)
             (pred_3 ?v4)
             (pred_1 ?v13)
             (pred_5 ))



(:action op_2
:parameters (?v11 ?v1 ?v10 ?v7)
:precondition (and (pred_9 ?v11) (pred_9 ?v1) (pred_12 ?v10) (pred_8 ?v7)
          (pred_6 ?v11 ?v1) (pred_7 ?v10 ?v7)
                   (pred_4 ?v1 ?v7) (pred_2 ?v11) 
                   (pred_10 ?v1) (pred_3 ?v10))
:effect (and  (pred_1 ?v1) (not (pred_10 ?v1))))


(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_9 ?v11) (pred_9 ?v3)
               (pred_2 ?v11) (pred_6 ?v11 ?v3) (pred_1 ?v3))
:effect (and (pred_2 ?v3) (not (pred_2 ?v11))))

(:action op_3
:parameters (?v11 ?v10)
:precondition (and (pred_9 ?v11) (pred_12 ?v10) 
                  (pred_2 ?v11) (pred_11 ?v10 ?v11) (pred_5 ))
:effect (and (pred_3 ?v10)
   (not (pred_11 ?v10 ?v11)) (not (pred_5 ))))


(:action op_5
:parameters (?v11 ?v5 ?v8)
:precondition (and (pred_9 ?v11) (pred_12 ?v5) (pred_12 ?v8)
                  (pred_2 ?v11) (pred_3 ?v8) (pred_11 ?v5 ?v11))
:effect (and (pred_3 ?v5) (pred_11 ?v8 ?v11)
        (not (pred_3 ?v8)) (not (pred_11 ?v5 ?v11))))

(:action op_1
:parameters (?v11 ?v10)
:precondition (and (pred_9 ?v11) (pred_12 ?v10) 
                  (pred_2 ?v11) (pred_3 ?v10))
:effect (and (pred_5 ) (pred_11 ?v10 ?v11) (not (pred_3 ?v10)))))


	
