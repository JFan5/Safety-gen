(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v3 ?v1)
             (pred_5 ?v8 ?v12)
             (pred_8 ?v3 ?v12)
             (pred_9 ?v11 ?v3 )
	     (pred_11 ?v3)
             (pred_6 ?v4)
             (pred_3 ?v8)
             (pred_1 ?v12)
             (pred_4 ?v3)
             (pred_12 ?v8)
             (pred_7 ?v3)
             (pred_2 ))



(:action op_2
:parameters (?v10 ?v2 ?v5 ?v7)
:precondition (and (pred_6 ?v10) (pred_6 ?v2) (pred_3 ?v5) (pred_1 ?v7)
          (pred_10 ?v10 ?v2) (pred_5 ?v5 ?v7)
                   (pred_8 ?v2 ?v7) (pred_11 ?v10) 
                   (pred_4 ?v2) (pred_12 ?v5))
:effect (and  (pred_7 ?v2) (not (pred_4 ?v2))))


(:action op_5
:parameters (?v10 ?v9)
:precondition (and (pred_6 ?v10) (pred_6 ?v9)
               (pred_11 ?v10) (pred_10 ?v10 ?v9) (pred_7 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v10))))

(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_6 ?v10) (pred_3 ?v5) 
                  (pred_11 ?v10) (pred_9 ?v5 ?v10) (pred_2 ))
:effect (and (pred_12 ?v5)
   (not (pred_9 ?v5 ?v10)) (not (pred_2 ))))


(:action op_1
:parameters (?v10 ?v13 ?v6)
:precondition (and (pred_6 ?v10) (pred_3 ?v13) (pred_3 ?v6)
                  (pred_11 ?v10) (pred_12 ?v6) (pred_9 ?v13 ?v10))
:effect (and (pred_12 ?v13) (pred_9 ?v6 ?v10)
        (not (pred_12 ?v6)) (not (pred_9 ?v13 ?v10))))

(:action op_3
:parameters (?v10 ?v5)
:precondition (and (pred_6 ?v10) (pred_3 ?v5) 
                  (pred_11 ?v10) (pred_12 ?v5))
:effect (and (pred_2 ) (pred_9 ?v5 ?v10) (not (pred_12 ?v5)))))


	
