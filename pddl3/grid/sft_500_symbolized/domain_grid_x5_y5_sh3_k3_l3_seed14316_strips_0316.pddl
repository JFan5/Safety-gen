(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v13 ?v7)
             (pred_7 ?v6 ?v4)
             (pred_9 ?v13 ?v4)
             (pred_11 ?v12 ?v13 )
	     (pred_10 ?v13)
             (pred_1 ?v9)
             (pred_4 ?v6)
             (pred_2 ?v4)
             (pred_8 ?v13)
             (pred_5 ?v6)
             (pred_6 ?v13)
             (pred_3 ))



(:action op_5
:parameters (?v5 ?v11 ?v2 ?v1)
:precondition (and (pred_1 ?v5) (pred_1 ?v11) (pred_4 ?v2) (pred_2 ?v1)
          (pred_12 ?v5 ?v11) (pred_7 ?v2 ?v1)
                   (pred_9 ?v11 ?v1) (pred_10 ?v5) 
                   (pred_8 ?v11) (pred_5 ?v2))
:effect (and  (pred_6 ?v11) (not (pred_8 ?v11))))


(:action op_2
:parameters (?v5 ?v10)
:precondition (and (pred_1 ?v5) (pred_1 ?v10)
               (pred_10 ?v5) (pred_12 ?v5 ?v10) (pred_6 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v5))))

(:action op_4
:parameters (?v5 ?v2)
:precondition (and (pred_1 ?v5) (pred_4 ?v2) 
                  (pred_10 ?v5) (pred_11 ?v2 ?v5) (pred_3 ))
:effect (and (pred_5 ?v2)
   (not (pred_11 ?v2 ?v5)) (not (pred_3 ))))


(:action op_1
:parameters (?v5 ?v8 ?v3)
:precondition (and (pred_1 ?v5) (pred_4 ?v8) (pred_4 ?v3)
                  (pred_10 ?v5) (pred_5 ?v3) (pred_11 ?v8 ?v5))
:effect (and (pred_5 ?v8) (pred_11 ?v3 ?v5)
        (not (pred_5 ?v3)) (not (pred_11 ?v8 ?v5))))

(:action op_3
:parameters (?v5 ?v2)
:precondition (and (pred_1 ?v5) (pred_4 ?v2) 
                  (pred_10 ?v5) (pred_5 ?v2))
:effect (and (pred_3 ) (pred_11 ?v2 ?v5) (not (pred_5 ?v2)))))


	
