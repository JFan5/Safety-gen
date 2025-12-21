(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v2)
             (pred_11 ?v9 ?v7)
             (pred_7 ?v4 ?v7)
             (pred_1 ?v3 ?v4 )
	     (pred_3 ?v4)
             (pred_2 ?v1)
             (pred_4 ?v9)
             (pred_8 ?v7)
             (pred_10 ?v4)
             (pred_12 ?v9)
             (pred_6 ?v4)
             (pred_9 ))



(:action op_4
:parameters (?v5 ?v11 ?v13 ?v12)
:precondition (and (pred_2 ?v5) (pred_2 ?v11) (pred_4 ?v13) (pred_8 ?v12)
          (pred_5 ?v5 ?v11) (pred_11 ?v13 ?v12)
                   (pred_7 ?v11 ?v12) (pred_3 ?v5) 
                   (pred_10 ?v11) (pred_12 ?v13))
:effect (and  (pred_6 ?v11) (not (pred_10 ?v11))))


(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_2 ?v5) (pred_2 ?v6)
               (pred_3 ?v5) (pred_5 ?v5 ?v6) (pred_6 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v5))))

(:action op_2
:parameters (?v5 ?v13)
:precondition (and (pred_2 ?v5) (pred_4 ?v13) 
                  (pred_3 ?v5) (pred_1 ?v13 ?v5) (pred_9 ))
:effect (and (pred_12 ?v13)
   (not (pred_1 ?v13 ?v5)) (not (pred_9 ))))


(:action op_5
:parameters (?v5 ?v10 ?v8)
:precondition (and (pred_2 ?v5) (pred_4 ?v10) (pred_4 ?v8)
                  (pred_3 ?v5) (pred_12 ?v8) (pred_1 ?v10 ?v5))
:effect (and (pred_12 ?v10) (pred_1 ?v8 ?v5)
        (not (pred_12 ?v8)) (not (pred_1 ?v10 ?v5))))

(:action op_3
:parameters (?v5 ?v13)
:precondition (and (pred_2 ?v5) (pred_4 ?v13) 
                  (pred_3 ?v5) (pred_12 ?v13))
:effect (and (pred_9 ) (pred_1 ?v13 ?v5) (not (pred_12 ?v13)))))


	
