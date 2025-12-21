(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v1 ?v3)
             (pred_3 ?v12 ?v4)
             (pred_1 ?v1 ?v4)
             (pred_5 ?v7 ?v1 )
	     (pred_8 ?v1)
             (pred_4 ?v6)
             (pred_2 ?v12)
             (pred_7 ?v4)
             (pred_10 ?v1)
             (pred_9 ?v12)
             (pred_12 ?v1)
             (pred_6 ))



(:action op_3
:parameters (?v5 ?v10 ?v9 ?v13)
:precondition (and (pred_4 ?v5) (pred_4 ?v10) (pred_2 ?v9) (pred_7 ?v13)
          (pred_11 ?v5 ?v10) (pred_3 ?v9 ?v13)
                   (pred_1 ?v10 ?v13) (pred_8 ?v5) 
                   (pred_10 ?v10) (pred_9 ?v9))
:effect (and  (pred_12 ?v10) (not (pred_10 ?v10))))


(:action op_1
:parameters (?v5 ?v8)
:precondition (and (pred_4 ?v5) (pred_4 ?v8)
               (pred_8 ?v5) (pred_11 ?v5 ?v8) (pred_12 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v5))))

(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_4 ?v5) (pred_2 ?v9) 
                  (pred_8 ?v5) (pred_5 ?v9 ?v5) (pred_6 ))
:effect (and (pred_9 ?v9)
   (not (pred_5 ?v9 ?v5)) (not (pred_6 ))))


(:action op_5
:parameters (?v5 ?v11 ?v2)
:precondition (and (pred_4 ?v5) (pred_2 ?v11) (pred_2 ?v2)
                  (pred_8 ?v5) (pred_9 ?v2) (pred_5 ?v11 ?v5))
:effect (and (pred_9 ?v11) (pred_5 ?v2 ?v5)
        (not (pred_9 ?v2)) (not (pred_5 ?v11 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_4 ?v5) (pred_2 ?v9) 
                  (pred_8 ?v5) (pred_9 ?v9))
:effect (and (pred_6 ) (pred_5 ?v9 ?v5) (not (pred_9 ?v9)))))


	
