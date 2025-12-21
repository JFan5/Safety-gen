(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v8)
             (pred_9 ?v10 ?v1)
             (pred_5 ?v12 ?v1)
             (pred_10 ?v7 ?v12 )
	     (pred_1 ?v12)
             (pred_3 ?v9)
             (pred_12 ?v10)
             (pred_8 ?v1)
             (pred_7 ?v12)
             (pred_6 ?v10)
             (pred_11 ?v12)
             (pred_2 ))



(:action op_1
:parameters (?v2 ?v11 ?v13 ?v5)
:precondition (and (pred_3 ?v2) (pred_3 ?v11) (pred_12 ?v13) (pred_8 ?v5)
          (pred_4 ?v2 ?v11) (pred_9 ?v13 ?v5)
                   (pred_5 ?v11 ?v5) (pred_1 ?v2) 
                   (pred_7 ?v11) (pred_6 ?v13))
:effect (and  (pred_11 ?v11) (not (pred_7 ?v11))))


(:action op_2
:parameters (?v2 ?v6)
:precondition (and (pred_3 ?v2) (pred_3 ?v6)
               (pred_1 ?v2) (pred_4 ?v2 ?v6) (pred_11 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v2))))

(:action op_3
:parameters (?v2 ?v13)
:precondition (and (pred_3 ?v2) (pred_12 ?v13) 
                  (pred_1 ?v2) (pred_10 ?v13 ?v2) (pred_2 ))
:effect (and (pred_6 ?v13)
   (not (pred_10 ?v13 ?v2)) (not (pred_2 ))))


(:action op_4
:parameters (?v2 ?v3 ?v4)
:precondition (and (pred_3 ?v2) (pred_12 ?v3) (pred_12 ?v4)
                  (pred_1 ?v2) (pred_6 ?v4) (pred_10 ?v3 ?v2))
:effect (and (pred_6 ?v3) (pred_10 ?v4 ?v2)
        (not (pred_6 ?v4)) (not (pred_10 ?v3 ?v2))))

(:action op_5
:parameters (?v2 ?v13)
:precondition (and (pred_3 ?v2) (pred_12 ?v13) 
                  (pred_1 ?v2) (pred_6 ?v13))
:effect (and (pred_2 ) (pred_10 ?v13 ?v2) (not (pred_6 ?v13)))))


	
