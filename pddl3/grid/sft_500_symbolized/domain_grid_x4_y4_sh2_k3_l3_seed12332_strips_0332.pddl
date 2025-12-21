(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v9 ?v3)
             (pred_2 ?v12 ?v8)
             (pred_11 ?v9 ?v8)
             (pred_1 ?v6 ?v9 )
	     (pred_4 ?v9)
             (pred_7 ?v7)
             (pred_3 ?v12)
             (pred_6 ?v8)
             (pred_8 ?v9)
             (pred_9 ?v12)
             (pred_5 ?v9)
             (pred_10 ))



(:action op_1
:parameters (?v5 ?v10 ?v11 ?v2)
:precondition (and (pred_7 ?v5) (pred_7 ?v10) (pred_3 ?v11) (pred_6 ?v2)
          (pred_12 ?v5 ?v10) (pred_2 ?v11 ?v2)
                   (pred_11 ?v10 ?v2) (pred_4 ?v5) 
                   (pred_8 ?v10) (pred_9 ?v11))
:effect (and  (pred_5 ?v10) (not (pred_8 ?v10))))


(:action op_3
:parameters (?v5 ?v1)
:precondition (and (pred_7 ?v5) (pred_7 ?v1)
               (pred_4 ?v5) (pred_12 ?v5 ?v1) (pred_5 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v5))))

(:action op_5
:parameters (?v5 ?v11)
:precondition (and (pred_7 ?v5) (pred_3 ?v11) 
                  (pred_4 ?v5) (pred_1 ?v11 ?v5) (pred_10 ))
:effect (and (pred_9 ?v11)
   (not (pred_1 ?v11 ?v5)) (not (pred_10 ))))


(:action op_2
:parameters (?v5 ?v13 ?v4)
:precondition (and (pred_7 ?v5) (pred_3 ?v13) (pred_3 ?v4)
                  (pred_4 ?v5) (pred_9 ?v4) (pred_1 ?v13 ?v5))
:effect (and (pred_9 ?v13) (pred_1 ?v4 ?v5)
        (not (pred_9 ?v4)) (not (pred_1 ?v13 ?v5))))

(:action op_4
:parameters (?v5 ?v11)
:precondition (and (pred_7 ?v5) (pred_3 ?v11) 
                  (pred_4 ?v5) (pred_9 ?v11))
:effect (and (pred_10 ) (pred_1 ?v11 ?v5) (not (pred_9 ?v11)))))


	
