(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v1)
             (pred_12 ?v6 ?v7)
             (pred_5 ?v8 ?v7)
             (pred_11 ?v13 ?v8 )
	     (pred_9 ?v8)
             (pred_1 ?v3)
             (pred_6 ?v6)
             (pred_8 ?v7)
             (pred_10 ?v8)
             (pred_2 ?v6)
             (pred_4 ?v8)
             (pred_3 ))



(:action op_4
:parameters (?v5 ?v12 ?v10 ?v4)
:precondition (and (pred_1 ?v5) (pred_1 ?v12) (pred_6 ?v10) (pred_8 ?v4)
          (pred_7 ?v5 ?v12) (pred_12 ?v10 ?v4)
                   (pred_5 ?v12 ?v4) (pred_9 ?v5) 
                   (pred_10 ?v12) (pred_2 ?v10))
:effect (and  (pred_4 ?v12) (not (pred_10 ?v12))))


(:action op_3
:parameters (?v5 ?v9)
:precondition (and (pred_1 ?v5) (pred_1 ?v9)
               (pred_9 ?v5) (pred_7 ?v5 ?v9) (pred_4 ?v9))
:effect (and (pred_9 ?v9) (not (pred_9 ?v5))))

(:action op_5
:parameters (?v5 ?v10)
:precondition (and (pred_1 ?v5) (pred_6 ?v10) 
                  (pred_9 ?v5) (pred_11 ?v10 ?v5) (pred_3 ))
:effect (and (pred_2 ?v10)
   (not (pred_11 ?v10 ?v5)) (not (pred_3 ))))


(:action op_2
:parameters (?v5 ?v11 ?v2)
:precondition (and (pred_1 ?v5) (pred_6 ?v11) (pred_6 ?v2)
                  (pred_9 ?v5) (pred_2 ?v2) (pred_11 ?v11 ?v5))
:effect (and (pred_2 ?v11) (pred_11 ?v2 ?v5)
        (not (pred_2 ?v2)) (not (pred_11 ?v11 ?v5))))

(:action op_1
:parameters (?v5 ?v10)
:precondition (and (pred_1 ?v5) (pred_6 ?v10) 
                  (pred_9 ?v5) (pred_2 ?v10))
:effect (and (pred_3 ) (pred_11 ?v10 ?v5) (not (pred_2 ?v10)))))


	
