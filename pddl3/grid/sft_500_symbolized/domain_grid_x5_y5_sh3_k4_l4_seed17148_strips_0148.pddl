(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v2)
             (pred_8 ?v3 ?v12)
             (pred_10 ?v7 ?v12)
             (pred_4 ?v8 ?v7 )
	     (pred_1 ?v7)
             (pred_6 ?v10)
             (pred_9 ?v3)
             (pred_3 ?v12)
             (pred_12 ?v7)
             (pred_5 ?v3)
             (pred_2 ?v7)
             (pred_11 ))



(:action op_3
:parameters (?v5 ?v11 ?v1 ?v4)
:precondition (and (pred_6 ?v5) (pred_6 ?v11) (pred_9 ?v1) (pred_3 ?v4)
          (pred_7 ?v5 ?v11) (pred_8 ?v1 ?v4)
                   (pred_10 ?v11 ?v4) (pred_1 ?v5) 
                   (pred_12 ?v11) (pred_5 ?v1))
:effect (and  (pred_2 ?v11) (not (pred_12 ?v11))))


(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_6 ?v5) (pred_6 ?v13)
               (pred_1 ?v5) (pred_7 ?v5 ?v13) (pred_2 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v5))))

(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_6 ?v5) (pred_9 ?v1) 
                  (pred_1 ?v5) (pred_4 ?v1 ?v5) (pred_11 ))
:effect (and (pred_5 ?v1)
   (not (pred_4 ?v1 ?v5)) (not (pred_11 ))))


(:action op_2
:parameters (?v5 ?v6 ?v9)
:precondition (and (pred_6 ?v5) (pred_9 ?v6) (pred_9 ?v9)
                  (pred_1 ?v5) (pred_5 ?v9) (pred_4 ?v6 ?v5))
:effect (and (pred_5 ?v6) (pred_4 ?v9 ?v5)
        (not (pred_5 ?v9)) (not (pred_4 ?v6 ?v5))))

(:action op_4
:parameters (?v5 ?v1)
:precondition (and (pred_6 ?v5) (pred_9 ?v1) 
                  (pred_1 ?v5) (pred_5 ?v1))
:effect (and (pred_11 ) (pred_4 ?v1 ?v5) (not (pred_5 ?v1)))))


	
