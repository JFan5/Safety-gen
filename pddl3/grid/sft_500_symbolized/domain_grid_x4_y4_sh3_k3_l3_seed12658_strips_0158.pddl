(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v2)
             (pred_12 ?v6 ?v13)
             (pred_6 ?v9 ?v13)
             (pred_9 ?v8 ?v9 )
	     (pred_11 ?v9)
             (pred_8 ?v7)
             (pred_5 ?v6)
             (pred_10 ?v13)
             (pred_2 ?v9)
             (pred_7 ?v6)
             (pred_4 ?v9)
             (pred_3 ))



(:action op_4
:parameters (?v5 ?v11 ?v10 ?v3)
:precondition (and (pred_8 ?v5) (pred_8 ?v11) (pred_5 ?v10) (pred_10 ?v3)
          (pred_1 ?v5 ?v11) (pred_12 ?v10 ?v3)
                   (pred_6 ?v11 ?v3) (pred_11 ?v5) 
                   (pred_2 ?v11) (pred_7 ?v10))
:effect (and  (pred_4 ?v11) (not (pred_2 ?v11))))


(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_8 ?v5) (pred_8 ?v1)
               (pred_11 ?v5) (pred_1 ?v5 ?v1) (pred_4 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v5))))

(:action op_2
:parameters (?v5 ?v10)
:precondition (and (pred_8 ?v5) (pred_5 ?v10) 
                  (pred_11 ?v5) (pred_9 ?v10 ?v5) (pred_3 ))
:effect (and (pred_7 ?v10)
   (not (pred_9 ?v10 ?v5)) (not (pred_3 ))))


(:action op_3
:parameters (?v5 ?v12 ?v4)
:precondition (and (pred_8 ?v5) (pred_5 ?v12) (pred_5 ?v4)
                  (pred_11 ?v5) (pred_7 ?v4) (pred_9 ?v12 ?v5))
:effect (and (pred_7 ?v12) (pred_9 ?v4 ?v5)
        (not (pred_7 ?v4)) (not (pred_9 ?v12 ?v5))))

(:action op_1
:parameters (?v5 ?v10)
:precondition (and (pred_8 ?v5) (pred_5 ?v10) 
                  (pred_11 ?v5) (pred_7 ?v10))
:effect (and (pred_3 ) (pred_9 ?v10 ?v5) (not (pred_7 ?v10)))))


	
