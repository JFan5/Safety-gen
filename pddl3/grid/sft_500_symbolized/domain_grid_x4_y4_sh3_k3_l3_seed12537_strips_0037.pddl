(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v11)
             (pred_10 ?v9 ?v12)
             (pred_8 ?v2 ?v12)
             (pred_9 ?v6 ?v2 )
	     (pred_12 ?v2)
             (pred_11 ?v4)
             (pred_1 ?v9)
             (pred_4 ?v12)
             (pred_2 ?v2)
             (pred_6 ?v9)
             (pred_5 ?v2)
             (pred_3 ))



(:action op_5
:parameters (?v5 ?v10 ?v7 ?v3)
:precondition (and (pred_11 ?v5) (pred_11 ?v10) (pred_1 ?v7) (pred_4 ?v3)
          (pred_7 ?v5 ?v10) (pred_10 ?v7 ?v3)
                   (pred_8 ?v10 ?v3) (pred_12 ?v5) 
                   (pred_2 ?v10) (pred_6 ?v7))
:effect (and  (pred_5 ?v10) (not (pred_2 ?v10))))


(:action op_4
:parameters (?v5 ?v13)
:precondition (and (pred_11 ?v5) (pred_11 ?v13)
               (pred_12 ?v5) (pred_7 ?v5 ?v13) (pred_5 ?v13))
:effect (and (pred_12 ?v13) (not (pred_12 ?v5))))

(:action op_3
:parameters (?v5 ?v7)
:precondition (and (pred_11 ?v5) (pred_1 ?v7) 
                  (pred_12 ?v5) (pred_9 ?v7 ?v5) (pred_3 ))
:effect (and (pred_6 ?v7)
   (not (pred_9 ?v7 ?v5)) (not (pred_3 ))))


(:action op_1
:parameters (?v5 ?v1 ?v8)
:precondition (and (pred_11 ?v5) (pred_1 ?v1) (pred_1 ?v8)
                  (pred_12 ?v5) (pred_6 ?v8) (pred_9 ?v1 ?v5))
:effect (and (pred_6 ?v1) (pred_9 ?v8 ?v5)
        (not (pred_6 ?v8)) (not (pred_9 ?v1 ?v5))))

(:action op_2
:parameters (?v5 ?v7)
:precondition (and (pred_11 ?v5) (pred_1 ?v7) 
                  (pred_12 ?v5) (pred_6 ?v7))
:effect (and (pred_3 ) (pred_9 ?v7 ?v5) (not (pred_6 ?v7)))))


	
